DROP TRIGGER after_sign_delete;
DELIMITER //
CREATE TRIGGER after_sign_delete
AFTER DELETE
ON `sign` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"sign",`old`.`uuid`,concat("name¦",COALESCE(`old`.`name`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END //
DELIMITER ;