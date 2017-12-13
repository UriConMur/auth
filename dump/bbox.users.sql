/*
-- 1.-Creation of the user table AND
*/

CREATE TABLE IF NOT EXISTS `bbox2.0`.`bbox.users` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(98) NOT NULL DEFAULT '$argon2i$v=19$m=1024,t=2,p=2$ZWl2WlkwSmMvS2hyN0tqVQ$klDVUlGrEHa8mivm53Pn+jlTumwp8FECnPSM6GtePgI',
  `is_active` TINYINT(4) NULL DEFAULT '1',
  `is_removed` TINYINT(4) NULL DEFAULT '0',
  `dt_last_activity` DATETIME NULL DEFAULT NULL,
  `id_creator` INT(11) NOT NULL DEFAULT '0',
  `dt_creator` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `user_UNIQUE` (`user` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8

INSERT INTO `bbox.users` (`id_user`,`user`,`user_password`,`is_active`,`is_removed`,`dt_last_activity`,`id_creator`,`dt_creator`) VALUES (1,'paola.martinez.678','$argon2i$v=19$m=1024,t=2,p=2$ZWl2WlkwSmMvS2hyN0tqVQ$klDVUlGrEHa8mivm53Pn+jlTumwp8FECnPSM6GtePgI',1,0,'2017-12-10 00:00:00',102345,'0000-00-00 00:00:00');
INSERT INTO `bbox.users` (`id_user`,`user`,`user_password`,`is_active`,`is_removed`,`dt_last_activity`,`id_creator`,`dt_creator`) VALUES (2,'paola.martinez','$argon2i$v=19$m=1024,t=2,p=2$ZWl2WlkwSmMvS2hyN0tqVQ$klDVUlGrEHa8mivm53Pn+jlTumwp8FECnPSM6GtePgI',1,0,NULL,0,'0000-00-00 00:00:00');


/*
-- 2.-This SP is used by sp_login_user_get.sql
*/

CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR_PARAM`(x TEXT, delim VARCHAR(12),pos INT) RETURNS text CHARSET utf8
RETURN REPLACE
	(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
	LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
	delim, '');

/*
-- 3.- this SP will be used for all the actions required by this APP,
--case 2 is to confirm that the user exists in the database,
-- if the user exists the return is 1, otherwise is 0.
*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user_get`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

CASE
	WHEN case_type = 2 #This case get username and password, check its existence in bbox.users table
	THEN
		SET @user = SPLIT_STR_PARAM(data_value,"|-|",1);
        SET @password = SPLIT_STR_PARAM(data_value,"|-|",2);

		IF((SELECT COUNT(*) FROM `bbox.users` WHERE user LIKE @user AND user_password LIKE @password)=1) THEN
            UPDATE `bbox.users` SET is_active = 1 WHERE user LIKE @user;
            UPDATE `bbox.users` SET dt_last_activity = CURDATE() WHERE user LIKE @user;
            SET @login =1;
		ELSE
            SET @login = 0;
		END IF;

        SELECT @login;
END CASE;
END
