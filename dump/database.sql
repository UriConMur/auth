-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bbox_login
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

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
  `id_modifier` int(11) DEFAULT NULL,
  `dt_last_modifier` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `RANDOM_ID`(case_type INT, data_value TEXT) RETURNS int(11)
BEGIN
	DECLARE RANDOM_USER INT DEFAULT 1;
	DECLARE SHORT_LAST_NAME INT DEFAULT 2;

    CASE
		WHEN case_type = RANDOM_USER THEN
			RETURN MID(FLOOR(10000 * RAND()),1,3);
		WHEN case_type = SHORT_LAST_NAME THEN
			SET @number_random = FLOOR(10 * RAND()) + 1;
			WHILE (@number_random < 2 OR @number_random >= LENGTH(data_value)) DO
				SET @number_random = SUBSTRING(FLOOR(100 * RAND()),1);
			END WHILE;
            RETURN @number_random;
	END CASE;
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
/*!50003 DROP FUNCTION IF EXISTS `USER_NO_EXIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `USER_NO_EXIST`(user TEXT) RETURNS tinyint(1)
BEGIN
	IF (SELECT COUNT(*) FROM bbox_login.bbox_users WHERE SUBSTRING_INDEX(bbox_login.bbox_users.user,'.',2) = user) = 0 THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
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
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user_set`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

DECLARE INSERT_NEW_USER INT DEFAULT 1;
DECLARE MODIFY_USER INT DEFAULT 2;
DECLARE DELETE_USER INT DEFAULT 3;

CASE
	WHEN case_type = INSERT_NEW_USER THEN
		SET data_value = REPLACE(LOWER(data_value), ' ','');

		SET @name = SPLIT_STR_PARAM(data_value,"|-|",1);
		SET @middle = SPLIT_STR_PARAM(data_value,"|-|",2);
		SET @last_name = SPLIT_STR_PARAM(data_value,"|-|",3);
		SET @second_last = SPLIT_STR_PARAM(data_value,"|-|",4);

		SET @name_last = CONCAT(@name,'.',@last_name);
        SET @name_second_last = CONCAT(@name,'.',@second_last);
        SET @name_middle = CONCAT(@name,'.', @middle);
        SET @middle_last = CONCAT(@middle,'.',@last_name);
        SET @middle_second = CONCAT(@middle,'.',@second_last);
        SET @name_last_2 = CONCAT(@name,'.',MID(@last_name,1,RANDOM_ID(2,@last_name)));

		IF USER_NO_EXIST(@name_last) THEN
			SET @shortName = MID(@name_last,1,16);
		ELSEIF LENGTH(@second_last) && USER_NO_EXIST(@name_second_last) THEN
			SET @shortName = MID(@name_second_last,1,16);
		ELSEIF LENGTH(@middle) && USER_NO_EXIST(@name_middle) THEN
			SET @shortName = MID(@name_middle,1,16);
		ELSEIF LENGTH(@middle) && USER_NO_EXIST(@middle_last) THEN
			SET @shortName = MID(@middle_last,1,16);
		ELSEIF LENGTH(@middle) && LENGTH(@second_last) && USER_NO_EXIST(@middle_second) THEN
			SET @shortName = MID(@middle_second,1,16);
		ELSE
			SET @shortName = MID(@name_last_2,1,16);
		END IF;

		IF SUBSTRING(@shortName,16) = '.' THEN
			SET @shortName = TRIM(TRAILING '.' FROM @shortName);
		END IF;

		SET @user = CONCAT(@shortName, '.',RANDOM_ID(1,''));

        WHILE ((SELECT COUNT(*) FROM bbox_login.bbox_users WHERE user = @user AND is_active = 1)>0) DO
			SET @user = CONCAT(@shortName, '.',RANDOM_ID());
		END WHILE;

		INSERT INTO bbox_login.bbox_users
        (user,
        id_creator,
        id_modifier,
        dt_last_modifier)
        VALUES
        (@user,
        id_modifier,
		id_modifier,
        NOW());

        SELECT user
        FROM bbox_login.bbox_users
        WHERE user = @user;

	WHEN case_type = MODIFY_USER THEN
		SET @user_id = SPLIT_STR_PARAM(data_value,"|-|",1);
		SET @new_password = SPLIT_STR_PARAM(data_value,"|-|",2);

        UPDATE bbox_login.bbox_users
        SET
        user_password = @new_password,
        id_modifier = id_modifier,
	    dt_last_modifier =NOW()
        WHERE id_user = @user_id;

	WHEN case_type = DELETE_USER THEN
		SET @user_id = SPLIT_STR_PARAM(data_value,"|-|",1);

		UPDATE bbox_login.bbox_users
        SET
        is_active = 0,
		id_modifier = id_modifier,
        dt_last_modifier = NOW()
        WHERE id_user = @user_id;

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

-- Dump completed on 2018-02-14 13:45:48
