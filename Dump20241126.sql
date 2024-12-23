-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pac
-- ------------------------------------------------------
-- Server version	8.0.40

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

--
-- Table structure for table `auxspace`
--

DROP TABLE IF EXISTS `auxspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auxspace` (
  `name` varchar(40) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `dimensions` varchar(100) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auxspace`
--

LOCK TABLES `auxspace` WRITE;
/*!40000 ALTER TABLE `auxspace` DISABLE KEYS */;
INSERT INTO `auxspace` VALUES ('Lobbies','In addition to being a beautiful entrance way for guests, the upper and lower lobby areas can be adapted in a variety of ways. Create a registration area, breakfast nook, dining room, a place for display tables, a dance floor. The rooms can be sectioned into smaller break-out areas of left as a large open space, based on your preferences and needs.\nDimensions: 7,000 square feet','7000',10),('Organ Room','Room for the organ and its performers to rehearse and prepare.','2400',15),('Support Room','Room for technical staff and equipment storage.','2400',10);
/*!40000 ALTER TABLE `auxspace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `email` varchar(40) NOT NULL,
  `salutation` varchar(5) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `streetAddress` varchar(40) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `phoneNum` char(10) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('janesmith@example.com','Ms.','Jane','Smith','456 Oak St',90001,'Los Angeles','CA','USA','1234556890'),('johndoe@example.com','Mr.','John','Doe','123 Main St',10001,'New York','NY','USA','9875343210');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `donationNumber` char(10) NOT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `type` enum('Weekly','Monthly','Quartley','Annually') DEFAULT NULL,
  `isRecurring` tinyint(1) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `tribute` varchar(50) DEFAULT NULL,
  `organization` varchar(40) DEFAULT NULL,
  `cardNum` varchar(19) DEFAULT NULL,
  `CVC` int DEFAULT NULL,
  `cardExpDate` date DEFAULT NULL,
  PRIMARY KEY (`donationNumber`),
  KEY `contact` (`contact`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `contact` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES ('DON001','johndoe@example.com','Monthly',1,'50.00','In memory of my parents','Theatre Foundation','1234567812345678',123,'2024-06-30'),('DON002','janesmith@example.com','Annually',0,'100.00','','Arts for All','9876543298765432',321,'2024-07-15');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emaillistmember`
--

DROP TABLE IF EXISTS `emaillistmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emaillistmember` (
  `contact` varchar(40) NOT NULL,
  `series` varchar(40) NOT NULL,
  `receiveJazzEmails` tinyint(1) DEFAULT NULL,
  `receiveClassicalMusicEmails` tinyint(1) DEFAULT NULL,
  `receiveFilandTheatreEmails` tinyint(1) DEFAULT NULL,
  `receiveDanceEmails` tinyint(1) DEFAULT NULL,
  `receiveMusicEmails` tinyint(1) DEFAULT NULL,
  `receiveWorldDanceAndMusicEmails` tinyint(1) DEFAULT NULL,
  `receiveKidsAndFamilyEmails` tinyint(1) DEFAULT NULL,
  `receiveResourcesForEducators` tinyint(1) DEFAULT NULL,
  `consentToTracking` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`contact`,`series`),
  CONSTRAINT `emaillistmember_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `contact` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emaillistmember`
--

LOCK TABLES `emaillistmember` WRITE;
/*!40000 ALTER TABLE `emaillistmember` DISABLE KEYS */;
INSERT INTO `emaillistmember` VALUES ('janesmith@example.com','Jazz Series',1,0,0,1,0,1,1,0,0),('johndoe@example.com','Broadway Series',1,0,1,0,1,1,0,1,1);
/*!40000 ALTER TABLE `emaillistmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` char(9) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `series` varchar(40) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `genre` varchar(40) DEFAULT NULL,
  `venue` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venue` (`venue`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`venue`) REFERENCES `venue` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('EVT001','The Phantom of the Opera','Broadway Series','A classic musical about a mysterious figure haunting the Paris opera house.','Musical','Concert Hall'),('EVT002','Jazz Festival','Summer Concert Series','A weekend-long jazz music festival featuring top artists.','Jazz','PepsiCo Theatre');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventdate`
--

DROP TABLE IF EXISTS `eventdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventdate` (
  `eventID` char(9) NOT NULL,
  `dateTimeOccurring` date NOT NULL,
  PRIMARY KEY (`eventID`,`dateTimeOccurring`),
  CONSTRAINT `eventdate_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventdate`
--

LOCK TABLES `eventdate` WRITE;
/*!40000 ALTER TABLE `eventdate` DISABLE KEYS */;
INSERT INTO `eventdate` VALUES ('EVT001','2024-06-01'),('EVT002','2024-07-05');
/*!40000 ALTER TABLE `eventdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixedseriessubscriber`
--

DROP TABLE IF EXISTS `fixedseriessubscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixedseriessubscriber` (
  `contact` varchar(40) NOT NULL,
  `series` varchar(40) NOT NULL,
  `expirationDate` date DEFAULT NULL,
  PRIMARY KEY (`contact`,`series`),
  CONSTRAINT `fixedseriessubscriber_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `contact` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixedseriessubscriber`
--

LOCK TABLES `fixedseriessubscriber` WRITE;
/*!40000 ALTER TABLE `fixedseriessubscriber` DISABLE KEYS */;
INSERT INTO `fixedseriessubscriber` VALUES ('janesmith@example.com','Jazz Series','2024-12-01'),('johndoe@example.com','Broadway Series','2025-06-01');
/*!40000 ALTER TABLE `fixedseriessubscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `confirmationNum` char(20) NOT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `eventDiscovery` enum('Email','Season Brochure','Postcard','Twitter','Instagram','Google','Calendar listing (Online)','Calendar listing (Newspaper)','Print Advertisement','Radio Advertisement','Website Advertisement','Feature Article','Word of Mouth') DEFAULT NULL,
  `Price` varchar(5) DEFAULT NULL,
  `cardNum` varchar(19) DEFAULT NULL,
  `CVC` int DEFAULT NULL,
  `cardExpDate` date DEFAULT NULL,
  `cardCountry` varchar(40) DEFAULT NULL,
  `streetAddress` varchar(40) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  `deliveryMethod` enum('Email','Ship','Will Call') DEFAULT NULL,
  PRIMARY KEY (`confirmationNum`),
  KEY `contact` (`contact`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `contact` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES ('ORD001','johndoe@example.com','Email','20.00','1234567812345678',123,'2024-06-30','USA','123 Main St',10001,'New York','NY','USA','First time attending!','Email'),('ORD002','janesmith@example.com','Google','18.00','9876543298765432',321,'2024-07-15','USA','456 Oak St',90001,'Los Angeles','CA','USA','Birthday gift','Ship');
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer`
--

DROP TABLE IF EXISTS `performer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer` (
  `ssn` char(9) NOT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `bio` varchar(150) DEFAULT NULL,
  `website` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer`
--

LOCK TABLES `performer` WRITE;
/*!40000 ALTER TABLE `performer` DISABLE KEYS */;
INSERT INTO `performer` VALUES ('123456789','John','Doe','A renowned tenor with performances across the world.','http://johndoe.com'),('987654321','Jane','Smith','An accomplished pianist known for her classical music performances.','http://janesmithmusic.com');
/*!40000 ALTER TABLE `performer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer_event`
--

DROP TABLE IF EXISTS `performer_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer_event` (
  `ssn` char(9) NOT NULL,
  `event_id` char(9) NOT NULL,
  PRIMARY KEY (`ssn`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `performer_event_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `performer` (`ssn`),
  CONSTRAINT `performer_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer_event`
--

LOCK TABLES `performer_event` WRITE;
/*!40000 ALTER TABLE `performer_event` DISABLE KEYS */;
INSERT INTO `performer_event` VALUES ('123456789','EVT001'),('987654321','EVT002');
/*!40000 ALTER TABLE `performer_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `employeeID` int NOT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `middleName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `position` varchar(40) DEFAULT NULL,
  `department` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (220022123,'Alice','B','Johnson','1234567790','alice.johnson@theatre.com','Stage Manager','Production'),(220022124,'Bob',NULL,'Williams','9876534210','bob.williams@arena.com','Event Coordinator','Operations');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `id` char(9) NOT NULL,
  `client` varchar(40) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `insuranceCarrier` varchar(40) DEFAULT NULL,
  `amountPaid` varchar(12) DEFAULT NULL,
  `boxOfficeRevenue` varchar(9) DEFAULT NULL,
  `cost` varchar(9) DEFAULT NULL,
  `ticketInfoReceived` tinyint(1) DEFAULT NULL,
  `totalTicketsSold` varchar(6) DEFAULT NULL,
  `dateFullyPaid` date DEFAULT NULL,
  `ticketPrice` varchar(6) DEFAULT NULL,
  `propertyDamageCoverage` tinyint(1) DEFAULT NULL,
  `workersComp` tinyint(1) DEFAULT NULL,
  `bodilyInjuryCoverage` tinyint(1) DEFAULT NULL,
  `disabilityCoverage` tinyint(1) DEFAULT NULL,
  `generalAggregateCoverage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`client`) REFERENCES `rentalclient` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES ('RNT001','johndoe@example.com','2024-06-01','2024-06-30','InsureCorp','1000.00','5000.00','2000.00',1,'500','2024-06-15','20.00',1,1,1,0,1),('RNT002','janesmith@example.com','2024-07-01','2024-07-15','SafeCo','800.00','3000.00','1500.00',1,'400','2024-07-05','18.00',0,1,1,1,0);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalclient`
--

DROP TABLE IF EXISTS `rentalclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentalclient` (
  `email` varchar(40) NOT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `streetAddress` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalclient`
--

LOCK TABLES `rentalclient` WRITE;
/*!40000 ALTER TABLE `rentalclient` DISABLE KEYS */;
INSERT INTO `rentalclient` VALUES ('janesmith@example.com','9876543210','Jane','Smith','456 Oak St','Los Angeles','CA','90001'),('johndoe@example.com','1234567890','John','Doe','123 Main St','New York','NY','10001');
/*!40000 ALTER TABLE `rentalclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalstaff`
--

DROP TABLE IF EXISTS `rentalstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentalstaff` (
  `employeeID` int NOT NULL,
  `rental` char(9) NOT NULL,
  PRIMARY KEY (`employeeID`,`rental`),
  KEY `rental` (`rental`),
  CONSTRAINT `rentalstaff_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `personnel` (`employeeID`),
  CONSTRAINT `rentalstaff_ibfk_2` FOREIGN KEY (`rental`) REFERENCES `rental` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalstaff`
--

LOCK TABLES `rentalstaff` WRITE;
/*!40000 ALTER TABLE `rentalstaff` DISABLE KEYS */;
INSERT INTO `rentalstaff` VALUES (220022123,'RNT001'),(220022124,'RNT002');
/*!40000 ALTER TABLE `rentalstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentedauxspace`
--

DROP TABLE IF EXISTS `rentedauxspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentedauxspace` (
  `rental` char(9) NOT NULL,
  `auxSpaceName` varchar(40) NOT NULL,
  PRIMARY KEY (`rental`,`auxSpaceName`),
  KEY `auxSpaceName` (`auxSpaceName`),
  CONSTRAINT `rentedauxspace_ibfk_1` FOREIGN KEY (`rental`) REFERENCES `rental` (`id`),
  CONSTRAINT `rentedauxspace_ibfk_2` FOREIGN KEY (`auxSpaceName`) REFERENCES `auxspace` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentedauxspace`
--

LOCK TABLES `rentedauxspace` WRITE;
/*!40000 ALTER TABLE `rentedauxspace` DISABLE KEYS */;
INSERT INTO `rentedauxspace` VALUES ('RNT001','Organ Room'),('RNT002','Support Room');
/*!40000 ALTER TABLE `rentedauxspace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentedvenues`
--

DROP TABLE IF EXISTS `rentedvenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentedvenues` (
  `rental` char(9) NOT NULL,
  `venueName` varchar(40) NOT NULL,
  PRIMARY KEY (`rental`,`venueName`),
  KEY `venueName` (`venueName`),
  CONSTRAINT `rentedvenues_ibfk_1` FOREIGN KEY (`rental`) REFERENCES `rental` (`id`),
  CONSTRAINT `rentedvenues_ibfk_2` FOREIGN KEY (`venueName`) REFERENCES `venue` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentedvenues`
--

LOCK TABLES `rentedvenues` WRITE;
/*!40000 ALTER TABLE `rentedvenues` DISABLE KEYS */;
INSERT INTO `rentedvenues` VALUES ('RNT001','PepsiCo Theatre'),('RNT002','Repertory Theatre');
/*!40000 ALTER TABLE `rentedvenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seatID` char(5) NOT NULL,
  `location` enum('Orchestra','Balcony','Grand Tier','Second Tier','House Left','House Right') DEFAULT NULL,
  `seatrows` char(1) DEFAULT NULL,
  `seatNumber` varchar(4) DEFAULT NULL,
  `orientation` enum('Left','Center','Right') DEFAULT NULL,
  `venue` varchar(40) NOT NULL,
  PRIMARY KEY (`seatID`),
  KEY `venue` (`venue`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`venue`) REFERENCES `venue` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES ('S001','Orchestra','A','1','Center','Repertory Theatre'),('S002','Balcony','B','3','Left','Recital Hall');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticketID` int NOT NULL,
  `event` char(9) DEFAULT NULL,
  `dateTimeAndYear` date DEFAULT NULL,
  `discount` decimal(4,2) DEFAULT NULL,
  `price` varchar(5) DEFAULT NULL,
  `priceLevel` enum('Regular','Child','Veteran','Senior','Alumni') DEFAULT NULL,
  `seat` char(5) DEFAULT NULL,
  `ord` char(20) DEFAULT NULL,
  PRIMARY KEY (`ticketID`),
  KEY `event` (`event`),
  KEY `seat` (`seat`),
  KEY `ord` (`ord`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`event`) REFERENCES `event` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seat`) REFERENCES `seat` (`seatID`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`ord`) REFERENCES `orderdetails` (`confirmationNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1001,'EVT001','2024-06-01',0.00,'50.00','Regular','S001','ORD001'),(1002,'EVT002','2024-07-05',5.00,'45.00','Senior','S002','ORD002');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `name` varchar(40) NOT NULL,
  `total_capacity` int DEFAULT NULL,
  `dimensions` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('Concert Hall',2000,'200ft x 100ft','A fully equipped, three-tiered concert hall, this 1,372-seat theatre is the grandest in The Purchase PAC.'),('PepsiCo Theatre',5000,'300ft x 150ft','This mid-sized 713-seat theatre has a large stage allowing for exceptional adaptability. Technical systems and seating were fully renovated and upgraded in 2017.'),('Recital Hall',5000,'300ft x 150ft','A more intimate 552-seat theatre notable for its exceptional acoustics, it is enhanced by white oak walls and a sprung floor.'),('Repertory Theatre',5000,'300ft x 150ft','The Repertory Theatre is a “black box” theatre. It provides designers with complete flexibility and has a maximum capacity of 500');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 20:59:21
