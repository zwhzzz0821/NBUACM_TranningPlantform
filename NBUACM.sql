CREATE DATABASE /*!32312 IF NOT EXISTS*/`NBUACM` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `NBUACM`;

DROP TABLE IF EXISTS `problem`;

CREATE TABLE `problem` (
    `ProblemId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `contestId` INT,
    `ProblemIndex` VARCHAR(10),
    `name` VARCHAR(255),
    `Type` VARCHAR(50),
    `points` DECIMAL(10, 1),
    `rating` INT,
    `tags` VARCHAR(255)
);

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codeforceshandle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codeforcesrating` int DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('216001893','123456','陈炳灿','bingcan',1148),('233333333','123456','朱文豪','Yukim1',1782);
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
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userandratinglist`
--

LOCK TABLES `userandratinglist` WRITE;
/*!40000 ALTER TABLE `userandratinglist` DISABLE KEYS */;
INSERT INTO `userandratinglist` VALUES (175,'Yukim1',1624,'Codeforces Round 764 (Div. 3)',0,382,1641833400),(176,'Yukim1',1627,'Codeforces Round 766 (Div. 2)',382,623,1642264500),(177,'Yukim1',1629,'Codeforces Round 767 (Div. 2)',623,758,1642869300),(178,'Yukim1',1657,'Educational Codeforces Round 125 (Rated for Div. 2)',758,891,1647967500),(179,'Yukim1',1656,'CodeTON Round 1 (Div. 1 + Div. 2, Rated, Prizes!)',891,968,1648139700),(180,'Yukim1',1658,'Codeforces Round 779 (Div. 2)',968,1017,1648398900),(181,'Yukim1',1661,'Educational Codeforces Round 126 (Rated for Div. 2)',1017,1046,1649522100),(182,'Yukim1',1659,'Codeforces Round 782 (Div. 2)',1046,945,1650214200),(183,'Yukim1',1668,'Codeforces Round 783 (Div. 2)',945,1067,1650386100),(184,'Yukim1',1669,'Codeforces Round 784 (Div. 4)',1067,1115,1650558900),(185,'Yukim1',1671,'Educational Codeforces Round 127 (Rated for Div. 2)',1115,1162,1650645300),(186,'Yukim1',1672,'Codeforces Global Round 20',1162,1186,1650733500),(187,'Yukim1',1673,'Codeforces Round 785 (Div. 2)',1186,1079,1651336500),(188,'Yukim1',1674,'Codeforces Round 786 (Div. 3)',1079,1128,1651509300),(189,'Yukim1',1675,'Codeforces Round 787 (Div. 3)',1128,1137,1651769400),(190,'Yukim1',1688,'Codeforces Round 796 (Div. 2)',1137,1275,1654274100),(191,'Yukim1',1696,'Codeforces Global Round 21',1275,1247,1656175800),(192,'Yukim1',1698,'Codeforces Round 803 (Div. 2)',1247,1252,1656435000),(193,'Yukim1',1699,'Codeforces Round 804 (Div. 2)',1252,1297,1656952500),(194,'Yukim1',1701,'Educational Codeforces Round 131 (Rated for Div. 2)',1297,1275,1657298100),(195,'Yukim1',1702,'Codeforces Round 805 (Div. 3)',1275,1256,1657471800),(196,'Yukim1',1703,'Codeforces Round 806 (Div. 4)',1256,1316,1657644600),(197,'Yukim1',1705,'Codeforces Round 807 (Div. 2)',1316,1257,1657900200),(198,'Yukim1',1706,'Codeforces Round 809 (Div. 2)',1257,1251,1658162100),(199,'Yukim1',1709,'Educational Codeforces Round 132 (Rated for Div. 2)',1251,1216,1658421300),(200,'Yukim1',1704,'CodeTON Round 2 (Div. 1 + Div. 2, Rated, Prizes!)',1216,1246,1659285300),(201,'Yukim1',1716,'Educational Codeforces Round 133 (Rated for Div. 2)',1246,1198,1659630900),(202,'Yukim1',1713,'Codeforces Round 812 (Div. 2)',1198,1236,1659803700),(203,'Yukim1',1712,'Codeforces Round 813 (Div. 2)',1236,1345,1660409400),(204,'Yukim1',1719,'Codeforces Round 814 (Div. 2)',1345,1273,1660667700),(205,'Yukim1',1722,'Codeforces Round 817 (Div. 4)',1273,1379,1661879100),(206,'Yukim1',1717,'Codeforces Round 818 (Div. 2)',1379,1409,1662136500),(207,'Yukim1',1728,'Educational Codeforces Round 135 (Rated for Div. 2)',1409,1419,1662654900),(208,'Yukim1',1729,'Codeforces Round 820 (Div. 3)',1419,1440,1663001400),(209,'Yukim1',1733,'Codeforces Round 821 (Div. 2)',1440,1422,1663605300),(210,'Yukim1',1734,'Codeforces Round 822 (Div. 2)',1422,1427,1663941900),(211,'Yukim1',1730,'Codeforces Round 823 (Div. 2)',1427,1461,1664123700),(212,'Yukim1',1739,'Educational Codeforces Round 136 (Rated for Div. 2)',1461,1491,1664469300),(213,'Yukim1',1738,'Codeforces Global Round 22',1491,1449,1664557500),(214,'Yukim1',1735,'Codeforces Round 824 (Div. 2)',1449,1465,1664729400),(215,'Yukim1',1737,'Dytechlab Cup 2022',1465,1569,1665162300),(216,'Yukim1',1736,'Codeforces Round 825 (Div. 2)',1569,1580,1665419700),(217,'Yukim1',1741,'Codeforces Round 826 (Div. 3)',1580,1536,1665507000),(218,'Yukim1',1746,'Codeforces Global Round 23',1536,1565,1665852600),(219,'Yukim1',1744,'Codeforces Round  828 (Div. 3)',1565,1564,1665939000),(220,'Yukim1',1743,'Educational Codeforces Round 137 (Rated for Div. 2)',1564,1662,1666024500),(221,'Yukim1',1750,'CodeTON Round 3 (Div. 1 + Div. 2, Rated, Prizes!)',1662,1615,1667754300),(222,'Yukim1',1748,'Codeforces Round 833 (Div. 2)',1615,1632,1668270900),(223,'Yukim1',1761,'Pinely Round 1 (Div. 1 + Div. 2)',1632,1565,1668963900),(224,'Yukim1',1762,'Codeforces Round 838 (Div. 2)',1565,1595,1671123900),(225,'Yukim1',1774,'Polynomial Round 2022 (Div. 1 + Div. 2, Rated, Prizes!)',1595,1555,1671296700),(226,'Yukim1',1763,'Codeforces Round 840 (Div. 2) and Enigma 2022 - Cybros LNMIIT',1555,1649,1671467700),(227,'Yukim1',1731,'Codeforces Round 841 (Div. 2) and Divide by Zero 2022',1649,1656,1672158900),(228,'Yukim1',1770,'Good Bye 2022: 2023 is NEAR',1656,1643,1672419900),(229,'Yukim1',1768,'Codeforces Round 842 (Div. 2)',1643,1661,1672936500),(230,'Yukim1',1792,'Educational Codeforces Round 142 (Rated for Div. 2)',1661,1610,1674578100),(231,'Yukim1',1808,'Codeforces Round 861 (Div. 2)',1610,1652,1680087900),(232,'Yukim1',1805,'Codeforces Round 862 (Div. 2)',1652,1626,1680453300),(233,'Yukim1',1816,'Codeforces Round 865 (Div. 2)',1626,1569,1681059600),(234,'Yukim1',1821,'Educational Codeforces Round 147 (Rated for Div. 2)',1569,1634,1682008500),(235,'Yukim1',1826,'Codeforces Round 870 (Div. 2)',1634,1680,1683304500),(236,'Yukim1',1825,'Codeforces Round 872 (Div. 2)',1680,1541,1683554700),(237,'Yukim1',1832,'Educational Codeforces Round 148 (Rated for Div. 2)',1541,1648,1683909300),(238,'Yukim1',1837,'Educational Codeforces Round 149 (Rated for Div. 2)',1648,1603,1685032500),(239,'Yukim1',1831,'Codeforces Round 875 (Div. 2)',1603,1591,1685293500),(240,'Yukim1',1840,'Codeforces Round 878 (Div. 3)',1591,1623,1686070200),(241,'Yukim1',1847,'Codeforces Round 882 (Div. 2)',1623,1662,1688662200),(242,'Yukim1',1853,'Codeforces Round 887 (Div. 2)',1662,1625,1690131900),(243,'Yukim1',1860,'Educational Codeforces Round 153 (Rated for Div. 2)',1625,1613,1692290100),(244,'Yukim1',1864,'Harbour.Space Scholarship Contest 2023-2024 (Div. 1 + Div. 2)',1613,1645,1693071300),(245,'Yukim1',1863,'Pinely Round 2 (Div. 1 + Div. 2)',1645,1632,1693416900),(246,'Yukim1',1861,'Educational Codeforces Round 154 (Rated for Div. 2)',1632,1608,1693499700),(247,'Yukim1',1869,'Codeforces Round 896 (Div. 2)',1608,1630,1694363700),(248,'Yukim1',1867,'Codeforces Round 897 (Div. 2)',1630,1705,1694450100),(249,'Yukim1',1870,'CodeTON Round 6 (Div. 1 + Div. 2, Rated, Prizes!)',1705,1731,1695055800),(250,'Yukim1',1879,'Educational Codeforces Round 155 (Rated for Div. 2)',1731,1790,1695573300),(251,'Yukim1',1882,'Codeforces Round 899 (Div. 2)',1790,1820,1695659700),(252,'Yukim1',1875,'Codeforces Round 901 (Div. 2)',1820,1785,1696095300),(253,'Yukim1',1877,'Codeforces Round 902 (Div. 2, based on COMPFEST 15 - Final Round)',1785,1720,1696764900),(254,'Yukim1',1886,'Educational Codeforces Round 156 (Rated for Div. 2)',1720,1751,1696869300),(255,'Yukim1',1884,'Codeforces Round 904 (Div. 2)',1751,1734,1697965500),(256,'Yukim1',1891,'Codeforces Round 907 (Div. 2)',1734,1756,1698683700),(257,'Yukim1',1895,'Educational Codeforces Round 157 (Rated for Div. 2)',1756,1787,1699029300),(258,'Yukim1',1901,'Educational Codeforces Round 158 (Rated for Div. 2)',1787,1766,1700843700),(259,'Yukim1',1896,'CodeTON Round 7 (Div. 1 + Div. 2, Rated, Prizes!)',1766,1754,1700932800),(260,'Yukim1',1900,'Codeforces Round 911 (Div. 2)',1754,1704,1701016500),(261,'Yukim1',1920,'Codeforces Round 919 (Div. 2)',1704,1782,1705163700),(262,'bingcan',1624,'Codeforces Round 764 (Div. 3)',0,349,1641833400),(263,'bingcan',1625,'Codeforces Round 765 (Div. 2)',349,577,1641996300),(264,'bingcan',1754,'Codeforces Round 829 (Div. 2)',577,753,1666518600),(265,'bingcan',1877,'Codeforces Round 902 (Div. 2, based on COMPFEST 15 - Final Round)',753,952,1696764900),(266,'bingcan',1884,'Codeforces Round 904 (Div. 2)',952,1148,1697965500);
/*!40000 ALTER TABLE `userandratinglist` ENABLE KEYS */;
UNLOCK TABLES;