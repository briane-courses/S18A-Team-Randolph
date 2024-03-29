CREATE DATABASE  IF NOT EXISTS `requestdocdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `requestdocdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: requestdocdb
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `degreesofuser`
--

DROP TABLE IF EXISTS `degreesofuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreesofuser` (
  `degreeID` int(11) NOT NULL AUTO_INCREMENT,
  `degreeName` varchar(45) NOT NULL,
  `level` varchar(45) NOT NULL,
  `yearAdmitted` int(4) NOT NULL,
  `campusAttended` varchar(45) NOT NULL,
  `admittedAs` varchar(45) NOT NULL,
  `graduated` varchar(45) NOT NULL,
  `yearLevel` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `lastSchoolAttendedPrevDlsu` varchar(45) NOT NULL,
  `graduatedYear` int(11) DEFAULT NULL,
  `graduatedMonth` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `academicYear` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`degreeID`,`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreesofuser`
--

LOCK TABLES `degreesofuser` WRITE;
/*!40000 ALTER TABLE `degreesofuser` DISABLE KEYS */;
INSERT INTO `degreesofuser` VALUES (1,'Bachelors','Masters',2013,'DLSU-Manila','Undergraduate','No',3,2,'Philippine Cultural College',2011,2,3,'2014-2015'),(2,'BS-IT','Bachelor',2013,'DLSU-Manila','New Student','No',4,3,'Philippine Cultural College',2011,5,3,'2014-2015'),(3,'AB-COM','Bachelor',2013,'DLSU-Manila','Cross Enrollee','No',3,1,'Muntinlupa Science High School',2010,1,3,'2014-2015'),(4,'BS-CS-ST','Bachelor',2014,'DLSU-Manila','New Student','No',3,7,'DLSZ',2014,3,3,'2014-2015'),(5,'MBA','Doctorate',2018,'DLSU-Manila','New Student','Yes',NULL,7,'DLSZ',2010,3,NULL,NULL);
/*!40000 ALTER TABLE `degreesofuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryrates`
--

DROP TABLE IF EXISTS `deliveryrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryrates` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `delay` int(11) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryrates`
--

LOCK TABLES `deliveryrates` WRITE;
/*!40000 ALTER TABLE `deliveryrates` DISABLE KEYS */;
INSERT INTO `deliveryrates` VALUES (1,1200,2,'Brunei'),(2,1650,2,'Canada'),(3,1400,3,'China'),(4,2350,4,'Europe'),(5,2544,4,'Fiji Island\n'),(6,2500,3,'Guam'),(7,950,2,'Hongkong/Singapore'),(8,1200,2,'Indonesia/ Malaysia/ Taiwan/ Thailand'),(9,1200,2,'Japan'),(10,128,1,'Luzon'),(11,128,1,'Metro Manila'),(12,2500,2,'Mexico City\n'),(13,2400,3,'Middle East'),(14,158,1,'Mindanao'),(15,1400,2,'New Zealand'),(16,2600,3,'Papua New Guinea'),(17,0,1,'Pickup - DLSU Manila'),(18,3178,3,'South America'),(19,1200,2,'South Korea'),(20,1650,2,'USA'),(21,1400,1,'Vietnam'),(22,142,1,'Visayas'),(23,2544,4,'Africa'),(24,1400,2,'Australia');
/*!40000 ALTER TABLE `deliveryrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `docuID` int(11) NOT NULL AUTO_INCREMENT,
  `docuName` varchar(500) NOT NULL,
  `regularPrice` float NOT NULL,
  `expressPrice` float DEFAULT NULL,
  `category` varchar(45) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`docuID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'Official Transcript of Records for Employment (Batch 1980)',150,NULL,'Transcript of Records','both',' *for Students with ID no. 80XXXX (those who entered DLSU-M in 1980) and below'),(2,'Official Transcript of Records for Employment',150,300,'Transcript of Records','both',NULL),(3,'Official Transcript of Records for Evaluation',150,300,'Transcript of Records','both',NULL),(4,'Ranking in Degree Program',110,200,'Certification','undergrad',NULL),(5,'Ranking by College',110,220,'Certification','undergrad',NULL),(6,'Dean\'s List',110,220,'Certification','undergrad',NULL),(7,'Completion for Academic Units',110,NULL,'Certification','grad',NULL),(8,'Trimestral Calendar',110,220,'Certification','both',NULL),(9,'Cumulative GPA',110,220,'Certification','both',NULL),(10,'Enrollment',110,220,'Certification','both',NULL),(11,'Grading System',110,220,'Certification','both',NULL),(12,'Graduation / With Honors',110,220,'Certification','both',NULL),(13,'Medium of Instruction (English)',110,220,'Certification','both',NULL),(14,'Tuition and Miscellaneous Fees Breakdown (Current Term)',40,NULL,'Certification','both',NULL),(15,'Tuition and Miscellaneous Fees Breakdown (starting SY2000-01)',110,220,'Certification','both',NULL),(16,'Units Earned',110,220,'Certification','both',NULL),(17,'Course (Subject) Description',110,NULL,'Certification','both',' - Max of 5 courses per certification) *IMPORTANT*: Indicate the title of the course in the *Other Instructions*'),(18,'Official Transcript of Records (Previous to DLSU)',50,NULL,'Certified True Copy','both',NULL),(19,'Form 137 (High School Transcript)',50,NULL,'Certified True Copy','both',NULL),(20,'Form 138 (High School Card)',50,NULL,'Certified True Copy','both',NULL),(21,'Espiritu, Paolo Montesa',200,NULL,'Certified True Copy','both','(CTC TOR-2 and Cert of Grad-2)'),(22,'Special Credentials',0,NULL,'Others','both',NULL),(23,'Special Handling (WES)',150,300,'Others','both',NULL);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailingaddress`
--

DROP TABLE IF EXISTS `mailingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailingaddress` (
  `mailingID` int(11) NOT NULL AUTO_INCREMENT,
  `zipcode` int(11) NOT NULL,
  `streetName` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `locationID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `addressline` varchar(200) DEFAULT NULL,
  `contactperson` varchar(45) NOT NULL,
  `contactnumber` varchar(45) NOT NULL,
  PRIMARY KEY (`mailingID`,`locationID`,`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailingaddress`
--

LOCK TABLES `mailingaddress` WRITE;
/*!40000 ALTER TABLE `mailingaddress` DISABLE KEYS */;
INSERT INTO `mailingaddress` VALUES (1,1116,'Bagbag','Quezon City','Philippines',1,3,NULL,'Juan','09234578691'),(2,1118,'Fairview','Quezon City','Philippines',1,4,NULL,'Juan','09238947563'),(3,100000,'DongCheng','Beijing','China',2,5,NULL,'Juan','09345679284'),(4,1116,'Bagbag','Quezon City','Philippines',1,3,NULL,'Juan','09327568329'),(5,102200,'Changping','Beijing','China',2,2,NULL,'Juan','09332875682');
/*!40000 ALTER TABLE `mailingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `docuID` int(11) NOT NULL,
  `transactionID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `docuID` (`docuID`),
  KEY `transactionID` (`transactionID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`docuID`) REFERENCES `document` (`docuID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`transactionID`) REFERENCES `transactions` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `docuID` int(11) NOT NULL,
  `transactionID` int(11) NOT NULL,
  `deliveryRate` varchar(45) DEFAULT NULL,
  `packaging` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderID`,`docuID`,`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `mailingID` int(11) NOT NULL,
  `deliveryProcessing` varchar(45) NOT NULL,
  `dateRequested` datetime(1) NOT NULL,
  `dateDue` datetime(1) NOT NULL,
  `estimatedDeliveryDate` datetime(1) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'pending',
  `transactionDate` datetime NOT NULL,
  PRIMARY KEY (`transactionID`,`userID`,`mailingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `idNumber` int(11) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(45) NOT NULL,
  `gender` char(1) NOT NULL,
  `birthYear` int(4) NOT NULL,
  `birthMonth` int(2) NOT NULL,
  `birthDay` int(2) NOT NULL,
  `citizenship` varchar(45) NOT NULL,
  `placeOfBirth` varchar(45) NOT NULL,
  `currentAddress` varchar(500) NOT NULL,
  `phoneNo` varchar(45) NOT NULL,
  `alternatePhoneNo` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `alternateEmail` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `verified` varchar(45) DEFAULT 'not verified',
  `registeredDate` datetime NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,11310162,'Buluran','Aaron Benedict','Maravillas','M',1996,12,25,'Filipino','Caloocan','9th Ave Caloocan City','9332539467',NULL,'buluran_aaron@dlsu.edu.ph',NULL,'bamboozle','not verified','0000-00-00 00:00:00'),(2,11318724,'Sun','Jan Christian','Dante','M',1996,9,12,'Filipino','Manila','Fairview Quezon City','9328720808',NULL,'jan_sun@dlsu.edu.ph',NULL,'ball123','not verified','0000-00-00 00:00:00'),(3,11342498,'Lim','Eugene','Go','M',1996,5,1,'Filipino','Manila','Quirino Hi-way Novaliches Quezon City','9228833857',NULL,'eugene_lim96@yahoo.com',NULL,'test123','not verified','0000-00-00 00:00:00'),(4,11423123,'Marcelo','Micaella','Reyes','F',1997,1,2,'Filipino','Manila','Banawe Quezon City','9178576765',NULL,'marcelo_micaella@dlsu.edu.ph',NULL,'mica123','not verified','0000-00-00 00:00:00'),(5,11425598,'Brosas','Hazel Anne','Legaspi','F',1998,11,8,'Filipino','Laguna','BF Homes Milan San Pedro Laguna','9420992385',NULL,'hazel_brosas@dlsu.edu.ph',NULL,'12345','not verified','0000-00-00 00:00:00'),(6,11428236,'Malonzo','Juan Lorenzo','Peñaranda','M',1997,10,27,'Filipino','Manila','55 Milflores st. Twinville subd. Concepcion Marikina City','9052770864',NULL,'malonzo_juan@dlsu.edu.ph',NULL,'juan123','not verified','0000-00-00 00:00:00'),(7,11428376,'Yu','Randolph Nathaniel','Malveda','M',1996,11,28,'Filipino','Manila','162 Sarangani St. AAVA','9178955038',NULL,'randolph_yu@dlsu.edu.ph',NULL,'randolphyu','not verified','0000-00-00 00:00:00'),(21,NULL,'lopez','jed','garcia','M',1993,9,10,'Filipino','quezon','springville','09235678890','','jed_lopez@gmail.com','','hello123','not verified','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-14  0:40:55
