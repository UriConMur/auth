CREATE DATABASE  IF NOT EXISTS `bbox_login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bbox_login`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bbox_login
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `bbox_users`
--

DROP TABLE IF EXISTS `bbox_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbox_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `user_password` varchar(98) NOT NULL DEFAULT '$argon2i$v=19$m=1024,t=2,p=2$ZWl2WlkwSmMvS2hyN0tqVQ$klDVUlGrEHa8mivm53Pn+jlTumwp8FECnPSM6GtePgI',
  `is_active` tinyint(4) DEFAULT '1',
  `is_removed` tinyint(4) DEFAULT '0',
  `dt_last_activity` datetime DEFAULT NULL,
  `id_creator` int(11) NOT NULL DEFAULT '0',
  `dt_created` datetime NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'bbox_login'
--

--
-- Dumping routines for database 'bbox_login'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR_PARAM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR_PARAM`(x TEXT, delim VARCHAR(12),pos INT) RETURNS text CHARSET utf8
RETURN REPLACE
	(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
	LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
	delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_user_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user_get`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE GET_USER INT DEFAULT 2;

CASE
	WHEN case_type = GET_USER #This case get username and password, check its existence in bbox.users table
	THEN
		SET @user = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @password = SPLIT_STR_PARAM(data_value,"|-|",2);

		IF((SELECT COUNT(*) FROM `bbox_users` WHERE user LIKE @user AND user_password LIKE @password)=1) THEN
            UPDATE `bbox_users` SET is_active = 1 WHERE user LIKE @user;
            UPDATE `bbox_users` SET dt_last_activity = CURDATE() WHERE user LIKE @user;
            SET @login =1;
		ELSE
            SET @login = 0;
		END IF;

        SELECT @login as uuid;
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-17 16:25:58
