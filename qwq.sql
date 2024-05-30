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
INSERT INTO `allusersubmissionstatus` VALUES (1,4,26,0,1800,1293.4056007226739,1.3333,9.3333,0,1375.6410256410256,1198.6422171233007);
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
-- Table structure for table `problemlist`
--

DROP TABLE IF EXISTS `problemlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problemlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `begin` varchar(100) DEFAULT NULL,
  `end` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemlist`
--

LOCK TABLES `problemlist` WRITE;
/*!40000 ALTER TABLE `problemlist` DISABLE KEYS */;
INSERT INTO `problemlist` VALUES (1,'题单测试','开始时间','结束时间');
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
INSERT INTO `problemlistwithusers` VALUES (1,'123456789'),(1,'233333333');
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
INSERT INTO `user` VALUES ('123456789','123456','胡健山','5-3',1633,0,1,0,2,726,365,100,74,92,66,21,12,0,2,3,0,1400,1270.4109589041095),('226001634','123456','不知名学弟','226001634',1441,4,26,4,44,414,218,89,47,68,13,1,0,0,3,1,0,926.9230769230769,1032.1100917431193),('233333333','123456','朱文豪','Yukim1',1782,0,1,0,2,2457,1107,279,181,241,282,101,23,0,1,2,0,1800,1293.4056007226739);
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
INSERT INTO `userandratinglist` VALUES (175,'Yukim1',1624,'Codeforces Round 764 (Div. 3)',0,382,1641833400),(176,'Yukim1',1627,'Codeforces Round 766 (Div. 2)',382,623,1642264500),(177,'Yukim1',1629,'Codeforces Round 767 (Div. 2)',623,758,1642869300),(178,'Yukim1',1657,'Educational Codeforces Round 125 (Rated for Div. 2)',758,891,1647967500),(179,'Yukim1',1656,'CodeTON Round 1 (Div. 1 + Div. 2, Rated, Prizes!)',891,968,1648139700),(180,'Yukim1',1658,'Codeforces Round 779 (Div. 2)',968,1017,1648398900),(181,'Yukim1',1661,'Educational Codeforces Round 126 (Rated for Div. 2)',1017,1046,1649522100),(182,'Yukim1',1659,'Codeforces Round 782 (Div. 2)',1046,945,1650214200),(183,'Yukim1',1668,'Codeforces Round 783 (Div. 2)',945,1067,1650386100),(184,'Yukim1',1669,'Codeforces Round 784 (Div. 4)',1067,1115,1650558900),(185,'Yukim1',1671,'Educational Codeforces Round 127 (Rated for Div. 2)',1115,1162,1650645300),(186,'Yukim1',1672,'Codeforces Global Round 20',1162,1186,1650733500),(187,'Yukim1',1673,'Codeforces Round 785 (Div. 2)',1186,1079,1651336500),(188,'Yukim1',1674,'Codeforces Round 786 (Div. 3)',1079,1128,1651509300),(189,'Yukim1',1675,'Codeforces Round 787 (Div. 3)',1128,1137,1651769400),(190,'Yukim1',1688,'Codeforces Round 796 (Div. 2)',1137,1275,1654274100),(191,'Yukim1',1696,'Codeforces Global Round 21',1275,1247,1656175800),(192,'Yukim1',1698,'Codeforces Round 803 (Div. 2)',1247,1252,1656435000),(193,'Yukim1',1699,'Codeforces Round 804 (Div. 2)',1252,1297,1656952500),(194,'Yukim1',1701,'Educational Codeforces Round 131 (Rated for Div. 2)',1297,1275,1657298100),(195,'Yukim1',1702,'Codeforces Round 805 (Div. 3)',1275,1256,1657471800),(196,'Yukim1',1703,'Codeforces Round 806 (Div. 4)',1256,1316,1657644600),(197,'Yukim1',1705,'Codeforces Round 807 (Div. 2)',1316,1257,1657900200),(198,'Yukim1',1706,'Codeforces Round 809 (Div. 2)',1257,1251,1658162100),(199,'Yukim1',1709,'Educational Codeforces Round 132 (Rated for Div. 2)',1251,1216,1658421300),(200,'Yukim1',1704,'CodeTON Round 2 (Div. 1 + Div. 2, Rated, Prizes!)',1216,1246,1659285300),(201,'Yukim1',1716,'Educational Codeforces Round 133 (Rated for Div. 2)',1246,1198,1659630900),(202,'Yukim1',1713,'Codeforces Round 812 (Div. 2)',1198,1236,1659803700),(203,'Yukim1',1712,'Codeforces Round 813 (Div. 2)',1236,1345,1660409400),(204,'Yukim1',1719,'Codeforces Round 814 (Div. 2)',1345,1273,1660667700),(205,'Yukim1',1722,'Codeforces Round 817 (Div. 4)',1273,1379,1661879100),(206,'Yukim1',1717,'Codeforces Round 818 (Div. 2)',1379,1409,1662136500),(207,'Yukim1',1728,'Educational Codeforces Round 135 (Rated for Div. 2)',1409,1419,1662654900),(208,'Yukim1',1729,'Codeforces Round 820 (Div. 3)',1419,1440,1663001400),(209,'Yukim1',1733,'Codeforces Round 821 (Div. 2)',1440,1422,1663605300),(210,'Yukim1',1734,'Codeforces Round 822 (Div. 2)',1422,1427,1663941900),(211,'Yukim1',1730,'Codeforces Round 823 (Div. 2)',1427,1461,1664123700),(212,'Yukim1',1739,'Educational Codeforces Round 136 (Rated for Div. 2)',1461,1491,1664469300),(213,'Yukim1',1738,'Codeforces Global Round 22',1491,1449,1664557500),(214,'Yukim1',1735,'Codeforces Round 824 (Div. 2)',1449,1465,1664729400),(215,'Yukim1',1737,'Dytechlab Cup 2022',1465,1569,1665162300),(216,'Yukim1',1736,'Codeforces Round 825 (Div. 2)',1569,1580,1665419700),(217,'Yukim1',1741,'Codeforces Round 826 (Div. 3)',1580,1536,1665507000),(218,'Yukim1',1746,'Codeforces Global Round 23',1536,1565,1665852600),(219,'Yukim1',1744,'Codeforces Round  828 (Div. 3)',1565,1564,1665939000),(220,'Yukim1',1743,'Educational Codeforces Round 137 (Rated for Div. 2)',1564,1662,1666024500),(221,'Yukim1',1750,'CodeTON Round 3 (Div. 1 + Div. 2, Rated, Prizes!)',1662,1615,1667754300),(222,'Yukim1',1748,'Codeforces Round 833 (Div. 2)',1615,1632,1668270900),(223,'Yukim1',1761,'Pinely Round 1 (Div. 1 + Div. 2)',1632,1565,1668963900),(224,'Yukim1',1762,'Codeforces Round 838 (Div. 2)',1565,1595,1671123900),(225,'Yukim1',1774,'Polynomial Round 2022 (Div. 1 + Div. 2, Rated, Prizes!)',1595,1555,1671296700),(226,'Yukim1',1763,'Codeforces Round 840 (Div. 2) and Enigma 2022 - Cybros LNMIIT',1555,1649,1671467700),(227,'Yukim1',1731,'Codeforces Round 841 (Div. 2) and Divide by Zero 2022',1649,1656,1672158900),(228,'Yukim1',1770,'Good Bye 2022: 2023 is NEAR',1656,1643,1672419900),(229,'Yukim1',1768,'Codeforces Round 842 (Div. 2)',1643,1661,1672936500),(230,'Yukim1',1792,'Educational Codeforces Round 142 (Rated for Div. 2)',1661,1610,1674578100),(231,'Yukim1',1808,'Codeforces Round 861 (Div. 2)',1610,1652,1680087900),(232,'Yukim1',1805,'Codeforces Round 862 (Div. 2)',1652,1626,1680453300),(233,'Yukim1',1816,'Codeforces Round 865 (Div. 2)',1626,1569,1681059600),(234,'Yukim1',1821,'Educational Codeforces Round 147 (Rated for Div. 2)',1569,1634,1682008500),(235,'Yukim1',1826,'Codeforces Round 870 (Div. 2)',1634,1680,1683304500),(236,'Yukim1',1825,'Codeforces Round 872 (Div. 2)',1680,1541,1683554700),(237,'Yukim1',1832,'Educational Codeforces Round 148 (Rated for Div. 2)',1541,1648,1683909300),(238,'Yukim1',1837,'Educational Codeforces Round 149 (Rated for Div. 2)',1648,1603,1685032500),(239,'Yukim1',1831,'Codeforces Round 875 (Div. 2)',1603,1591,1685293500),(240,'Yukim1',1840,'Codeforces Round 878 (Div. 3)',1591,1623,1686070200),(241,'Yukim1',1847,'Codeforces Round 882 (Div. 2)',1623,1662,1688662200),(242,'Yukim1',1853,'Codeforces Round 887 (Div. 2)',1662,1625,1690131900),(243,'Yukim1',1860,'Educational Codeforces Round 153 (Rated for Div. 2)',1625,1613,1692290100),(244,'Yukim1',1864,'Harbour.Space Scholarship Contest 2023-2024 (Div. 1 + Div. 2)',1613,1645,1693071300),(245,'Yukim1',1863,'Pinely Round 2 (Div. 1 + Div. 2)',1645,1632,1693416900),(246,'Yukim1',1861,'Educational Codeforces Round 154 (Rated for Div. 2)',1632,1608,1693499700),(247,'Yukim1',1869,'Codeforces Round 896 (Div. 2)',1608,1630,1694363700),(248,'Yukim1',1867,'Codeforces Round 897 (Div. 2)',1630,1705,1694450100),(249,'Yukim1',1870,'CodeTON Round 6 (Div. 1 + Div. 2, Rated, Prizes!)',1705,1731,1695055800),(250,'Yukim1',1879,'Educational Codeforces Round 155 (Rated for Div. 2)',1731,1790,1695573300),(251,'Yukim1',1882,'Codeforces Round 899 (Div. 2)',1790,1820,1695659700),(252,'Yukim1',1875,'Codeforces Round 901 (Div. 2)',1820,1785,1696095300),(253,'Yukim1',1877,'Codeforces Round 902 (Div. 2, based on COMPFEST 15 - Final Round)',1785,1720,1696764900),(254,'Yukim1',1886,'Educational Codeforces Round 156 (Rated for Div. 2)',1720,1751,1696869300),(255,'Yukim1',1884,'Codeforces Round 904 (Div. 2)',1751,1734,1697965500),(256,'Yukim1',1891,'Codeforces Round 907 (Div. 2)',1734,1756,1698683700),(257,'Yukim1',1895,'Educational Codeforces Round 157 (Rated for Div. 2)',1756,1787,1699029300),(258,'Yukim1',1901,'Educational Codeforces Round 158 (Rated for Div. 2)',1787,1766,1700843700),(259,'Yukim1',1896,'CodeTON Round 7 (Div. 1 + Div. 2, Rated, Prizes!)',1766,1754,1700932800),(260,'Yukim1',1900,'Codeforces Round 911 (Div. 2)',1754,1704,1701016500),(261,'Yukim1',1920,'Codeforces Round 919 (Div. 2)',1704,1782,1705163700),(262,'bingcan',1624,'Codeforces Round 764 (Div. 3)',0,349,1641833400),(263,'bingcan',1625,'Codeforces Round 765 (Div. 2)',349,577,1641996300),(264,'bingcan',1754,'Codeforces Round 829 (Div. 2)',577,753,1666518600),(265,'bingcan',1877,'Codeforces Round 902 (Div. 2, based on COMPFEST 15 - Final Round)',753,952,1696764900),(266,'bingcan',1884,'Codeforces Round 904 (Div. 2)',952,1148,1697965500),(267,'5-3',1833,'Codeforces Round 874 (Div. 3)',0,357,1684515000),(268,'5-3',1831,'Codeforces Round 875 (Div. 2)',357,619,1685293500),(269,'5-3',1839,'Codeforces Round 876 (Div. 2)',619,860,1685810100),(270,'5-3',1838,'Codeforces Round 877 (Div. 2)',860,1101,1685897100),(271,'5-3',1844,'Codeforces Round 884 (Div. 1 + Div. 2)',1101,1196,1689096900),(272,'5-3',1848,'Codeforces Round 885 (Div. 2)',1196,1180,1689525300),(273,'5-3',1850,'Codeforces Round 886 (Div. 4)',1180,1128,1689957300),(274,'5-3',1853,'Codeforces Round 887 (Div. 2)',1128,1163,1690131900),(275,'5-3',1849,'Educational Codeforces Round 152 (Rated for Div. 2)',1163,1190,1690475700),(276,'5-3',1855,'Codeforces Round 889 (Div. 2)',1190,1263,1690650300),(277,'5-3',1857,'Codeforces Round 891 (Div. 3)',1263,1278,1691427000),(278,'5-3',1859,'Codeforces Round 892 (Div. 2)',1278,1268,1691858100),(279,'5-3',1858,'Codeforces Round 893 (Div. 2)',1268,1335,1692117300),(280,'5-3',1860,'Educational Codeforces Round 153 (Rated for Div. 2)',1335,1410,1692290100),(281,'5-3',1862,'Codeforces Round 894 (Div. 3)',1410,1398,1692895800),(282,'5-3',1864,'Harbour.Space Scholarship Contest 2023-2024 (Div. 1 + Div. 2)',1398,1464,1693071300),(283,'5-3',1863,'Pinely Round 2 (Div. 1 + Div. 2)',1464,1475,1693416900),(284,'5-3',1861,'Educational Codeforces Round 154 (Rated for Div. 2)',1475,1486,1693499700),(285,'5-3',1872,'Codeforces Round 895 (Div. 3)',1486,1487,1694105400),(286,'5-3',1869,'Codeforces Round 896 (Div. 2)',1487,1484,1694363700),(287,'5-3',1867,'Codeforces Round 897 (Div. 2)',1484,1500,1694450100),(288,'5-3',1870,'CodeTON Round 6 (Div. 1 + Div. 2, Rated, Prizes!)',1500,1491,1695055800),(289,'5-3',1879,'Educational Codeforces Round 155 (Rated for Div. 2)',1491,1530,1695573300),(290,'5-3',1882,'Codeforces Round 899 (Div. 2)',1530,1507,1695659700),(291,'5-3',1878,'Codeforces Round 900 (Div. 3)',1507,1571,1695747000),(292,'5-3',1875,'Codeforces Round 901 (Div. 2)',1571,1517,1696095300),(293,'5-3',1877,'Codeforces Round 902 (Div. 2, based on COMPFEST 15 - Final Round)',1517,1489,1696764900),(294,'5-3',1886,'Educational Codeforces Round 156 (Rated for Div. 2)',1489,1553,1696869300),(295,'5-3',1881,'Codeforces Round 903 (Div. 3)',1553,1493,1697129400),(296,'5-3',1884,'Codeforces Round 904 (Div. 2)',1493,1563,1697965500),(297,'5-3',1890,'Codeforces Round 906 (Div. 2)',1563,1603,1698512700),(298,'5-3',1895,'Educational Codeforces Round 157 (Rated for Div. 2)',1603,1606,1699029300),(299,'5-3',1894,'Codeforces Round 908 (Div. 2)',1606,1631,1699374900),(300,'5-3',1898,'Codeforces Round 910 (Div. 2)',1631,1641,1700411700),(301,'5-3',1901,'Educational Codeforces Round 158 (Rated for Div. 2)',1641,1612,1700843700),(302,'5-3',1896,'CodeTON Round 7 (Div. 1 + Div. 2, Rated, Prizes!)',1612,1620,1700932800),(303,'5-3',1900,'Codeforces Round 911 (Div. 2)',1620,1639,1701016500),(304,'5-3',1903,'Codeforces Round 912 (Div. 2)',1639,1629,1701370200),(305,'5-3',1902,'Educational Codeforces Round 159 (Rated for Div. 2)',1629,1650,1701621300),(306,'5-3',1905,'Codeforces Round 915 (Div. 2)',1650,1686,1702744500),(307,'5-3',1909,'Pinely Round 3 (Div. 1 + Div. 2)',1686,1664,1703352900),(308,'5-3',1917,'Codeforces Round 917 (Div. 2)',1664,1768,1703435700),(309,'5-3',1916,'Good Bye 2023',1768,1810,1703955000),(310,'5-3',1919,'Hello 2024',1810,1762,1704560700),(311,'5-3',1920,'Codeforces Round 919 (Div. 2)',1762,1671,1705163700),(312,'5-3',1922,'Educational Codeforces Round 161 (Rated for Div. 2)',1671,1626,1705595700),(313,'5-3',1925,'Codeforces Round 921 (Div. 2)',1626,1648,1706373900),(314,'5-3',1918,'Codeforces Round 922 (Div. 2)',1648,1639,1706633100),(315,'5-3',1929,'Codeforces Round 926 (Div. 2)',1639,1689,1708014900),(316,'5-3',1930,'think-cell Round 1',1689,1618,1708191300),(317,'5-3',1923,'Educational Codeforces Round 162 (Rated for Div. 2)',1618,1635,1708706100),(318,'5-3',1937,'Codeforces Round 930 (Div. 2)',1635,1660,1709224500),(319,'5-3',1934,'Codeforces Round 931 (Div. 2)',1660,1712,1709310900),(320,'5-3',1948,'Educational Codeforces Round 163 (Rated for Div. 2)',1712,1636,1710520500),(321,'5-3',1946,'Codeforces Round 936 (Div. 2)',1636,1637,1711125300),(322,'5-3',1954,'Educational Codeforces Round 164 (Rated for Div. 2)',1637,1595,1712939700),(323,'5-3',1972,'Codeforces Round 942 (Div. 2)',1595,1633,1714496700),(324,'226001634',1775,'Codeforces Round 843 (Div. 2)',0,403,1673358300),(325,'226001634',1879,'Educational Codeforces Round 155 (Rated for Div. 2)',403,692,1695573300),(326,'226001634',1882,'Codeforces Round 899 (Div. 2)',692,895,1695659700),(327,'226001634',1875,'Codeforces Round 901 (Div. 2)',895,1043,1696095300),(328,'226001634',1886,'Educational Codeforces Round 156 (Rated for Div. 2)',1043,1110,1696869300),(329,'226001634',1901,'Educational Codeforces Round 158 (Rated for Div. 2)',1110,1230,1700843700),(330,'226001634',1922,'Educational Codeforces Round 161 (Rated for Div. 2)',1230,1224,1705595700),(331,'226001634',1957,'Codeforces Round 940 (Div. 2) and CodeCraft-23',1224,1247,1713718200),(332,'226001634',1966,'Codeforces Round 941 (Div. 2)',1247,1240,1714235700),(333,'226001634',1969,'Educational Codeforces Round 165 (Rated for Div. 2)',1240,1316,1714408500),(334,'226001634',1972,'Codeforces Round 942 (Div. 2)',1316,1298,1714496700),(335,'226001634',1968,'Codeforces Round 943 (Div. 3)',1298,1384,1714669200),(336,'226001634',1973,'Codeforces Round 945 (Div. 2)',1384,1384,1715963700),(337,'226001634',1974,'Codeforces Round 946 (Div. 3)',1384,1441,1716223800);
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

-- Dump completed on 2024-05-24 20:55:12


DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;