-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for Linux (x86_64)
--
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hobbies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (1,'Baking'),(2,'Racing'),(3,'Animal Fostering'),(4,'Reading'),(5,'Gaming'),(6,'Sports');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobby_interest`
--

DROP TABLE IF EXISTS `hobby_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hobby_interest` (
  `hobby_id` bigint(20) unsigned NOT NULL,
  `interest_id` bigint(20) unsigned NOT NULL,
  KEY `hobby_interest_hobby_id_foreign` (`hobby_id`),
  KEY `hobby_interest_interest_id_foreign` (`interest_id`),
  CONSTRAINT `hobby_interest_hobby_id_foreign` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`),
  CONSTRAINT `hobby_interest_interest_id_foreign` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobby_interest`
--

LOCK TABLES `hobby_interest` WRITE;
/*!40000 ALTER TABLE `hobby_interest` DISABLE KEYS */;
INSERT INTO `hobby_interest` VALUES (1,18),(1,16),(1,17),(2,19),(2,20),(2,14),(3,11),(3,15),(3,21),(4,22),(4,23),(4,12),(5,24),(5,13),(5,9),(6,25),(6,10),(6,26);
/*!40000 ALTER TABLE `hobby_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `interests_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (21,'animals'),(10,'baseball'),(20,'boats'),(23,'books'),(17,'cakes'),(14,'cars'),(11,'cats'),(9,'computers'),(24,'consoles'),(16,'cooking'),(15,'dogs'),(25,'football'),(13,'games'),(12,'novels'),(18,'pastries'),(22,'reading'),(26,'tennis'),(19,'trucks');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (6,'John Smith','6\'2\"','1980-10-19'),(7,'Jane Smith','5\'4\"','1984-06-20'),(8,'Bob Singleton','5\'8\"','1993-06-23'),(9,'Walter Taylor','6\'1\"','1997-11-29');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_interest`
--

DROP TABLE IF EXISTS `person_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_interest` (
  `person_id` bigint(20) unsigned NOT NULL,
  `interest_id` bigint(20) unsigned NOT NULL,
  KEY `person_interest_person_id_foreign` (`person_id`),
  KEY `person_interest_interest_id_foreign` (`interest_id`),
  CONSTRAINT `person_interest_interest_id_foreign` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`),
  CONSTRAINT `person_interest_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_interest`
--

LOCK TABLES `person_interest` WRITE;
/*!40000 ALTER TABLE `person_interest` DISABLE KEYS */;
INSERT INTO `person_interest` VALUES (6,9),(6,10),(6,11),(7,12),(7,9),(7,13),(8,14),(8,13),(8,15),(9,16),(9,11),(9,17);
/*!40000 ALTER TABLE `person_interest` ENABLE KEYS */;
UNLOCK TABLES;