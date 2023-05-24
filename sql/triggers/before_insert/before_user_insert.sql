DROP TRIGGER before_user_insert;
DELIMITER //
CREATE TRIGGER before_user_insert
BEFORE INSERT
ON `user` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "user");
END //
DELIMITER ;