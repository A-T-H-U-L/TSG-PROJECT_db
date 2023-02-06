CREATE DATABASE  IF NOT EXISTS `taxmanager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `taxmanager`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: taxmanager
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `city` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(45) NOT NULL,
  PRIMARY KEY (`cityId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Kochi'),(2,'Chennai'),(3,'Bangloru');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roletype` varchar(45) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolelist`
--

DROP TABLE IF EXISTS `rolelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rolelist` (
  `listId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`listId`),
  KEY `roleId_idx` (`roleId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleid`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user_account` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolelist`
--

LOCK TABLES `rolelist` WRITE;
/*!40000 ALTER TABLE `rolelist` DISABLE KEYS */;
INSERT INTO `rolelist` VALUES (1,1,25),(2,1,26),(3,1,27),(4,1,29),(5,1,30),(6,1,31),(7,1,32),(8,1,33),(9,1,34),(10,1,35),(11,1,36),(12,1,37),(13,1,38);
/*!40000 ALTER TABLE `rolelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `state` (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(45) NOT NULL,
  `cityId` int(11) NOT NULL,
  PRIMARY KEY (`stateId`),
  KEY `cityId_idx` (`cityId`),
  CONSTRAINT `cityId` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Kerala',1),(2,'TamilNadu',2),(3,'Karnataka',3);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxprofessionaldata`
--

DROP TABLE IF EXISTS `taxprofessionaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taxprofessionaldata` (
  `taxProId` int(11) NOT NULL AUTO_INCREMENT,
  `taxProName` varchar(45) NOT NULL,
  `consultentType` varchar(45) NOT NULL,
  `ratePerHour` int(11) NOT NULL,
  `stateId` int(11) NOT NULL,
  `ratingId` int(11) NOT NULL,
  PRIMARY KEY (`taxProId`),
  KEY `sateId_idx` (`stateId`),
  CONSTRAINT `sateId` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxprofessionaldata`
--

LOCK TABLES `taxprofessionaldata` WRITE;
/*!40000 ALTER TABLE `taxprofessionaldata` DISABLE KEYS */;
INSERT INTO `taxprofessionaldata` VALUES (1,'ARUN','Small Business',20,1,1),(2,'VISHNU','Employed',15,2,2);
/*!40000 ALTER TABLE `taxprofessionaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_account` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,'ATHUL K','athul.athul97@gmail.com','1234567'),(2,'ARCHANA','archana.archana@gmail.com','7654321'),(3,'Arun','arun@dnc.com','567890954'),(16,'ATHUL K','athul.athul97@gmail.com','1234567'),(17,'ATHUL K','athul.athul97@gmail.com','1234567'),(18,'ATHUL K','athul.athul97@gmail.com','1234567'),(19,'ATHUL K','athul.athul97@gmail.com','1234567'),(20,'ATHUL K','athul.athul97@gmail.com','1234567'),(21,'ATHUL K','athul.athul97@gmail.com','1234567'),(22,'ATHUL K','athul.athul97@gmail.com','1234567'),(23,'ATHUL K','athul.athul97@gmail.com','1234567'),(24,'ATHUL K','athul.athul97@gmail.com','1234567'),(25,'ATHUL K','athul.athul97@gmail.com','1234567'),(26,'ATHUL K','athul.athul97@gmail.com','1234567'),(27,'ATHUL K','athul.athul97@gmail.com','1234567'),(28,'ATHUL K','athul.athul97@gmail.com','1234567'),(29,'ATHUL K','athul.athul97@gmail.com','1234567'),(30,'ATHUL K','athul.athul97@gmail.com','1234567'),(31,'ATHUL K','athul.athul97@gmail.com','1234567'),(32,'ATHUL K','athul.athul97@gmail.com','1234567'),(33,'ATHUL K','athul.athul97@gmail.com','1234567'),(34,'ATHUL K','a.athul90@gmail.com','12345678'),(35,'ATHUL K','athul.athul90@gmail.com','sdfsdfd'),(36,'ATHUL K','athul90@gmail.com','123212323'),(37,'ATHUL K','a.athul90@gmail.com','12345678'),(38,'ATHUL K','athul90@gmail.com','09876543');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'taxmanager'
--

--
-- Dumping routines for database 'taxmanager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-06 21:04:59
