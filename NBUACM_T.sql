-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: nbuacm
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allusersubmissionstatus`
--

DROP TABLE IF EXISTS `allusersubmissionstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allusersubmissionstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxWeekAC` int DEFAULT '0',
  `maxMonthAC` int DEFAULT '0',
  `maxWeekAverageACRating` double DEFAULT '0',
  `maxMonthAverageACRating` double DEFAULT '0',
  `maxTotalAverageACRating` double DEFAULT '0',
  `avgWeekAC` double DEFAULT '0',
  `avgMonthAC` double DEFAULT '0',
  `avgWeekAverageACRating` double DEFAULT '0',
  `avgMonthAverageACRating` double DEFAULT '0',
  `avgTotalAverageACRating` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allusersubmissionstatus`
--

LOCK TABLES `allusersubmissionstatus` WRITE;
/*!40000 ALTER TABLE `allusersubmissionstatus` DISABLE KEYS */;
INSERT INTO `allusersubmissionstatus` VALUES (1,0,22,0,1800,1293.4056007226739,0,8,0,1372.7272727272727,1198.9980432400805);
/*!40000 ALTER TABLE `allusersubmissionstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem` (
  `ProblemId` int NOT NULL AUTO_INCREMENT,
  `contestId` int DEFAULT NULL,
  `ProblemIndex` char(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `points` decimal(10,1) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProblemId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `acsubmissionid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contestId` bigint unsigned DEFAULT NULL,
  `ProblemIndex` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `actime` bigint unsigned DEFAULT NULL,
  `handle` varchar(100) DEFAULT NULL,
  `ProblemId` int DEFAULT NULL,
  `submissionIdFromCF` bigint unsigned DEFAULT NULL,
  `ProblemRating` int DEFAULT '0',
  `verdict` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acsubmissionid`),
  KEY `fk_problem_id` (`ProblemId`),
  CONSTRAINT `fk_problem_id` FOREIGN KEY (`ProblemId`) REFERENCES `problem` (`ProblemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codeforceshandle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codeforcesrating` int DEFAULT '0',
  `weekAC` int DEFAULT '0',
  `monthAC` int DEFAULT '0',
  `weekSubmits` int DEFAULT '0',
  `monthSubmits` int DEFAULT '0',
  `totalSubmits` int DEFAULT '0',
  `totalACSubmits` int DEFAULT '0',
  `Difficulty1` int DEFAULT '0',
  `Difficulty2` int DEFAULT '0',
  `Difficulty3` int DEFAULT '0',
  `Difficulty4` int DEFAULT '0',
  `Difficulty5` int DEFAULT '0',
  `Difficulty6` int DEFAULT '0',
  `Difficulty7` int DEFAULT '0',
  `ratingRank` int DEFAULT '0',
  `monthACRank` int DEFAULT '0',
  `weekAverageACRating` double DEFAULT NULL,
  `monthAverageACRating` double DEFAULT NULL,
  `totalAverageACRating` double DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123456789','123456','胡健山','5-3',1633,0,1,0,2,726,365,100,74,92,66,21,12,0,2,3,0,1400,1270.4109589041095),('226001634','123456','不知名学弟','226001634',1392,0,22,0,40,410,214,88,46,67,12,1,0,0,3,1,0,918.1818181818181,1033.177570093458),('233333333','123456','朱文豪','Yukim1',1782,0,1,0,2,2457,1107,279,181,241,282,101,23,0,1,2,0,1800,1293.4056007226739);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userandratinglist`
--

DROP TABLE IF EXISTS `userandratinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userandratinglist` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(100) DEFAULT NULL,
  `contestid` int DEFAULT NULL,
  `contestname` varchar(100) DEFAULT NULL,
  `oldrating` int DEFAULT NULL,
  `newrating` int DEFAULT NULL,
  `ratingupdatetimeseconds` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userandratinglist`
--

LOCK TABLES `userandratinglist` WRITE;
/*!40000 ALTER TABLE `userandratinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `userandratinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 21:18:40
