DROP SCHEMA IF EXISTS `libertaliadb`;
CREATE SCHEMA `libertaliadb`;
USE `libertaliadb`;

CREATE DATABASE  IF NOT EXISTS `libertaliadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libertaliadb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: libertaliadb
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `JEmail` varchar(50) NOT NULL,
  `Post_Date` datetime NOT NULL,
  `Commenter` varchar(50) NOT NULL,
  `Comment_Date` datetime NOT NULL,
  `Comment_Text` varchar(1000) NOT NULL,
  PRIMARY KEY (`JEmail`,`Post_Date`,`Commenter`,`Comment_Date`),
  KEY `Post Date_idx` (`Post_Date`),
  KEY `Commenter_fk_idx` (`Commenter`),
  CONSTRAINT `Commenter_fk` FOREIGN KEY (`Commenter`) REFERENCES `engager` (`Email`),
  CONSTRAINT `JEmail_fk9` FOREIGN KEY (`JEmail`) REFERENCES `post` (`JEmail`),
  CONSTRAINT `PostDate_fk` FOREIGN KEY (`Post_Date`) REFERENCES `post` (`PostDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('chrisraga@yahoo.gr','2024-12-30 19:30:33','mixblack@gmail.com','2024-12-30 20:10:00','Ante re Paokara'),('chrisraga@yahoo.gr','2024-12-30 19:30:33','samagiamarina@gmail.com','2024-12-30 21:04:07','Ante re Paokara'),('helenb12@gmail.com','2025-01-23 12:45:45','panoslek@gmail.com','2025-01-23 14:32:46','This state is not so professional!'),('kamsmith76@gmail.com ','2025-03-03 00:15:45','marric@gmail.com','2025-03-03 08:13:20','What a cruel\nimage!'),('yousraegypt@gmail.com ','2025-04-03 13:12:24','fatimaaaaa@gmail.com ','2025-04-04 07:02:04','That’s so sad'),('yousraegypt@gmail.com ','2025-04-03 13:12:24','yoloo2004@gmail.com ','2025-04-05 19:43:12','We have to\nprotect mother\nnature');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `comment_BEFORE_INSERT` BEFORE INSERT ON `comment` FOR EACH ROW BEGIN
    IF (NEW.`Comment_Date` <= NEW.`Post_Date`) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Comment Date must be greater than Post Date';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `comments_per_post`
--

DROP TABLE IF EXISTS `comments_per_post`;
/*!50001 DROP VIEW IF EXISTS `comments_per_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comments_per_post` AS SELECT 
 1 AS `JEmail`,
 1 AS `Post_Date`,
 1 AS `ΝumComments`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `common_fields`
--

DROP TABLE IF EXISTS `common_fields`;
/*!50001 DROP VIEW IF EXISTS `common_fields`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `common_fields` AS SELECT 
 1 AS `JEmail`,
 1 AS `EngEmail`,
 1 AS `Field`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dislikes_per_post`
--

DROP TABLE IF EXISTS `dislikes_per_post`;
/*!50001 DROP VIEW IF EXISTS `dislikes_per_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dislikes_per_post` AS SELECT 
 1 AS `JEmail`,
 1 AS `Post_Date`,
 1 AS `NumLikes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `JEmail` varchar(50) NOT NULL,
  `Donator` varchar(50) NOT NULL,
  `Donation_Date` datetime NOT NULL,
  `Amount` float NOT NULL,
  PRIMARY KEY (`JEmail`,`Donator`,`Donation_Date`),
  KEY `Donator_idx` (`Donator`),
  CONSTRAINT `Donator` FOREIGN KEY (`Donator`) REFERENCES `engager` (`Email`),
  CONSTRAINT `JEmail_fk` FOREIGN KEY (`JEmail`) REFERENCES `journalist` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES ('chrisraga@yahoo.gr','samagiamarina@gmail.com','2025-03-11 07:22:20',10),('demyild1988@gmail.com','fatimaaaaa@gmail.com','2027-01-13 00:12:34',9),('demyild1988@gmail.com','marric@gmail.com','2026-03-03 21:43:04',9),('helenb12@gmail.com','panoslek@gmail.com','2025-04-23 16:02:02',5),('helenb12@gmail.com','panoslek@gmail.com','2025-05-01 01:40:17',2),('kamsmith76@gmail.com','marric@gmail.com','2027-12-30 06:28:54',20);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `INCOPATIBLE_DATES_donation_date_restrict_bi` BEFORE INSERT ON `donation` FOR EACH ROW BEGIN
    -- Ensure Donation_Date is not earlier than the Journalist's Registration_Date
    IF (NEW.Donation_Date < (SELECT `Registration_Date` 
                             FROM `libertaliadb`.`journalist` 
                             WHERE `Email` = NEW.JEmail)) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Donation date cannot be earlier than the registration date of the journalist';
    END IF;

    -- Ensure Donation_Date is not earlier than the Engager's Registration_Date
    IF (NEW.Donation_Date < (SELECT `Registration_Date` 
                             FROM `libertaliadb`.`engager` 
                             WHERE `Email` = NEW.Donator)) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Donation date cannot be earlier than the registration dateof the engager';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `amount_restrict_bi` BEFORE INSERT ON `donation` FOR EACH ROW BEGIN
	IF (NEW.Amount < 0) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Amount should be greater than 0';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `engager`
--

DROP TABLE IF EXISTS `engager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engager` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `Nationality` enum('Afghan','Albanian','Algerian','American','Andorran','Angolan','Antiguans','Argentine','Armenian','Australian','Austrian','Azerbaijani','Bahaman','Bahraini','Bangladeshi','Barbadian','Belarusian','Belgian','Belizean','Beninese','Bhutanese','Bolivian','Bosnian','Botswanan','Brazilian','Bruneian','Bulgarian','Burkinabe','Burundian','Cambodian','Cameroonian','Canadian','Cape Verdean','Central African','Chadian','Chilean','Chinese','Colombian','Comoran','Congolese','Costa Rican','Croatian','Cuban','Cypriot','Czech','Danish','Djiboutian','Dominican','Dutch','Ecuadorian','Egyptian','Emirati','English','Equatorial Guinean','Eritrean','Estonian','Eswatini','Ethiopian','Fijian','Filipino','Finnish','French','Gabonese','Gambian','Georgian','German','Ghanaian','Greek','Grenadian','Guatemalan','Guinean','Guinean-Bissauan','Guyanese','Haitian','Honduran','Hungarian','Icelandic','Indian','Indonesian','Iranian','Iraqi','Irish','Israeli','Italian','Ivorian','Jamaican','Japanese','Jordanian','Kazakh','Kenyan','Kittian and Nevisian','Kuwaiti','Kyrgyz','Laotian','Latvian','Lebanese','Liberian','Libyan','Liechtensteiner','Lithuanian','Luxembourgish','Malagasy','Malawi','Malaysian','Maldivian','Malian','Malta','Marshallese','Mauritanian','Mauritian','Mexican','Micronesian','Moldovan','Monacan','Mongolian','Moroccan','Mozambican','Myanmarese','Namibian','Nepalese','New Zealander','Nicaraguan','Nigerien','Nigerian','North Korean','Norwegian','Omani','Pakistani','Palauan','Palestinian','Panamanian','Papua New Guinean','Paraguayan','Peruvian','Philippine','Polish','Portuguese','Qatari','Romanian','Russian','Rwandan','Saint Lucian','Salvadoran','Samoan','San Marinese','Sao Tomean','Saudi','Scottish','Senegalese','Serbian','Seychellois','Sierra Leonean','Singaporean','Slovak','Slovenian','Solomon Islander','Somali','South African','South Korean','South Sudanese','Spanish','Sri Lankan','Sudanese','Surinamer','Swazi','Swedish','Swiss','Syrian','Taiwanese','Tajik','Tanzanian','Thai','Togolese','Tongan','Trinidadian','Tunisian','Turkish','Turkmen','Ugandan','Ukrainian','Uruguayan','Uzbek','Vanuatu','Vatican','Venezuelan','Vietnamese','Welsh','Yemeni','Zambian','Zimbabwean') NOT NULL,
  `Sex` enum('Male','Female','prefer not to define') NOT NULL,
  `Registration_Date` date NOT NULL,
  `User_Photo` blob,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engager`
--

LOCK TABLES `engager` WRITE;
/*!40000 ALTER TABLE `engager` DISABLE KEYS */;
INSERT INTO `engager` VALUES ('fatimaaaaa@gmail.com','fatnig01234567','Fatima Idonije','1996-10-12','Nigerian','prefer not to define','2025-03-23',NULL),('marric@gmail.com','sdg3332as','Martha Rice','1989-02-23','Irish','Female','2025-01-01',NULL),('mixblack@gmail.com','veroiascity2002','Thanos Michalopoulos','2002-07-04','Greek','Male','2024-12-10',NULL),('panoslek@gmail.com','panossssreeee','Panos Lekos','2002-03-01','Greek','Male','2024-12-21',NULL),('samagiamarina@gmail.com','poioseinaiokwdikos','Christos Samaras','2002-11-15','Greek','Male','2025-01-22',NULL),('yoloo2004@gmail.com','ilovekangaroos4ever','Charlotte Allen','2004-06-17','Australian','Female','2025-01-01',NULL);
/*!40000 ALTER TABLE `engager` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `adult_engager_bi` BEFORE INSERT ON `engager` FOR EACH ROW BEGIN
    DECLARE age INT;
    SET age = DATEDIFF(NEW.`Registration_Date`, NEW.`Birthdate`) / 365;
    IF (age < 18) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Engager must be at least 18 years old';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nation_engager_bi` BEFORE INSERT ON `engager` FOR EACH ROW BEGIN
    IF (NEW.`Nationality` NOT IN (
        'Afghan', 'Albanian', 'Algerian', 'Andorran', 'Angolan', 
        'Antiguans', 'Argentine', 'Armenian', 'Australian', 'Austrian', 
        'Azerbaijani', 'Bahaman', 'Bahraini', 'Bangladeshi', 'Barbadian', 
        'Belarusian', 'Belgian', 'Belizean', 'Beninese', 'Bhutanese', 
        'Bolivian', 'Bosnian', 'Botswanan', 'Brazilian', 'Bruneian', 
        'Bulgarian', 'Burkinabe', 'Burundian', 'Cambodian', 'Cameroonian', 
        'Canadian', 'Cape Verdean', 'Central African', 'Chadian', 'Chilean', 
        'Chinese', 'Colombian', 'Comoran', 'Congolese', 'Costa Rican', 
        'Croatian', 'Cuban', 'Cypriot', 'Czech', 'Danish', 
        'Djiboutian', 'Dominican', 'Dutch', 'Ecuadorian', 'Egyptian', 
        'Emirati', 'English', 'Equatorial Guinean', 'Eritrean', 'Estonian', 'Eswatini', 
        'Ethiopian', 'Fijian', 'Filipino', 'Finnish', 'French', 
        'Gabonese', 'Gambian', 'Georgian', 'German', 'Ghanaian', 
        'Greek', 'Grenadian', 'Guatemalan', 'Guinean', 'Guinean-Bissauan', 
        'Guyanese', 'Haitian', 'Honduran', 'Hungarian', 'Icelandic', 
        'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish', 
        'Israeli', 'Italian', 'Ivorian', 'Jamaican', 'Japanese', 
        'Jordanian', 'Kazakh', 'Kenyan', 'Kittian and Nevisian', 'Kuwaiti', 
        'Kyrgyz', 'Laotian', 'Latvian', 'Lebanese', 'Liberian', 
        'Libyan', 'Liechtensteiner', 'Lithuanian', 'Luxembourgish', 'Malagasy', 
        'Malawi', 'Malaysian', 'Maldivian', 'Malian', 'Malta', 
        'Marshallese', 'Mauritanian', 'Mauritian', 'Mexican', 'Micronesian', 
        'Moldovan', 'Monacan', 'Mongolian', 'Moroccan', 'Mozambican', 
        'Myanmarese', 'Namibian', 'Nepalese', 'New Zealander', 'Nicaraguan', 
        'Nigerien', 'Nigerian', 'North Korean', 'Norwegian', 'Omani', 
        'Pakistani', 'Palauan', 'Palestinian', 'Panamanian', 'Papua New Guinean', 
        'Paraguayan', 'Peruvian', 'Philippine', 'Polish', 'Portuguese', 
        'Qatari', 'Romanian', 'Russian', 'Rwandan', 'Saint Lucian', 
        'Salvadoran', 'Samoan', 'San Marinese', 'Sao Tomean', 'Saudi', 
        'Scottish', 'Senegalese', 'Serbian', 'Seychellois', 'Sierra Leonean', 
        'Singaporean', 'Slovak', 'Slovenian', 'Solomon Islander', 'Somali', 
        'South African', 'South Korean', 'South Sudanese', 'Spanish', 'Sri Lankan', 
        'Sudanese', 'Surinamer', 'Swazi', 'Swedish', 'Swiss', 
        'Syrian', 'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 
        'Togolese', 'Tongan', 'Trinidadian', 'Tunisian', 'Turkish', 
        'Turkmen', 'Ugandan', 'Ukrainian', 'Uruguayan', 'Uzbek', 
        'Vanuatu', 'Vatican', 'Venezuelan', 'Vietnamese', 'Welsh', 
        'Yemeni', 'Zambian', 'Zimbabwean'
    )) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not a nationality';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sex_engager_bi` BEFORE INSERT ON `engager` FOR EACH ROW BEGIN
    IF (NEW.`Sex` NOT IN ('Male', 'Female', 'prefer not to define')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not a predefined sex declaration';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `engager_interests`
--

DROP TABLE IF EXISTS `engager_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engager_interests` (
  `Email` varchar(50) NOT NULL,
  `Topics_of_Interest` enum('Sports','Politics','Economy','Society','Lifestyle','Showbiz','Global','Environment','Art/Culture','Science','Technology') NOT NULL,
  PRIMARY KEY (`Email`,`Topics_of_Interest`),
  CONSTRAINT `enint_Email` FOREIGN KEY (`Email`) REFERENCES `engager` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engager_interests`
--

LOCK TABLES `engager_interests` WRITE;
/*!40000 ALTER TABLE `engager_interests` DISABLE KEYS */;
INSERT INTO `engager_interests` VALUES ('fatimaaaaa@gmail.com','Society'),('fatimaaaaa@gmail.com','Lifestyle'),('fatimaaaaa@gmail.com','Showbiz'),('panoslek@gmail.com','Technology'),('samagiamarina@gmail.com','Sports'),('samagiamarina@gmail.com','Politics');
/*!40000 ALTER TABLE `engager_interests` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enum_engager_interests_bi` BEFORE INSERT ON `engager_interests` FOR EACH ROW BEGIN
    IF (NEW.`Topics_of_Interest` NOT IN ('Sports', 'Politics', 'Economy', 'Society', 'Lifestyle', 'Showbiz', 'Global', 'Environment', 'Art/Culture', 'Science', 'Technology')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid topic of interest';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enum_engager_interests_bu` BEFORE UPDATE ON `engager_interests` FOR EACH ROW BEGIN
    IF (NEW.`Topics_of_Interest` NOT IN ('Sports', 'Politics', 'Economy', 'Society', 'Lifestyle', 'Showbiz', 'Global', 'Environment', 'Art/Culture', 'Science', 'Technology')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid topic of interest';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `engager_no_password`
--

DROP TABLE IF EXISTS `engager_no_password`;
/*!50001 DROP VIEW IF EXISTS `engager_no_password`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `engager_no_password` AS SELECT 
 1 AS `Email`,
 1 AS `Fullname`,
 1 AS `Birthdate`,
 1 AS `Nationality`,
 1 AS `Sex`,
 1 AS `Registration_Date`,
 1 AS `User_Photo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `engager_reports`
--

DROP TABLE IF EXISTS `engager_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engager_reports` (
  `Email` varchar(50) NOT NULL,
  `ModeratorID` int NOT NULL,
  `Report_Engager_Date` datetime NOT NULL,
  PRIMARY KEY (`Email`,`ModeratorID`),
  KEY `ModeratorID_idx` (`ModeratorID`),
  CONSTRAINT `Email_fk1` FOREIGN KEY (`Email`) REFERENCES `engager` (`Email`),
  CONSTRAINT `ModeratorID` FOREIGN KEY (`ModeratorID`) REFERENCES `moderator` (`ModeratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engager_reports`
--

LOCK TABLES `engager_reports` WRITE;
/*!40000 ALTER TABLE `engager_reports` DISABLE KEYS */;
INSERT INTO `engager_reports` VALUES ('fatimaaaaa@gmail.com',2,'2025-04-19 12:12:12'),('fatimaaaaa@gmail.com',12,'2025-04-19 12:23:45'),('marric@gmail.com',24,'2025-06-12 06:12:55'),('samagiamarina@gmail.com',12,'2025-04-12 20:33:23'),('samagiamarina@gmail.com',32,'2025-05-05 09:46:52'),('samagiamarina@gmail.com',58,'2025-04-12 20:33:23');
/*!40000 ALTER TABLE `engager_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `engager_self_view`
--

DROP TABLE IF EXISTS `engager_self_view`;
/*!50001 DROP VIEW IF EXISTS `engager_self_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `engager_self_view` AS SELECT 
 1 AS `Email`,
 1 AS `Password`,
 1 AS `Fullname`,
 1 AS `Birthdate`,
 1 AS `Nationality`,
 1 AS `Sex`,
 1 AS `User_Photo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `JEmail` varchar(50) NOT NULL,
  `Follower` varchar(50) NOT NULL,
  `Follow_Date` datetime NOT NULL,
  PRIMARY KEY (`Follower`,`JEmail`),
  KEY `JEmail_fk23` (`JEmail`),
  CONSTRAINT `Follower` FOREIGN KEY (`Follower`) REFERENCES `engager` (`Email`),
  CONSTRAINT `JEmail_fk23` FOREIGN KEY (`JEmail`) REFERENCES `journalist` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('demyild1988@gmail.com','fatimaaaaa@gmail.com','2026-02-23 21:43:04'),('demyild1988@gmail.com','marric@gmail.com','2025-03-12 11:13:42'),('arportosalt@gmail.com','mixblack@gmail.com','2026-08-22 10:13:42'),('chrisraga@yahoo.gr','panoslek@gmail.com','2025-02-23 10:32:23'),('chrisraga@yahoo.gr','samagiamarina@gmail.com','2025-02-23 10:32:23'),('demyild1988@gmail.com','yoloo2004@gmail.com','2026-01-01 12:12:43');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `followers_per_journalist`
--

DROP TABLE IF EXISTS `followers_per_journalist`;
/*!50001 DROP VIEW IF EXISTS `followers_per_journalist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `followers_per_journalist` AS SELECT 
 1 AS `JEmail`,
 1 AS `NumFollowers`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag` (
  `Text` varchar(50) NOT NULL,
  PRIMARY KEY (`Text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES ('FreePalestine'),('GlobalWarming'),('Israel'),('Mitsotakis'),('Picasso'),('SuperLeague'),('Ukraine ');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalist`
--

DROP TABLE IF EXISTS `journalist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journalist` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `Nationality` enum('Afghan','Albanian','Algerian','American','Andorran','Angolan','Antiguans','Argentine','Armenian','Australian','Austrian','Azerbaijani','Bahaman','Bahraini','Bangladeshi','Barbadian','Belarusian','Belgian','Belizean','Beninese','Bhutanese','Bolivian','Bosnian','Botswanan','Brazilian','Bruneian','Bulgarian','Burkinabe','Burundian','Cambodian','Cameroonian','Canadian','Cape Verdean','Central African','Chadian','Chilean','Chinese','Colombian','Comoran','Congolese','Costa Rican','Croatian','Cuban','Cypriot','Czech','Danish','Djiboutian','Dominican','Dutch','Ecuadorian','Egyptian','Emirati','English','Equatorial Guinean','Eritrean','Estonian','Eswatini','Ethiopian','Fijian','Filipino','Finnish','French','Gabonese','Gambian','Georgian','German','Ghanaian','Greek','Grenadian','Guatemalan','Guinean','Guinean-Bissauan','Guyanese','Haitian','Honduran','Hungarian','Icelandic','Indian','Indonesian','Iranian','Iraqi','Irish','Israeli','Italian','Ivorian','Jamaican','Japanese','Jordanian','Kazakh','Kenyan','Kittian and Nevisian','Kuwaiti','Kyrgyz','Laotian','Latvian','Lebanese','Liberian','Libyan','Liechtensteiner','Lithuanian','Luxembourgish','Malagasy','Malawi','Malaysian','Maldivian','Malian','Malta','Marshallese','Mauritanian','Mauritian','Mexican','Micronesian','Moldovan','Monacan','Mongolian','Moroccan','Mozambican','Myanmarese','Namibian','Nepalese','New Zealander','Nicaraguan','Nigerien','Nigerian','North Korean','Norwegian','Omani','Pakistani','Palauan','Palestinian','Panamanian','Papua New Guinean','Paraguayan','Peruvian','Philippine','Polish','Portuguese','Qatari','Romanian','Russian','Rwandan','Saint Lucian','Salvadoran','Samoan','San Marinese','Sao Tomean','Saudi','Scottish','Senegalese','Serbian','Seychellois','Sierra Leonean','Singaporean','Slovak','Slovenian','Solomon Islander','Somali','South African','South Korean','South Sudanese','Spanish','Sri Lankan','Sudanese','Surinamer','Swazi','Swedish','Swiss','Syrian','Taiwanese','Tajik','Tanzanian','Thai','Togolese','Tongan','Trinidadian','Tunisian','Turkish','Turkmen','Ugandan','Ukrainian','Uruguayan','Uzbek','Vanuatu','Vatican','Venezuelan','Vietnamese','Welsh','Yemeni','Zambian','Zimbabwean') NOT NULL,
  `Sex` enum('Male','Female','prefer not to define') NOT NULL,
  `Registration_Date` date NOT NULL,
  `User_Photo` blob,
  `Specialization_Field` enum('Sports','Politics','Economy','Society','Lifestyle','Showbiz','Global','Environment','Art/Culture','Science','Technology') NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalist`
--

LOCK TABLES `journalist` WRITE;
/*!40000 ALTER TABLE `journalist` DISABLE KEYS */;
INSERT INTO `journalist` VALUES ('arportosalt@gmail.com','alfzsNDskai','Aris Portosalte','1963-09-07','Greek','Male','2025-01-22',NULL,'Politics'),('chrisraga@yahoo.gr','trelopaokiG4','Christos Ragkatsis','1968-10-23','Greek','Male','2024-12-21',NULL,'Sports'),('demyild1988@gmail.com','asf_fsa1988','Demir Yildiz','1988-12-02','Turkish','Male','2025-01-01',NULL,'Society'),('helenb12@gmail.com','helbek1995eng','Helen Baker','1995-04-03','English','Female','2024-12-10',NULL,'Art/Culture'),('kamsmith76@gmail.com','19767691kmusa','Kamala Smith','1976-08-08','American','prefer not to define','2025-01-01',NULL,'Society'),('yousraegypt@gmail.com','034334#_yr','Yousra Ashraf','1993-05-04','Egyptian','Female','2025-03-23',NULL,'Environment');
/*!40000 ALTER TABLE `journalist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `adult_journalist_bi` BEFORE INSERT ON `journalist` FOR EACH ROW BEGIN
    DECLARE age INT;
    SET age = DATEDIFF(NEW.`Registration_Date`, NEW.`Birthdate`) / 365;
    IF (age < 20) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Journalist must be at least 20 years old. Pote phres ptuxio re?';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enum_journalist_spec_field_bi` BEFORE INSERT ON `journalist` FOR EACH ROW BEGIN
    IF (NEW.`Specialization_Field` NOT IN ('Sports', 'Politics', 'Economy', 'Society', 'Lifestyle', 'Showbiz', 'Global', 'Environment', 'Art/Culture', 'Science', 'Technology')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid specialization field';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nation_journalist_bi` BEFORE INSERT ON `journalist` FOR EACH ROW BEGIN
    IF (NEW.`Nationality` NOT IN (
        'Afghan', 'Albanian', 'Algerian', 'American', 'Andorran', 'Angolan', 
        'Antiguans', 'Argentine', 'Armenian', 'Australian', 'Austrian', 
        'Azerbaijani', 'Bahaman', 'Bahraini', 'Bangladeshi', 'Barbadian', 
        'Belarusian', 'Belgian', 'Belizean', 'Beninese', 'Bhutanese', 
        'Bolivian', 'Bosnian', 'Botswanan', 'Brazilian', 'Bruneian', 
        'Bulgarian', 'Burkinabe', 'Burundian', 'Cambodian', 'Cameroonian', 
        'Canadian', 'Cape Verdean', 'Central African', 'Chadian', 'Chilean', 
        'Chinese', 'Colombian', 'Comoran', 'Congolese', 'Costa Rican', 
        'Croatian', 'Cuban', 'Cypriot', 'Czech', 'Danish', 
        'Djiboutian', 'Dominican', 'Dutch', 'Ecuadorian', 'Egyptian', 
        'Emirati', 'English', 'Equatorial Guinean', 'Eritrean', 'Estonian', 'Eswatini', 
        'Ethiopian', 'Fijian', 'Filipino', 'Finnish', 'French', 
        'Gabonese', 'Gambian', 'Georgian', 'German', 'Ghanaian', 
        'Greek', 'Grenadian', 'Guatemalan', 'Guinean', 'Guinean-Bissauan', 
        'Guyanese', 'Haitian', 'Honduran', 'Hungarian', 'Icelandic', 
        'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish', 
        'Israeli', 'Italian', 'Ivorian', 'Jamaican', 'Japanese', 
        'Jordanian', 'Kazakh', 'Kenyan', 'Kittian and Nevisian', 'Kuwaiti', 
        'Kyrgyz', 'Laotian', 'Latvian', 'Lebanese', 'Liberian', 
        'Libyan', 'Liechtensteiner', 'Lithuanian', 'Luxembourgish', 'Malagasy', 
        'Malawi', 'Malaysian', 'Maldivian', 'Malian', 'Malta', 
        'Marshallese', 'Mauritanian', 'Mauritian', 'Mexican', 'Micronesian', 
        'Moldovan', 'Monacan', 'Mongolian', 'Moroccan', 'Mozambican', 
        'Myanmarese', 'Namibian', 'Nepalese', 'New Zealander', 'Nicaraguan', 
        'Nigerien', 'Nigerian', 'North Korean', 'Norwegian', 'Omani', 
        'Pakistani', 'Palauan', 'Palestinian', 'Panamanian', 'Papua New Guinean', 
        'Paraguayan', 'Peruvian', 'Philippine', 'Polish', 'Portuguese', 
        'Qatari', 'Romanian', 'Russian', 'Rwandan', 'Saint Lucian', 
        'Salvadoran', 'Samoan', 'San Marinese', 'Sao Tomean', 'Saudi', 
        'Scottish', 'Senegalese', 'Serbian', 'Seychellois', 'Sierra Leonean', 
        'Singaporean', 'Slovak', 'Slovenian', 'Solomon Islander', 'Somali', 
        'South African', 'South Korean', 'South Sudanese', 'Spanish', 'Sri Lankan', 
        'Sudanese', 'Surinamer', 'Swazi', 'Swedish', 'Swiss', 
        'Syrian', 'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 
        'Togolese', 'Tongan', 'Trinidadian', 'Tunisian', 'Turkish', 
        'Turkmen', 'Ugandan', 'Ukrainian', 'Uruguayan', 'Uzbek', 
        'Vanuatu', 'Vatican', 'Venezuelan', 'Vietnamese', 'Welsh', 
        'Yemeni', 'Zambian', 'Zimbabwean'
    )) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not a nationality';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sex_journalist_bi` BEFORE INSERT ON `journalist` FOR EACH ROW BEGIN
    IF (NEW.`Sex` NOT IN ('Male', 'Female', 'prefer not to define')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not a predefined sex declaration';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enum_journalist_spec_field_bu` BEFORE UPDATE ON `journalist` FOR EACH ROW BEGIN
    IF (NEW.`Specialization_Field` NOT IN ('Sports', 'Politics', 'Economy', 'Society', 'Lifestyle', 'Showbiz', 'Global', 'Environment', 'Art/Culture', 'Science', 'Technology')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid specialization field';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `journalist_interest`
--

DROP TABLE IF EXISTS `journalist_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journalist_interest` (
  `Topics_of_Interest` enum('Sports','Politics','Economy','Society','Lifestyle','Showbiz','Global','Environment','Art/Culture','Science','Technology') NOT NULL,
  `JEmail` varchar(50) NOT NULL,
  PRIMARY KEY (`Topics_of_Interest`,`JEmail`),
  KEY `JEmail_idx` (`JEmail`),
  CONSTRAINT `journint_email` FOREIGN KEY (`JEmail`) REFERENCES `journalist` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalist_interest`
--

LOCK TABLES `journalist_interest` WRITE;
/*!40000 ALTER TABLE `journalist_interest` DISABLE KEYS */;
INSERT INTO `journalist_interest` VALUES ('Showbiz','chrisraga@yahoo.gr'),('Politics','helenb12@gmail.com'),('Art/Culture','helenb12@gmail.com'),('Global','yousraegypt@gmail.com'),('Environment','yousraegypt@gmail.com'),('Science','yousraegypt@gmail.com');
/*!40000 ALTER TABLE `journalist_interest` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enum_journalist_interest_bi` BEFORE INSERT ON `journalist_interest` FOR EACH ROW BEGIN
    IF (NEW.`Topics_of_Interest` NOT IN ('Sports', 'Politics', 'Economy', 'Society', 'Lifestyle', 'Showbiz', 'Global', 'Environment', 'Art/Culture', 'Science', 'Technology')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid topic of interest';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enum_journalist_interest_bu` BEFORE UPDATE ON `journalist_interest` FOR EACH ROW BEGIN
    IF (NEW.`Topics_of_Interest` NOT IN ('Sports', 'Politics', 'Economy', 'Society', 'Lifestyle', 'Showbiz', 'Global', 'Environment', 'Art/Culture', 'Science', 'Technology')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid topic of interest';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `journalist_license`
--

DROP TABLE IF EXISTS `journalist_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journalist_license` (
  `JEmail` varchar(50) NOT NULL,
  `Journalist_License` varchar(50) NOT NULL,
  PRIMARY KEY (`JEmail`),
  CONSTRAINT `JEmail_fk4` FOREIGN KEY (`JEmail`) REFERENCES `journalist` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalist_license`
--

LOCK TABLES `journalist_license` WRITE;
/*!40000 ALTER TABLE `journalist_license` DISABLE KEYS */;
INSERT INTO `journalist_license` VALUES ('arportosalt@gmail.com','www.globaljournalistlicenses.com/Aris_Portosalte'),('chrisraga@yahoo.gr','www.globaljournalistlicenses.com/Christos_Ragatsis'),('demyild1988@gmail.com','www.globaljournalistlicenses.com/Demir_Yildiz'),('helenb12@gmail.com','www.globaljournalistlicenses.com/HelenBaker'),('kamsmith76@gmail.com','www.globaljournalistlicenses.com/Kamala_Smith'),('yousraegypt@gmail.com','www.globaljournalistlicenses.com/Yousra_Ashraf');
/*!40000 ALTER TABLE `journalist_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `journalist_no_password`
--

DROP TABLE IF EXISTS `journalist_no_password`;
/*!50001 DROP VIEW IF EXISTS `journalist_no_password`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `journalist_no_password` AS SELECT 
 1 AS `Email`,
 1 AS `Fullname`,
 1 AS `Birthdate`,
 1 AS `Nationality`,
 1 AS `Sex`,
 1 AS `Registration_Date`,
 1 AS `User_Photo`,
 1 AS `Specialization_Field`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `journalist_self_view`
--

DROP TABLE IF EXISTS `journalist_self_view`;
/*!50001 DROP VIEW IF EXISTS `journalist_self_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `journalist_self_view` AS SELECT 
 1 AS `Email`,
 1 AS `Password`,
 1 AS `Fullname`,
 1 AS `Birthdate`,
 1 AS `Nationality`,
 1 AS `Sex`,
 1 AS `User_Photo`,
 1 AS `Specialization_Field`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `likes_per_post`
--

DROP TABLE IF EXISTS `likes_per_post`;
/*!50001 DROP VIEW IF EXISTS `likes_per_post`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `likes_per_post` AS SELECT 
 1 AS `JEmail`,
 1 AS `Post_Date`,
 1 AS `NumLikes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `moderator`
--

DROP TABLE IF EXISTS `moderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderator` (
  `ModeratorID` int NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `Nationality` enum('Afghan','Albanian','Algerian','American','Andorran','Angolan','Antiguans','Argentine','Armenian','Australian','Austrian','Azerbaijani','Bahaman','Bahraini','Bangladeshi','Barbadian','Belarusian','Belgian','Belizean','Beninese','Bhutanese','Bolivian','Bosnian','Botswanan','Brazilian','Bruneian','Bulgarian','Burkinabe','Burundian','Cambodian','Cameroonian','Canadian','Cape Verdean','Central African','Chadian','Chilean','Chinese','Colombian','Comoran','Congolese','Costa Rican','Croatian','Cuban','Cypriot','Czech','Danish','Djiboutian','Dominican','Dutch','Ecuadorian','Egyptian','Emirati','English','Equatorial Guinean','Eritrean','Estonian','Eswatini','Ethiopian','Fijian','Filipino','Finnish','French','Gabonese','Gambian','Georgian','German','Ghanaian','Greek','Grenadian','Guatemalan','Guinean','Guinean-Bissauan','Guyanese','Haitian','Honduran','Hungarian','Icelandic','Indian','Indonesian','Iranian','Iraqi','Irish','Israeli','Italian','Ivorian','Jamaican','Japanese','Jordanian','Kazakh','Kenyan','Kittian and Nevisian','Kuwaiti','Kyrgyz','Laotian','Latvian','Lebanese','Liberian','Libyan','Liechtensteiner','Lithuanian','Luxembourgish','Malagasy','Malawi','Malaysian','Maldivian','Malian','Malta','Marshallese','Mauritanian','Mauritian','Mexican','Micronesian','Moldovan','Monacan','Mongolian','Moroccan','Mozambican','Myanmarese','Namibian','Nepalese','New Zealander','Nicaraguan','Nigerien','Nigerian','North Korean','Norwegian','Omani','Pakistani','Palauan','Palestinian','Panamanian','Papua New Guinean','Paraguayan','Peruvian','Philippine','Polish','Portuguese','Qatari','Romanian','Russian','Rwandan','Saint Lucian','Salvadoran','Samoan','San Marinese','Sao Tomean','Saudi','Scottish','Senegalese','Serbian','Seychellois','Sierra Leonean','Singaporean','Slovak','Slovenian','Solomon Islander','Somali','South African','South Korean','South Sudanese','Spanish','Sri Lankan','Sudanese','Surinamer','Swazi','Swedish','Swiss','Syrian','Taiwanese','Tajik','Tanzanian','Thai','Togolese','Tongan','Trinidadian','Tunisian','Turkish','Turkmen','Ugandan','Ukrainian','Uruguayan','Uzbek','Vanuatu','Vatican','Venezuelan','Vietnamese','Welsh','Yemeni','Zambian','Zimbabwean') NOT NULL,
  `Sex` enum('Male','Female','prefer not to define') NOT NULL,
  PRIMARY KEY (`ModeratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderator`
--

LOCK TABLES `moderator` WRITE;
/*!40000 ALTER TABLE `moderator` DISABLE KEYS */;
INSERT INTO `moderator` VALUES (2,'Eleni Pantazi','2001-12-30','Greek','Female'),(12,'Georgios Pantelidis','1999-01-12','Greek','Male'),(24,'Chen Wang','1998-04-13','Chinese','Male'),(32,'Frieda Bauer','2000-02-14','German','Female'),(45,'Adam Davies','2001-12-30','Canadian','Male'),(58,'Ganesha Bajwa','1975-06-06','Indian','Female');
/*!40000 ALTER TABLE `moderator` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nation_moderator_bi` BEFORE INSERT ON `moderator` FOR EACH ROW BEGIN
    IF (NEW.`Nationality` NOT IN (
        'Afghan', 'Albanian', 'Algerian', 'American', 'Andorran', 'Angolan', 
        'Antiguans', 'Argentine', 'Armenian', 'Australian', 'Austrian', 
        'Azerbaijani', 'Bahaman', 'Bahraini', 'Bangladeshi', 'Barbadian', 
        'Belarusian', 'Belgian', 'Belizean', 'Beninese', 'Bhutanese', 
        'Bolivian', 'Bosnian', 'Botswanan', 'Brazilian', 'Bruneian', 
        'Bulgarian', 'Burkinabe', 'Burundian', 'Cambodian', 'Cameroonian', 
        'Canadian', 'Cape Verdean', 'Central African', 'Chadian', 'Chilean', 
        'Chinese', 'Colombian', 'Comoran', 'Congolese', 'Costa Rican', 
        'Croatian', 'Cuban', 'Cypriot', 'Czech', 'Danish', 
        'Djiboutian', 'Dominican', 'Dutch', 'Ecuadorian', 'Egyptian', 
        'Emirati', 'English', 'Equatorial Guinean', 'Eritrean', 'Estonian', 'Eswatini', 
        'Ethiopian', 'Fijian', 'Filipino', 'Finnish', 'French', 
        'Gabonese', 'Gambian', 'Georgian', 'German', 'Ghanaian', 
        'Greek', 'Grenadian', 'Guatemalan', 'Guinean', 'Guinean-Bissauan', 
        'Guyanese', 'Haitian', 'Honduran', 'Hungarian', 'Icelandic', 
        'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish', 
        'Israeli', 'Italian', 'Ivorian', 'Jamaican', 'Japanese', 
        'Jordanian', 'Kazakh', 'Kenyan', 'Kittian and Nevisian', 'Kuwaiti', 
        'Kyrgyz', 'Laotian', 'Latvian', 'Lebanese', 'Liberian', 
        'Libyan', 'Liechtensteiner', 'Lithuanian', 'Luxembourgish', 'Malagasy', 
        'Malawi', 'Malaysian', 'Maldivian', 'Malian', 'Malta', 
        'Marshallese', 'Mauritanian', 'Mauritian', 'Mexican', 'Micronesian', 
        'Moldovan', 'Monacan', 'Mongolian', 'Moroccan', 'Mozambican', 
        'Myanmarese', 'Namibian', 'Nepalese', 'New Zealander', 'Nicaraguan', 
        'Nigerien', 'Nigerian', 'North Korean', 'Norwegian', 'Omani', 
        'Pakistani', 'Palauan', 'Palestinian', 'Panamanian', 'Papua New Guinean', 
        'Paraguayan', 'Peruvian', 'Philippine', 'Polish', 'Portuguese', 
        'Qatari', 'Romanian', 'Russian', 'Rwandan', 'Saint Lucian', 
        'Salvadoran', 'Samoan', 'San Marinese', 'Sao Tomean', 'Saudi', 
        'Scottish', 'Senegalese', 'Serbian', 'Seychellois', 'Sierra Leonean', 
        'Singaporean', 'Slovak', 'Slovenian', 'Solomon Islander', 'Somali', 
        'South African', 'South Korean', 'South Sudanese', 'Spanish', 'Sri Lankan', 
        'Sudanese', 'Surinamer', 'Swazi', 'Swedish', 'Swiss', 
        'Syrian', 'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 
        'Togolese', 'Tongan', 'Trinidadian', 'Tunisian', 'Turkish', 
        'Turkmen', 'Ugandan', 'Ukrainian', 'Uruguayan', 'Uzbek', 
        'Vanuatu', 'Vatican', 'Venezuelan', 'Vietnamese', 'Welsh', 
        'Yemeni', 'Zambian', 'Zimbabwean'
    )) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not a nationality';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sex_moderator_bi` BEFORE INSERT ON `moderator` FOR EACH ROW BEGIN
    IF (NEW.`Sex` NOT IN ('Male', 'Female', 'prefer not to define')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not a predefined sex declaration';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `moderator_identity`
--

DROP TABLE IF EXISTS `moderator_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderator_identity` (
  `Moderator_ID` int NOT NULL,
  `Identity_Card_Number` varchar(50) NOT NULL,
  PRIMARY KEY (`Moderator_ID`),
  CONSTRAINT `Moderator ID_fk` FOREIGN KEY (`Moderator_ID`) REFERENCES `moderator` (`ModeratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderator_identity`
--

LOCK TABLES `moderator_identity` WRITE;
/*!40000 ALTER TABLE `moderator_identity` DISABLE KEYS */;
INSERT INTO `moderator_identity` VALUES (2,'AR234022'),(12,'AM504560'),(24,'RVV123213'),(32,'XC009333'),(45,'NM123011'),(58,'ZGT569234\n');
/*!40000 ALTER TABLE `moderator_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `moderator_self_view`
--

DROP TABLE IF EXISTS `moderator_self_view`;
/*!50001 DROP VIEW IF EXISTS `moderator_self_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `moderator_self_view` AS SELECT 
 1 AS `ModeratorID`,
 1 AS `FullName`,
 1 AS `Birthdate`,
 1 AS `Nationality`,
 1 AS `Sex`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `num_engager_reports`
--

DROP TABLE IF EXISTS `num_engager_reports`;
/*!50001 DROP VIEW IF EXISTS `num_engager_reports`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `num_engager_reports` AS SELECT 
 1 AS `Email`,
 1 AS `Fullname`,
 1 AS `NumReports`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `PostDate` datetime NOT NULL,
  `JEmail` varchar(50) NOT NULL,
  `Post_Text` varchar(4000) NOT NULL,
  `Post_Image` blob,
  PRIMARY KEY (`PostDate`,`JEmail`),
  KEY `JEmail_idx` (`JEmail`),
  CONSTRAINT `TAJEmail` FOREIGN KEY (`JEmail`) REFERENCES `journalist` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('2024-12-21 13:30:45','helenb12@gmail.com','This is the famous Picasso\'s painting sold for\n1.000.000 euros.',NULL),('2024-12-30 19:30:33','chrisraga@yahoo.gr','Terastio diplo tou PAOK mesa sto Karaiskakis.O dikefalos einai protathlitis xeimona',NULL),('2025-01-23 12:45:45','helenb12@gmail.com','60.000 attended Coldplay’s concert yesterday in\nLondon. That is so stupid.\n',NULL),('2025-03-03 00:12:12','demyild1988@gmail.com',' New Israeli attack in Gaza right now! ',NULL),('2025-03-03 00:15:45','kamsmith76@gmail.com','New Israeli attack in Gaza right now! ',NULL),('2025-04-03 13:12:24','yousraegypt@gmail.com','The water level of the Neil has dropped by 8% over\nthe past 10 years according to recent studies',NULL),('2025-10-20 17:36:21','arportosalt@gmail.com','The Greek government is doing whatever they can to control the fires. Mitsotakis is great!',NULL),('2025-10-21 05:23:11','arportosalt@gmail.com','The prime minister of greece states that we will stand with Ukrain',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_reports`
--

DROP TABLE IF EXISTS `post_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_reports` (
  `Post_Date` datetime NOT NULL,
  `JEmail` varchar(50) NOT NULL,
  `ModeratorID` int NOT NULL,
  `Report_Post_Date` datetime NOT NULL,
  PRIMARY KEY (`Post_Date`,`JEmail`,`ModeratorID`),
  KEY `JEmail_idx` (`JEmail`),
  KEY `ModeratorID_idx` (`ModeratorID`),
  CONSTRAINT `JEmail_fk5` FOREIGN KEY (`JEmail`) REFERENCES `post` (`JEmail`),
  CONSTRAINT `ModeratorID_k` FOREIGN KEY (`ModeratorID`) REFERENCES `moderator` (`ModeratorID`),
  CONSTRAINT `Post Date` FOREIGN KEY (`Post_Date`) REFERENCES `post` (`PostDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_reports`
--

LOCK TABLES `post_reports` WRITE;
/*!40000 ALTER TABLE `post_reports` DISABLE KEYS */;
INSERT INTO `post_reports` VALUES ('2025-01-23 12:45:45','helenb12@gmail.com',32,'2025-01-23 12:59:14'),('2025-01-23 12:45:45','helenb12@gmail.com',58,'2025-01-23 18:02:14'),('2025-03-03 00:15:45','kamsmith76@gmail.com ',2,'2025-03-03 02:51:12'),('2025-03-03 00:15:45','kamsmith76@gmail.com ',12,'2025-03-03 05:32:23'),('2025-03-03 00:15:45','kamsmith76@gmail.com',24,'2025-03-03 10:22:05'),('2025-10-20 17:36:21','arportosalt@gmail.com',12,'2025-10-21 05:23:11');
/*!40000 ALTER TABLE `post_reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `post_reports_date_bi` BEFORE INSERT ON `post_reports` FOR EACH ROW BEGIN
    IF (NEW.`Report_Post_Date` <= NEW.`Post_Date`) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Report Date must be greater than Post Date';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reaction` (
  `JEmail` varchar(50) NOT NULL,
  `Reactioner` varchar(50) NOT NULL,
  `Post_Date` datetime NOT NULL,
  `Reaction_Type` tinyint(1) NOT NULL,
  `Reaction_Date` datetime NOT NULL,
  PRIMARY KEY (`Reactioner`,`JEmail`,`Post_Date`),
  KEY `Post Date_idx` (`Post_Date`),
  KEY `JEmail_fk8` (`JEmail`),
  CONSTRAINT `JEmail_fk8` FOREIGN KEY (`JEmail`) REFERENCES `post` (`JEmail`),
  CONSTRAINT `Post Date_fk` FOREIGN KEY (`Post_Date`) REFERENCES `post` (`PostDate`),
  CONSTRAINT `Reactioner_k` FOREIGN KEY (`Reactioner`) REFERENCES `engager` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaction`
--

LOCK TABLES `reaction` WRITE;
/*!40000 ALTER TABLE `reaction` DISABLE KEYS */;
INSERT INTO `reaction` VALUES ('yousraegypt@gmail.com','fatimaaaaa@gmail.com','2025-04-03 13:12:24',1,'2025-04-03 14:00:00'),('yousraegypt@gmail.com','marric@gmail.com','2025-04-03 13:12:24',1,'2025-04-03 14:00:00'),('chrisraga@yahoo.gr','mixblack@gmail.com','2024-12-30 19:30:33',1,'2024-12-30 19:37:41'),('helenb12@gmail.com','mixblack@gmail.com','2025-01-23 12:45:45',0,'2025-01-23 13:15:32'),('helenb12@gmail.com','panoslek@gmail.com','2025-01-23 12:45:45',0,'2025-01-23 13:42:11'),('yousraegypt@gmail.com','yoloo2004@gmail.com','2025-04-03 13:12:24',1,'2025-04-05 20:19:00');
/*!40000 ALTER TABLE `reaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `val_reaction_date_bi` BEFORE INSERT ON `reaction` FOR EACH ROW BEGIN
    IF (NEW.`Reaction_Date` <= NEW.`Post_Date`) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Reaction Date must be greater than Post Date';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `val_reaction_type_bi` BEFORE INSERT ON `reaction` FOR EACH ROW BEGIN
    IF NEW.`Reaction_Type` NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid reaction type. Allowed values: 1 (like), 0 (dislike)';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `val_reaction_date_bu` BEFORE UPDATE ON `reaction` FOR EACH ROW BEGIN
    IF (NEW.`Reaction_Date` <= NEW.`Post_Date`) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Reaction Date must be greater than Post Date';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `val_reaction_type_bu` BEFORE UPDATE ON `reaction` FOR EACH ROW BEGIN
    IF NEW.`Reaction_Type` NOT IN (0, 1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid reaction type. Allowed values: 1 (like), 0 (dislike)';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference` (
  `JEmail` varchar(50) NOT NULL,
  `Post_Date` datetime NOT NULL,
  `Text` varchar(50) NOT NULL,
  PRIMARY KEY (`JEmail`,`Post_Date`,`Text`),
  KEY `PostDate_idx` (`Post_Date`),
  KEY `Text_idx` (`Text`),
  CONSTRAINT `JEmail` FOREIGN KEY (`JEmail`) REFERENCES `post` (`JEmail`),
  CONSTRAINT `PostDate` FOREIGN KEY (`Post_Date`) REFERENCES `post` (`PostDate`),
  CONSTRAINT `Text` FOREIGN KEY (`Text`) REFERENCES `hashtag` (`Text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference`
--

LOCK TABLES `reference` WRITE;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
INSERT INTO `reference` VALUES ('chrisraga@yahoo.gr','2024-12-30 19:30:33','SuperLeague'),('demyild1988@gmail.com','2025-03-03 00:12:12','Israel '),('kamsmith76@gmail.com','2025-03-03 00:15:45','FreePalestine'),('yousraegypt@gmail.com','2025-04-03 13:12:24','GlobalWarming'),('arportosalt@gmail.com','2025-10-20 17:36:21','Mitsotakis'),('arportosalt@gmail.com','2025-10-20 17:36:21','Ukraine');
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `comments_per_post`
--

/*!50001 DROP VIEW IF EXISTS `comments_per_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comments_per_post` AS select `comment`.`JEmail` AS `JEmail`,`comment`.`Post_Date` AS `Post_Date`,count(distinct concat(`comment`.`Commenter`,`comment`.`Comment_Date`)) AS `ΝumComments` from `comment` group by `comment`.`JEmail`,`comment`.`Post_Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `common_fields`
--

/*!50001 DROP VIEW IF EXISTS `common_fields`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `common_fields` AS select `journalist`.`Email` AS `JEmail`,`engager_interests`.`Email` AS `EngEmail`,`journalist`.`Specialization_Field` AS `Field` from (`engager_interests` join `journalist` on((`journalist`.`Specialization_Field` = `engager_interests`.`Topics_of_Interest`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dislikes_per_post`
--

/*!50001 DROP VIEW IF EXISTS `dislikes_per_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dislikes_per_post` AS select `reaction`.`JEmail` AS `JEmail`,`reaction`.`Post_Date` AS `Post_Date`,count(`reaction`.`Reactioner`) AS `NumLikes` from `reaction` where (`reaction`.`Reaction_Type` = '0') group by `reaction`.`JEmail`,`reaction`.`Post_Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `engager_no_password`
--

/*!50001 DROP VIEW IF EXISTS `engager_no_password`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`panos`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engager_no_password` AS select `engager`.`Email` AS `Email`,`engager`.`Fullname` AS `Fullname`,`engager`.`Birthdate` AS `Birthdate`,`engager`.`Nationality` AS `Nationality`,`engager`.`Sex` AS `Sex`,`engager`.`Registration_Date` AS `Registration_Date`,`engager`.`User_Photo` AS `User_Photo` from `engager` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `engager_self_view`
--

/*!50001 DROP VIEW IF EXISTS `engager_self_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`panos`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engager_self_view` AS select `engager`.`Email` AS `Email`,`engager`.`Password` AS `Password`,`engager`.`Fullname` AS `Fullname`,`engager`.`Birthdate` AS `Birthdate`,`engager`.`Nationality` AS `Nationality`,`engager`.`Sex` AS `Sex`,`engager`.`User_Photo` AS `User_Photo` from `engager` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `followers_per_journalist`
--

/*!50001 DROP VIEW IF EXISTS `followers_per_journalist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `followers_per_journalist` AS select `follow`.`JEmail` AS `JEmail`,count(`follow`.`Follower`) AS `NumFollowers` from `follow` group by `follow`.`JEmail` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `journalist_no_password`
--

/*!50001 DROP VIEW IF EXISTS `journalist_no_password`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`panos`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `journalist_no_password` AS select `journalist`.`Email` AS `Email`,`journalist`.`Fullname` AS `Fullname`,`journalist`.`Birthdate` AS `Birthdate`,`journalist`.`Nationality` AS `Nationality`,`journalist`.`Sex` AS `Sex`,`journalist`.`Registration_Date` AS `Registration_Date`,`journalist`.`User_Photo` AS `User_Photo`,`journalist`.`Specialization_Field` AS `Specialization_Field` from `journalist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `journalist_self_view`
--

/*!50001 DROP VIEW IF EXISTS `journalist_self_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`panos`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `journalist_self_view` AS select `journalist`.`Email` AS `Email`,`journalist`.`Password` AS `Password`,`journalist`.`Fullname` AS `Fullname`,`journalist`.`Birthdate` AS `Birthdate`,`journalist`.`Nationality` AS `Nationality`,`journalist`.`Sex` AS `Sex`,`journalist`.`User_Photo` AS `User_Photo`,`journalist`.`Specialization_Field` AS `Specialization_Field` from `journalist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `likes_per_post`
--

/*!50001 DROP VIEW IF EXISTS `likes_per_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `likes_per_post` AS select `reaction`.`JEmail` AS `JEmail`,`reaction`.`Post_Date` AS `Post_Date`,count(`reaction`.`Reactioner`) AS `NumLikes` from `reaction` where (`reaction`.`Reaction_Type` = '1') group by `reaction`.`JEmail`,`reaction`.`Post_Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `moderator_self_view`
--

/*!50001 DROP VIEW IF EXISTS `moderator_self_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`panos`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `moderator_self_view` AS select `moderator`.`ModeratorID` AS `ModeratorID`,`moderator`.`FullName` AS `FullName`,`moderator`.`Birthdate` AS `Birthdate`,`moderator`.`Nationality` AS `Nationality`,`moderator`.`Sex` AS `Sex` from `moderator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `num_engager_reports`
--

/*!50001 DROP VIEW IF EXISTS `num_engager_reports`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `num_engager_reports` AS select `engager`.`Email` AS `Email`,`engager`.`Fullname` AS `Fullname`,count(`engager_reports`.`ModeratorID`) AS `NumReports` from (`engager` join `engager_reports` on((`engager`.`Email` = `engager_reports`.`Email`))) group by `engager`.`Email`,`engager`.`Email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-26 17:39:17
