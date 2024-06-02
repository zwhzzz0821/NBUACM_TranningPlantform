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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allusersubmissionstatus`
--

LOCK TABLES `allusersubmissionstatus` WRITE;
/*!40000 ALTER TABLE `allusersubmissionstatus` DISABLE KEYS */;
INSERT INTO `allusersubmissionstatus` VALUES (1,3,0,1100,0,1293.231046931408,1.3333,0,366.6666666666667,0,1201.6230350549115);
/*!40000 ALTER TABLE `allusersubmissionstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BlogContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ProblemId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('233333333','朱文豪','123456');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

--
-- Table structure for table `problemlist`
--

DROP TABLE IF EXISTS `problemlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problemlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `begin` bigint unsigned DEFAULT '0',
  `end` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemlist`
--

LOCK TABLES `problemlist` WRITE;
/*!40000 ALTER TABLE `problemlist` DISABLE KEYS */;
INSERT INTO `problemlist` VALUES (1,'题单测试',0,0),(2,'题单测试',1718294400,1718899200),(3,'题单测试1',1718726400,1719452467),(4,'题单测试3',1717603200,1718899200),(5,'题单测试',1717516800,1717603200),(6,'题单测试',1717603200,1717689600),(7,'题单测试',1717516800,1717776000),(8,'题单测试',1717516800,1717776000);
/*!40000 ALTER TABLE `problemlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problemlistwithproblems`
--

DROP TABLE IF EXISTS `problemlistwithproblems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problemlistwithproblems` (
  `problemListId` int DEFAULT NULL,
  `problemId` int DEFAULT NULL,
  `contestId` int DEFAULT NULL,
  `problemIndex` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `acNumber` int DEFAULT '0',
  KEY `problemlistwithproblems_problem_FK` (`problemId`),
  KEY `problemlistwithproblems_problemlist_FK` (`problemListId`),
  CONSTRAINT `problemlistwithproblems_problem_FK` FOREIGN KEY (`problemId`) REFERENCES `problem` (`ProblemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `problemlistwithproblems_problemlist_FK` FOREIGN KEY (`problemListId`) REFERENCES `problemlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemlistwithproblems`
--

LOCK TABLES `problemlistwithproblems` WRITE;
/*!40000 ALTER TABLE `problemlistwithproblems` DISABLE KEYS */;
INSERT INTO `problemlistwithproblems` VALUES (2,1079,233,'A','Perfect Permutation',0),(3,4272,998,'A','Balloons',0),(4,4272,998,'A','Balloons',0),(5,1038,223,'A','Bracket Sequence',0),(6,1127,244,'A','Dividing Orange',0),(7,2370,555,'A','Case of Matryoshkas',0),(8,2370,555,'A','Case of Matryoshkas',0);
/*!40000 ALTER TABLE `problemlistwithproblems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problemlistwithusers`
--

DROP TABLE IF EXISTS `problemlistwithusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problemlistwithusers` (
  `problemListId` int DEFAULT NULL,
  `uid` varchar(100) DEFAULT NULL,
  KEY `problemlistwithusers_problemlist_FK` (`problemListId`),
  KEY `problemlistwithusers_user_FK` (`uid`),
  CONSTRAINT `problemlistwithusers_problemlist_FK` FOREIGN KEY (`problemListId`) REFERENCES `problemlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `problemlistwithusers_user_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemlistwithusers`
--

LOCK TABLES `problemlistwithusers` WRITE;
/*!40000 ALTER TABLE `problemlistwithusers` DISABLE KEYS */;
INSERT INTO `problemlistwithusers` VALUES (1,'123456789'),(1,'233333333'),(7,'123456789'),(7,'226001634'),(7,'233333333'),(8,'123456789'),(8,'226001634');
/*!40000 ALTER TABLE `problemlistwithusers` ENABLE KEYS */;
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
  `uid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acsubmissionid`),
  KEY `fk_problem_id` (`ProblemId`),
  CONSTRAINT `fk_problem_id` FOREIGN KEY (`ProblemId`) REFERENCES `problem` (`ProblemId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--



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
  `imageURL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123456789','123456','胡健山','5-3',1624,3,0,3,0,729,368,103,74,92,66,21,12,0,2,2,0,0,1260.054347826087,'https://userpic.codeforces.org/3252576/title/e014a85bbbc31b82.jpg','0','0','0'),('226001634','123456','不知名学弟','226001634',1409,0,0,0,0,422,221,88,48,71,13,1,0,0,3,3,0,0,1051.5837104072398,'https://userpic.codeforces.org/no-title.jpg','0','0','0'),('233333333','123456','朱文豪','Yukim1',1782,1,0,1,0,2458,1108,279,182,241,282,101,23,0,1,1,1100,0,1293.231046931408,'https://userpic.codeforces.org/2402327/title/5b8aacefdf3beaf9.jpg','1791654567','233@qq.com','男');
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
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userandratinglist`
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 20:55:12


DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `codeforceshandle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
