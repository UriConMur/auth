/*
-- Date: 2017-12-10 18:15
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
