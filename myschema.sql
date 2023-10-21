-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: FootballDB
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Games` (
  `GameID` varchar(10) NOT NULL,
  `Date` date DEFAULT NULL,
  `Opponent` varchar(255) DEFAULT NULL,
  `ScoreFor` int DEFAULT NULL,
  `ScoreAgainst` int DEFAULT NULL,
  `Season` int DEFAULT NULL,
  PRIMARY KEY (`GameID`),
  KEY `Season` (`Season`),
  CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`Season`) REFERENCES `SeasonPlayerInfo` (`Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games`
--

LOCK TABLES `Games` WRITE;
/*!40000 ALTER TABLE `Games` DISABLE KEYS */;
INSERT INTO `Games` VALUES ('LAR182023','2023-01-08','Los Angeles Rams',19,16,2022),('NYJ112023','2023-01-01','New York Jets',23,6,2022);
/*!40000 ALTER TABLE `Games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Players` (
  `PlayerID` varchar(10) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `JerseyNo` int DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES ('GSMITHQB','Geno','Smith',7,'Quarterback'),('QDIGGSFS','Quandre','Diggs',6,'Free Safety'),('WOOLENCB','Riq','Woolen',27,'Cornerback');
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeasonPlayerInfo`
--

DROP TABLE IF EXISTS `SeasonPlayerInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SeasonPlayerInfo` (
  `PlayerID` varchar(10) NOT NULL,
  `Season` int NOT NULL,
  PRIMARY KEY (`PlayerID`,`Season`),
  KEY `Season` (`Season`),
  CONSTRAINT `SeasonPlayerInfo_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeasonPlayerInfo`
--

LOCK TABLES `SeasonPlayerInfo` WRITE;
/*!40000 ALTER TABLE `SeasonPlayerInfo` DISABLE KEYS */;
INSERT INTO `SeasonPlayerInfo` VALUES ('QDIGGSFS',2021),('QDIGGSFS',2022),('WOOLENCB',2022),('WOOLENCB',2023);
/*!40000 ALTER TABLE `SeasonPlayerInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatisticsGame`
--

DROP TABLE IF EXISTS `StatisticsGame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StatisticsGame` (
  `PlayerID` varchar(10) NOT NULL,
  `GainedYards` int DEFAULT NULL,
  `InterceptionsOff` int DEFAULT NULL,
  `InterceptionsDef` int DEFAULT NULL,
  `SacksOff` int DEFAULT NULL,
  `SacksDef` int DEFAULT NULL,
  `FumblesRec` int DEFAULT NULL,
  `FumblesLost` int DEFAULT NULL,
  `Touchdowns` int DEFAULT NULL,
  `GameID` varchar(10) NOT NULL,
  PRIMARY KEY (`PlayerID`,`GameID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `StatisticsGame_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`),
  CONSTRAINT `StatisticsGame_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticsGame`
--

LOCK TABLES `StatisticsGame` WRITE;
/*!40000 ALTER TABLE `StatisticsGame` DISABLE KEYS */;
INSERT INTO `StatisticsGame` VALUES ('GSMITHQB',264,2,0,3,0,0,0,1,'LAR182023'),('QDIGGSFS',0,0,1,0,0,0,0,0,'LAR182023'),('WOOLENCB',0,0,0,0,0,0,0,0,'LAR182023');
/*!40000 ALTER TABLE `StatisticsGame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatisticsSeason`
--

DROP TABLE IF EXISTS `StatisticsSeason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StatisticsSeason` (
  `PlayerID` varchar(10) NOT NULL,
  `GainedYards` int DEFAULT NULL,
  `InterceptionsOff` int DEFAULT NULL,
  `InterceptionsDef` int DEFAULT NULL,
  `SacksDef` int DEFAULT NULL,
  `SacksOff` int DEFAULT NULL,
  `FumblesRec` int DEFAULT NULL,
  `FumblesLost` int DEFAULT NULL,
  `Touchdowns` int DEFAULT NULL,
  `Season` int NOT NULL,
  PRIMARY KEY (`PlayerID`,`Season`),
  KEY `Season` (`Season`),
  CONSTRAINT `StatisticsSeason_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticsSeason`
--

LOCK TABLES `StatisticsSeason` WRITE;
/*!40000 ALTER TABLE `StatisticsSeason` DISABLE KEYS */;
INSERT INTO `StatisticsSeason` VALUES ('GSMITHQB',4648,11,0,0,46,1,2,31,2022),('QDIGGSFS',0,0,4,0,0,1,0,0,2022),('WOOLENCB',0,0,6,0,0,2,0,1,2022);
/*!40000 ALTER TABLE `StatisticsSeason` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-21 19:19:23
