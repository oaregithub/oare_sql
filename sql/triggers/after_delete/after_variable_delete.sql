DROP TRIGGER after_variable_delete;
DELIMITER //
CREATE TRIGGER after_variable_delete
AFTER DELETE
ON `variable` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"variable",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL')));
	DELETE FROM uuid 
WHERE
    uuid.uuid = `old`.uuid;
END //
DELIMITER ;
