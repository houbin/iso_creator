-- MySQL dump 10.13  Distrib 5.5.46, for Linux (x86_64)
--
-- Host: localhost    Database: data_collection
-- ------------------------------------------------------
-- Server version	5.5.46

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
-- Current Database: `data_collection`
--

DROP DATABASE IF EXISTS `data_collection`;
CREATE DATABASE `data_collection` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `data_collection`;

--
-- Table structure for table `alarm_config`
--

DROP TABLE IF EXISTS `alarm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` varchar(45) NOT NULL,
  `alarm_type` tinyint(4) NOT NULL COMMENT '1:邮件,2:短信',
  `alarm_value` varchar(100) NOT NULL COMMENT '邮件地址或者手机号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='报警配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm_config`
--

LOCK TABLES `alarm_config` WRITE;
/*!40000 ALTER TABLE `alarm_config` DISABLE KEYS */;
INSERT INTO `alarm_config` VALUES (1,'23',1,'houbin0504@163.com'),(3,'23',1,'15552390112@163.com'),(4,'A301',1,'xjs@163.com'),(5,'A301',2,'15612341234'),(8,'A301',1,'xjs@qq.com'),(9,'A301',2,'13584756215');
/*!40000 ALTER TABLE `alarm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analog_config`
--

DROP TABLE IF EXISTS `analog_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analog_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` varchar(45) NOT NULL COMMENT '设备id',
  `probe_no` tinyint(4) NOT NULL COMMENT '探头号',
  `probe_name` varchar(45) DEFAULT NULL COMMENT '探头名称',
  `param_a` double DEFAULT NULL COMMENT '公式参数a',
  `param_b` double DEFAULT NULL COMMENT '公式参数b',
  `upper_limit` double DEFAULT NULL COMMENT '模拟量上限值',
  `down_limit` double DEFAULT NULL COMMENT '模拟量下限值',
  `max_range` double DEFAULT NULL COMMENT '模拟量最大量程',
  `min_range` double DEFAULT NULL COMMENT '模拟量最小量程',
  `upper_relay` int(11) DEFAULT NULL COMMENT '达到上限时报警信号输出到哪个继电器',
  `down_relay` int(11) DEFAULT NULL COMMENT '达到下限值时报警信号输出到哪个继电器',
  `unit` varchar(10) DEFAULT NULL COMMENT '模拟量单位',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_PROBE` (`dev_id`,`probe_no`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analog_config`
--

LOCK TABLES `analog_config` WRITE;
/*!40000 ALTER TABLE `analog_config` DISABLE KEYS */;
INSERT INTO `analog_config` VALUES (1,'A301',1,'1号探头',2,3,80,20,100,0,1,1,'立方'),(2,'A301',2,'2号探头',3,4,70,30,100,0,2,2,'毫克'),(32,'23',0,'abc',1.1,1.2,10,-10,10,-10,2,5,''),(33,'23',2,'abc',2.1,2.2,5.1,2.2,4.1,0,2,8,''),(34,'23',4,'abc',3.1,3.2,2.5,-1.5,-3,-10,2,9,''),(35,'23',6,'abc',3.1,3.2,2,1,2,1,2,5,'');
/*!40000 ALTER TABLE `analog_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analog_data`
--

DROP TABLE IF EXISTS `analog_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analog_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `dev_id` varchar(45) NOT NULL,
  `probe_no` tinyint(4) NOT NULL COMMENT '探头号',
  `value` double DEFAULT NULL,
  `alarm_state` tinyint(4) DEFAULT NULL COMMENT '是否出发报警，0代表未报警，1代表报警',
  PRIMARY KEY (`id`),
  KEY `FIND_PROBE` (`dev_id`,`probe_no`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analog_data`
--

LOCK TABLES `analog_data` WRITE;
/*!40000 ALTER TABLE `analog_data` DISABLE KEYS */;
INSERT INTO `analog_data` VALUES (1,'2016-01-20 09:48:00','A301',1,50,0),(2,'2016-01-20 09:45:00','A301',1,60,1),(3,'2016-01-20 09:50:00','A301',2,70,1),(6,'2016-01-20 17:40:48','000023',0,-0.3,0),(7,'2016-01-20 17:40:48','000023',2,0.5,1),(8,'2016-01-20 17:40:48','000023',4,100,0),(9,'2016-01-20 17:40:48','000023',6,0,1),(10,'2016-01-20 17:43:34','000023',0,-0.3,0),(11,'2016-01-20 17:43:34','000023',2,0.5,1),(12,'2016-01-20 17:43:34','000023',4,100,0),(13,'2016-01-20 17:43:34','000023',6,0,1),(14,'2016-01-20 17:44:48','000023',0,-0.3,0),(15,'2016-01-20 17:44:48','000023',2,0.5,1),(16,'2016-01-20 17:44:48','000023',4,100,0),(17,'2016-01-20 17:44:48','000023',6,0,1),(18,'2016-01-20 17:48:24','000023',0,-0.3,0),(19,'2016-01-20 17:48:24','000023',2,0.5,1),(20,'2016-01-20 17:48:24','000023',4,100,0),(21,'2016-01-20 17:48:24','000023',6,0,1),(22,'2016-01-20 17:49:36','000023',0,-0.3,0),(23,'2016-01-20 17:49:36','000023',2,0.5,1),(24,'2016-01-20 17:49:36','000023',4,100,0),(25,'2016-01-20 17:49:36','000023',6,0,1),(26,'2016-01-20 17:52:47','23',0,-0.3,0),(27,'2016-01-20 17:52:47','23',2,0.5,1),(28,'2016-01-20 17:52:47','23',4,100,0),(29,'2016-01-20 17:52:47','23',6,0,1),(30,'2016-01-20 17:55:16','23',0,-0.3,0),(31,'2016-01-20 17:55:16','23',2,0.5,1),(32,'2016-01-20 17:55:16','23',4,100,0),(33,'2016-01-20 17:55:16','23',6,0,1),(34,'2016-01-20 17:57:02','23',0,-0.3,0),(35,'2016-01-20 17:57:02','23',2,0.5,1),(36,'2016-01-20 17:57:02','23',4,100,0),(37,'2016-01-20 17:57:02','23',6,0,1),(38,'2016-01-20 18:00:19','23',0,-0.3,0),(39,'2016-01-20 18:00:19','23',2,0.5,1),(40,'2016-01-20 18:00:19','23',4,100,0),(41,'2016-01-20 18:00:19','23',6,0,1),(42,'2016-01-20 18:01:52','23',0,-0.3,0),(43,'2016-01-20 18:01:52','23',2,0.5,1),(44,'2016-01-20 18:01:52','23',4,100,0),(45,'2016-01-20 18:01:52','23',6,0,1),(46,'2016-01-20 18:02:41','23',0,-0.3,0),(47,'2016-01-20 18:02:41','23',2,0.5,1),(48,'2016-01-20 18:02:41','23',4,100,0),(49,'2016-01-20 18:02:41','23',6,0,1),(50,'2016-01-20 18:03:13','23',0,-0.3,0),(51,'2016-01-20 18:03:13','23',2,0.5,1),(52,'2016-01-20 18:03:13','23',4,100,0),(53,'2016-01-20 18:03:13','23',6,0,1),(54,'2016-01-21 09:18:57','23',0,-0.3,0),(55,'2016-01-21 09:18:57','23',2,0.5,1),(56,'2016-01-21 09:18:57','23',4,100,0),(57,'2016-01-21 09:18:57','23',6,0,1),(58,'2016-01-21 09:22:38','23',0,-0.3,0),(59,'2016-01-21 09:22:38','23',2,0.5,1),(60,'2016-01-21 09:22:38','23',4,100,0),(61,'2016-01-21 09:22:38','23',6,0,1),(62,'2016-01-20 09:55:00','A301',1,44,1),(63,'2016-01-20 09:50:00','A301',1,22,1),(64,'2016-01-20 10:00:00','A301',1,11,1),(65,'2016-01-21 09:51:52','23',0,-0.3,0),(66,'2016-01-21 09:51:52','23',2,0.5,1),(67,'2016-01-21 09:51:52','23',4,100,0),(68,'2016-01-21 09:51:52','23',6,0,1),(69,'2016-01-21 10:02:38','23',0,-0.3,0),(70,'2016-01-21 10:02:38','23',2,0.5,1),(71,'2016-01-21 10:02:38','23',4,100,0),(72,'2016-01-21 10:02:38','23',6,0,1),(73,'2016-01-21 10:04:41','23',0,-0.3,0),(74,'2016-01-21 10:04:41','23',2,0.5,1),(75,'2016-01-21 10:04:41','23',4,100,0),(76,'2016-01-21 10:04:41','23',6,0,1),(77,'2016-01-21 10:07:18','23',0,-0.3,0),(78,'2016-01-21 10:07:18','23',2,0.5,1),(79,'2016-01-21 10:07:18','23',4,100,0),(80,'2016-01-21 10:07:18','23',6,0,1),(81,'2016-01-21 10:09:27','23',0,-0.3,0),(82,'2016-01-21 10:09:27','23',2,0.5,1),(83,'2016-01-21 10:09:27','23',4,100,0),(84,'2016-01-21 10:09:27','23',6,0,1),(85,'2016-01-21 10:09:48','23',0,-0.3,0),(86,'2016-01-21 10:09:48','23',2,0.5,1),(87,'2016-01-21 10:09:48','23',4,100,0),(88,'2016-01-21 10:09:48','23',6,0,1),(89,'2016-01-21 10:10:44','23',0,-0.3,0),(90,'2016-01-21 10:10:44','23',2,0.5,1),(91,'2016-01-21 10:10:44','23',4,100,0),(92,'2016-01-21 10:10:44','23',6,0,1),(93,'2016-01-21 10:13:07','23',0,-0.3,0),(94,'2016-01-21 10:13:07','23',2,0.5,1),(95,'2016-01-21 10:13:07','23',4,100,0),(96,'2016-01-21 10:13:07','23',6,0,1),(97,'2016-01-19 10:00:00','A301',1,-1,1),(98,'2016-01-21 10:00:00','A301',1,-22,1),(99,'2016-01-21 09:00:00','A301',1,11,1),(100,'2016-01-21 11:12:24','23',0,-0.3,0),(101,'2016-01-21 11:12:24','23',2,0.5,1),(102,'2016-01-21 11:12:24','23',4,100,0),(103,'2016-01-21 11:12:24','23',6,0,1),(104,'2016-01-21 11:19:09','23',0,-0.3,0),(105,'2016-01-21 11:19:09','23',2,0.5,1),(106,'2016-01-21 11:19:09','23',4,100,0),(107,'2016-01-21 11:19:09','23',6,0,1),(108,'2016-01-21 11:22:48','23',0,-0.3,0),(109,'2016-01-21 11:22:48','23',2,0.5,1),(110,'2016-01-21 11:22:48','23',4,100,0),(111,'2016-01-21 11:22:48','23',6,0,1),(112,'2016-01-21 11:23:55','23',0,-0.3,0),(113,'2016-01-21 11:23:55','23',2,0.5,1),(114,'2016-01-21 11:23:55','23',4,100,0),(115,'2016-01-21 11:23:55','23',6,0,1),(116,'2016-01-21 11:29:45','23',0,-0.3,0),(117,'2016-01-21 11:29:45','23',2,0.5,1),(118,'2016-01-21 11:29:45','23',4,100,0),(119,'2016-01-21 11:29:45','23',6,0,1),(120,'2016-01-21 11:53:36','23',0,-0.3,0),(121,'2016-01-21 11:53:36','23',2,0.5,1),(122,'2016-01-21 11:53:36','23',4,100,0),(123,'2016-01-21 11:53:36','23',6,0,1),(124,'2016-01-21 11:54:54','23',0,-0.3,0),(125,'2016-01-21 11:54:54','23',2,0.5,1),(126,'2016-01-21 11:54:54','23',4,100,0),(127,'2016-01-21 11:54:54','23',6,0,1),(128,'2016-01-21 11:56:04','23',0,-0.3,0),(129,'2016-01-21 11:56:04','23',2,0.5,1),(130,'2016-01-21 11:56:04','23',4,100,0),(131,'2016-01-21 11:56:04','23',6,0,1),(132,'2016-01-21 11:57:43','23',0,-0.3,0),(133,'2016-01-21 11:57:43','23',2,0.5,1),(134,'2016-01-21 11:57:43','23',4,100,0),(135,'2016-01-21 11:57:43','23',6,0,1),(136,'2016-01-21 11:57:59','23',0,-0.3,0),(137,'2016-01-21 11:57:59','23',2,0.5,1),(138,'2016-01-21 11:57:59','23',4,100,0),(139,'2016-01-21 11:57:59','23',6,0,1),(140,'2016-01-21 12:02:32','23',0,-0.3,0),(141,'2016-01-21 12:02:32','23',2,0.5,1),(142,'2016-01-21 12:02:32','23',4,100,0),(143,'2016-01-21 12:02:32','23',6,0,1),(144,'2016-01-21 12:02:44','23',0,-0.3,0),(145,'2016-01-21 12:02:44','23',2,0.5,1),(146,'2016-01-21 12:02:44','23',4,100,0),(147,'2016-01-21 12:02:44','23',6,0,1),(148,'2016-01-21 12:03:33','23',0,-0.3,0),(149,'2016-01-21 12:03:33','23',2,0.5,1),(150,'2016-01-21 12:03:33','23',4,100,0),(151,'2016-01-21 12:03:33','23',6,0,1),(152,'2016-01-21 12:05:51','23',0,-0.3,0),(153,'2016-01-21 12:05:51','23',2,0.5,1),(154,'2016-01-21 12:05:51','23',4,100,0),(155,'2016-01-21 12:05:51','23',6,0,1),(156,'2016-01-21 12:06:01','23',0,-0.3,0),(157,'2016-01-21 12:06:01','23',2,0.5,1),(158,'2016-01-21 12:06:01','23',4,100,0),(159,'2016-01-21 12:06:01','23',6,0,1),(160,'2016-01-21 12:07:17','23',0,-0.3,0),(161,'2016-01-21 12:07:17','23',2,0.5,1),(162,'2016-01-21 12:07:17','23',4,100,0),(163,'2016-01-21 12:07:17','23',6,0,1),(164,'2016-01-21 12:07:51','23',0,-0.3,0),(165,'2016-01-21 12:07:51','23',2,0.5,1),(166,'2016-01-21 12:07:51','23',4,100,0),(167,'2016-01-21 12:07:51','23',6,0,1),(168,'2016-01-21 12:11:47','23',0,-0.3,0),(169,'2016-01-21 12:11:47','23',2,0.5,1),(170,'2016-01-21 12:11:47','23',4,100,0),(171,'2016-01-21 12:11:47','23',6,0,1),(172,'2016-01-21 12:51:05','23',0,-0.3,0),(173,'2016-01-21 12:51:05','23',2,0.5,1),(174,'2016-01-21 12:51:05','23',4,100,0),(175,'2016-01-21 12:51:05','23',6,0,1),(176,'2016-01-21 12:54:22','23',0,-0.3,0),(177,'2016-01-21 12:54:22','23',2,0.5,1),(178,'2016-01-21 12:54:22','23',4,100,0),(179,'2016-01-21 12:54:22','23',6,0,1),(180,'2016-01-21 12:56:43','23',0,-0.3,0),(181,'2016-01-21 12:56:43','23',2,0.5,1),(182,'2016-01-21 12:56:43','23',4,100,0),(183,'2016-01-21 12:56:43','23',6,0,1),(184,'2016-01-21 13:36:33','23',0,-0.3,0),(185,'2016-01-21 13:36:33','23',2,0.5,1),(186,'2016-01-21 13:36:33','23',4,100,0),(187,'2016-01-21 13:36:33','23',6,0,1);
/*!40000 ALTER TABLE `analog_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_info`
--

DROP TABLE IF EXISTS `device_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_info` (
  `dev_id` varchar(45) NOT NULL,
  `dev_name` varchar(100) NOT NULL,
  `is_online` tinyint(4) NOT NULL COMMENT '0:不在线，1:在线',
  PRIMARY KEY (`dev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集设备信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_info`
--

LOCK TABLES `device_info` WRITE;
/*!40000 ALTER TABLE `device_info` DISABLE KEYS */;
INSERT INTO `device_info` VALUES ('A301','走廊设备',1),('A302','前台设备',1),('A303','大厅设备',1);
/*!40000 ALTER TABLE `device_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_config`
--

DROP TABLE IF EXISTS `switch_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` varchar(45) NOT NULL,
  `probe_no` tinyint(4) NOT NULL COMMENT '探头号',
  `probe_name` varchar(45) DEFAULT NULL COMMENT '探头名称',
  `normal` int(11) DEFAULT NULL COMMENT '开关量正常值',
  `alarm_relay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_PROBE` (`dev_id`,`probe_no`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_config`
--

LOCK TABLES `switch_config` WRITE;
/*!40000 ALTER TABLE `switch_config` DISABLE KEYS */;
INSERT INTO `switch_config` VALUES (1,'A301',3,'3号探头',10,1),(2,'A301',4,'4号探头',0,1),(3,'A301',5,'5号探头',NULL,NULL),(28,'23',3,'侯斌',0,5),(29,'23',5,'侯斌',1,7);
/*!40000 ALTER TABLE `switch_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_data`
--

DROP TABLE IF EXISTS `switch_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `dev_id` varchar(45) NOT NULL,
  `probe_no` tinyint(4) NOT NULL COMMENT '探头号',
  `value` tinyint(4) DEFAULT NULL,
  `alarm_state` tinyint(4) DEFAULT NULL COMMENT '是否触发报警，0代表未报警，1代表报警',
  PRIMARY KEY (`id`),
  KEY `FIND_PROBE` (`dev_id`,`probe_no`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='开关量采集数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_data`
--

LOCK TABLES `switch_data` WRITE;
/*!40000 ALTER TABLE `switch_data` DISABLE KEYS */;
INSERT INTO `switch_data` VALUES (1,'2016-01-20 09:55:00','A301',3,0,1),(2,'2016-01-20 09:50:00','A301',4,0,0),(3,'2016-01-20 17:40:48','000023',1,2,1),(4,'2016-01-20 17:40:48','000023',3,0,0),(5,'2016-01-20 17:40:48','000023',5,1,1),(6,'2016-01-20 17:43:34','000023',1,2,1),(7,'2016-01-20 17:43:34','000023',3,0,0),(8,'2016-01-20 17:43:34','000023',5,1,1),(9,'2016-01-20 17:44:48','000023',1,2,1),(10,'2016-01-20 17:44:48','000023',3,0,0),(11,'2016-01-20 17:44:48','000023',5,1,1),(12,'2016-01-20 17:48:24','000023',1,2,1),(13,'2016-01-20 17:48:24','000023',3,0,0),(14,'2016-01-20 17:48:24','000023',5,1,1),(15,'2016-01-20 17:49:36','000023',1,2,1),(16,'2016-01-20 17:49:36','000023',3,0,0),(17,'2016-01-20 17:49:36','000023',5,1,1),(18,'2016-01-20 17:52:47','23',1,2,1),(19,'2016-01-20 17:52:47','23',3,0,0),(20,'2016-01-20 17:52:47','23',5,1,1),(21,'2016-01-20 17:55:16','23',1,2,1),(22,'2016-01-20 17:55:16','23',3,0,0),(23,'2016-01-20 17:55:16','23',5,1,1),(24,'2016-01-20 17:57:02','23',1,2,1),(25,'2016-01-20 17:57:02','23',3,0,0),(26,'2016-01-20 17:57:02','23',5,1,1),(27,'2016-01-20 18:00:19','23',1,2,1),(28,'2016-01-20 18:00:19','23',3,0,0),(29,'2016-01-20 18:00:19','23',5,1,1),(30,'2016-01-20 18:01:52','23',1,2,1),(31,'2016-01-20 18:01:52','23',3,0,0),(32,'2016-01-20 18:01:52','23',5,1,1),(33,'2016-01-20 18:02:41','23',1,2,1),(34,'2016-01-20 18:02:41','23',3,0,0),(35,'2016-01-20 18:02:41','23',5,1,1),(36,'2016-01-20 18:03:13','23',1,2,1),(37,'2016-01-20 18:03:13','23',3,0,0),(38,'2016-01-20 18:03:13','23',5,1,1),(39,'2016-01-21 09:18:57','23',1,2,1),(40,'2016-01-21 09:18:57','23',3,0,0),(41,'2016-01-21 09:18:57','23',5,1,1),(42,'2016-01-21 09:22:38','23',1,2,1),(43,'2016-01-21 09:22:38','23',3,0,0),(44,'2016-01-21 09:22:38','23',5,1,1),(45,'2016-01-21 09:51:52','23',1,2,1),(46,'2016-01-21 09:51:52','23',3,0,0),(47,'2016-01-21 09:51:52','23',5,1,1),(48,'2016-01-21 10:02:38','23',1,2,1),(49,'2016-01-21 10:02:38','23',3,0,0),(50,'2016-01-21 10:02:38','23',5,1,1),(51,'2016-01-21 10:04:41','23',1,2,1),(52,'2016-01-21 10:04:41','23',3,0,0),(53,'2016-01-21 10:04:41','23',5,1,1),(54,'2016-01-21 10:07:18','23',1,2,1),(55,'2016-01-21 10:07:18','23',3,0,0),(56,'2016-01-21 10:07:18','23',5,1,1),(57,'2016-01-21 10:09:27','23',1,2,1),(58,'2016-01-21 10:09:27','23',3,0,0),(59,'2016-01-21 10:09:27','23',5,1,1),(60,'2016-01-21 10:09:48','23',1,2,1),(61,'2016-01-21 10:09:48','23',3,0,0),(62,'2016-01-21 10:09:48','23',5,1,1),(63,'2016-01-21 10:10:44','23',1,2,1),(64,'2016-01-21 10:10:44','23',3,0,0),(65,'2016-01-21 10:10:44','23',5,1,1),(66,'2016-01-21 10:13:07','23',1,2,1),(67,'2016-01-21 10:13:07','23',3,0,0),(68,'2016-01-21 10:13:07','23',5,1,1),(69,'2016-01-21 11:12:24','23',1,2,1),(70,'2016-01-21 11:12:24','23',3,0,0),(71,'2016-01-21 11:12:24','23',5,1,1),(72,'2016-01-21 11:19:09','23',1,2,1),(73,'2016-01-21 11:19:09','23',3,0,0),(74,'2016-01-21 11:19:09','23',5,1,1),(75,'2016-01-21 11:22:48','23',1,2,1),(76,'2016-01-21 11:22:48','23',3,0,0),(77,'2016-01-21 11:22:48','23',5,1,1),(78,'2016-01-21 11:23:55','23',1,2,1),(79,'2016-01-21 11:23:55','23',3,0,0),(80,'2016-01-21 11:23:55','23',5,1,1),(81,'2016-01-21 11:29:45','23',1,2,1),(82,'2016-01-21 11:29:45','23',3,0,0),(83,'2016-01-21 11:29:45','23',5,1,1),(84,'2016-01-21 11:53:36','23',1,2,1),(85,'2016-01-21 11:53:36','23',3,0,0),(86,'2016-01-21 11:53:36','23',5,1,1),(87,'2016-01-21 11:54:54','23',1,2,1),(88,'2016-01-21 11:54:54','23',3,0,0),(89,'2016-01-21 11:54:54','23',5,1,1),(90,'2016-01-21 11:56:04','23',1,2,1),(91,'2016-01-21 11:56:04','23',3,0,0),(92,'2016-01-21 11:56:04','23',5,1,1),(93,'2016-01-21 11:57:43','23',1,2,1),(94,'2016-01-21 11:57:43','23',3,0,0),(95,'2016-01-21 11:57:43','23',5,1,1),(96,'2016-01-21 11:57:59','23',1,2,1),(97,'2016-01-21 11:57:59','23',3,0,0),(98,'2016-01-21 11:57:59','23',5,1,1),(99,'2016-01-21 12:02:32','23',1,2,1),(100,'2016-01-21 12:02:32','23',3,0,0),(101,'2016-01-21 12:02:32','23',5,1,1),(102,'2016-01-21 12:02:44','23',1,2,1),(103,'2016-01-21 12:02:44','23',3,0,0),(104,'2016-01-21 12:02:44','23',5,1,1),(105,'2016-01-21 12:03:33','23',1,2,1),(106,'2016-01-21 12:03:33','23',3,0,0),(107,'2016-01-21 12:03:33','23',5,1,1),(108,'2016-01-21 12:05:51','23',1,2,1),(109,'2016-01-21 12:05:51','23',3,0,0),(110,'2016-01-21 12:05:51','23',5,1,1),(111,'2016-01-21 12:06:01','23',1,2,1),(112,'2016-01-21 12:06:01','23',3,0,0),(113,'2016-01-21 12:06:01','23',5,1,1),(114,'2016-01-21 12:07:17','23',1,2,1),(115,'2016-01-21 12:07:17','23',3,0,0),(116,'2016-01-21 12:07:17','23',5,1,1),(117,'2016-01-21 12:07:51','23',1,2,1),(118,'2016-01-21 12:07:51','23',3,0,0),(119,'2016-01-21 12:07:51','23',5,1,1),(120,'2016-01-21 12:11:47','23',1,2,1),(121,'2016-01-21 12:11:47','23',3,0,0),(122,'2016-01-21 12:11:47','23',5,1,1),(123,'2016-01-21 12:51:05','23',1,2,1),(124,'2016-01-21 12:51:05','23',3,0,0),(125,'2016-01-21 12:51:05','23',5,1,1),(126,'2016-01-21 12:54:22','23',1,2,1),(127,'2016-01-21 12:54:22','23',3,0,0),(128,'2016-01-21 12:54:22','23',5,1,1),(129,'2016-01-21 12:56:43','23',1,2,1),(130,'2016-01-21 12:56:43','23',3,0,0),(131,'2016-01-21 12:56:43','23',5,1,1),(132,'2016-01-21 13:36:33','23',1,2,1),(133,'2016-01-21 13:36:33','23',3,0,0),(134,'2016-01-21 13:36:33','23',5,1,1);
/*!40000 ALTER TABLE `switch_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `permission_code` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT '0' COMMENT '父结点id',
  `available` char(1) DEFAULT '1' COMMENT '是否可用,1：可用，0不可用',
  `cardinality` int(11) DEFAULT '1' COMMENT '0:表示不是菜单,大于0是菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'报警管理',NULL,NULL,0,'1',2),(2,'设备管理',NULL,NULL,0,'1',3),(4,'用户管理',NULL,NULL,0,'1',4),(5,'用户列表','/user/userlist.do','user:userlist',4,'1',1),(6,'角色列表','/user/rolelist.do','user:rolelist',4,'1',2),(7,'权限列表','/user/permlist.do','user:permlist',4,'1',3),(8,'用户角色','/user/userrole.do','user:userrole',4,'1',4),(9,'角色权限','/user/roleperm.do','user:roleperm',4,'1',5),(10,'添加用户,','/user/useradd.do','user:useradd',4,'1',0),(11,'修改用户','/user/userupd.do','user:userupd',4,'1',0),(12,'删除用户','/user/userdel.do','user:userdel',4,'1',0),(13,'添加角色','/user/addrole.do','user:addrole',4,'1',0),(14,'修改角色','/user/updrole.do','user:updrole',4,'1',0),(15,'删除角色','/user/delrole.do','user:delrole',4,'1',0),(16,'权限添加','/user/permadd.do','user:permadd',4,'1',0),(17,'权限删除','/user/permdel.do','user:permdel',4,'1',0),(18,'权限修改','/user/permupd.do','user:permupd',4,'1',0),(19,'查询用户角色','/user/getuserrole.do','user:userrole',4,'1',0),(20,'更新用户角色','/user/upduserrole.do','user:userrole',4,'1',0),(21,'查询角色权限','/user/getroleperm.do','user:roleperm',4,'1',0),(22,'更新角色权限','/user/updroleperm.do','user:roleperm',4,'1',0),(23,'在线监控',NULL,NULL,0,'1',1),(24,'图形显示','/monitor/graph.do','monitor:graph',23,'1',1),(25,'列表显示','/monitor/list.do','monitor:list',23,'1',2),(36,'用户设备','/user/userdev.do','user:userdev',4,'1',6),(37,'添加用户设备','/user/adduserdev.do','user:adduserdev',4,'1',0),(38,'删除用户设备','/user/deluserdev.do','user:deluserdev',4,'1',0),(40,'查询探头数据列表','/monitor/probedatalist.do','monitor:probedatalist',23,'1',0),(41,'查询探头列表','/monitor/probeinfolist.do','monitor:probeinfolist',23,'1',0),(42,'查询探头历史数据','/monitor/probehisdata.do','monitor:probehisdata',23,'1',0),(43,'报警查询','/alarm/alarmlist.do','alarm:alarmlist',1,'1',1),(45,'报警配置','/alarm/alarmconf.do','alarm:alarmconf',1,'1',2),(46,'探头配置','/device/probeconf.do','device:probeconf',2,'1',1);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '一旦输入，不可修改',
  `available` char(1) NOT NULL DEFAULT '1' COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'系统管理员','admin','1'),(9,'普通用户','user','1');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_role_id` int(11) NOT NULL COMMENT '角色id',
  `sys_permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES (2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(57,1,36),(58,1,37),(59,1,38),(60,1,40),(61,1,41),(62,1,42),(64,1,43),(65,1,44),(66,1,45),(67,1,1),(68,1,46);
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `locked` char(1) DEFAULT '0' COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','f3694f162729b7d0254c6e40260bf15c','qwerty','0'),(8,'342423','a06019567f944ccfaa408df04bceb52b','evd)pd','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_user_id` int(11) NOT NULL,
  `sys_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_device`
--

DROP TABLE IF EXISTS `user_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `dev_id` varchar(45) NOT NULL COMMENT '设备id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户与设备的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_device`
--

LOCK TABLES `user_device` WRITE;
/*!40000 ALTER TABLE `user_device` DISABLE KEYS */;
INSERT INTO `user_device` VALUES (5,1,'A302'),(8,1,'A303'),(9,1,'A301');
/*!40000 ALTER TABLE `user_device` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-22 15:22:17
