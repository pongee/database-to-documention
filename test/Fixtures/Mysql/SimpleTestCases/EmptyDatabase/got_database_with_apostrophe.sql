/*
CREATE TABLE user (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id),
  KEY idx_actor_last_name (last_name)
) engine=innodb DEFAULT charset=utf8;
*/

--CREATE TABLE IF NOT EXISTS `developer` (
--`id` INT(10) UNSIGNED NOT NULL
--) engine=innodb DEFAULT charset=utf8;