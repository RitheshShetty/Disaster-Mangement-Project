-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: dbfall2018rithesh.ca0renarcvbd.us-east-2.rds.amazonaws.com    Database: disaster_report_system
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `AdverseEffect`
--

DROP TABLE IF EXISTS `AdverseEffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdverseEffect` (
  `adverse_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `preventive` varchar(5) NOT NULL,
  PRIMARY KEY (`adverse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdverseEffect`
--

LOCK TABLES `AdverseEffect` WRITE;
/*!40000 ALTER TABLE `AdverseEffect` DISABLE KEYS */;
INSERT INTO `AdverseEffect` VALUES (1,'Power outage','Yes'),(2,'Water shortage','Yes'),(3,'Food scarcity','Yes'),(4,'Communication breakdown','Yes'),(5,'Road blockage','No'),(6,'Flood','No'),(7,'Fire','No'),(8,'Acid Rain','No'),(9,'Infrastructure damage','Yes'),(10,'Land slide','No'),(11,'Epidemic','No'),(12,'Radiation sickness','No'),(13,'Mud slide','No'),(14,'Nuclear Winter','No'),(15,'Heavy Rain','No'),(16,'High and Dusty winds','No'),(17,'Storm Surge','No'),(18,'Thunder Strikes','No'),(19,'Pyroclastic flow','No'),(20,'Agriculture Damage','No');
/*!40000 ALTER TABLE `AdverseEffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeathType`
--

DROP TABLE IF EXISTS `DeathType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeathType` (
  `death_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `cause_of_death` varchar(30) NOT NULL,
  PRIMARY KEY (`death_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeathType`
--

LOCK TABLES `DeathType` WRITE;
/*!40000 ALTER TABLE `DeathType` DISABLE KEYS */;
INSERT INTO `DeathType` VALUES (1,'Heart Attack'),(2,'Hyperthermia'),(3,'Hypothermia'),(4,'Radiation'),(5,'Chemical Poisoning'),(6,'Traumatic injury'),(7,'Blunt-force trauma'),(8,'Suffocation'),(9,'Smoke Inhalation'),(10,'Drowning'),(11,'Electrocution'),(12,'Burns'),(13,'Lightening'),(14,'Water flow');
/*!40000 ALTER TABLE `DeathType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisAdvEff`
--

DROP TABLE IF EXISTS `DisAdvEff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisAdvEff` (
  `disaster_id` int(11) NOT NULL,
  `adverse_id` int(11) NOT NULL,
  KEY `disaster_id` (`disaster_id`),
  KEY `adverse_id` (`adverse_id`),
  CONSTRAINT `DisAdvEff_ibfk_1` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`),
  CONSTRAINT `DisAdvEff_ibfk_2` FOREIGN KEY (`adverse_id`) REFERENCES `AdverseEffect` (`adverse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisAdvEff`
--

LOCK TABLES `DisAdvEff` WRITE;
/*!40000 ALTER TABLE `DisAdvEff` DISABLE KEYS */;
INSERT INTO `DisAdvEff` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,9),(1,15),(1,18),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,9),(2,15),(2,18),(2,20),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,9),(3,20),(4,1),(4,2),(4,3),(4,4),(4,7),(4,9),(4,12),(4,14),(4,20),(5,5),(5,7),(5,9),(5,16),(5,19),(5,20),(6,1),(6,2),(6,3),(6,4),(6,7),(6,9),(6,12),(6,14),(6,20),(7,5),(7,7),(7,9),(7,16),(7,19),(7,20),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,9),(8,20);
/*!40000 ALTER TABLE `DisAdvEff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisEmgSvr`
--

DROP TABLE IF EXISTS `DisEmgSvr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisEmgSvr` (
  `disaster_id` int(11) NOT NULL,
  `emg_svr_id` int(11) NOT NULL,
  `pre` tinyint(1) NOT NULL,
  `post` tinyint(1) NOT NULL,
  PRIMARY KEY (`disaster_id`,`emg_svr_id`),
  KEY `disaster_id` (`disaster_id`),
  KEY `emg_svr_id` (`emg_svr_id`),
  CONSTRAINT `DisEmgSvr_ibfk_1` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`),
  CONSTRAINT `DisEmgSvr_ibfk_2` FOREIGN KEY (`emg_svr_id`) REFERENCES `EmergencyService` (`emg_svr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisEmgSvr`
--

LOCK TABLES `DisEmgSvr` WRITE;
/*!40000 ALTER TABLE `DisEmgSvr` DISABLE KEYS */;
INSERT INTO `DisEmgSvr` VALUES (1,1,1,0),(1,2,0,1),(1,4,1,0),(1,7,0,1),(2,1,1,0),(2,2,0,1),(2,4,1,0),(2,7,0,1),(2,8,0,1),(3,2,0,1),(3,3,0,1),(3,7,0,1),(3,10,1,1),(4,3,0,1),(4,5,0,1),(4,6,1,1),(4,11,0,1),(5,3,0,1),(5,5,0,1),(5,6,0,1),(5,11,0,1),(6,3,0,1),(6,5,0,1),(6,6,1,1),(6,11,0,1),(7,2,0,1),(7,3,0,1),(7,6,0,1),(7,9,1,1),(7,11,0,1),(8,1,1,0),(8,2,0,1),(8,3,0,1),(8,4,0,1),(8,5,0,1),(8,6,0,1),(8,8,0,1),(8,10,0,1);
/*!40000 ALTER TABLE `DisEmgSvr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disaster`
--

DROP TABLE IF EXISTS `Disaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disaster` (
  `disaster_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `intensity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`disaster_id`),
  KEY `type_id` (`type_id`),
  KEY `Disaster` (`intensity_id`),
  CONSTRAINT `Disaster_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `DisasterType` (`type_id`),
  CONSTRAINT `Disaster_ibfk_2` FOREIGN KEY (`intensity_id`) REFERENCES `DisasterIntensity` (`intensity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disaster`
--

LOCK TABLES `Disaster` WRITE;
/*!40000 ALTER TABLE `Disaster` DISABLE KEYS */;
INSERT INTO `Disaster` VALUES (1,'Florence',1,'Charlotte','North Carolina','USA','2018-09-13','11:32:00','2018-09-15','09:20:06',1),(2,'Micheal',1,'Miami','Florida','USA','2018-10-08','05:08:47','2018-09-15','09:20:06',1),(3,'Titli',1,'Srikakulam','Andhra Pradesh','India','2018-10-13','15:00:03','2018-10-16','01:05:08',3),(4,'Nagasaki Nuclear explosion',5,'Nagasaki','Kyushu','Japan','1945-08-06','03:43:00','1945-08-09','08:04:09',31),(5,'Kanaga',4,'Kanaga','Alaska','USA','2012-02-18','12:14:56','2012-02-18','22:46:24',29),(6,'Hiroshima Nuclear explosion',5,'Hiroshima','Honshu','Japan','1945-08-06','02:59:00','1945-08-09','08:45:54',34),(7,'Denali earthquake',3,'Denali','Alaska','USA','2002-11-03','16:45:00','2002-11-03','05:00:43',19),(8,'Hud Hud',2,'Vizag','Andhra Pradesh','India','2014-10-10','09:07:00','2014-10-12','19:34:59',11);
/*!40000 ALTER TABLE `Disaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `DisasterAdverseEffects`
--

DROP TABLE IF EXISTS `DisasterAdverseEffects`;
/*!50001 DROP VIEW IF EXISTS `DisasterAdverseEffects`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DisasterAdverseEffects` AS SELECT 
 1 AS `Disaster`,
 1 AS `Type`,
 1 AS `Adverse Effects`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `DisasterDeathCount`
--

DROP TABLE IF EXISTS `DisasterDeathCount`;
/*!50001 DROP VIEW IF EXISTS `DisasterDeathCount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DisasterDeathCount` AS SELECT 
 1 AS `Disaster`,
 1 AS `Type`,
 1 AS `Death Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `DisasterFundingDetails`
--

DROP TABLE IF EXISTS `DisasterFundingDetails`;
/*!50001 DROP VIEW IF EXISTS `DisasterFundingDetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DisasterFundingDetails` AS SELECT 
 1 AS `Disaster Name`,
 1 AS `Funder`,
 1 AS `Amount(USD)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DisasterInjured`
--

DROP TABLE IF EXISTS `DisasterInjured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisasterInjured` (
  `ssn` int(10) NOT NULL,
  `injury_type_id` int(11) NOT NULL,
  `disaster_id` int(11) NOT NULL,
  PRIMARY KEY (`ssn`,`injury_type_id`,`disaster_id`),
  KEY `injury_type_id` (`injury_type_id`),
  KEY `disaster_id` (`disaster_id`),
  CONSTRAINT `DisasterInjured_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `Injured` (`ssn`),
  CONSTRAINT `DisasterInjured_ibfk_2` FOREIGN KEY (`injury_type_id`) REFERENCES `InjuredType` (`injury_type_id`),
  CONSTRAINT `DisasterInjured_ibfk_3` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisasterInjured`
--

LOCK TABLES `DisasterInjured` WRITE;
/*!40000 ALTER TABLE `DisasterInjured` DISABLE KEYS */;
INSERT INTO `DisasterInjured` VALUES (123,1,2),(515,1,8),(543,1,7),(652,1,1),(123,2,2),(154,2,1),(532,2,3),(123,3,2),(543,3,8),(652,3,1),(736,3,8),(325,4,5),(456,4,5),(485,4,6),(515,4,5),(154,5,1),(325,5,5),(736,5,1),(754,5,4),(863,5,1),(515,6,8),(543,6,7),(863,6,7),(974,6,7),(532,7,3),(543,7,7),(431,8,4),(485,8,6),(543,8,8),(736,8,8),(154,9,1),(532,10,3),(652,10,1),(754,10,4),(456,11,5),(515,11,5),(754,11,4),(431,12,4),(456,17,5),(485,17,6),(515,17,5),(543,18,7),(543,18,8),(652,18,1),(736,18,8),(863,18,7),(974,18,7),(863,19,7),(974,19,7),(515,21,8),(431,22,4),(123,24,2),(736,24,1),(863,24,1),(543,26,8),(736,26,8),(515,27,8),(974,28,4),(154,29,1),(652,30,1),(754,31,4);
/*!40000 ALTER TABLE `DisasterInjured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `DisasterInjuredCount`
--

DROP TABLE IF EXISTS `DisasterInjuredCount`;
/*!50001 DROP VIEW IF EXISTS `DisasterInjuredCount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `DisasterInjuredCount` AS SELECT 
 1 AS `Name`,
 1 AS `Type`,
 1 AS `Number of people who got Injured`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DisasterIntensity`
--

DROP TABLE IF EXISTS `DisasterIntensity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisasterIntensity` (
  `intensity_id` int(11) NOT NULL AUTO_INCREMENT,
  `intensity_range` varchar(100) NOT NULL,
  PRIMARY KEY (`intensity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisasterIntensity`
--

LOCK TABLES `DisasterIntensity` WRITE;
/*!40000 ALTER TABLE `DisasterIntensity` DISABLE KEYS */;
INSERT INTO `DisasterIntensity` VALUES (1,'Winds 119-153 km/hr (74-95 mph)'),(2,'Winds 154-177 km/hr (96-110 mph)'),(3,'Winds 178-208 km/hr (111-129 mph)'),(4,'Winds 209-251 km/hr (130-156 mph)'),(5,'Winds more than 252 km/hr (157 mph)'),(6,'Hm less than 0.5'),(7,'Hm=1m'),(8,'Hm=2m'),(9,'Hm=4 to 6m'),(10,'Hm=10 to 20m'),(11,'Hm=more than 30m'),(12,'1 point'),(13,'2 point'),(14,'3 point'),(15,'4 point'),(16,'5 point'),(17,'6 point'),(18,'7 point'),(19,'8 point'),(20,'9 point'),(21,'10 point'),(22,'11 point'),(23,'12 point'),(24,'Hydrothermal eruption'),(25,'Phreatic eruption'),(26,'Phreatomagmatic eruption '),(27,'Lava'),(28,'Strombolian and Hawaiian eruptions'),(29,'Vulcanian eruptions'),(30,'Subplinian and Plinian eruptions'),(31,'Blast—40–50% of total energy'),(32,'Thermal radiation—30–50% of total energy'),(33,'Ionizing radiation—5% of total energy'),(34,'Residual radiation—5–10% of total energy');
/*!40000 ALTER TABLE `DisasterIntensity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisasterType`
--

DROP TABLE IF EXISTS `DisasterType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisasterType` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `disaster_type` varchar(30) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `idx_disaster_type` (`disaster_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisasterType`
--

LOCK TABLES `DisasterType` WRITE;
/*!40000 ALTER TABLE `DisasterType` DISABLE KEYS */;
INSERT INTO `DisasterType` VALUES (3,'Earthquake'),(1,'Hurricane'),(5,'Nuclear Explosion'),(2,'Tsunami'),(4,'Volcano');
/*!40000 ALTER TABLE `DisasterType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmergencyService`
--

DROP TABLE IF EXISTS `EmergencyService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmergencyService` (
  `emg_svr_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `service_provider` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`emg_svr_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmergencyService`
--

LOCK TABLES `EmergencyService` WRITE;
/*!40000 ALTER TABLE `EmergencyService` DISABLE KEYS */;
INSERT INTO `EmergencyService` VALUES (1,'Local Alerts','Network Operator','Network Operator will send messages regarding the Disaster date, intensity, safety measures, evacuation routes and places'),(2,'Food Distribution','Government Authorities and Vol','Provide Food and water for those who are in evacuation places and also for who cound not make food due to disaster'),(3,'Medical Assistance','Healthcare System','Provide drugs,medications during and after Disaster'),(4,'Pre-disaster Evacuation','FEMA','Evacuate people who are in the vicinity of the Disaster'),(5,'Ambulance Service','Healthcare System','Facilitate amubalances to take injured people to the hospital'),(6,'Restoration Service','Government Authorities','Restore the Services like Transport system, clearing Road blockages and Power transmission'),(7,'Post-disaster Evacuation','FEMA','Evacuate the people who were severly affected by the Disaster'),(8,'Provide Temporary Shelter','FEMA','Provide Temporary residence to the people who have been evacuated(Pre-disaster)'),(9,'Search Service','Police','Asssist in searching the victims location'),(10,'Rescue','Police','Save the victims who are in danger'),(11,'Firefighting','Fire authorities','Prevent the spread of fire');
/*!40000 ALTER TABLE `EmergencyService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `EmergencyServiceDetails`
--

DROP TABLE IF EXISTS `EmergencyServiceDetails`;
/*!50001 DROP VIEW IF EXISTS `EmergencyServiceDetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `EmergencyServiceDetails` AS SELECT 
 1 AS `Disaster Name`,
 1 AS `Service Name`,
 1 AS `Service Provider`,
 1 AS `Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Fatality`
--

DROP TABLE IF EXISTS `Fatality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fatality` (
  `ssn` int(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address_line_1` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` varchar(30) NOT NULL,
  `emergency_contact` varchar(15) NOT NULL,
  `date_of_death` date NOT NULL,
  `death_type_id` int(11) NOT NULL,
  `disaster_id` int(11) NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `death_type_id` (`death_type_id`),
  KEY `disaster_id` (`disaster_id`),
  CONSTRAINT `Fatality_ibfk_1` FOREIGN KEY (`death_type_id`) REFERENCES `DeathType` (`death_type_id`),
  CONSTRAINT `Fatality_ibfk_2` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fatality`
--

LOCK TABLES `Fatality` WRITE;
/*!40000 ALTER TABLE `Fatality` DISABLE KEYS */;
INSERT INTO `Fatality` VALUES (857,'Ebony','Mow',NULL,'Titan',NULL,'Sweden','3882946737','2018-11-08',13,2),(867,'Bucky','Barnes','Shastrinagar','SanFrancisco','42198','Australia','3792373293','2012-02-19',12,5),(877,'Natasha ','Romanoff',NULL,'Czecpragueh',NULL,'czech','8377637183','2018-10-14',14,3),(887,'James','Rhodes',NULL,'Dortmund','','Germany','3772398836','2014-10-11',10,8),(897,'Stephen','Hawking','786 Galaxy view','SanJose',NULL,'Spain','3779361936','1945-08-07',11,6),(907,'Heath','ledger',NULL,'Gandgapur',NULL,'India','9822280849','2012-02-20',9,5),(917,'Bruce','Wayne','12 City BLVD','Charlotte','28262','NewZealand','3719361936','2012-02-25',8,5),(927,'Sherloc','Holmes',NULL,'Londion',NULL,'USA','128372984','2002-11-03',6,7),(937,'Harley','Queen','Baxter street','',NULL,'Russia','278192136','1945-09-07',5,4),(947,'Steve','Rogers',NULL,'',NULL,'USA','3719837651','2018-10-25',3,3),(957,'dora','milage',NULL,'wakanda',NULL,'Africa','3791379164','2018-11-09',1,2),(967,'Mbaku','Jabbari','765 tryon steert','Wakana',NULL,'Africa','7264109735','2002-11-04',7,7),(977,'Peter','Parker','123 wilson ave','Boston','2826','USA','1238631233','1945-10-08',4,4),(987,'Chris ','Hemsworth',NULL,'Assguard',NULL,'USA','9879234123','2018-10-10',2,1);
/*!40000 ALTER TABLE `Fatality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FunderDetail`
--

DROP TABLE IF EXISTS `FunderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FunderDetail` (
  `funder_id` int(11) NOT NULL,
  `funder_org_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`funder_id`),
  KEY `idx_funder_org_name` (`funder_org_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FunderDetail`
--

LOCK TABLES `FunderDetail` WRITE;
/*!40000 ALTER TABLE `FunderDetail` DISABLE KEYS */;
INSERT INTO `FunderDetail` VALUES (5,'Donations'),(1,'Federal Funding'),(3,'International Funding'),(4,'NGO Funding'),(2,'State Funding');
/*!40000 ALTER TABLE `FunderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funding`
--

DROP TABLE IF EXISTS `Funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Funding` (
  `disaster_id` int(5) NOT NULL,
  `funder_id` int(5) NOT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`disaster_id`,`funder_id`),
  KEY `funder_id` (`funder_id`),
  CONSTRAINT `Funding_ibfk_1` FOREIGN KEY (`funder_id`) REFERENCES `FunderDetail` (`funder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funding`
--

LOCK TABLES `Funding` WRITE;
/*!40000 ALTER TABLE `Funding` DISABLE KEYS */;
INSERT INTO `Funding` VALUES (1,1,2132000),(1,2,4625000),(1,3,1583586),(2,1,2313455),(2,2,3000000),(2,3,934600),(3,1,800000),(3,2,3146134),(3,3,765000),(4,2,5000000),(4,5,324865),(5,1,3000000),(5,4,534160),(6,3,445600),(6,4,0),(7,2,400000),(7,3,53426),(8,1,450000),(8,2,50000),(8,4,0);
/*!40000 ALTER TABLE `Funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthCareManagementService`
--

DROP TABLE IF EXISTS `HealthCareManagementService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HealthCareManagementService` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_service` varchar(50) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `idx_type_of_service` (`type_of_service`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthCareManagementService`
--

LOCK TABLES `HealthCareManagementService` WRITE;
/*!40000 ALTER TABLE `HealthCareManagementService` DISABLE KEYS */;
INSERT INTO `HealthCareManagementService` VALUES (1,'Cardio Service'),(3,'Diabetic Service'),(11,'Eyes, Ear, Nose and Throat Service'),(2,'Orthopedic Service'),(10,'Pharma Service'),(4,'Qurantine Service'),(5,'Radiation Service'),(9,'Scanning, Imaging and Radiology'),(6,'Surgical Service'),(7,'Trauma Service'),(8,'Women Service');
/*!40000 ALTER TABLE `HealthCareManagementService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthCareMngmtSvcDis`
--

DROP TABLE IF EXISTS `HealthCareMngmtSvcDis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HealthCareMngmtSvcDis` (
  `disaster_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `num_served` int(11) NOT NULL,
  PRIMARY KEY (`disaster_id`,`service_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `HealthCareMngmtSvcDis_ibfk_1` FOREIGN KEY (`disaster_id`) REFERENCES `Disaster` (`disaster_id`),
  CONSTRAINT `HealthCareMngmtSvcDis_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `HealthCareManagementService` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthCareMngmtSvcDis`
--

LOCK TABLES `HealthCareMngmtSvcDis` WRITE;
/*!40000 ALTER TABLE `HealthCareMngmtSvcDis` DISABLE KEYS */;
INSERT INTO `HealthCareMngmtSvcDis` VALUES (1,2,551),(1,3,1001),(1,6,1500),(1,8,303),(1,9,2500),(1,10,5001),(2,2,250),(2,3,555),(2,6,12),(2,8,34),(2,9,1001),(2,10,50),(3,1,123),(3,2,3432),(3,3,678),(3,6,565),(3,8,23),(3,10,12),(3,11,89),(4,1,763),(4,2,999),(4,4,12),(4,5,90),(4,7,1200),(4,8,34),(4,9,891),(4,10,1001),(4,11,59),(5,4,34),(5,5,895),(5,7,345),(5,8,675),(5,10,761),(5,11,36),(6,1,99),(6,2,123),(6,4,2),(6,5,456),(6,7,909),(6,8,34),(6,9,7891),(6,10,1002),(6,11,145),(7,1,890),(7,2,34),(7,6,1002),(7,8,67),(7,9,897),(7,10,6),(8,1,567),(8,2,112),(8,3,78),(8,6,899),(8,8,87),(8,10,1111),(8,11,124);
/*!40000 ALTER TABLE `HealthCareMngmtSvcDis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `HealthCareServicesForDisaster`
--

DROP TABLE IF EXISTS `HealthCareServicesForDisaster`;
/*!50001 DROP VIEW IF EXISTS `HealthCareServicesForDisaster`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HealthCareServicesForDisaster` AS SELECT 
 1 AS `Name`,
 1 AS `Type`,
 1 AS `Type of Service`,
 1 AS `Number of people who recieved treatment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Injured`
--

DROP TABLE IF EXISTS `Injured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Injured` (
  `ssn` int(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address_line_1` varchar(30) DEFAULT NULL,
  `address_line_2` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` varchar(30) NOT NULL,
  `emergency_contact` varchar(15) NOT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Injured`
--

LOCK TABLES `Injured` WRITE;
/*!40000 ALTER TABLE `Injured` DISABLE KEYS */;
INSERT INTO `Injured` VALUES (123,'Steven','Robert','123 Mallard creek dr','apt f','charlotte','28221','USA','2025550111'),(154,'Steve','Waugh','4781 Lake view','apt c','san francisxo','28263','USA','2025550139'),(325,'David ','Smith','12 black drive',NULL,'charlotte','28262','USA','2025550165'),(431,'Amesh','Sharma','Dalal street',NULL,'Delhi','411038','INDIA','2025550128'),(456,'Faf ','Miller','Abbywood lane','apt 4','chicago','23837','USA','2025550140'),(485,'Mitchael','Johnson','1233 concord','apt 3','matthews','23873','USA','2025550166'),(515,'Mark','Tylor','Allen jay Drive',NULL,'San Antonio','23732','Berlin','6469266614'),(532,'Cameron ','White','Charter place',NULL,'Melborne','12376','Australia','7192662837'),(543,'Marcus ','Waugh','Bacliff Drive','apt g','dallas','23874','USA','6054756968'),(652,'Mark','Wood','Heron Glenn Drive','apt b','San Jose','23476','USA','8884475594'),(736,'Alex','Stevart','1723 Chelsea','apt 7','Manchester','12376','United Kingdom','2065695829'),(754,'Dean ','Jhones','cardiff ave','apt d','dallas','12376','USA','6302967536'),(863,'Joe','Strass','Casino drive','apt r','Las Vegas','23767','USA','1373899271'),(974,'Mitchell','Stark','fullston evw','apt h','perth','12367','Australia','1283899126');
/*!40000 ALTER TABLE `Injured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InjuredType`
--

DROP TABLE IF EXISTS `InjuredType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InjuredType` (
  `injury_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_injury` varchar(30) NOT NULL,
  PRIMARY KEY (`injury_type_id`),
  KEY `idx_type_of_injury` (`type_of_injury`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InjuredType`
--

LOCK TABLES `InjuredType` WRITE;
/*!40000 ALTER TABLE `InjuredType` DISABLE KEYS */;
INSERT INTO `InjuredType` VALUES (6,'Accidents'),(23,'Assault'),(31,'Asthama'),(29,'Blood Pressure rise'),(30,'Blood sugar drop'),(17,'Bruise'),(22,'Burn'),(19,'Concussion'),(25,'Conjuctivitis'),(3,'cuts'),(28,'Depression'),(24,'Fever'),(18,'Fracture'),(7,'Head injuries'),(11,'Heat Edema'),(4,'Hyperthermia'),(2,'Hypothermia'),(10,'Infections'),(27,'Infulenza'),(20,'Insect Bite'),(9,'Neural'),(1,'Orthopedic'),(26,'Pain'),(12,'Rashes'),(21,'Snake Bite'),(8,'Trauma'),(5,'wounds');
/*!40000 ALTER TABLE `InjuredType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  `privilege` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `idx_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Database Administrator','Write'),(2,'Emergency Service Provider','Write'),(3,'Adverse Effect Reporter','Write'),(4,'Reporter','Read'),(5,'Medical Analyst','Write'),(6,'Disaster Casualty Reporter','Write'),(7,'Funding Analyst','Write');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_name`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('David','Dav_24',4),('George','Lope@06',2),('John','@kika',3),('Kiran','Kit@4',5),('Mary','Chat$45',2),('Patel','qwer!',4),('Prakash','Aks&*',4),('Ram','PassRam12@',7),('ratan','anmol@23',6),('Samules','Sam_34',3),('Satish','Sam$23',4),('Steven','Math+0',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `UserRole`
--

DROP TABLE IF EXISTS `UserRole`;
/*!50001 DROP VIEW IF EXISTS `UserRole`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `UserRole` AS SELECT 
 1 AS `User Name`,
 1 AS `Role Name`,
 1 AS `privilege`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `DisasterAdverseEffects`
--

/*!50001 DROP VIEW IF EXISTS `DisasterAdverseEffects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DisasterAdverseEffects` AS select `d`.`name` AS `Disaster`,`dt`.`disaster_type` AS `Type`,group_concat(`ae`.`name` separator ',') AS `Adverse Effects` from (((`Disaster` `d` join `DisasterType` `dt` on((`d`.`type_id` = `dt`.`type_id`))) join `DisAdvEff` `dae` on((`d`.`disaster_id` = `dae`.`disaster_id`))) join `AdverseEffect` `ae` on((`dae`.`adverse_id` = `ae`.`adverse_id`))) group by `dae`.`disaster_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DisasterDeathCount`
--

/*!50001 DROP VIEW IF EXISTS `DisasterDeathCount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DisasterDeathCount` AS select `d`.`name` AS `Disaster`,`dt`.`disaster_type` AS `Type`,count(`f`.`ssn`) AS `Death Count` from ((`Disaster` `d` join `DisasterType` `dt` on((`d`.`type_id` = `dt`.`type_id`))) join `Fatality` `f` on((`d`.`disaster_id` = `f`.`disaster_id`))) group by `f`.`disaster_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DisasterFundingDetails`
--

/*!50001 DROP VIEW IF EXISTS `DisasterFundingDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DisasterFundingDetails` AS select `D`.`name` AS `Disaster Name`,`FDD`.`funder_org_name` AS `Funder`,`FDD`.`amount` AS `Amount(USD)` from (`disaster_report_system`.`Disaster` `D` left join (select `F`.`disaster_id` AS `disaster_id`,`F`.`amount` AS `amount`,`FD`.`funder_org_name` AS `funder_org_name` from (`disaster_report_system`.`Funding` `F` join `disaster_report_system`.`FunderDetail` `FD` on((`FD`.`funder_id` = `F`.`funder_id`)))) `FDD` on((`D`.`disaster_id` = `FDD`.`disaster_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DisasterInjuredCount`
--

/*!50001 DROP VIEW IF EXISTS `DisasterInjuredCount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DisasterInjuredCount` AS select distinct `d`.`name` AS `Name`,`dt`.`disaster_type` AS `Type`,count(distinct `di`.`ssn`) AS `Number of people who got Injured` from ((`DisasterInjured` `di` join `Disaster` `d` on((`di`.`disaster_id` = `d`.`disaster_id`))) join `DisasterType` `dt` on((`d`.`type_id` = `dt`.`type_id`))) group by `di`.`disaster_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `EmergencyServiceDetails`
--

/*!50001 DROP VIEW IF EXISTS `EmergencyServiceDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `EmergencyServiceDetails` AS select `J1`.`name` AS `Disaster Name`,`ES`.`name` AS `Service Name`,`ES`.`service_provider` AS `Service Provider`,`J1`.`Type` AS `Type` from (`disaster_report_system`.`EmergencyService` `ES` join (select `D`.`disaster_id` AS `disaster_id`,`D`.`name` AS `name`,`DES`.`emg_svr_id` AS `emg_svr_id`,if((`DES`.`pre` = 1),'Pre-Disaster','Post-Disaster') AS `Type` from (`disaster_report_system`.`DisEmgSvr` `DES` join `disaster_report_system`.`Disaster` `D` on((`DES`.`disaster_id` = `D`.`disaster_id`)))) `J1` on((`ES`.`emg_svr_id` = `J1`.`emg_svr_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HealthCareServicesForDisaster`
--

/*!50001 DROP VIEW IF EXISTS `HealthCareServicesForDisaster`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `HealthCareServicesForDisaster` AS select `d`.`name` AS `Name`,`dt`.`disaster_type` AS `Type`,group_concat(`h2`.`type_of_service` separator ',') AS `Type of Service`,sum(`h1`.`num_served`) AS `Number of people who recieved treatment` from (((`HealthCareMngmtSvcDis` `h1` join `Disaster` `d` on((`h1`.`disaster_id` = `d`.`disaster_id`))) join `DisasterType` `dt` on((`d`.`type_id` = `dt`.`type_id`))) join `HealthCareManagementService` `h2` on((`h1`.`service_id` = `h2`.`service_id`))) group by `d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `UserRole`
--

/*!50001 DROP VIEW IF EXISTS `UserRole`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`RITHESHDB`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `UserRole` AS select `User`.`user_name` AS `User Name`,`Role`.`role_name` AS `Role Name`,`Role`.`privilege` AS `privilege` from (`User` join `Role` on((`User`.`role_id` = `Role`.`role_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 20:59:45
