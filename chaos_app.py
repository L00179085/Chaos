from flask import Flask, jsonify, request
import json
import random
import time
import logging
import os
from datetime import datetime
from jira import JIRA, JIRAError
import mysql.connector
from dateutil import parser


# Define the directory where logs will be saved
log_directory = "logs"
if not os.path.exists(log_directory):
    os.makedirs(log_directory)

# Get the current date and time for the log filename
current_time = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
log_filename = os.path.join(log_directory, f"experiment_log_{current_time}.txt")

# Custom logging handler to ensure flushing after every log message
class FlushFileHandler(logging.FileHandler):
    def emit(self, record):
        super().emit(record)
        self.flush()

# Configure logging to write to the timestamped file in the specified directory
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        FlushFileHandler(log_filename),
        logging.StreamHandler()
    ]
)


# Load configuration
with open('config.json') as config_file:
    config = json.load(config_file)

# JIRA and MySQL configurations
jira_url = config['jira_url']
jira_username = config['jira_username']
jira_api_token = config['jira_api_token']
STORY_POINTS_FIELD = config['story_points_field']
board_global_id = config['board_id']
mysql_config = config['mysql']
user_emails = config.get('user_emails', [])

# JIRA Connection
jira = JIRA(basic_auth=(jira_username, jira_api_token), server=jira_url)

# MySQL Connection
db_connection = mysql.connector.connect(
    host=mysql_config['host'],
    user=mysql_config['user'],
    password=mysql_config['password'],
    database=mysql_config['database']
)
cursor = db_connection.cursor()

# Create the Flask app instance
app = Flask(__name__)

@app.route('/start_experiment/<board_id>', methods=['POST','GET'])
def start_experiment(board_id):
    try:
        run_ids = []
        active_sprints = get_active_sprints(board_id)
        
        for sprint in active_sprints:
            sprint_backlog = get_sprint_backlog(sprint.id)
            
            # Insert sprint details into the sprints table and get the run_id
            run_id = insert_sprint(sprint.id, sprint.name, sprint.startDate, sprint.endDate)
            run_ids.append(run_id)
            
            # Calculate initial story points for each user and total story points
            initial_user_story_points, total_story_points = calculate_initial_story_points(sprint_backlog)
            
            # Log total story points before the experiments
            insert_metric(run_id, 'total_story_points', total_story_points)
            
            # Calculate total issues
            calculate_total_issues(run_id, sprint_backlog)
            
            # Find linked tasks
            linked_tasks = find_linked_tasks(sprint_backlog)

            # Simulate blocking issues
            affected_issues, dependent_issues, original_states = simulate_block_issue(run_id, sprint_backlog, linked_tasks)
            
            # Simulate story points increase
            original_story_points = simulate_story_points_increase(run_id, sprint_backlog, linked_tasks)
            
            # Simulate resource allocation variability
            simulate_resource_allocation_variability(run_id, sprint_backlog)
            
            # Simulate dynamic task assignment and calculate new story points for each user
            assignment_changes, _ = simulate_dynamic_task_assignment_and_calculate_story_points(run_id, sprint_backlog)
            
            # Simulate priority change
            simulate_priority_change(run_id, sprint_backlog, linked_tasks)
            
            # Simulate remove assignment and block related tasks
            removed_assignments = simulate_remove_assignment(run_id, sprint_backlog, linked_tasks)
            
            # Revert changes if necessary
            revert_changes(affected_issues, dependent_issues, original_states, original_story_points, assignment_changes, removed_assignments)
            
        logging.info("Chaos experiments completed.")
        
        #time.sleep(10)  # Extended to ensure MySQL data is inserted properly.

        # Return a successful response with the run IDs
        return jsonify({"status": "success", "run_ids": run_ids}), 200    
    except Exception as e:
        logging.error(f"Error occurred: {e}", exc_info=True)
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route('/test/<board_id>', methods=['POST'])        
def test_experiment(board_id):
    try:
        logging.info("This is a test log message.")
        # Return a successful response with the run IDs
        # Force flush to ensure the log is written immediately
        for handler in logging.getLogger().handlers:
            handler.flush()        
        return jsonify({"status": "success", "run_ids": board_id}), 200    
    except Exception as e:
        logging.error(f"Error occurred: {e}", exc_info=True)
        return jsonify({"status": "error", "message": str(e)}), 500        

def get_active_sprints(board_id):
    try:
        sprints = jira.sprints(board_id, state='active')
        return sprints
    except Exception as e:
        logging.error(f"Error fetching active sprints: {e}")
        return []

def get_sprint_backlog(sprint_id):
    try:
        issues = jira.search_issues(f'sprint={sprint_id}', maxResults=False)
        return issues
    except Exception as e:
        logging.error(f"Error fetching sprint backlog: {e}")
        return []

def find_linked_tasks(issues):
    linked_tasks = {}
    for issue in issues:
        links = issue.fields.issuelinks
        linked_tasks[issue.key] = []
        for link in links:
            if hasattr(link, "outwardIssue"):
                linked_tasks[issue.key].append(link.outwardIssue.key)
            elif hasattr(link, "inwardIssue"):
                linked_tasks[issue.key].append(link.inwardIssue.key)
    return linked_tasks

def transition_issue(issue, transition_name):
    transitions = jira.transitions(issue)
    transition_id = next((t['id'] for t in transitions if t['name'].lower() == transition_name.lower()), None)
    if transition_id:
        jira.transition_issue(issue, transition_id)
        logging.info(f"Issue {issue.key} transitioned to {transition_name}")
    else:
        logging.error(f"Transition '{transition_name}' not found for issue {issue.key}")

def get_users_by_email(emails):
    users = []
    try:
        for email in emails:
            found_users = jira.search_users(query=email)
            if found_users:
                users.extend(found_users)
                logging.info(f"Found user(s) for email {email}: {[user.displayName for user in found_users]}")
            else:
                logging.warning(f"No user found for email {email}")
        unique_users = list(set(users))  # Remove duplicates
        logging.info(f"Total unique users fetched: {len(unique_users)}")
        return unique_users
    except JIRAError as e:
        logging.error(f"Error fetching users by email: {e.status_code} {e.text}")
        return []

def get_all_users_from_jira():
    return get_users_by_email(user_emails)

def calculate_initial_story_points(issues):
    user_story_points = {}
    total_story_points = 0
    for task in issues:
        assignee = task.fields.assignee.accountId if task.fields.assignee else 'unassigned'
        story_points = getattr(task.fields, STORY_POINTS_FIELD, 0)
        total_story_points += story_points
        if assignee in user_story_points:
            user_story_points[assignee] += story_points
        else:
            user_story_points[assignee] = story_points

    return user_story_points, total_story_points

def convert_datetime_to_mysql_format(dt_str):
    dt = parser.isoparse(dt_str)
    return dt.strftime('%Y-%m-%d %H:%M:%S')

def insert_sprint(sprint_id, sprint_name, start_date, end_date):
    start_date_mysql = convert_datetime_to_mysql_format(start_date)
    end_date_mysql = convert_datetime_to_mysql_format(end_date)
    cursor.execute("""
        INSERT INTO sprints (sprint_id, sprint_name, start_date, end_date) 
        VALUES (%s, %s, %s, %s)
    """, (sprint_id, sprint_name, start_date_mysql, end_date_mysql))
    db_connection.commit()
    run_id = cursor.lastrowid
    logging.info(f"Run ID for sprint {sprint_id}: {run_id}")
    return run_id

def insert_metric(run_id, metric_name, metric_value):
    logging.info(f"Inserting metric {metric_name} with value {metric_value} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO metrics (sprint_id, metric_name, metric_value) 
        VALUES (%s, %s, %s)
    """, (run_id, metric_name, metric_value))
    db_connection.commit()

def insert_user_story_points(run_id, user, initial_story_points, new_story_points):
    logging.info(f"Inserting user story points for user {user} with initial points {initial_story_points} and new points {new_story_points} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO user_story_points (sprint_id, user, initial_story_points, new_story_points) 
        VALUES (%s, %s, %s, %s)
    """, (run_id, user, initial_story_points, new_story_points))
    db_connection.commit()

def insert_blocked_issue(run_id, issue_key, linked_issue_key=None):
    logging.info(f"Inserting blocked issue {issue_key} with linked issue {linked_issue_key} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO blocked_issues (sprint_id, issue_key, linked_issue_key) 
        VALUES (%s, %s, %s)
    """, (run_id, issue_key, linked_issue_key))
    db_connection.commit()

def insert_resource_allocation(run_id, task_key, original_resources, new_resources):
    logging.info(f"Inserting resource allocation for task {task_key} with original resources {original_resources} and new resources {new_resources} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO resource_allocation (sprint_id, task_key, original_resources, new_resources) 
        VALUES (%s, %s, %s, %s)
    """, (run_id, task_key, original_resources, new_resources))
    db_connection.commit()

def insert_priority_count(run_id, priority, count):
    logging.info(f"Inserting priority count for {priority} with count {count} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO priority_counts (sprint_id, priority, count) 
        VALUES (%s, %s, %s)
    """, (run_id, priority, count))
    db_connection.commit()

def insert_affected_task(run_id, task_key, dependent_task_key):
    logging.info(f"Inserting affected task {task_key} with dependent task {dependent_task_key} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO affected_tasks (sprint_id, task_key, dependent_task_key) 
        VALUES (%s, %s, %s)
    """, (run_id, task_key, dependent_task_key))
    db_connection.commit()

def insert_removed_assignment(run_id, task_key, user, affected_issues):
    logging.info(f"Inserting removed assignment for task {task_key} with user {user} and affected issues {affected_issues} for run ID {run_id}")
    cursor.execute("""
        INSERT INTO removed_assignments (sprint_id, task_key, user, affected_issues) 
        VALUES (%s, %s, %s, %s)
    """, (run_id, task_key, user, affected_issues))
    db_connection.commit()

def simulate_remove_assignment(run_id, issues, linked_tasks):
    removed_assignments = []
    for task in random.sample(issues, min(5, len(issues))):
        if task.fields.assignee:
            user = task.fields.assignee.displayName
            try:
                task.update(fields={'assignee': None})
                removed_assignments.append((task.key, user))
                logging.info(f"Removed assignee {user} from task {task.key}")

                # Block the task and all related tasks
                affected_issues = set()
                original_status = task.fields.status.name
                transition_issue(task, 'Blocked')
                affected_issues.add(task.key)
                for linked_task_key in linked_tasks.get(task.key, []):
                    linked_task = jira.issue(linked_task_key)
                    transition_issue(linked_task, 'Blocked')
                    affected_issues.add(linked_task.key)

                insert_removed_assignment(run_id, task.key, user, len(affected_issues))
            except JIRAError as e:
                logging.error(f"Error removing assignee from task {task.key}: {e.status_code} {e.text}")
    insert_metric(run_id, 'removed_assignments', len(removed_assignments))
    return removed_assignments

def revert_remove_assignment(removed_assignments):
    for task_key, user in removed_assignments:
        try:
            task = jira.issue(task_key)
            task.update(fields={'assignee': {'name': user}})
            transition_issue(task, 'In Progress')
            logging.info(f"Reassigned {user} to task {task_key} and moved it to In Progress")
        except JIRAError as e:
            logging.error(f"Error reassigning {user} to task {task_key}: {e.status_code} {e.text}")

def simulate_priority_change(run_id, issues, linked_tasks):
    # Collect initial priority counts
    priority_counts = {'Highest': 0, 'High': 0, 'Medium': 0, 'Low': 0, 'Lowest': 0}
    for task in issues:
        priority = task.fields.priority.name if task.fields.priority else 'None'
        if priority in priority_counts:
            priority_counts[priority] += 1

    # Insert initial priority counts into the database
    for priority, count in priority_counts.items():
        insert_priority_count(run_id, f"Initial {priority}", count)

    priority_changes = []
    affected_tasks = []

    for task in issues:
        original_priority = task.fields.priority.name if task.fields.priority else 'None'
        new_priority = random.choice(['Highest', 'High', 'Medium', 'Low', 'Lowest'])
        if original_priority != new_priority:
            try:
                task.update(fields={'priority': {'name': new_priority}})
                priority_changes.append((task.key, original_priority, new_priority))
                logging.info(f"Task {task.key} priority changed from {original_priority} to {new_priority}")
                if task.key in linked_tasks:
                    for linked_task_key in linked_tasks[task.key]:
                        linked_task = jira.issue(linked_task_key)
                        linked_task.update(fields={'priority': {'name': new_priority}})
                        affected_tasks.append((linked_task_key, task.key))
                        logging.info(f"Linked task {linked_task_key} priority changed to {new_priority} due to {task.key}")
                        insert_affected_task(run_id, linked_task_key, task.key)
            except JIRAError as e:
                logging.error(f"Error changing priority for task {task.key}: {e.status_code} {e.text}")

    insert_metric(run_id, 'priority_changes', len(priority_changes))
    insert_metric(run_id, 'affected_tasks', len(affected_tasks))

    # Collect final priority counts
    final_priority_counts = {'Highest': 0, 'High': 0, 'Medium': 0, 'Low': 0, 'Lowest': 0}
    for task in issues:
        priority = task.fields.priority.name if task.fields.priority else 'None'
        if priority in final_priority_counts:
            final_priority_counts[priority] += 1

    # Insert final priority counts into the database
    for priority, count in final_priority_counts.items():
        insert_priority_count(run_id, f"Final {priority}", count)

    return priority_changes, affected_tasks

def simulate_resource_allocation_variability(run_id, issues):
    # Fetch high priority tasks
    high_priority_tasks = [task for task in issues if task.fields.priority and task.fields.priority.name in ['Highest', 'High']]
    if not high_priority_tasks:
        logging.warning("No high priority tasks found for resource allocation variability experiment.")
        return

    users = get_all_users_from_jira()
    if not users:
        logging.warning("No users available for assignment. Skipping resource allocation variability experiment.")
        return

    user_story_points_before = calculate_initial_story_points(issues)[0]

    # Randomly select tasks and change their assignee
    assignment_changes = {}
    for task in random.sample(high_priority_tasks, min(5, len(high_priority_tasks))):
        original_assignee = task.fields.assignee.accountId if task.fields.assignee else 'unassigned'
        new_assignee = random.choice(users).accountId
        if original_assignee != new_assignee:
            try:
                task.update(fields={'assignee': {'accountId': new_assignee}})
                assignment_changes[task.key] = (original_assignee, new_assignee)
                logging.info(f"Task {task.key} reassigned from {original_assignee} to {new_assignee}")
            except JIRAError as e:
                logging.error(f"Error reassigning task {task.key}: {e.status_code} {e.text}")

    user_story_points_after = calculate_initial_story_points(issues)[0]

    # Log changes
    for user in user_story_points_after:
        initial_points = user_story_points_before.get(user, 0)
        new_points = user_story_points_after[user]
        insert_user_story_points(run_id, user, initial_points, new_points)

    insert_metric(run_id, 'resource_variability', len(assignment_changes))
    return assignment_changes

def simulate_block_issue(run_id, issues, linked_tasks):
    affected_issues = set()
    dependent_issues = set()
    original_states = {}
    if not issues:
        logging.warning("No issues available for blocking. Skipping block issue experiment.")
        return affected_issues, dependent_issues, original_states
    issue_to_block = random.choice(issues)
    try:
        original_states[issue_to_block.key] = issue_to_block.fields.status.name
        transition_issue(issue_to_block, 'Blocked')
        logging.info(f"Issue {issue_to_block.key} blocked")
        affected_issues.add(issue_to_block.key)
        insert_blocked_issue(run_id, issue_to_block.key)
        if issue_to_block.key in linked_tasks:
            for linked_issue_key in linked_tasks[issue_to_block.key]:
                linked_issue = jira.issue(linked_issue_key)
                original_states[linked_issue.key] = linked_issue.fields.status.name
                transition_issue(linked_issue, 'Blocked')
                dependent_issues.add(linked_issue.key)
                logging.info(f"Linked issue {linked_issue.key} blocked due to {issue_to_block.key}")
                insert_blocked_issue(run_id, linked_issue.key, issue_to_block.key)
        insert_metric(run_id, 'directly_blocked_issues', len(affected_issues))
        insert_metric(run_id, 'dependent_blocked_issues', len(dependent_issues))
    except JIRAError as e:
        logging.error(f"Error blocking issue {issue_to_block.key}: {e.status_code} {e.text}")
    return affected_issues, dependent_issues, original_states

def simulate_story_points_increase(run_id, issues, linked_tasks):
    total_story_points_change = 0
    original_story_points = {}
    overflow_issues = 0
    for issue in issues:
        if issue.key in linked_tasks:
            story_points_field = getattr(issue.fields, STORY_POINTS_FIELD, None)
            if story_points_field is not None:
                original_story_points[issue.key] = story_points_field
                increased_story_points = original_story_points[issue.key] + random.randint(1, 5)
                if increased_story_points > original_story_points[issue.key]:
                    overflow_issues += 1
                try:
                    issue.update(fields={STORY_POINTS_FIELD: increased_story_points})
                    total_story_points_change += (increased_story_points - original_story_points[issue.key])
                    logging.info(f"Issue {issue.key} story points increased from {original_story_points[issue.key]} to {increased_story_points}")
                except JIRAError as e:
                    logging.error(f"Error updating issue {issue.key}: {e.status_code} {e.text}")
    insert_metric(run_id, 'story_points_change', total_story_points_change)
    insert_metric(run_id, 'story_points_overflow', overflow_issues)
    return original_story_points

def simulate_dynamic_task_assignment_and_calculate_story_points(run_id, issues):
    assignment_changes = {}
    user_story_points = {}

    users = get_all_users_from_jira()

    if not users:
        logging.warning("No users available for assignment. Skipping dynamic task assignment experiment.")
        return assignment_changes, user_story_points

    for task in issues:
        original_assignee = task.fields.assignee.accountId if task.fields.assignee else 'unassigned'
        new_assignee = random.choice(users).accountId
        if original_assignee != new_assignee:
            try:
                task.update(fields={'assignee': {'accountId': new_assignee}})
                assignment_changes[task.key] = (original_assignee, new_assignee)
                logging.info(f"Task {task.key} assigned from {original_assignee} to {new_assignee}")
            except JIRAError as e:
                logging.error(f"Error reassigning task {task.key}: {e.status_code} {e.text}")

        story_points = getattr(task.fields, STORY_POINTS_FIELD, 0)
        if new_assignee in user_story_points:
            user_story_points[new_assignee] += story_points
        else:
            user_story_points[new_assignee] = story_points

    for user, points in user_story_points.items():
        logging.info(f"New story points for user {user}: {points}")
        initial_points = user_story_points.get(user, 0)
        insert_user_story_points(run_id, user, initial_points, points)

    insert_metric(run_id, 'dynamic_task_assignment', len(assignment_changes))
    return assignment_changes, user_story_points

def calculate_total_issues(run_id, issues):
    total_issues = len(issues)
    insert_metric(run_id, 'total_issues', total_issues)
    logging.info(f"Total issues in sprint: {total_issues}")
    return total_issues

def revert_changes(affected_issues, dependent_issues, original_states, original_story_points, assignment_changes, removed_assignments):
    for issue_key, original_status in original_states.items():
        issue = jira.issue(issue_key)
        try:
            transition_issue(issue, original_status)
            logging.info(f"Issue {issue.key} status reverted to {original_status}")
        except JIRAError as e:
            logging.error(f"Error reverting issue {issue.key} status: {e.status_code} {e.text}")

    for issue_key, original_points in original_story_points.items():
        issue = jira.issue(issue_key)
        try:
            issue.update(fields={STORY_POINTS_FIELD: original_points})
            logging.info(f"Issue {issue.key} story points reverted to {original_points}")
        except JIRAError as e:
            logging.error(f"Error reverting issue {issue.key} story points: {e.status_code} {e.text}")

    for issue_key, (original_assignee, new_assignee) in assignment_changes.items():
        issue = jira.issue(issue_key)
        try:
            issue.update(fields={'assignee': {'accountId': original_assignee}})
            logging.info(f"Issue {issue.key} reassigned back to {original_assignee}")
        except JIRAError as e:
            logging.error(f"Error reverting assignee for issue {issue.key}: {e.status_code} {e.text}")

    revert_remove_assignment(removed_assignments)

if __name__ == "__main__":
    app.run(ssl_context=('./certs/cert.pem', './certs/key.pem'),host='0.0.0.0', port=5000, debug=True)
