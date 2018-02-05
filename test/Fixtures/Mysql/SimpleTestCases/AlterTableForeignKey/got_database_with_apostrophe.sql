CREATE TABLE user (
  `user_id` INT(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (user_id)
);

CREATE TABLE log (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `userId` INT(10) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE `log`
	ADD CONSTRAINT `FK_log_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`user_id`);
