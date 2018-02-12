CREATE DATABASE  IF NOT EXISTS `bbox_login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bbox_login`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: bbox_login
-- ------------------------------------------------------
-- Server version	5.6.35

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
  `user` varchar(45) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(35) COLLATE utf8_bin NOT NULL DEFAULT 'f5a5d1e505092b674af2e6fe94ec9341b0b',
  `is_active` tinyint(4) DEFAULT '1',
  `is_removed` tinyint(4) DEFAULT '0',
  `dt_last_activity` datetime DEFAULT NULL,
  `id_creator` int(11) NOT NULL DEFAULT '0',
  `dt_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'bbox_login'
--

--
-- Dumping routines for database 'bbox_login'
--
/*!50003 DROP FUNCTION IF EXISTS `RANDOM_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `RANDOM_ID`() RETURNS text CHARSET utf8
BEGIN
	SET @numberRandom = FLOOR(10000 * RAND());

    SET @numberRandom = (
		SELECT
		IF(LENGTH(@numberRandom) > 3,
			(MID(@numberRandom,1,3)),
            @numberRandom
		));

RETURN @numberRandom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR_PARAM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP FUNCTION IF EXISTS `USER_EXIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `USER_EXIST`(user TEXT) RETURNS text CHARSET utf8
BEGIN
	RETURN (select COUNT(*) from bbox_login.bbox_users where SUBSTRING_INDEX(bbox_login.bbox_users.user,'.',2) = user);
END ;;
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
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user_get`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE GET_USER INT DEFAULT 2;

CASE
	WHEN case_type = GET_USER THEN #This case get username and password, check its existence in bbox.users table, if this exist it returns the id_user, otherwise, nothing
        SET @user = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @pass = SPLIT_STR_PARAM(data_value,"|-|",2);

        SELECT id_user
        INTO @id_user
        FROM `bbox_users`
        WHERE user = @user AND user_password = @pass COLLATE utf8_bin;

        SELECT
			@id_user as uuid,
            id_employee as id_employee,
            id_position as id_position,
            shortName as name
		FROM bbox_personnel.e_employee where id_user = @id_user LIMIT 1;

END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_user_set` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user_set`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE SET_NEW_USER INT DEFAULT 1;

CASE
	WHEN case_type = SET_NEW_USER THEN
		SET data_value = LOWER(data_value);

		SET @name = SPLIT_STR_PARAM(data_value,"|-|",1);
		SET @middle = SPLIT_STR_PARAM(data_value,"|-|",2);
		SET @last_name = SPLIT_STR_PARAM(data_value,"|-|",3);
		SET @second_last = SPLIT_STR_PARAM(data_value,"|-|",4);

		IF USER_EXIST(CONCAT(@name,'.',@last_name)) = 0 THEN
			SET @shortName = SUBSTRING(CONCAT(@name,'.',@last_name),1,16);
		ELSEIF LENGTH(@second_last) && USER_EXIST(CONCAT(@name,'.',@second_last)) = 0 THEN
			SET @shortName = SUBSTRING(CONCAT(@name,'.',@second_last),1,16);
		ELSEIF LENGTH(@middle) && USER_EXIST(CONCAT(@name,'.', @middle))= 0 THEN
			SET @shortName = SUBSTRING(CONCAT(@name,'.', @middle),1,16);
		ELSEIF LENGTH(@middle) && USER_EXIST(CONCAT(@middle,'.',@last_name)) = 0 THEN
			SET @shortName = SUBSTRING(CONCAT(@middle,'.',@last_name),1,16);
		ELSEIF LENGTH(@middle) && LENGTH(@second_last) && USER_EXIST(CONCAT(@middle,'.',@second_last)) = 0 THEN
			SET @shortName = SUBSTRING(CONCAT(@middle,'.',@second_last),1,16);
		ELSE
			SET @shortName = SUBSTRING(CONCAT(@name,'.',LEFT(@last_name, LENGTH(@last_name)-2)),1,16);
		END IF;

		IF SUBSTRING(@shortName,16) = '.' THEN
			SET @shortName = REPLACE(@shortName,'.','');
		END IF;

		SET @user = CONCAT(@shortName, '.',RANDOM_ID());

        WHILE ((select COUNT(*) from bbox_login.bbox_users where user = @user and is_active = 1)>0) DO
			SET @user = CONCAT(@shortName, '.',RANDOM_ID());
		END WHILE;

		INSERT INTO bbox_login.bbox_users(user, id_creator) values(@user, id_modifier);

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

-- Dump completed on 2018-02-08 15:27:04
