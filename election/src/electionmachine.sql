-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: electionmachine
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

create database electionmachine;

use electionmachine;
--
-- Table structure for creating table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL UNIQUE,
  `party` varchar(250) DEFAULT NULL,
  `proffesion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data into table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES 
(2,'Adeniyi Olufunmilola','29','funmi@asdf.fi','Christian Democrats – KD','Student'),
(3,'Robert Blankson','30','roberts@asdf.fi','Left Alliance of Finland – VAS','Student'),
(4,'Tommi Lee','40','tommi@lecture.fi','National Coalition Party – KOK','Lecturer'),
(5,'Deepak Sandeep','36','deepak@lecture.fi','Centre Party – KESK','Lecturer'),
(6,'Tommi Fins','23','tommi@asdf.fi','Christian Democrats – KD','Student'),
(7,'Vernesa Black','36','vernesa@hit.com','The Finns – PS','Marketer');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

select * from candidates;


CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL UNIQUE,
  `password` varchar(20) NOT NULL
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'Oluwole', 'Osinubi', 'oluwole20100@student.hamk.fi', '123456');


DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `email` varchar(50) DEFAULT NULL UNIQUE,
  `score` int(11) NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answer` varchar(50) DEFAULT NULL
) ;

INSERT INTO `answers` (`answer`) VALUES
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree'),
('Strongly Agree');

/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-05 18:48:18
