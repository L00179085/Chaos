-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: chaos_experiments
-- ------------------------------------------------------
-- Server version       5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affected_tasks`
--

DROP TABLE IF EXISTS `affected_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affected_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `task_key` varchar(255) DEFAULT NULL,
  `dependent_task_key` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affected_tasks`
--

LOCK TABLES `affected_tasks` WRITE;
/*!40000 ALTER TABLE `affected_tasks` DISABLE KEYS */;
INSERT INTO `affected_tasks` VALUES (186,25,'HBOM-12','HBOM-11','2024-08-13 09:19:08'),(187,25,'HBOM-9','HBOM-11','2024-08-13 09:19:09'),(188,25,'HBOM-8','HBOM-11','2024-08-13 09:19:10'),(189,25,'HBOM-10','HBOM-11','2024-08-13 09:19:11'),(190,25,'HBOM-11','HBOM-9','2024-08-13 09:19:13'),(191,25,'HBOM-7','HBOM-9','2024-08-13 09:19:14'),(192,25,'HBOM-11','HBOM-8','2024-08-13 09:19:15'),(193,25,'HBOM-2','HBOM-8','2024-08-13 09:19:16'),(194,25,'HBOM-9','HBOM-7','2024-08-13 09:19:18'),(195,25,'HBOM-6','HBOM-7','2024-08-13 09:19:19'),(196,25,'HBOM-7','HBOM-6','2024-08-13 09:19:21'),(197,25,'HBOM-5','HBOM-6','2024-08-13 09:19:22'),(198,25,'HBOM-2','HBOM-6','2024-08-13 09:19:23'),(199,25,'HBOM-6','HBOM-5','2024-08-13 09:19:25'),(200,25,'HBOM-4','HBOM-5','2024-08-13 09:19:26'),(201,25,'HBOM-5','HBOM-4','2024-08-13 09:19:27'),(202,25,'HBOM-6','HBOM-2','2024-08-13 09:19:30'),(203,25,'HBOM-8','HBOM-2','2024-08-13 09:19:31'),(204,25,'HBOM-1','HBOM-2','2024-08-13 09:19:32'),(205,25,'HBOM-2','HBOM-1','2024-08-13 09:19:34'),(206,26,'HBOM-12','HBOM-11','2024-08-18 16:14:44'),(207,26,'HBOM-8','HBOM-11','2024-08-18 16:14:45'),(208,26,'HBOM-9','HBOM-11','2024-08-18 16:14:46'),(209,26,'HBOM-10','HBOM-11','2024-08-18 16:14:47'),(210,26,'HBOM-11','HBOM-10','2024-08-18 16:14:48'),(211,26,'HBOM-9','HBOM-7','2024-08-18 16:14:49'),(212,26,'HBOM-6','HBOM-7','2024-08-18 16:14:51'),(213,26,'HBOM-7','HBOM-6','2024-08-18 16:14:52'),(214,26,'HBOM-5','HBOM-6','2024-08-18 16:14:53'),(215,26,'HBOM-2','HBOM-6','2024-08-18 16:14:54'),(216,26,'HBOM-6','HBOM-5','2024-08-18 16:14:55'),(217,26,'HBOM-4','HBOM-5','2024-08-18 16:14:56'),(218,26,'HBOM-5','HBOM-4','2024-08-18 16:14:58'),(219,26,'HBOM-6','HBOM-2','2024-08-18 16:15:00'),(220,26,'HBOM-8','HBOM-2','2024-08-18 16:15:01'),(221,26,'HBOM-1','HBOM-2','2024-08-18 16:15:02'),(222,26,'HBOM-2','HBOM-1','2024-08-18 16:15:03'),(223,27,'HBOM-12','HBOM-11','2024-08-27 13:16:42'),(224,27,'HBOM-10','HBOM-11','2024-08-27 13:16:43'),(225,27,'HBOM-9','HBOM-11','2024-08-27 13:16:44'),(226,27,'HBOM-8','HBOM-11','2024-08-27 13:16:45'),(227,27,'HBOM-11','HBOM-10','2024-08-27 13:16:46'),(228,27,'HBOM-11','HBOM-9','2024-08-27 13:16:48'),(229,27,'HBOM-7','HBOM-9','2024-08-27 13:16:49'),(230,27,'HBOM-11','HBOM-8','2024-08-27 13:16:50'),(231,27,'HBOM-2','HBOM-8','2024-08-27 13:16:51'),(232,27,'HBOM-9','HBOM-7','2024-08-27 13:16:53'),(233,27,'HBOM-6','HBOM-7','2024-08-27 13:16:54'),(234,27,'HBOM-7','HBOM-6','2024-08-27 13:16:55'),(235,27,'HBOM-5','HBOM-6','2024-08-27 13:16:56'),(236,27,'HBOM-2','HBOM-6','2024-08-27 13:16:57'),(237,27,'HBOM-6','HBOM-5','2024-08-27 13:16:59'),(238,27,'HBOM-4','HBOM-5','2024-08-27 13:17:00'),(239,27,'HBOM-6','HBOM-2','2024-08-27 13:17:01'),(240,27,'HBOM-8','HBOM-2','2024-08-27 13:17:03'),(241,27,'HBOM-1','HBOM-2','2024-08-27 13:17:04'),(242,27,'HBOM-2','HBOM-1','2024-08-27 13:17:05'),(243,28,'HBOM-11','HBOM-10','2024-08-27 13:36:01'),(244,28,'HBOM-11','HBOM-9','2024-08-27 13:36:03'),(245,28,'HBOM-7','HBOM-9','2024-08-27 13:36:04'),(246,28,'HBOM-11','HBOM-8','2024-08-27 13:36:05'),(247,28,'HBOM-2','HBOM-8','2024-08-27 13:36:06'),(248,28,'HBOM-9','HBOM-7','2024-08-27 13:36:08'),(249,28,'HBOM-6','HBOM-7','2024-08-27 13:36:09'),(250,28,'HBOM-7','HBOM-6','2024-08-27 13:36:10'),(251,28,'HBOM-5','HBOM-6','2024-08-27 13:36:11'),(252,28,'HBOM-2','HBOM-6','2024-08-27 13:36:12'),(253,28,'HBOM-6','HBOM-5','2024-08-27 13:36:14'),(254,28,'HBOM-4','HBOM-5','2024-08-27 13:36:14'),(255,28,'HBOM-5','HBOM-4','2024-08-27 13:36:16'),(256,28,'HBOM-2','HBOM-1','2024-08-27 13:36:18'),(257,29,'HBOM-12','HBOM-11','2024-08-27 13:47:47'),(258,29,'HBOM-8','HBOM-11','2024-08-27 13:47:48'),(259,29,'HBOM-9','HBOM-11','2024-08-27 13:47:49'),(260,29,'HBOM-10','HBOM-11','2024-08-27 13:47:50'),(261,29,'HBOM-11','HBOM-9','2024-08-27 13:47:51'),(262,29,'HBOM-7','HBOM-9','2024-08-27 13:47:52'),(263,29,'HBOM-11','HBOM-8','2024-08-27 13:47:53'),(264,29,'HBOM-2','HBOM-8','2024-08-27 13:47:54'),(265,29,'HBOM-9','HBOM-7','2024-08-27 13:47:56'),(266,29,'HBOM-6','HBOM-7','2024-08-27 13:47:57'),(267,29,'HBOM-7','HBOM-6','2024-08-27 13:47:58'),(268,29,'HBOM-2','HBOM-6','2024-08-27 13:47:59'),(269,29,'HBOM-5','HBOM-6','2024-08-27 13:48:00'),(270,29,'HBOM-6','HBOM-5','2024-08-27 13:48:02'),(271,29,'HBOM-4','HBOM-5','2024-08-27 13:48:03'),(272,29,'HBOM-5','HBOM-4','2024-08-27 13:48:04'),(273,29,'HBOM-8','HBOM-2','2024-08-27 13:48:06'),(274,29,'HBOM-6','HBOM-2','2024-08-27 13:48:07'),(275,29,'HBOM-1','HBOM-2','2024-08-27 13:48:08'),(276,29,'HBOM-2','HBOM-1','2024-08-27 13:48:10'),(277,30,'HBOM-12','HBOM-11','2024-08-27 14:05:36'),(278,30,'HBOM-9','HBOM-11','2024-08-27 14:05:37'),(279,30,'HBOM-10','HBOM-11','2024-08-27 14:05:38'),(280,30,'HBOM-11','HBOM-10','2024-08-27 14:05:40'),(281,30,'HBOM-11','HBOM-9','2024-08-27 14:05:42'),(282,30,'HBOM-7','HBOM-9','2024-08-27 14:05:43'),(283,30,'HBOM-2','HBOM-8','2024-08-27 14:05:44'),(284,30,'HBOM-9','HBOM-7','2024-08-27 14:05:46'),(285,30,'HBOM-6','HBOM-7','2024-08-27 14:05:47'),(286,30,'HBOM-6','HBOM-5','2024-08-27 14:05:48'),(287,30,'HBOM-4','HBOM-5','2024-08-27 14:05:49'),(288,30,'HBOM-5','HBOM-4','2024-08-27 14:05:51'),(289,30,'HBOM-6','HBOM-2','2024-08-27 14:05:53'),(290,30,'HBOM-8','HBOM-2','2024-08-27 14:05:54'),(291,30,'HBOM-1','HBOM-2','2024-08-27 14:05:55'),(292,30,'HBOM-2','HBOM-1','2024-08-27 14:05:57'),(293,31,'HBOM-12','HBOM-11','2024-08-27 14:14:10'),(294,31,'HBOM-9','HBOM-11','2024-08-27 14:14:11'),(295,31,'HBOM-10','HBOM-11','2024-08-27 14:14:12'),(296,31,'HBOM-11','HBOM-10','2024-08-27 14:14:14'),(297,31,'HBOM-11','HBOM-9','2024-08-27 14:14:15'),(298,31,'HBOM-7','HBOM-9','2024-08-27 14:14:16'),(299,31,'HBOM-2','HBOM-8','2024-08-27 14:14:18'),(300,31,'HBOM-9','HBOM-7','2024-08-27 14:14:19'),(301,31,'HBOM-6','HBOM-7','2024-08-27 14:14:20'),(302,31,'HBOM-7','HBOM-6','2024-08-27 14:14:22'),(303,31,'HBOM-5','HBOM-6','2024-08-27 14:14:23'),(304,31,'HBOM-2','HBOM-6','2024-08-27 14:14:24'),(305,31,'HBOM-6','HBOM-5','2024-08-27 14:14:25'),(306,31,'HBOM-4','HBOM-5','2024-08-27 14:14:26'),(307,31,'HBOM-5','HBOM-4','2024-08-27 14:14:28'),(308,31,'HBOM-2','HBOM-1','2024-08-27 14:14:30'),(309,32,'HBOM-12','HBOM-11','2024-08-27 14:19:57'),(310,32,'HBOM-10','HBOM-11','2024-08-27 14:19:58'),(311,32,'HBOM-9','HBOM-11','2024-08-27 14:19:58'),(312,32,'HBOM-11','HBOM-10','2024-08-27 14:20:00'),(313,32,'HBOM-11','HBOM-9','2024-08-27 14:20:01'),(314,32,'HBOM-7','HBOM-9','2024-08-27 14:20:02'),(315,32,'HBOM-9','HBOM-7','2024-08-27 14:20:04'),(316,32,'HBOM-6','HBOM-7','2024-08-27 14:20:05'),(317,32,'HBOM-7','HBOM-6','2024-08-27 14:20:07'),(318,32,'HBOM-5','HBOM-6','2024-08-27 14:20:07'),(319,32,'HBOM-2','HBOM-6','2024-08-27 14:20:08'),(320,32,'HBOM-6','HBOM-5','2024-08-27 14:20:10'),(321,32,'HBOM-4','HBOM-5','2024-08-27 14:20:11'),(322,32,'HBOM-5','HBOM-4','2024-08-27 14:20:12'),(323,32,'HBOM-8','HBOM-2','2024-08-27 14:20:14'),(324,32,'HBOM-6','HBOM-2','2024-08-27 14:20:15'),(325,32,'HBOM-1','HBOM-2','2024-08-27 14:20:16'),(326,32,'HBOM-2','HBOM-1','2024-08-27 14:20:18'),(327,33,'HBOM-11','HBOM-10','2024-08-27 14:38:02'),(328,33,'HBOM-11','HBOM-9','2024-08-27 14:38:03'),(329,33,'HBOM-7','HBOM-9','2024-08-27 14:38:04'),(330,33,'HBOM-2','HBOM-8','2024-08-27 14:38:06'),(331,33,'HBOM-9','HBOM-7','2024-08-27 14:38:07'),(332,33,'HBOM-6','HBOM-7','2024-08-27 14:38:08'),(333,33,'HBOM-7','HBOM-6','2024-08-27 14:38:10'),(334,33,'HBOM-5','HBOM-6','2024-08-27 14:38:11'),(335,33,'HBOM-2','HBOM-6','2024-08-27 14:38:12'),(336,33,'HBOM-6','HBOM-5','2024-08-27 14:38:14'),(337,33,'HBOM-4','HBOM-5','2024-08-27 14:38:14'),(338,33,'HBOM-5','HBOM-4','2024-08-27 14:38:16'),(339,33,'HBOM-8','HBOM-2','2024-08-27 14:38:18'),(340,33,'HBOM-6','HBOM-2','2024-08-27 14:38:19'),(341,33,'HBOM-1','HBOM-2','2024-08-27 14:38:20'),(342,33,'HBOM-2','HBOM-1','2024-08-27 14:38:22'),(343,34,'HBOM-11','HBOM-10','2024-08-27 14:53:28'),(344,34,'HBOM-11','HBOM-9','2024-08-27 14:53:30'),(345,34,'HBOM-7','HBOM-9','2024-08-27 14:53:31'),(346,34,'HBOM-2','HBOM-8','2024-08-27 14:53:32'),(347,34,'HBOM-9','HBOM-7','2024-08-27 14:53:34'),(348,34,'HBOM-6','HBOM-7','2024-08-27 14:53:35'),(349,34,'HBOM-7','HBOM-6','2024-08-27 14:53:36'),(350,34,'HBOM-5','HBOM-6','2024-08-27 14:53:37'),(351,34,'HBOM-2','HBOM-6','2024-08-27 14:53:38'),(352,34,'HBOM-6','HBOM-5','2024-08-27 14:53:40'),(353,34,'HBOM-4','HBOM-5','2024-08-27 14:53:41'),(354,34,'HBOM-6','HBOM-2','2024-08-27 14:53:43'),(355,34,'HBOM-8','HBOM-2','2024-08-27 14:53:44'),(356,34,'HBOM-1','HBOM-2','2024-08-27 14:53:45'),(357,34,'HBOM-2','HBOM-1','2024-08-27 14:53:47'),(358,35,'HBOM-12','HBOM-11','2024-08-27 15:25:25'),(359,35,'HBOM-9','HBOM-11','2024-08-27 15:25:26'),(360,35,'HBOM-10','HBOM-11','2024-08-27 15:25:27'),(361,35,'HBOM-11','HBOM-10','2024-08-27 15:25:29'),(362,35,'HBOM-11','HBOM-9','2024-08-27 15:25:30'),(363,35,'HBOM-7','HBOM-9','2024-08-27 15:25:31'),(364,35,'HBOM-2','HBOM-8','2024-08-27 15:25:33'),(365,35,'HBOM-7','HBOM-6','2024-08-27 15:25:35'),(366,35,'HBOM-5','HBOM-6','2024-08-27 15:25:36'),(367,35,'HBOM-2','HBOM-6','2024-08-27 15:25:37'),(368,35,'HBOM-6','HBOM-5','2024-08-27 15:25:38'),(369,35,'HBOM-4','HBOM-5','2024-08-27 15:25:39'),(370,35,'HBOM-5','HBOM-4','2024-08-27 15:25:41'),(371,35,'HBOM-8','HBOM-2','2024-08-27 15:25:43'),(372,35,'HBOM-6','HBOM-2','2024-08-27 15:25:44'),(373,35,'HBOM-1','HBOM-2','2024-08-27 15:25:45'),(374,35,'HBOM-2','HBOM-1','2024-08-27 15:25:46'),(375,36,'HBOM-12','HBOM-11','2024-08-27 16:00:45'),(376,36,'HBOM-10','HBOM-11','2024-08-27 16:00:46'),(377,36,'HBOM-9','HBOM-11','2024-08-27 16:00:47'),(378,36,'HBOM-11','HBOM-10','2024-08-27 16:00:49'),(379,36,'HBOM-2','HBOM-8','2024-08-27 16:00:50'),(380,36,'HBOM-9','HBOM-7','2024-08-27 16:00:52'),(381,36,'HBOM-6','HBOM-7','2024-08-27 16:00:53'),(382,36,'HBOM-7','HBOM-6','2024-08-27 16:00:54'),(383,36,'HBOM-5','HBOM-6','2024-08-27 16:00:55'),(384,36,'HBOM-2','HBOM-6','2024-08-27 16:00:56'),(385,36,'HBOM-6','HBOM-5','2024-08-27 16:00:58'),(386,36,'HBOM-4','HBOM-5','2024-08-27 16:00:59'),(387,36,'HBOM-5','HBOM-4','2024-08-27 16:01:00'),(388,36,'HBOM-6','HBOM-2','2024-08-27 16:01:03'),(389,36,'HBOM-8','HBOM-2','2024-08-27 16:01:04'),(390,36,'HBOM-1','HBOM-2','2024-08-27 16:01:04'),(391,36,'HBOM-2','HBOM-1','2024-08-27 16:01:06');
/*!40000 ALTER TABLE `affected_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_issues`
--

DROP TABLE IF EXISTS `blocked_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `issue_key` varchar(255) DEFAULT NULL,
  `linked_issue_key` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_issues`
--

LOCK TABLES `blocked_issues` WRITE;
/*!40000 ALTER TABLE `blocked_issues` DISABLE KEYS */;
INSERT INTO `blocked_issues` VALUES (66,25,'HBOM-7',NULL,'2024-08-13 09:18:48'),(67,25,'HBOM-9','HBOM-7','2024-08-13 09:18:49'),(68,25,'HBOM-6','HBOM-7','2024-08-13 09:18:50'),(69,26,'HBOM-2',NULL,'2024-08-18 16:14:22'),(70,26,'HBOM-6','HBOM-2','2024-08-18 16:14:23'),(71,26,'HBOM-8','HBOM-2','2024-08-18 16:14:24'),(72,26,'HBOM-1','HBOM-2','2024-08-18 16:14:25'),(73,27,'HBOM-11',NULL,'2024-08-27 13:16:17'),(74,27,'HBOM-12','HBOM-11','2024-08-27 13:16:17'),(75,27,'HBOM-10','HBOM-11','2024-08-27 13:16:18'),(76,27,'HBOM-9','HBOM-11','2024-08-27 13:16:19'),(77,27,'HBOM-8','HBOM-11','2024-08-27 13:16:20'),(78,28,'HBOM-4',NULL,'2024-08-27 13:35:40'),(79,28,'HBOM-5','HBOM-4','2024-08-27 13:35:41'),(80,29,'HBOM-1',NULL,'2024-08-27 13:47:25'),(81,29,'HBOM-2','HBOM-1','2024-08-27 13:47:26'),(82,30,'HBOM-7',NULL,'2024-08-27 14:05:15'),(83,30,'HBOM-9','HBOM-7','2024-08-27 14:05:16'),(84,30,'HBOM-6','HBOM-7','2024-08-27 14:05:17'),(85,31,'HBOM-6',NULL,'2024-08-27 14:13:47'),(86,31,'HBOM-7','HBOM-6','2024-08-27 14:13:48'),(87,31,'HBOM-5','HBOM-6','2024-08-27 14:13:49'),(88,31,'HBOM-2','HBOM-6','2024-08-27 14:13:50'),(89,32,'HBOM-8',NULL,'2024-08-27 14:19:38'),(90,32,'HBOM-2','HBOM-8','2024-08-27 14:19:39'),(91,33,'HBOM-2',NULL,'2024-08-27 14:37:40'),(92,33,'HBOM-8','HBOM-2','2024-08-27 14:37:41'),(93,33,'HBOM-6','HBOM-2','2024-08-27 14:37:42'),(94,33,'HBOM-1','HBOM-2','2024-08-27 14:37:43'),(95,34,'HBOM-12',NULL,'2024-08-27 14:53:07'),(96,34,'CHAOS-10','HBOM-12','2024-08-27 14:53:08'),(97,34,'HBOM-11','HBOM-12','2024-08-27 14:53:09'),(98,35,'HBOM-3',NULL,'2024-08-27 15:25:06'),(99,36,'HBOM-1',NULL,'2024-08-27 16:00:26'),(100,36,'HBOM-2','HBOM-1','2024-08-27 16:00:27');
/*!40000 ALTER TABLE `blocked_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `metric_name` varchar(255) DEFAULT NULL,
  `metric_value` float DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES (211,25,'total_story_points',49,'2024-08-13 09:18:47'),(212,25,'total_issues',12,'2024-08-13 09:18:47'),(213,25,'directly_blocked_issues',1,'2024-08-13 09:18:50'),(214,25,'dependent_blocked_issues',2,'2024-08-13 09:18:50'),(215,25,'story_points_change',42,'2024-08-13 09:18:58'),(216,25,'story_points_overflow',12,'2024-08-13 09:18:58'),(217,25,'resource_variability',2,'2024-08-13 09:19:00'),(218,25,'dynamic_task_assignment',8,'2024-08-13 09:19:06'),(219,25,'priority_changes',10,'2024-08-13 09:19:34'),(220,25,'affected_tasks',20,'2024-08-13 09:19:34'),(221,25,'removed_assignments',5,'2024-08-13 09:19:49'),(222,26,'total_story_points',49,'2024-08-18 16:14:22'),(223,26,'total_issues',12,'2024-08-18 16:14:22'),(224,26,'directly_blocked_issues',1,'2024-08-18 16:14:25'),(225,26,'dependent_blocked_issues',3,'2024-08-18 16:14:25'),(226,26,'story_points_change',38,'2024-08-18 16:14:33'),(227,26,'story_points_overflow',12,'2024-08-18 16:14:33'),(228,26,'resource_variability',4,'2024-08-18 16:14:36'),(229,26,'dynamic_task_assignment',8,'2024-08-18 16:14:41'),(230,26,'priority_changes',10,'2024-08-18 16:15:03'),(231,26,'affected_tasks',17,'2024-08-18 16:15:03'),(232,26,'removed_assignments',5,'2024-08-18 16:15:16'),(233,27,'total_story_points',49,'2024-08-27 13:16:16'),(234,27,'total_issues',12,'2024-08-27 13:16:16'),(235,27,'directly_blocked_issues',1,'2024-08-27 13:16:20'),(236,27,'dependent_blocked_issues',4,'2024-08-27 13:16:20'),(237,27,'story_points_change',33,'2024-08-27 13:16:29'),(238,27,'story_points_overflow',12,'2024-08-27 13:16:29'),(239,27,'resource_variability',4,'2024-08-27 13:16:32'),(240,27,'dynamic_task_assignment',10,'2024-08-27 13:16:39'),(241,27,'priority_changes',10,'2024-08-27 13:17:05'),(242,27,'affected_tasks',20,'2024-08-27 13:17:05'),(243,27,'removed_assignments',5,'2024-08-27 13:17:19'),(244,28,'total_story_points',49,'2024-08-27 13:35:39'),(245,28,'total_issues',12,'2024-08-27 13:35:39'),(246,28,'directly_blocked_issues',1,'2024-08-27 13:35:41'),(247,28,'dependent_blocked_issues',1,'2024-08-27 13:35:41'),(248,28,'story_points_change',35,'2024-08-27 13:35:49'),(249,28,'story_points_overflow',12,'2024-08-27 13:35:49'),(250,28,'resource_variability',3,'2024-08-27 13:35:52'),(251,28,'dynamic_task_assignment',10,'2024-08-27 13:35:59'),(252,28,'priority_changes',10,'2024-08-27 13:36:18'),(253,28,'affected_tasks',14,'2024-08-27 13:36:18'),(254,28,'removed_assignments',5,'2024-08-27 13:36:33'),(255,29,'total_story_points',49,'2024-08-27 13:47:24'),(256,29,'total_issues',12,'2024-08-27 13:47:24'),(257,29,'directly_blocked_issues',1,'2024-08-27 13:47:26'),(258,29,'dependent_blocked_issues',1,'2024-08-27 13:47:26'),(259,29,'story_points_change',40,'2024-08-27 13:47:34'),(260,29,'story_points_overflow',12,'2024-08-27 13:47:34'),(261,29,'resource_variability',5,'2024-08-27 13:47:38'),(262,29,'dynamic_task_assignment',9,'2024-08-27 13:47:44'),(263,29,'priority_changes',11,'2024-08-27 13:48:10'),(264,29,'affected_tasks',20,'2024-08-27 13:48:10'),(265,29,'removed_assignments',5,'2024-08-27 13:48:23'),(266,30,'total_story_points',49,'2024-08-27 14:05:15'),(267,30,'total_issues',12,'2024-08-27 14:05:15'),(268,30,'directly_blocked_issues',1,'2024-08-27 14:05:17'),(269,30,'dependent_blocked_issues',2,'2024-08-27 14:05:17'),(270,30,'story_points_change',42,'2024-08-27 14:05:25'),(271,30,'story_points_overflow',12,'2024-08-27 14:05:25'),(272,30,'resource_variability',2,'2024-08-27 14:05:27'),(273,30,'dynamic_task_assignment',10,'2024-08-27 14:05:34'),(274,30,'priority_changes',11,'2024-08-27 14:05:57'),(275,30,'affected_tasks',16,'2024-08-27 14:05:57'),(276,30,'removed_assignments',5,'2024-08-27 14:06:09'),(277,31,'total_story_points',49,'2024-08-27 14:13:46'),(278,31,'total_issues',12,'2024-08-27 14:13:46'),(279,31,'directly_blocked_issues',1,'2024-08-27 14:13:50'),(280,31,'dependent_blocked_issues',3,'2024-08-27 14:13:50'),(281,31,'story_points_change',34,'2024-08-27 14:13:58'),(282,31,'story_points_overflow',12,'2024-08-27 14:13:58'),(283,31,'resource_variability',3,'2024-08-27 14:14:00'),(284,31,'dynamic_task_assignment',10,'2024-08-27 14:14:07'),(285,31,'priority_changes',11,'2024-08-27 14:14:30'),(286,31,'affected_tasks',16,'2024-08-27 14:14:30'),(287,31,'removed_assignments',5,'2024-08-27 14:14:43'),(288,32,'total_story_points',49,'2024-08-27 14:19:38'),(289,32,'total_issues',12,'2024-08-27 14:19:38'),(290,32,'directly_blocked_issues',1,'2024-08-27 14:19:39'),(291,32,'dependent_blocked_issues',1,'2024-08-27 14:19:39'),(292,32,'story_points_change',30,'2024-08-27 14:19:47'),(293,32,'story_points_overflow',12,'2024-08-27 14:19:47'),(294,32,'resource_variability',3,'2024-08-27 14:19:50'),(295,32,'dynamic_task_assignment',6,'2024-08-27 14:19:54'),(296,32,'priority_changes',11,'2024-08-27 14:20:18'),(297,32,'affected_tasks',18,'2024-08-27 14:20:18'),(298,32,'removed_assignments',5,'2024-08-27 14:20:28'),(299,33,'total_story_points',49,'2024-08-27 14:37:39'),(300,33,'total_issues',12,'2024-08-27 14:37:39'),(301,33,'directly_blocked_issues',1,'2024-08-27 14:37:43'),(302,33,'dependent_blocked_issues',3,'2024-08-27 14:37:43'),(303,33,'story_points_change',39,'2024-08-27 14:37:51'),(304,33,'story_points_overflow',12,'2024-08-27 14:37:51'),(305,33,'resource_variability',5,'2024-08-27 14:37:54'),(306,33,'dynamic_task_assignment',7,'2024-08-27 14:37:59'),(307,33,'priority_changes',11,'2024-08-27 14:38:22'),(308,33,'affected_tasks',16,'2024-08-27 14:38:22'),(309,33,'removed_assignments',5,'2024-08-27 14:38:35'),(310,34,'total_story_points',49,'2024-08-27 14:53:06'),(311,34,'total_issues',12,'2024-08-27 14:53:06'),(312,34,'directly_blocked_issues',1,'2024-08-27 14:53:09'),(313,34,'dependent_blocked_issues',2,'2024-08-27 14:53:09'),(314,34,'story_points_change',35,'2024-08-27 14:53:16'),(315,34,'story_points_overflow',12,'2024-08-27 14:53:16'),(316,34,'resource_variability',2,'2024-08-27 14:53:18'),(317,34,'dynamic_task_assignment',11,'2024-08-27 14:53:25'),(318,34,'priority_changes',10,'2024-08-27 14:53:47'),(319,34,'affected_tasks',15,'2024-08-27 14:53:47'),(320,34,'removed_assignments',5,'2024-08-27 14:53:57'),(321,35,'total_story_points',49,'2024-08-27 15:25:05'),(322,35,'total_issues',12,'2024-08-27 15:25:05'),(323,35,'directly_blocked_issues',1,'2024-08-27 15:25:06'),(324,35,'dependent_blocked_issues',0,'2024-08-27 15:25:06'),(325,35,'story_points_change',37,'2024-08-27 15:25:14'),(326,35,'story_points_overflow',12,'2024-08-27 15:25:14'),(327,35,'resource_variability',2,'2024-08-27 15:25:15'),(328,35,'dynamic_task_assignment',10,'2024-08-27 15:25:22'),(329,35,'priority_changes',11,'2024-08-27 15:25:46'),(330,35,'affected_tasks',17,'2024-08-27 15:25:46'),(331,35,'removed_assignments',5,'2024-08-27 15:25:59'),(332,36,'total_story_points',49,'2024-08-27 16:00:25'),(333,36,'total_issues',12,'2024-08-27 16:00:25'),(334,36,'directly_blocked_issues',1,'2024-08-27 16:00:27'),(335,36,'dependent_blocked_issues',1,'2024-08-27 16:00:27'),(336,36,'story_points_change',33,'2024-08-27 16:00:35'),(337,36,'story_points_overflow',12,'2024-08-27 16:00:35'),(338,36,'resource_variability',5,'2024-08-27 16:00:38'),(339,36,'dynamic_task_assignment',6,'2024-08-27 16:00:43'),(340,36,'priority_changes',11,'2024-08-27 16:01:06'),(341,36,'affected_tasks',17,'2024-08-27 16:01:06'),(342,36,'removed_assignments',5,'2024-08-27 16:01:20');
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority_counts`
--

DROP TABLE IF EXISTS `priority_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priority_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority_counts`
--

LOCK TABLES `priority_counts` WRITE;
/*!40000 ALTER TABLE `priority_counts` DISABLE KEYS */;
INSERT INTO `priority_counts` VALUES (131,25,'Initial Highest',0,'2024-08-13 09:19:06'),(132,25,'Initial High',4,'2024-08-13 09:19:06'),(133,25,'Initial Medium',0,'2024-08-13 09:19:06'),(134,25,'Initial Low',5,'2024-08-13 09:19:06'),(135,25,'Initial Lowest',3,'2024-08-13 09:19:06'),(136,25,'Final Highest',4,'2024-08-13 09:19:34'),(137,25,'Final High',1,'2024-08-13 09:19:34'),(138,25,'Final Medium',3,'2024-08-13 09:19:34'),(139,25,'Final Low',1,'2024-08-13 09:19:34'),(140,25,'Final Lowest',3,'2024-08-13 09:19:34'),(141,26,'Initial Highest',5,'2024-08-18 16:14:41'),(142,26,'Initial High',2,'2024-08-18 16:14:41'),(143,26,'Initial Medium',4,'2024-08-18 16:14:41'),(144,26,'Initial Low',0,'2024-08-18 16:14:41'),(145,26,'Initial Lowest',1,'2024-08-18 16:14:41'),(146,26,'Final Highest',2,'2024-08-18 16:15:03'),(147,26,'Final High',2,'2024-08-18 16:15:03'),(148,26,'Final Medium',4,'2024-08-18 16:15:03'),(149,26,'Final Low',1,'2024-08-18 16:15:03'),(150,26,'Final Lowest',3,'2024-08-18 16:15:03'),(151,27,'Initial Highest',2,'2024-08-27 13:16:39'),(152,27,'Initial High',2,'2024-08-27 13:16:39'),(153,27,'Initial Medium',3,'2024-08-27 13:16:39'),(154,27,'Initial Low',1,'2024-08-27 13:16:39'),(155,27,'Initial Lowest',4,'2024-08-27 13:16:39'),(156,27,'Final Highest',3,'2024-08-27 13:17:05'),(157,27,'Final High',1,'2024-08-27 13:17:05'),(158,27,'Final Medium',5,'2024-08-27 13:17:05'),(159,27,'Final Low',2,'2024-08-27 13:17:05'),(160,27,'Final Lowest',1,'2024-08-27 13:17:05'),(161,28,'Initial Highest',5,'2024-08-27 13:35:59'),(162,28,'Initial High',1,'2024-08-27 13:35:59'),(163,28,'Initial Medium',3,'2024-08-27 13:35:59'),(164,28,'Initial Low',3,'2024-08-27 13:35:59'),(165,28,'Initial Lowest',0,'2024-08-27 13:35:59'),(166,28,'Final Highest',3,'2024-08-27 13:36:18'),(167,28,'Final High',5,'2024-08-27 13:36:18'),(168,28,'Final Medium',0,'2024-08-27 13:36:18'),(169,28,'Final Low',0,'2024-08-27 13:36:18'),(170,28,'Final Lowest',4,'2024-08-27 13:36:18'),(171,29,'Initial Highest',1,'2024-08-27 13:47:44'),(172,29,'Initial High',8,'2024-08-27 13:47:44'),(173,29,'Initial Medium',0,'2024-08-27 13:47:44'),(174,29,'Initial Low',0,'2024-08-27 13:47:44'),(175,29,'Initial Lowest',3,'2024-08-27 13:47:44'),(176,29,'Final Highest',4,'2024-08-27 13:48:10'),(177,29,'Final High',1,'2024-08-27 13:48:10'),(178,29,'Final Medium',4,'2024-08-27 13:48:10'),(179,29,'Final Low',1,'2024-08-27 13:48:10'),(180,29,'Final Lowest',2,'2024-08-27 13:48:10'),(181,30,'Initial Highest',2,'2024-08-27 14:05:34'),(182,30,'Initial High',0,'2024-08-27 14:05:34'),(183,30,'Initial Medium',6,'2024-08-27 14:05:34'),(184,30,'Initial Low',2,'2024-08-27 14:05:34'),(185,30,'Initial Lowest',2,'2024-08-27 14:05:34'),(186,30,'Final Highest',3,'2024-08-27 14:05:57'),(187,30,'Final High',3,'2024-08-27 14:05:57'),(188,30,'Final Medium',2,'2024-08-27 14:05:57'),(189,30,'Final Low',3,'2024-08-27 14:05:57'),(190,30,'Final Lowest',1,'2024-08-27 14:05:57'),(191,31,'Initial Highest',5,'2024-08-27 14:14:07'),(192,31,'Initial High',5,'2024-08-27 14:14:07'),(193,31,'Initial Medium',1,'2024-08-27 14:14:07'),(194,31,'Initial Low',1,'2024-08-27 14:14:07'),(195,31,'Initial Lowest',0,'2024-08-27 14:14:07'),(196,31,'Final Highest',2,'2024-08-27 14:14:30'),(197,31,'Final High',2,'2024-08-27 14:14:30'),(198,31,'Final Medium',3,'2024-08-27 14:14:30'),(199,31,'Final Low',4,'2024-08-27 14:14:30'),(200,31,'Final Lowest',1,'2024-08-27 14:14:30'),(201,32,'Initial Highest',2,'2024-08-27 14:19:54'),(202,32,'Initial High',1,'2024-08-27 14:19:54'),(203,32,'Initial Medium',4,'2024-08-27 14:19:54'),(204,32,'Initial Low',4,'2024-08-27 14:19:54'),(205,32,'Initial Lowest',1,'2024-08-27 14:19:54'),(206,32,'Final Highest',3,'2024-08-27 14:20:18'),(207,32,'Final High',4,'2024-08-27 14:20:18'),(208,32,'Final Medium',1,'2024-08-27 14:20:18'),(209,32,'Final Low',3,'2024-08-27 14:20:18'),(210,32,'Final Lowest',1,'2024-08-27 14:20:18'),(211,33,'Initial Highest',4,'2024-08-27 14:37:59'),(212,33,'Initial High',3,'2024-08-27 14:37:59'),(213,33,'Initial Medium',1,'2024-08-27 14:37:59'),(214,33,'Initial Low',3,'2024-08-27 14:37:59'),(215,33,'Initial Lowest',1,'2024-08-27 14:37:59'),(216,33,'Final Highest',4,'2024-08-27 14:38:22'),(217,33,'Final High',0,'2024-08-27 14:38:22'),(218,33,'Final Medium',2,'2024-08-27 14:38:22'),(219,33,'Final Low',5,'2024-08-27 14:38:22'),(220,33,'Final Lowest',1,'2024-08-27 14:38:22'),(221,34,'Initial Highest',4,'2024-08-27 14:53:25'),(222,34,'Initial High',0,'2024-08-27 14:53:25'),(223,34,'Initial Medium',3,'2024-08-27 14:53:25'),(224,34,'Initial Low',3,'2024-08-27 14:53:25'),(225,34,'Initial Lowest',2,'2024-08-27 14:53:25'),(226,34,'Final Highest',4,'2024-08-27 14:53:47'),(227,34,'Final High',1,'2024-08-27 14:53:47'),(228,34,'Final Medium',2,'2024-08-27 14:53:47'),(229,34,'Final Low',4,'2024-08-27 14:53:47'),(230,34,'Final Lowest',1,'2024-08-27 14:53:47'),(231,35,'Initial Highest',2,'2024-08-27 15:25:22'),(232,35,'Initial High',2,'2024-08-27 15:25:22'),(233,35,'Initial Medium',3,'2024-08-27 15:25:22'),(234,35,'Initial Low',4,'2024-08-27 15:25:22'),(235,35,'Initial Lowest',1,'2024-08-27 15:25:22'),(236,35,'Final Highest',6,'2024-08-27 15:25:46'),(237,35,'Final High',1,'2024-08-27 15:25:46'),(238,35,'Final Medium',3,'2024-08-27 15:25:46'),(239,35,'Final Low',1,'2024-08-27 15:25:46'),(240,35,'Final Lowest',1,'2024-08-27 15:25:46'),(241,36,'Initial Highest',8,'2024-08-27 16:00:43'),(242,36,'Initial High',0,'2024-08-27 16:00:43'),(243,36,'Initial Medium',2,'2024-08-27 16:00:43'),(244,36,'Initial Low',0,'2024-08-27 16:00:43'),(245,36,'Initial Lowest',2,'2024-08-27 16:00:43'),(246,36,'Final Highest',1,'2024-08-27 16:01:06'),(247,36,'Final High',4,'2024-08-27 16:01:06'),(248,36,'Final Medium',1,'2024-08-27 16:01:06'),(249,36,'Final Low',3,'2024-08-27 16:01:06'),(250,36,'Final Lowest',3,'2024-08-27 16:01:06');
/*!40000 ALTER TABLE `priority_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `removed_assignments`
--

DROP TABLE IF EXISTS `removed_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `removed_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `task_key` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `affected_issues` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `removed_assignments`
--

LOCK TABLES `removed_assignments` WRITE;
/*!40000 ALTER TABLE `removed_assignments` DISABLE KEYS */;
INSERT INTO `removed_assignments` VALUES (61,25,'HBOM-5','jollyjerinjoy',3,'2024-08-13 09:19:37'),(62,25,'HBOM-11','jollyjerinjoy',5,'2024-08-13 09:19:42'),(63,25,'HBOM-4','jollyjerinjoy',2,'2024-08-13 09:19:44'),(64,25,'HBOM-9','Aneesh Ramakrishna Pillai',3,'2024-08-13 09:19:47'),(65,25,'HBOM-1','Aneesh Ramakrishna Pillai',2,'2024-08-13 09:19:49'),(66,26,'HBOM-4','jollyjerinjoy',2,'2024-08-18 16:15:05'),(67,26,'HBOM-8','Aneesh Ramakrishna Pillai',3,'2024-08-18 16:15:08'),(68,26,'HBOM-12','jollyjerinjoy',3,'2024-08-18 16:15:10'),(69,26,'HBOM-2','Aneesh Ramakrishna Pillai',4,'2024-08-18 16:15:14'),(70,26,'HBOM-10','Aneesh Ramakrishna Pillai',2,'2024-08-18 16:15:16'),(71,27,'HBOM-9','jollyjerinjoy',3,'2024-08-27 13:17:08'),(72,27,'HBOM-12','Aneesh Ramakrishna Pillai',3,'2024-08-27 13:17:11'),(73,27,'HBOM-5','jollyjerinjoy',3,'2024-08-27 13:17:14'),(74,27,'HBOM-3','Aneesh Ramakrishna Pillai',1,'2024-08-27 13:17:15'),(75,27,'HBOM-7','Aneesh Ramakrishna Pillai',3,'2024-08-27 13:17:19'),(76,28,'HBOM-11','jollyjerinjoy',5,'2024-08-27 13:36:23'),(77,28,'HBOM-2','jollyjerinjoy',4,'2024-08-27 13:36:27'),(78,28,'HBOM-4','jollyjerinjoy',2,'2024-08-27 13:36:29'),(79,28,'HBOM-10','jollyjerinjoy',2,'2024-08-27 13:36:31'),(80,28,'HBOM-8','jollyjerinjoy',3,'2024-08-27 13:36:33'),(81,29,'HBOM-8','Aneesh Ramakrishna Pillai',3,'2024-08-27 13:48:13'),(82,29,'HBOM-9','jollyjerinjoy',3,'2024-08-27 13:48:16'),(83,29,'HBOM-6','Aneesh Ramakrishna Pillai',4,'2024-08-27 13:48:20'),(84,29,'HBOM-3','jollyjerinjoy',1,'2024-08-27 13:48:21'),(85,29,'HBOM-1','Aneesh Ramakrishna Pillai',2,'2024-08-27 13:48:23'),(86,30,'HBOM-5','Aneesh Ramakrishna Pillai',3,'2024-08-27 14:06:00'),(87,30,'HBOM-9','jollyjerinjoy',3,'2024-08-27 14:06:03'),(88,30,'HBOM-4','jollyjerinjoy',2,'2024-08-27 14:06:05'),(89,30,'HBOM-8','Aneesh Ramakrishna Pillai',2,'2024-08-27 14:06:07'),(90,30,'HBOM-7','Aneesh Ramakrishna Pillai',3,'2024-08-27 14:06:09'),(91,31,'HBOM-3','jollyjerinjoy',1,'2024-08-27 14:14:31'),(92,31,'HBOM-10','jollyjerinjoy',2,'2024-08-27 14:14:34'),(93,31,'HBOM-5','jollyjerinjoy',3,'2024-08-27 14:14:37'),(94,31,'HBOM-11','jollyjerinjoy',4,'2024-08-27 14:14:40'),(95,31,'HBOM-12','jollyjerinjoy',3,'2024-08-27 14:14:43'),(96,32,'HBOM-3','Aneesh Ramakrishna Pillai',1,'2024-08-27 14:20:19'),(97,32,'HBOM-12','Aneesh Ramakrishna Pillai',3,'2024-08-27 14:20:21'),(98,32,'HBOM-10','jollyjerinjoy',2,'2024-08-27 14:20:23'),(99,32,'HBOM-9','Aneesh Ramakrishna Pillai',3,'2024-08-27 14:20:26'),(100,32,'HBOM-1','jollyjerinjoy',2,'2024-08-27 14:20:28'),(101,33,'HBOM-6','Aneesh Ramakrishna Pillai',4,'2024-08-27 14:38:26'),(102,33,'HBOM-7','Aneesh Ramakrishna Pillai',3,'2024-08-27 14:38:28'),(103,33,'HBOM-3','jollyjerinjoy',1,'2024-08-27 14:38:30'),(104,33,'HBOM-10','jollyjerinjoy',2,'2024-08-27 14:38:32'),(105,33,'HBOM-9','jollyjerinjoy',3,'2024-08-27 14:38:35'),(106,34,'HBOM-4','jollyjerinjoy',2,'2024-08-27 14:53:49'),(107,34,'HBOM-8','Aneesh Ramakrishna Pillai',2,'2024-08-27 14:53:51'),(108,34,'HBOM-5','jollyjerinjoy',3,'2024-08-27 14:53:53'),(109,34,'HBOM-3','Aneesh Ramakrishna Pillai',1,'2024-08-27 14:53:55'),(110,34,'HBOM-1','Aneesh Ramakrishna Pillai',2,'2024-08-27 14:53:57'),(111,35,'HBOM-1','Aneesh Ramakrishna Pillai',2,'2024-08-27 15:25:48'),(112,35,'HBOM-5','jollyjerinjoy',3,'2024-08-27 15:25:51'),(113,35,'HBOM-9','jollyjerinjoy',3,'2024-08-27 15:25:54'),(114,35,'HBOM-6','jollyjerinjoy',4,'2024-08-27 15:25:57'),(115,35,'HBOM-8','Aneesh Ramakrishna Pillai',2,'2024-08-27 15:25:59'),(116,36,'HBOM-5','jollyjerinjoy',3,'2024-08-27 16:01:09'),(117,36,'HBOM-4','jollyjerinjoy',2,'2024-08-27 16:01:11'),(118,36,'HBOM-10','Aneesh Ramakrishna Pillai',2,'2024-08-27 16:01:13'),(119,36,'HBOM-12','jollyjerinjoy',3,'2024-08-27 16:01:16'),(120,36,'HBOM-11','Aneesh Ramakrishna Pillai',4,'2024-08-27 16:01:20');
/*!40000 ALTER TABLE `removed_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_allocation`
--

DROP TABLE IF EXISTS `resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `task_key` varchar(255) DEFAULT NULL,
  `original_resources` int(11) DEFAULT NULL,
  `new_resources` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_allocation`
--

LOCK TABLES `resource_allocation` WRITE;
/*!40000 ALTER TABLE `resource_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprints`
--

DROP TABLE IF EXISTS `sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `sprint_name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprints`
--

LOCK TABLES `sprints` WRITE;
/*!40000 ALTER TABLE `sprints` DISABLE KEYS */;
INSERT INTO `sprints` VALUES (25,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-09 23:00:00'),(26,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-09 23:00:00'),(27,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(28,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(29,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(30,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(31,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(32,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(33,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(34,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(35,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00'),(36,4,'Sprint 1: Development Sprint','2024-07-27 23:01:00','2024-08-03 23:00:00');
/*!40000 ALTER TABLE `sprints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_story_points`
--

DROP TABLE IF EXISTS `user_story_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_story_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprint_id` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `initial_story_points` float DEFAULT NULL,
  `new_story_points` float DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story_points`
--

LOCK TABLES `user_story_points` WRITE;
/*!40000 ALTER TABLE `user_story_points` DISABLE KEYS */;
INSERT INTO `user_story_points` VALUES (68,25,'unassigned',34,34,'2024-08-13 09:19:00'),(69,25,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',9,15,'2024-08-13 09:19:00'),(70,25,'5d95e3112cd7e10c296e7e1c',48,42,'2024-08-13 09:19:00'),(71,25,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',69,69,'2024-08-13 09:19:06'),(72,25,'5d95e3112cd7e10c296e7e1c',22,22,'2024-08-13 09:19:06'),(73,26,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',19,17,'2024-08-18 16:14:36'),(74,26,'unassigned',28,22,'2024-08-18 16:14:36'),(75,26,'5d95e3112cd7e10c296e7e1c',40,48,'2024-08-18 16:14:36'),(76,26,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',45,45,'2024-08-18 16:14:41'),(77,26,'5d95e3112cd7e10c296e7e1c',42,42,'2024-08-18 16:14:41'),(78,27,'5d95e3112cd7e10c296e7e1c',0,25,'2024-08-27 13:16:32'),(79,27,'unassigned',82,57,'2024-08-27 13:16:32'),(80,27,'5d95e3112cd7e10c296e7e1c',52,52,'2024-08-27 13:16:39'),(81,27,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',30,30,'2024-08-27 13:16:39'),(82,28,'unassigned',40,29,'2024-08-27 13:35:52'),(83,28,'5d95e3112cd7e10c296e7e1c',36,51,'2024-08-27 13:35:52'),(84,28,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',8,4,'2024-08-27 13:35:52'),(85,28,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',77,77,'2024-08-27 13:35:59'),(86,28,'5d95e3112cd7e10c296e7e1c',7,7,'2024-08-27 13:35:59'),(87,29,'5d95e3112cd7e10c296e7e1c',0,30,'2024-08-27 13:47:38'),(88,29,'unassigned',89,45,'2024-08-27 13:47:38'),(89,29,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',0,14,'2024-08-27 13:47:38'),(90,29,'5d95e3112cd7e10c296e7e1c',39,39,'2024-08-27 13:47:44'),(91,29,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',50,50,'2024-08-27 13:47:44'),(92,30,'unassigned',91,86,'2024-08-27 14:05:27'),(93,30,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',0,1,'2024-08-27 14:05:27'),(94,30,'5d95e3112cd7e10c296e7e1c',0,4,'2024-08-27 14:05:27'),(95,30,'5d95e3112cd7e10c296e7e1c',67,67,'2024-08-27 14:05:34'),(96,30,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',24,24,'2024-08-27 14:05:34'),(97,31,'5d95e3112cd7e10c296e7e1c',28,43,'2024-08-27 14:14:00'),(98,31,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',17,21,'2024-08-27 14:14:00'),(99,31,'unassigned',38,19,'2024-08-27 14:14:00'),(100,31,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',63,63,'2024-08-27 14:14:07'),(101,31,'5d95e3112cd7e10c296e7e1c',20,20,'2024-08-27 14:14:07'),(102,32,'unassigned',35,28,'2024-08-27 14:19:50'),(103,32,'5d95e3112cd7e10c296e7e1c',25,36,'2024-08-27 14:19:50'),(104,32,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',19,15,'2024-08-27 14:19:50'),(105,32,'5d95e3112cd7e10c296e7e1c',51,51,'2024-08-27 14:19:54'),(106,32,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',28,28,'2024-08-27 14:19:54'),(107,33,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',11,29,'2024-08-27 14:37:54'),(108,33,'5d95e3112cd7e10c296e7e1c',48,46,'2024-08-27 14:37:54'),(109,33,'unassigned',29,13,'2024-08-27 14:37:54'),(110,33,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',40,40,'2024-08-27 14:37:59'),(111,33,'5d95e3112cd7e10c296e7e1c',48,48,'2024-08-27 14:37:59'),(112,34,'5d95e3112cd7e10c296e7e1c',26,38,'2024-08-27 14:53:18'),(113,34,'unassigned',30,27,'2024-08-27 14:53:18'),(114,34,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',28,19,'2024-08-27 14:53:18'),(115,34,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',43,43,'2024-08-27 14:53:25'),(116,34,'5d95e3112cd7e10c296e7e1c',41,41,'2024-08-27 14:53:25'),(117,35,'5d95e3112cd7e10c296e7e1c',49,53,'2024-08-27 15:25:15'),(118,35,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',12,17,'2024-08-27 15:25:15'),(119,35,'unassigned',25,16,'2024-08-27 15:25:15'),(120,35,'5d95e3112cd7e10c296e7e1c',57,57,'2024-08-27 15:25:22'),(121,35,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',29,29,'2024-08-27 15:25:22'),(122,36,'5d95e3112cd7e10c296e7e1c',45,54,'2024-08-27 16:00:38'),(123,36,'unassigned',30,15,'2024-08-27 16:00:38'),(124,36,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',7,13,'2024-08-27 16:00:38'),(125,36,'712020:c848c6d8-f579-4e5c-8ec1-382636c7961f',29,29,'2024-08-27 16:00:43'),(126,36,'5d95e3112cd7e10c296e7e1c',53,53,'2024-08-27 16:00:43');
/*!40000 ALTER TABLE `user_story_points` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27 16:58:49