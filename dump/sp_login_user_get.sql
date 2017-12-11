CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user_get`(IN case_type INT, IN data_value TEXT, IN id_modifier INT)
BEGIN

CASE
	WHEN case_type = 2 #Get username and password, check its existence in bbox.users table
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