CREATE DATABASE  IF NOT EXISTS `mytraining` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mytraining`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: mytraining
-- ------------------------------------------------------
-- Server version	5.5.34

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificativo della tupla',
  `user_id` int(11) unsigned NOT NULL,
  `activity_data` datetime NOT NULL,
  `activity_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `training_time` int(11) NOT NULL COMMENT 'in minute',
  `weather_id` int(11) NOT NULL,
  `training_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_N_user_0` (`user_id`),
  KEY `acivity_N_weather_0` (`weather_id`),
  CONSTRAINT `acivity_N_weather_0` FOREIGN KEY (`weather_id`) REFERENCES `weather` (`id`),
  CONSTRAINT `activity_N_user_0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1 COMMENT='activity is a father of all trainig.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,1,'2013-11-24 17:00:00','2013-12-26 17:05:08',60,1,'gym'),(2,1,'2013-11-25 06:20:00','2013-12-27 20:07:20',46,1,'run'),(3,1,'2013-12-02 06:15:00','2013-12-26 17:05:08',60,1,'gym'),(4,1,'2013-12-04 06:15:00','2013-12-26 17:05:08',60,1,'gym'),(5,1,'2013-12-07 12:00:00','2013-12-26 17:05:08',60,1,'gym'),(6,1,'2013-12-09 06:00:00','2013-12-26 17:05:08',60,1,'gym'),(7,1,'2013-12-12 06:00:00','2013-12-26 17:05:08',60,1,'gym'),(8,1,'2013-12-14 10:50:00','2014-02-16 11:13:21',60,1,'run'),(9,1,'2013-12-14 18:00:00','2013-12-26 17:05:08',60,1,'gym'),(11,1,'2013-12-15 12:00:00','2013-12-26 17:05:08',30,1,'gym'),(12,1,'2013-12-16 06:00:00','2013-12-26 17:05:08',60,1,'gym'),(13,1,'2013-12-18 06:10:00','2013-12-26 17:05:08',55,1,'gym'),(14,1,'2013-12-21 11:10:00','2013-12-26 17:05:08',55,1,'gym'),(15,1,'2013-12-23 06:10:00','2013-12-26 17:05:08',55,1,'gym'),(16,1,'2013-12-22 12:00:00','2013-12-26 17:05:08',30,1,'gym'),(17,1,'2013-12-24 06:00:00','2013-12-26 17:05:08',30,1,'gym'),(18,1,'2013-12-25 00:00:00','2013-12-27 20:07:20',60,2,'run'),(19,1,'2013-12-25 18:10:00','2013-12-26 17:05:08',55,2,'gym'),(20,1,'2013-12-26 09:00:00','2013-12-27 20:07:20',55,1,'run'),(21,1,'2013-12-27 06:00:00','2013-12-27 15:29:07',30,1,'gym'),(22,1,'2013-12-28 09:00:00','2013-12-28 09:19:55',55,2,'run'),(23,1,'2013-12-28 18:10:00','2013-12-29 11:50:36',55,1,'gym'),(24,1,'2013-12-29 18:00:00','2013-12-29 18:09:09',30,2,'gym'),(25,1,'2013-12-30 06:10:00','2013-12-30 10:52:55',55,2,'gym'),(26,1,'2014-01-01 09:00:00','2014-01-01 09:29:09',50,1,'run'),(27,1,'2014-01-01 18:10:00','2014-01-01 19:18:42',55,1,'gym'),(28,1,'2014-01-02 06:00:00','2014-01-02 10:48:31',20,1,'gym'),(32,1,'2014-01-03 06:00:00','2014-01-03 15:01:49',60,2,'run'),(33,1,'2014-01-04 16:10:00','2014-01-04 16:46:12',55,1,'gym'),(46,1,'2014-01-05 09:00:00','2014-01-05 12:18:10',60,1,'run'),(47,1,'2014-01-05 16:48:00','2014-01-07 08:56:55',50,1,'gym'),(48,1,'2014-01-05 18:00:00','2014-01-05 17:21:58',20,1,'gym'),(49,1,'2014-01-06 09:00:00','2014-01-06 09:24:15',60,2,'run'),(50,1,'2014-01-06 17:30:00','2014-01-06 17:15:32',55,1,'gym'),(51,1,'2014-01-07 06:00:00','2014-01-07 09:04:29',50,2,'run'),(53,1,'2014-01-09 06:00:00','2014-01-09 16:02:33',45,1,'gym'),(54,1,'2014-01-11 18:00:00','2014-01-11 09:26:38',60,1,'gym'),(55,1,'2014-01-12 17:30:00','2014-01-12 17:21:59',45,1,'gym'),(56,1,'2014-01-13 07:00:00','2014-01-13 06:47:31',50,1,'gym'),(57,1,'2014-01-15 06:00:00','2014-01-15 09:05:24',40,1,'gym'),(58,1,'2014-01-17 18:45:00','2014-01-17 18:38:12',30,1,'gym'),(59,1,'2014-01-18 09:00:00','2014-01-18 10:32:14',45,2,'run'),(60,1,'2014-01-18 12:00:00','2014-01-18 17:14:41',45,1,'gym'),(71,1,'2014-01-20 20:20:00','2014-01-20 20:38:05',60,1,'gym'),(73,1,'2014-01-21 17:00:00','2014-01-25 20:24:11',60,1,'gym'),(74,1,'2014-01-25 17:00:00','2014-01-25 20:25:56',30,1,'gym'),(75,1,'2014-01-26 08:00:00','2014-01-26 09:00:09',60,1,'run'),(76,1,'2014-01-30 06:00:00','2014-02-01 07:56:08',60,1,'run'),(77,1,'2014-02-04 06:00:00','2014-02-05 06:42:08',60,1,'run'),(78,1,'2014-02-05 18:30:00','2014-02-05 19:53:55',50,1,'gym'),(79,1,'2014-02-07 18:00:00','2014-02-08 09:36:58',35,1,'gym'),(80,1,'2014-02-10 18:20:00','2014-02-10 19:19:48',50,1,'gym'),(81,1,'2014-02-11 06:20:00','2014-02-11 06:24:15',60,1,'run'),(82,1,'2014-02-12 18:00:00','2014-02-12 19:21:37',45,1,'gym'),(83,1,'2014-02-14 18:30:00','2014-02-15 08:16:31',45,1,'gym'),(84,1,'2014-02-16 08:00:00','2014-02-16 08:48:20',60,1,'run'),(85,1,'2014-02-17 18:00:00','2014-02-17 19:16:39',45,1,'gym'),(86,1,'2014-02-18 18:00:00','2014-02-18 19:38:00',40,1,'gym'),(87,1,'2014-02-18 06:00:00','2014-02-18 19:39:02',60,1,'run'),(88,1,'2014-02-21 18:45:00','2014-02-21 19:43:01',55,1,'gym'),(89,1,'2014-02-23 08:00:00','2014-02-23 09:24:09',60,1,'run'),(90,1,'2014-02-24 06:30:00','2014-02-24 14:57:23',60,1,'run'),(91,1,'2014-02-23 13:00:00','2014-02-24 15:00:28',55,1,'gym'),(92,1,'2014-02-25 13:00:00','2014-02-26 06:51:53',35,1,'gym'),(93,1,'2014-02-27 13:00:00','2014-02-28 06:11:49',45,1,'gym'),(94,1,'2014-02-27 07:00:00','2014-02-28 06:13:30',60,1,'run'),(95,1,'2014-03-02 08:00:00','2014-03-02 08:53:23',60,1,'run'),(97,1,'2014-03-03 19:30:00','2014-03-03 20:25:28',60,1,'gym'),(98,1,'2014-03-04 13:00:00','2014-03-04 20:41:39',40,1,'gym'),(99,1,'2014-03-06 18:00:00','2014-03-08 08:37:42',60,1,'gym'),(100,1,'2014-03-10 18:20:00','2014-03-10 19:44:01',55,1,'gym'),(101,1,'2014-03-09 18:00:00','2014-03-10 20:28:24',60,7,'spi'),(102,1,'2014-03-11 18:15:00','2014-03-12 05:27:52',50,1,'gym'),(103,1,'2014-03-11 06:30:00','2014-03-12 05:29:12',60,1,'run'),(104,1,'2014-03-12 06:36:00','2014-03-12 06:34:20',60,7,'spi'),(105,1,'2014-03-13 18:30:00','2014-03-14 07:20:04',60,1,'gym'),(106,1,'2014-03-14 13:05:00','2014-03-14 18:43:43',40,1,'gym');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mytraining`.`delete_activity` BEFORE DELETE
    ON mytraining.activity FOR EACH ROW
begin
  delete from gym_training
    where activity_id = old.id;
  
  delete from spinning_training
    where activity_id = old.id;
  
    delete from running_training
  where activity_id = old.id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bb_card`
--

DROP TABLE IF EXISTS `bb_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `date_create` datetime NOT NULL,
  `number_of_day` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BB_card_1_idx` (`user_id`),
  CONSTRAINT `fk_BB_card_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_card`
--

LOCK TABLES `bb_card` WRITE;
/*!40000 ALTER TABLE `bb_card` DISABLE KEYS */;
INSERT INTO `bb_card` VALUES (1,1,'FORZA_MASSA_MULTIFREQUENZA_AB','2014-02-01 00:00:00',3);
/*!40000 ALTER TABLE `bb_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body`
--

DROP TABLE IF EXISTS `body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_part` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body`
--

LOCK TABLES `body` WRITE;
/*!40000 ALTER TABLE `body` DISABLE KEYS */;
INSERT INTO `body` VALUES (1,'upper body'),(2,'lower body'),(3,'addominal');
/*!40000 ALTER TABLE `body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_equipment` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'balancer'),(2,'dumbbell'),(3,'none'),(4,'spring tool'),(5,'only disk'),(6,'machine');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_card`
--

DROP TABLE IF EXISTS `exercise_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BB_card_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `day` varchar(1) NOT NULL DEFAULT 'A',
  `series` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exercise_card_1_idx` (`BB_card_id`),
  KEY `fk_exercise_card_2_idx` (`exercise_id`),
  CONSTRAINT `fk_exercise_card_1` FOREIGN KEY (`BB_card_id`) REFERENCES `bb_card` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_card_2` FOREIGN KEY (`exercise_id`) REFERENCES `gym_exsercise` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_card`
--

LOCK TABLES `exercise_card` WRITE;
/*!40000 ALTER TABLE `exercise_card` DISABLE KEYS */;
INSERT INTO `exercise_card` VALUES (4,1,1,'1',4),(5,1,18,'1',3),(6,1,2,'1',4),(7,1,24,'1',4),(8,1,25,'1',3),(9,1,6,'1',3),(10,1,3,'2',4),(11,1,26,'2',3),(12,1,28,'2',3),(13,1,30,'2',4),(14,1,27,'2',4),(15,1,29,'2',3),(16,1,33,'1',3),(17,1,14,'3',3),(18,1,34,'3',3),(19,1,12,'3',3),(20,1,15,'3',3),(21,1,13,'3',3);
/*!40000 ALTER TABLE `exercise_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `kcal` int(11) NOT NULL,
  `protein` int(11) NOT NULL,
  `carb` int(11) NOT NULL,
  `fat` int(11) NOT NULL,
  `food_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_type_idx` (`food_type_id`),
  CONSTRAINT `food_type` FOREIGN KEY (`food_type_id`) REFERENCES `food_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='on 100 g of food';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Red Bull',45,0,11,0,8),(2,'Kellogs Special K Ciocholate',404,8,75,7,3),(3,'Tonno sgocciolato',198,29,0,8,4),(4,'Pasta di semola',374,13,75,2,3),(5,'Gallette di riso',389,8,80,2,3),(6,'Simmenthal',62,11,0,2,2),(7,'Petto di pollo',165,31,0,4,2),(8,'Banana',89,1,23,33,5),(9,'Mela',43,1,11,0,5),(10,'Uovo bollito',155,13,1,11,9),(11,'Ricotta',138,11,5,8,1),(12,'Mozzarella',254,24,3,16,1),(13,'Tacchino',160,20,0,8,2),(14,'Wurstel',230,15,3,17,2),(15,'Patate bollite',78,3,17,1,6),(16,'Pomodori da insalata',23,1,5,0,6),(17,'Olio d\'oliva',889,0,0,100,7);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_type`
--

LOCK TABLES `food_type` WRITE;
/*!40000 ALTER TABLE `food_type` DISABLE KEYS */;
INSERT INTO `food_type` VALUES (1,'dairy product'),(2,'meat'),(3,'cereals and tubers'),(4,'fish'),(5,'fruit'),(6,'vegetables'),(7,'lipids'),(8,'beverages'),(9,'uovo');
/*!40000 ALTER TABLE `food_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_user`
--

DROP TABLE IF EXISTS `food_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `food_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  KEY `food_idx` (`food_id`),
  CONSTRAINT `food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_user`
--

LOCK TABLES `food_user` WRITE;
/*!40000 ALTER TABLE `food_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_exsercise`
--

DROP TABLE IF EXISTS `gym_exsercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym_exsercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exsercise_name` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `part_of_body_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_table` (`equipment_id`),
  KEY `body_part_table` (`part_of_body_id`),
  CONSTRAINT `body_part_table` FOREIGN KEY (`part_of_body_id`) REFERENCES `body` (`id`),
  CONSTRAINT `equipment_table` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_exsercise`
--

LOCK TABLES `gym_exsercise` WRITE;
/*!40000 ALTER TABLE `gym_exsercise` DISABLE KEYS */;
INSERT INTO `gym_exsercise` VALUES (1,'Panca Piana BIL-L','The bench press is an exercise of the upper body',1,1),(2,'Military Press','military press',1,1),(3,'Trazioni',NULL,1,5),(4,'biceps curl',NULL,1,2),(5,'lounges',NULL,2,1),(6,'triceps at 70',NULL,1,2),(7,'romanian deadlifts',NULL,2,1),(8,'hip and leg power',NULL,2,2),(9,'inner thighs',NULL,2,4),(10,'side lounges',NULL,2,5),(11,'narrow push up',NULL,1,5),(12,'crunch',NULL,3,5),(13,'Leg lifts',NULL,3,3),(14,'plank',NULL,3,3),(15,'crunch disk around the leg',NULL,3,5),(16,'toe touch',NULL,3,3),(17,'gladiator press','trapezi',3,3),(18,'Panca Alta',NULL,1,1),(19,'prone tractions',NULL,1,5),(20,'scrollate',NULL,1,1),(22,'rower',NULL,1,2),(23,'lento dietro',NULL,1,1),(24,'SQUAT Multipower',NULL,2,1),(25,'Leg exstension',NULL,2,1),(26,'Lat machine',NULL,1,1),(27,'Calf',NULL,2,1),(28,'Tirate al Mento',NULL,1,1),(29,'Curl bilanciere curvo','',1,6),(30,'Leg curl ',NULL,2,6),(31,'Lento avanti multipower',NULL,2,6),(32,'Panca Piana BIL-M',NULL,1,1),(33,'Iperestensioni lombari',NULL,1,1),(34,'gambe alzate alla sbarra',NULL,3,3);
/*!40000 ALTER TABLE `gym_exsercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_training`
--

DROP TABLE IF EXISTS `gym_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym_training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `exercise_id` int(11) NOT NULL,
  `serie` int(4) NOT NULL,
  `repetitions` int(4) NOT NULL,
  `weight` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_training_1_activity_1` (`activity_id`),
  KEY `gym_training_1_exsercise_1` (`exercise_id`),
  CONSTRAINT `gym_training_1_activity_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `gym_training_1_exsercise_1` FOREIGN KEY (`exercise_id`) REFERENCES `gym_exsercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_training`
--

LOCK TABLES `gym_training` WRITE;
/*!40000 ALTER TABLE `gym_training` DISABLE KEYS */;
INSERT INTO `gym_training` VALUES (1,1,NULL,32,1,8,60),(2,1,NULL,32,2,8,60),(3,1,NULL,32,3,6,60),(4,1,NULL,2,1,8,36),(5,1,NULL,2,2,8,36),(6,1,NULL,2,3,6,34),(7,1,NULL,3,1,10,0),(8,1,NULL,3,2,10,0),(9,1,NULL,3,3,10,0),(10,1,NULL,3,4,5,0),(11,1,NULL,4,1,8,16),(12,1,NULL,4,2,8,16),(13,1,NULL,4,3,5,16),(14,1,NULL,6,1,10,23),(15,1,NULL,6,2,10,23),(16,1,NULL,6,3,10,23),(17,3,NULL,32,1,8,60),(18,3,NULL,32,2,6,60),(19,3,NULL,32,3,6,60),(20,3,NULL,2,1,8,36),(21,3,NULL,2,2,6,36),(22,3,NULL,2,3,6,34),(23,3,NULL,3,1,8,0),(24,3,NULL,3,2,8,0),(25,3,NULL,3,3,8,0),(26,3,NULL,4,1,8,16),(27,3,NULL,4,2,8,16),(28,3,NULL,4,3,5,16),(29,3,NULL,6,1,10,23),(30,3,NULL,6,2,10,23),(31,3,NULL,6,3,10,23),(32,4,NULL,32,1,6,60),(33,4,NULL,32,2,6,60),(34,4,NULL,32,3,6,60),(35,4,NULL,2,1,8,36),(36,4,NULL,2,2,6,36),(37,4,NULL,2,3,6,34),(38,4,NULL,2,3,6,34),(39,4,NULL,3,1,10,0),(40,4,NULL,3,2,10,0),(41,4,NULL,3,3,8,0),(42,4,NULL,4,1,8,16),(43,4,NULL,4,2,8,16),(44,4,NULL,4,3,5,16),(45,4,NULL,6,1,10,23),(46,4,NULL,6,2,10,23),(47,4,NULL,6,3,10,23),(48,5,NULL,32,1,8,60),(49,5,NULL,32,2,6,60),(50,5,NULL,32,3,6,60),(51,5,NULL,2,1,8,36),(52,5,NULL,2,2,6,36),(53,5,NULL,2,3,5,36),(54,5,NULL,2,3,5,36),(55,5,NULL,3,1,10,0),(56,5,NULL,3,2,10,0),(57,5,NULL,3,3,9,0),(58,5,NULL,4,1,9,16),(59,5,NULL,4,2,8,16),(60,5,NULL,4,3,5,16),(61,5,NULL,6,1,12,23),(62,5,NULL,6,2,12,23),(63,5,NULL,6,3,12,23),(64,6,NULL,32,1,9,60),(65,6,NULL,32,2,8,60),(66,6,NULL,32,3,7,60),(67,6,NULL,2,1,8,36),(68,6,NULL,2,2,7,36),(69,6,NULL,2,3,6,36),(70,6,NULL,2,3,5,36),(71,6,NULL,3,1,10,0),(72,6,NULL,3,2,10,0),(73,6,NULL,3,3,9,0),(74,6,NULL,4,1,9,16),(75,6,NULL,4,2,8,16),(76,6,NULL,4,3,7,16),(77,6,NULL,6,1,12,23),(78,6,NULL,6,2,12,23),(79,6,NULL,6,3,12,23),(80,7,NULL,32,1,9,61),(81,7,NULL,32,2,8,61),(82,7,NULL,32,3,7,61),(83,7,NULL,2,1,8,36),(84,7,NULL,2,2,7,36),(85,7,NULL,2,3,6,36),(86,7,NULL,2,3,5,36),(87,7,NULL,3,1,11,0),(88,7,NULL,3,2,10,0),(89,7,NULL,3,3,10,0),(90,7,NULL,4,1,9,16),(91,7,NULL,4,2,8,16),(92,7,NULL,4,3,8,16),(93,7,NULL,6,1,12,23),(94,7,NULL,6,2,12,23),(95,7,NULL,6,3,12,23),(96,9,NULL,32,1,9,61),(97,9,NULL,32,2,9,61),(98,9,NULL,32,3,7,61),(99,9,NULL,2,1,10,36),(100,9,NULL,2,2,9,36),(101,9,NULL,2,3,8,36),(102,9,NULL,2,3,7,36),(103,9,NULL,3,1,11,0),(104,9,NULL,3,2,11,0),(105,9,NULL,3,3,10,0),(106,9,NULL,4,1,8,18),(107,9,NULL,4,2,8,18),(108,9,NULL,4,3,7,18),(109,9,NULL,6,1,15,24),(110,9,NULL,6,2,15,24),(111,9,NULL,6,3,15,24),(128,11,NULL,5,1,16,20),(129,11,NULL,5,2,16,20),(130,11,NULL,5,3,10,20),(131,11,NULL,7,1,15,67),(132,11,NULL,7,2,15,67),(133,11,NULL,7,3,13,67),(134,11,NULL,9,1,16,0),(135,11,NULL,9,2,16,0),(136,11,NULL,9,3,16,0),(137,12,NULL,32,1,9,62),(138,12,NULL,32,2,8,62),(139,12,NULL,32,3,6,62),(140,12,NULL,2,1,8,37),(141,12,NULL,2,2,4,37),(142,12,NULL,2,3,6,36),(143,12,NULL,2,3,6,36),(144,12,NULL,3,1,11,0),(145,12,NULL,3,2,10,0),(146,12,NULL,3,3,10,0),(147,12,NULL,4,1,8,18),(148,12,NULL,4,2,8,18),(149,12,NULL,4,3,7,18),(150,12,NULL,6,1,15,24),(151,12,NULL,6,2,15,24),(152,12,NULL,6,3,15,24),(153,13,NULL,32,1,10,62),(154,13,NULL,32,2,9,62),(155,13,NULL,32,3,7,62),(156,13,NULL,2,1,9,38),(157,13,NULL,2,2,7,38),(158,13,NULL,2,3,7,36),(159,13,NULL,2,3,7,36),(160,13,NULL,3,1,11,0),(161,13,NULL,3,2,11,0),(162,13,NULL,3,3,8,0),(163,13,NULL,4,1,8,18),(164,13,NULL,4,2,8,18),(165,13,NULL,4,3,7,18),(166,13,NULL,6,1,15,24),(167,13,NULL,6,2,15,24),(168,13,NULL,6,3,15,24),(169,14,NULL,32,1,9,63),(170,14,NULL,32,2,9,63),(171,14,NULL,32,3,7,63),(172,14,NULL,32,4,7,63),(173,14,NULL,2,1,9,38),(174,14,NULL,2,2,8,38),(175,14,NULL,2,3,7,38),(176,14,NULL,2,3,6,38),(177,14,NULL,3,1,11,5),(178,14,NULL,3,2,10,5),(179,14,NULL,3,3,6,5),(180,14,NULL,4,1,8,18),(181,14,NULL,4,2,8,18),(182,14,NULL,4,3,7,18),(183,14,NULL,6,1,15,24),(184,14,NULL,6,2,15,24),(185,14,NULL,6,3,15,24),(186,15,NULL,32,1,9,63),(187,15,NULL,32,2,9,63),(188,15,NULL,32,3,7,63),(189,15,NULL,32,4,6,63),(190,15,NULL,2,1,9,38),(191,15,NULL,2,2,8,38),(192,15,NULL,2,3,6,38),(193,15,NULL,2,3,6,38),(194,15,NULL,3,1,11,5),(195,15,NULL,3,2,10,5),(196,15,NULL,3,3,6,5),(197,15,NULL,4,1,8,18),(198,15,NULL,4,2,8,18),(199,15,NULL,4,3,7,18),(200,15,NULL,6,1,15,24),(201,15,NULL,6,2,15,24),(202,15,NULL,6,3,15,24),(203,16,NULL,5,1,16,24),(204,16,NULL,5,2,16,24),(205,16,NULL,5,3,10,24),(206,16,NULL,5,4,10,24),(207,16,NULL,7,1,15,67),(208,16,NULL,7,2,15,67),(209,16,NULL,7,3,13,67),(210,16,NULL,9,1,16,0),(211,16,NULL,9,2,16,0),(212,16,NULL,9,3,16,0),(213,17,NULL,5,1,16,24),(214,17,NULL,5,2,16,24),(215,17,NULL,5,3,16,24),(216,17,NULL,5,4,10,24),(217,17,NULL,7,1,15,67),(218,17,NULL,7,2,15,67),(219,17,NULL,7,3,15,67),(220,17,NULL,9,1,16,0),(221,17,NULL,9,2,16,0),(222,17,NULL,9,3,16,0),(223,19,NULL,32,1,9,64),(224,19,NULL,32,2,7,64),(225,19,NULL,32,3,6,64),(226,19,NULL,32,4,5,64),(227,19,NULL,2,1,9,38),(228,19,NULL,2,2,8,38),(229,19,NULL,2,3,7,38),(230,19,NULL,2,4,7,38),(231,19,NULL,3,1,11,7),(232,19,NULL,3,2,10,7),(233,19,NULL,3,3,8,7),(234,19,NULL,4,1,8,18),(235,19,NULL,4,2,8,18),(236,19,NULL,4,3,7,18),(237,19,NULL,6,1,15,24),(238,19,NULL,6,2,15,24),(239,19,NULL,6,3,15,24),(240,21,NULL,5,1,14,28),(241,21,NULL,5,2,14,28),(242,21,NULL,5,3,14,28),(243,21,NULL,5,4,12,28),(244,21,NULL,7,1,15,67),(245,21,NULL,7,2,15,67),(246,21,NULL,7,3,15,67),(247,21,NULL,9,1,16,0),(248,21,NULL,9,2,16,0),(249,21,NULL,9,3,16,0),(250,23,NULL,32,1,10,64),(251,23,NULL,32,2,9,64),(252,23,NULL,32,3,8,64),(253,23,NULL,32,4,5,64),(254,23,NULL,2,1,9,38),(255,23,NULL,2,2,7,38),(256,23,NULL,2,3,6,38),(257,23,NULL,2,4,6,38),(258,23,NULL,3,1,10,7),(259,23,NULL,3,2,10,7),(260,23,NULL,3,3,10,7),(261,23,NULL,4,1,7,20),(262,23,NULL,4,2,6,20),(263,23,NULL,4,3,5,20),(264,23,NULL,6,1,15,24),(265,23,NULL,6,2,15,24),(266,23,NULL,6,3,15,24),(267,24,NULL,10,1,12,10),(268,24,NULL,10,2,10,10),(269,24,NULL,10,3,10,10),(270,24,NULL,5,1,16,30),(271,24,NULL,5,2,16,30),(272,24,NULL,5,3,16,30),(273,24,NULL,5,4,12,30),(274,24,NULL,7,1,12,76),(275,24,NULL,7,2,12,76),(276,24,NULL,7,3,10,76),(277,24,NULL,9,1,16,0),(278,24,NULL,9,2,16,0),(279,24,NULL,9,3,16,0),(280,25,NULL,32,1,9,65),(281,25,NULL,32,2,9,65),(282,25,NULL,32,3,7,65),(283,25,NULL,32,4,6,65),(284,25,NULL,2,1,9,38),(285,25,NULL,2,2,8,38),(286,25,NULL,2,3,7,38),(287,25,NULL,2,4,6,38),(288,25,NULL,3,1,7,10),(289,25,NULL,3,2,7,10),(290,25,NULL,3,3,6,10),(291,25,NULL,4,1,7,20),(292,25,NULL,4,2,6,20),(293,25,NULL,4,3,5,20),(294,25,NULL,11,1,20,0),(295,25,NULL,11,2,15,0),(296,25,NULL,11,3,15,0),(297,27,NULL,32,1,9,66),(298,27,NULL,32,2,9,66),(299,27,NULL,32,3,7,66),(300,27,NULL,32,4,7,66),(301,27,NULL,2,1,9,38),(302,27,NULL,2,2,8,38),(303,27,NULL,2,3,7,38),(304,27,NULL,3,1,10,10),(305,27,NULL,3,2,10,10),(306,27,NULL,3,3,7,10),(307,27,NULL,3,4,6,10),(308,27,NULL,4,1,8,20),(309,27,NULL,4,2,7,20),(310,27,NULL,4,3,6,20),(311,27,NULL,11,1,20,0),(312,27,NULL,11,2,20,0),(313,27,NULL,11,3,20,0),(314,28,NULL,12,1,40,10),(315,28,NULL,12,2,40,10),(316,28,NULL,12,3,40,10),(317,28,NULL,13,1,20,0),(318,28,NULL,13,2,20,0),(319,28,NULL,13,3,20,0),(320,28,NULL,14,1,50,0),(321,28,NULL,14,2,30,0),(322,33,NULL,32,1,10,66),(323,33,NULL,32,2,8,66),(324,33,NULL,32,3,6,66),(325,33,NULL,32,4,6,66),(326,33,NULL,2,1,9,38),(327,33,NULL,2,2,8,38),(328,33,NULL,2,3,6,38),(329,33,NULL,2,4,6,38),(330,33,NULL,3,1,10,10),(331,33,NULL,3,2,10,10),(332,33,NULL,3,3,7,10),(333,33,NULL,4,1,8,20),(334,33,NULL,4,2,7,20),(335,33,NULL,4,3,6,20),(336,33,NULL,11,1,13,10),(337,33,NULL,11,2,13,10),(338,33,NULL,11,3,13,10),(346,47,NULL,5,1,5,30),(347,47,NULL,5,2,5,30),(348,47,NULL,7,1,13,76),(349,47,NULL,7,2,10,76),(350,47,NULL,7,3,10,76),(351,47,NULL,7,4,10,76),(352,47,NULL,9,1,15,0),(353,47,NULL,9,2,15,0),(354,47,NULL,9,3,15,0),(355,48,NULL,12,1,45,10),(356,48,NULL,12,2,45,10),(357,48,NULL,12,3,45,10),(358,48,NULL,15,1,10,2),(359,48,NULL,15,2,10,2),(360,48,NULL,15,3,10,2),(361,48,NULL,13,1,16,0),(362,48,NULL,13,2,16,0),(363,48,NULL,13,3,16,0),(364,50,NULL,32,1,10,66),(365,50,NULL,32,2,9,66),(366,50,NULL,32,3,8,66),(367,50,NULL,32,4,5,66),(368,50,NULL,2,1,9,38),(369,50,NULL,2,2,8,38),(370,50,NULL,2,3,7,38),(371,50,NULL,2,4,6,38),(372,50,NULL,3,1,10,10),(373,50,NULL,3,2,9,10),(374,50,NULL,3,3,6,10),(375,50,NULL,4,1,8,20),(376,50,NULL,4,2,7,20),(377,50,NULL,4,3,6,20),(378,50,NULL,11,1,14,10),(379,50,NULL,11,2,13,10),(380,50,NULL,11,3,10,10),(385,53,NULL,32,1,10,66),(386,53,NULL,32,2,9,66),(387,53,NULL,32,3,8,66),(388,53,NULL,32,4,6,66),(389,53,NULL,2,1,9,38),(390,53,NULL,2,2,7,38),(391,53,NULL,2,3,6,38),(392,53,NULL,2,4,6,38),(393,53,NULL,3,1,10,10),(394,53,NULL,3,2,8,10),(395,53,NULL,3,3,6,10),(396,54,NULL,32,1,9,67),(397,54,NULL,32,2,8,67),(398,54,NULL,32,3,6,67),(399,54,NULL,32,4,5,67),(400,54,NULL,2,1,8,38),(401,54,NULL,2,2,8,38),(402,54,NULL,2,3,8,38),(403,54,NULL,2,4,5,38),(404,54,NULL,3,1,10,10),(405,54,NULL,3,2,10,10),(406,54,NULL,3,3,5,10),(407,54,NULL,11,1,16,10),(408,54,NULL,11,2,13,10),(409,54,NULL,11,3,12,10),(410,54,NULL,4,1,8,20),(411,54,NULL,4,2,8,20),(412,54,NULL,4,3,14,20),(413,55,NULL,5,1,14,40),(414,55,NULL,5,2,14,35),(415,55,NULL,5,3,12,35),(416,55,NULL,7,1,15,76),(417,55,NULL,7,2,12,76),(418,55,NULL,7,3,10,76),(419,55,NULL,9,1,16,0),(420,55,NULL,9,2,13,0),(421,55,NULL,9,3,10,0),(422,56,NULL,32,1,11,67),(423,56,NULL,32,2,9,67),(424,56,NULL,32,3,7,67),(425,56,NULL,32,4,7,67),(426,56,NULL,2,1,9,38),(427,56,NULL,2,2,7,38),(428,56,NULL,2,3,6,38),(429,56,NULL,2,4,6,38),(430,56,NULL,3,1,10,10),(431,56,NULL,3,2,10,10),(432,56,NULL,3,3,8,10),(433,56,NULL,11,1,16,10),(434,56,NULL,11,2,13,10),(435,56,NULL,11,3,9,10),(436,57,NULL,32,1,10,67),(437,57,NULL,32,2,7,67),(438,57,NULL,32,3,6,67),(439,57,NULL,32,4,6,67),(440,57,NULL,2,1,9,38),(441,57,NULL,2,2,8,38),(442,57,NULL,2,3,7,38),(443,57,NULL,2,4,6,38),(444,57,NULL,3,1,10,10),(445,57,NULL,3,2,8,10),(446,57,NULL,3,3,8,10),(447,58,NULL,5,1,16,35),(448,58,NULL,5,2,14,35),(449,58,NULL,5,3,12,35),(450,58,NULL,7,1,12,76),(451,58,NULL,7,2,10,76),(452,58,NULL,7,3,10,76),(453,58,NULL,9,1,15,0),(454,58,NULL,9,2,15,0),(455,58,NULL,9,3,8,0),(456,60,NULL,32,1,9,68),(457,60,NULL,32,2,8,68),(458,60,NULL,32,3,6,68),(459,60,NULL,32,4,6,68),(460,60,NULL,2,1,9,38),(461,60,NULL,2,2,8,38),(462,60,NULL,2,3,7,38),(463,60,NULL,2,4,6,38),(464,60,NULL,3,1,10,10),(465,60,NULL,3,2,9,10),(466,60,NULL,3,3,8,10),(467,60,NULL,11,1,16,10),(468,60,NULL,11,2,14,10),(469,60,NULL,11,3,10,10),(470,71,NULL,32,1,10,68),(471,71,NULL,32,2,9,68),(472,71,NULL,32,3,8,68),(473,71,NULL,32,4,6,68),(474,71,NULL,32,5,5,68),(475,71,NULL,2,1,9,38),(476,71,NULL,2,2,8,38),(477,71,NULL,2,3,8,38),(478,71,NULL,2,4,6,38),(479,71,NULL,18,1,12,40),(480,71,NULL,18,2,11,40),(481,71,NULL,18,3,8,40),(482,71,NULL,5,1,8,36),(483,71,NULL,5,2,7,36),(484,71,NULL,5,3,6,36),(485,71,NULL,5,4,5,36),(486,71,NULL,11,1,16,10),(487,71,NULL,11,2,12,10),(488,71,NULL,11,3,8,10),(489,73,NULL,3,1,12,10),(490,73,NULL,3,2,10,10),(491,73,NULL,3,3,8,10),(492,73,NULL,3,4,7,10),(493,73,NULL,22,1,11,30),(494,73,NULL,22,2,11,30),(495,73,NULL,22,3,11,30),(496,73,NULL,22,4,5,30),(497,73,NULL,19,1,10,10),(498,73,NULL,19,2,7,10),(499,73,NULL,19,3,6,10),(500,73,NULL,7,1,10,78),(501,73,NULL,7,2,9,78),(502,73,NULL,7,3,6,78),(503,73,NULL,20,1,11,78),(504,73,NULL,20,2,8,78),(505,73,NULL,20,3,7,78),(506,73,NULL,9,1,15,0),(507,73,NULL,9,2,15,0),(508,73,NULL,9,3,15,0),(509,74,NULL,32,1,10,68),(510,74,NULL,32,2,9,68),(511,74,NULL,32,3,8,68),(512,74,NULL,32,4,6,68),(513,74,NULL,2,1,10,38),(514,74,NULL,2,2,9,38),(515,74,NULL,2,3,7,38),(516,74,NULL,2,4,7,38),(517,78,NULL,32,1,12,60),(518,78,NULL,32,2,10,60),(519,78,NULL,32,3,10,60),(520,78,NULL,32,4,8,60),(521,78,NULL,2,1,8,55),(522,78,NULL,2,2,8,55),(523,78,NULL,2,3,6,55),(524,78,NULL,2,4,6,55),(525,78,NULL,18,1,10,40),(526,78,NULL,18,2,10,40),(527,78,NULL,18,3,10,40),(528,78,NULL,18,4,10,40),(529,78,NULL,7,1,12,76),(530,78,NULL,7,2,12,76),(531,78,NULL,7,3,12,76),(532,79,NULL,1,1,10,64),(533,79,NULL,1,2,8,64),(534,79,NULL,1,3,6,64),(535,79,NULL,1,4,6,64),(536,79,NULL,2,1,8,34),(537,79,NULL,2,2,8,34),(538,79,NULL,2,3,8,34),(539,79,NULL,3,1,10,0),(540,79,NULL,3,2,8,0),(541,79,NULL,3,3,6,0),(542,80,NULL,1,1,8,64),(543,80,NULL,1,2,7,64),(544,80,NULL,1,3,7,64),(545,80,NULL,1,4,6,64),(546,80,NULL,18,1,8,40),(547,80,NULL,18,2,8,40),(548,80,NULL,18,3,7,40),(549,80,NULL,24,1,8,50),(550,80,NULL,24,2,8,50),(551,80,NULL,24,3,8,50),(552,80,NULL,24,4,8,50),(553,80,NULL,25,1,15,60),(554,80,NULL,25,2,15,60),(555,80,NULL,25,3,15,60),(556,80,NULL,3,1,12,0),(557,80,NULL,3,2,6,0),(558,82,NULL,23,1,6,70),(559,82,NULL,23,2,6,70),(560,82,NULL,23,3,6,70),(561,82,NULL,23,4,6,65),(562,82,NULL,28,1,8,35),(563,82,NULL,28,2,7,35),(564,82,NULL,28,3,6,35),(565,82,NULL,26,1,8,90),(566,82,NULL,26,2,7,90),(567,82,NULL,26,3,6,90),(568,82,NULL,26,4,6,90),(569,82,NULL,24,1,8,60),(570,82,NULL,24,2,8,60),(571,82,NULL,24,3,8,60),(572,82,NULL,24,4,8,60),(573,82,NULL,27,1,8,80),(574,82,NULL,27,2,8,80),(575,82,NULL,27,3,6,80),(576,83,NULL,1,1,7,64),(577,83,NULL,1,2,6,64),(578,83,NULL,1,3,6,64),(579,83,NULL,1,4,5,64),(580,83,NULL,24,1,8,60),(581,83,NULL,24,2,7,60),(582,83,NULL,24,3,7,60),(583,83,NULL,26,1,8,90),(584,83,NULL,26,2,7,90),(585,83,NULL,26,3,6,90),(586,85,NULL,1,1,6,64),(587,85,NULL,1,2,6,64),(588,85,NULL,1,3,6,64),(589,85,NULL,1,4,6,64),(590,85,NULL,18,1,12,42),(591,85,NULL,18,2,10,42),(592,85,NULL,18,3,10,42),(593,85,NULL,23,1,6,70),(594,85,NULL,23,2,6,65),(595,85,NULL,23,3,6,60),(596,85,NULL,23,4,6,60),(597,85,NULL,24,1,10,64),(598,85,NULL,24,2,10,64),(599,85,NULL,24,3,8,64),(600,85,NULL,25,1,12,35),(601,85,NULL,25,2,12,35),(602,85,NULL,25,3,12,35),(603,85,NULL,4,1,8,15),(604,85,NULL,4,2,6,15),(605,85,NULL,4,3,6,15),(606,86,NULL,3,1,10,0),(607,86,NULL,3,2,8,0),(608,86,NULL,3,3,6,0),(609,86,NULL,26,1,10,90),(610,86,NULL,26,2,8,90),(611,86,NULL,26,3,8,90),(612,86,NULL,28,1,6,35),(613,86,NULL,28,2,6,30),(614,86,NULL,28,3,6,30),(615,86,NULL,27,1,8,80),(616,86,NULL,27,2,8,80),(617,86,NULL,27,3,6,80),(618,86,NULL,6,1,8,20),(619,86,NULL,6,2,8,20),(620,86,NULL,6,3,8,20),(621,88,NULL,1,1,7,64),(622,88,NULL,1,2,6,64),(623,88,NULL,1,3,6,64),(624,88,NULL,1,4,6,64),(625,88,NULL,18,1,10,46),(626,88,NULL,18,2,8,46),(627,88,NULL,18,3,6,46),(628,88,NULL,2,1,8,30),(629,88,NULL,2,2,6,30),(630,88,NULL,2,3,6,30),(631,88,NULL,24,1,10,64),(632,88,NULL,24,2,8,64),(633,88,NULL,24,3,8,64),(634,88,NULL,24,4,6,64),(635,88,NULL,25,1,12,55),(636,88,NULL,25,2,12,55),(637,88,NULL,25,3,12,55),(638,88,NULL,4,1,7,15),(639,88,NULL,4,2,6,15),(640,88,NULL,4,3,5,15),(641,91,NULL,1,1,7,64),(642,91,NULL,1,2,6,64),(643,91,NULL,1,3,6,64),(644,91,NULL,1,4,5,64),(645,91,NULL,18,1,10,46),(646,91,NULL,18,2,6,46),(647,91,NULL,18,3,6,46),(648,91,NULL,2,1,7,30),(649,91,NULL,2,2,6,30),(650,91,NULL,2,3,6,30),(651,91,NULL,24,1,10,66),(652,91,NULL,24,2,8,66),(653,91,NULL,24,3,8,66),(654,91,NULL,24,4,7,66),(655,91,NULL,25,1,12,60),(656,91,NULL,25,2,12,60),(657,91,NULL,25,3,12,60),(658,91,NULL,6,1,12,24),(659,91,NULL,6,2,12,24),(660,91,NULL,6,3,12,24),(661,92,NULL,3,1,10,0),(662,92,NULL,3,2,8,0),(663,92,NULL,3,3,7,0),(664,92,NULL,26,1,10,90),(665,92,NULL,26,2,10,90),(666,92,NULL,26,3,9,90),(667,92,NULL,28,1,7,35),(668,92,NULL,28,2,6,35),(669,92,NULL,28,3,7,32),(670,92,NULL,4,1,6,20),(671,92,NULL,4,2,5,20),(672,92,NULL,4,3,5,20),(673,93,NULL,1,1,6,66),(674,93,NULL,1,2,5,66),(675,93,NULL,1,3,5,64),(676,93,NULL,1,4,5,64),(677,93,NULL,31,1,6,30),(678,93,NULL,31,2,6,30),(679,93,NULL,31,3,5,30),(680,93,NULL,18,1,8,46),(681,93,NULL,18,2,6,46),(682,93,NULL,18,3,6,46),(683,93,NULL,24,1,10,66),(684,93,NULL,24,2,9,66),(685,93,NULL,24,3,9,66),(686,93,NULL,24,4,8,66),(687,93,NULL,25,1,12,60),(688,93,NULL,25,2,12,60),(689,93,NULL,25,3,12,60),(711,97,NULL,1,1,7,66),(712,97,NULL,1,2,6,66),(713,97,NULL,1,3,6,64),(714,97,NULL,1,4,5,64),(715,97,NULL,18,1,9,46),(716,97,NULL,18,2,6,46),(717,97,NULL,18,3,6,46),(718,97,NULL,31,1,7,30),(719,97,NULL,31,2,6,30),(720,97,NULL,31,3,6,30),(721,97,NULL,31,4,5,30),(722,97,NULL,24,1,10,70),(723,97,NULL,24,2,10,70),(724,97,NULL,24,3,10,70),(725,97,NULL,25,1,12,60),(726,97,NULL,25,2,12,60),(727,97,NULL,25,3,12,60),(728,97,NULL,6,1,10,24),(729,97,NULL,6,2,10,24),(730,97,NULL,6,3,10,24),(731,98,NULL,3,1,10,0),(732,98,NULL,3,2,10,0),(733,98,NULL,3,3,8,0),(734,98,NULL,3,4,6,0),(735,98,NULL,26,1,12,90),(736,98,NULL,26,2,12,90),(737,98,NULL,26,3,10,90),(738,98,NULL,28,1,7,35),(739,98,NULL,28,2,6,35),(740,98,NULL,28,3,6,35),(741,98,NULL,30,1,12,60),(742,98,NULL,30,2,12,60),(743,98,NULL,30,3,10,60),(744,98,NULL,30,4,8,60),(745,98,NULL,27,1,12,80),(746,98,NULL,27,2,12,80),(747,98,NULL,27,3,12,80),(748,98,NULL,27,4,12,80),(749,98,NULL,29,1,6,30),(750,99,NULL,1,1,7,66),(751,99,NULL,1,2,6,66),(752,99,NULL,1,3,6,66),(753,99,NULL,1,4,5,66),(754,99,NULL,18,1,10,46),(755,99,NULL,18,2,6,46),(756,99,NULL,18,3,6,46),(757,99,NULL,31,1,6,30),(758,99,NULL,31,2,6,30),(759,99,NULL,31,3,5,30),(760,99,NULL,31,4,5,30),(761,99,NULL,24,1,10,70),(762,99,NULL,24,2,10,70),(763,99,NULL,24,3,9,70),(764,99,NULL,24,4,8,70),(765,99,NULL,25,1,12,60),(766,99,NULL,25,2,12,60),(767,99,NULL,25,3,12,60),(768,99,NULL,6,1,12,24),(769,99,NULL,6,2,10,24),(770,99,NULL,6,3,10,24),(771,100,NULL,1,1,7,66),(772,100,NULL,1,2,6,66),(773,100,NULL,1,3,5,66),(774,100,NULL,1,4,5,66),(775,100,NULL,18,1,6,46),(776,100,NULL,18,2,6,46),(777,100,NULL,18,3,6,46),(778,100,NULL,31,1,8,30),(779,100,NULL,31,2,7,30),(780,100,NULL,31,3,6,30),(781,100,NULL,31,4,6,30),(782,100,NULL,24,1,10,70),(783,100,NULL,24,2,10,70),(784,100,NULL,24,3,10,70),(785,100,NULL,24,4,7,70),(786,100,NULL,25,1,12,65),(787,100,NULL,25,2,12,65),(788,100,NULL,25,3,12,65),(789,100,NULL,6,1,12,24),(790,100,NULL,6,2,12,24),(791,100,NULL,6,3,12,24),(792,102,NULL,3,1,10,0),(793,102,NULL,3,2,10,0),(794,102,NULL,3,3,9,0),(795,102,NULL,3,4,6,0),(796,102,NULL,26,1,10,90),(797,102,NULL,26,2,10,90),(798,102,NULL,26,3,10,90),(799,102,NULL,28,1,7,35),(800,102,NULL,28,2,6,35),(801,102,NULL,28,3,6,35),(802,102,NULL,30,1,10,60),(803,102,NULL,30,2,10,60),(804,102,NULL,30,3,10,60),(805,102,NULL,30,4,10,60),(806,102,NULL,27,1,10,80),(807,102,NULL,27,2,10,80),(808,102,NULL,27,3,10,80),(809,102,NULL,27,4,10,80),(810,102,NULL,29,1,6,30),(811,102,NULL,29,2,6,24),(812,105,NULL,1,1,6,66),(813,105,NULL,1,2,5,66),(814,105,NULL,1,3,6,64),(815,105,NULL,1,4,6,64),(816,105,NULL,18,1,7,46),(817,105,NULL,18,2,7,46),(818,105,NULL,18,3,7,46),(819,105,NULL,2,1,10,30),(820,105,NULL,2,2,9,30),(821,105,NULL,2,3,9,30),(822,105,NULL,2,4,8,30),(823,105,NULL,24,1,10,70),(824,105,NULL,24,2,10,70),(825,105,NULL,24,3,10,70),(826,105,NULL,24,4,9,70),(827,105,NULL,25,1,12,65),(828,105,NULL,25,2,12,65),(829,105,NULL,25,3,12,65),(830,106,NULL,3,1,10,0),(831,106,NULL,3,2,10,0),(832,106,NULL,3,3,8,0),(833,106,NULL,3,4,7,0),(834,106,NULL,26,1,12,90),(835,106,NULL,26,2,10,90),(836,106,NULL,26,3,10,90),(837,106,NULL,28,1,7,35),(838,106,NULL,28,2,6,35),(839,106,NULL,28,3,6,35),(840,106,NULL,28,4,6,35),(841,106,NULL,30,1,10,65),(842,106,NULL,30,2,10,65),(843,106,NULL,30,3,10,65),(844,106,NULL,30,4,10,65);
/*!40000 ALTER TABLE `gym_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `weight` double DEFAULT NULL,
  `thigh` double NOT NULL,
  `hips` double NOT NULL,
  `biceps` double NOT NULL,
  `chest` double NOT NULL,
  `calf` double NOT NULL,
  `data_insert` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_info_1_user_1_idx` (`user_id`),
  CONSTRAINT `personal_info_1_user_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` VALUES (1,1,NULL,60.5,90.5,35,122,35,'2014-03-03 00:00:00');
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `running_path`
--

DROP TABLE IF EXISTS `running_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `running_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_name` varchar(45) NOT NULL,
  `km` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `coordinates_start` varchar(45) DEFAULT NULL,
  `coordinates_end` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_name_UNIQUE` (`path_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `running_path`
--

LOCK TABLES `running_path` WRITE;
/*!40000 ALTER TABLE `running_path` DISABLE KEYS */;
INSERT INTO `running_path` VALUES (1,'SPG(fiume)-LAPPANO(bridge)',12,'this path is an only lap','39.341226,16.31346','39.320064,16.307046'),(2,'SPG(fiume)-LAPPANO(paolo marra)',9,NULL,NULL,NULL),(3,'SPG(fiume)-FONTANA_LAPPANO',9,'only lap',NULL,NULL);
/*!40000 ALTER TABLE `running_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `running_training`
--

DROP TABLE IF EXISTS `running_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `running_training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_id` int(11) NOT NULL,
  `bpm` int(3) NOT NULL,
  `time` int(5) NOT NULL COMMENT 'in minute',
  `activity_id` int(11) NOT NULL,
  `shoes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `running_1_activity_1` (`activity_id`),
  KEY `running_1_path_1_idx` (`path_id`),
  KEY `running_1_shoes_1_idx` (`shoes_id`),
  CONSTRAINT `running_1_activity_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `running_1_path_1` FOREIGN KEY (`path_id`) REFERENCES `running_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `running_1_shoes_1` FOREIGN KEY (`shoes_id`) REFERENCES `shoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `running_training`
--

LOCK TABLES `running_training` WRITE;
/*!40000 ALTER TABLE `running_training` DISABLE KEYS */;
INSERT INTO `running_training` VALUES (1,2,156,46,2,2),(2,2,156,50,8,2),(3,3,156,50,18,2),(4,2,156,50,20,2),(5,3,156,50,22,2),(6,3,156,50,26,2),(7,2,156,55,32,2),(8,2,156,55,46,2),(9,3,150,55,49,2),(10,3,158,41,51,2),(11,3,158,43,59,2),(14,2,155,50,75,2),(15,3,140,50,76,2),(16,3,150,50,77,2),(17,3,154,50,81,2),(18,3,145,50,84,2),(19,2,145,55,87,2),(20,2,145,55,89,2),(21,2,145,55,90,2),(22,3,140,50,94,2),(23,2,145,55,95,2),(24,2,140,55,103,2);
/*!40000 ALTER TABLE `running_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoes`
--

DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoes_name` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `date_of_purchase` datetime NOT NULL,
  `date_end` datetime DEFAULT NULL,
  `km_start` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes`
--

LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` VALUES (1,'gel-cumulus 14- blue','mizuno','2013-05-01 00:00:00',NULL,700),(2,'gel-cumulus 14-orange','mizuno','2013-08-01 00:00:00',NULL,200);
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spinning_training`
--

DROP TABLE IF EXISTS `spinning_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spinning_training` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bpm` int(10) unsigned NOT NULL COMMENT 'bpm average',
  `time` int(10) unsigned NOT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity` (`activity_id`),
  CONSTRAINT `activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spinning_training`
--

LOCK TABLES `spinning_training` WRITE;
/*!40000 ALTER TABLE `spinning_training` DISABLE KEYS */;
INSERT INTO `spinning_training` VALUES (1,60,135,101),(2,60,130,104);
/*!40000 ALTER TABLE `spinning_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spinning_trend`
--

DROP TABLE IF EXISTS `spinning_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spinning_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spinning_training_id` int(10) unsigned NOT NULL,
  `bpm` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `running_training` (`spinning_training_id`),
  CONSTRAINT `running_training` FOREIGN KEY (`spinning_training_id`) REFERENCES `spinning_training` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spinning_trend`
--

LOCK TABLES `spinning_trend` WRITE;
/*!40000 ALTER TABLE `spinning_trend` DISABLE KEYS */;
/*!40000 ALTER TABLE `spinning_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificativo della tupla',
  `username` varchar(20) NOT NULL COMMENT 'username dell''utente',
  `password` varchar(20) NOT NULL COMMENT 'password dell''utente',
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='inserimenti dei vari utenti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lorix','lc991','lorenzo.cozza@hotmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weather` varchar(20) NOT NULL,
  `temperature` int(3) NOT NULL COMMENT 'in degrees',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,'rain',10),(2,'sun',10),(3,'sun',20),(4,'sun',30),(5,'sun',5),(6,'rain',5),(7,'indor',20);
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mytraining'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-16 15:18:39
