DROP TRIGGER after_sign_reading_delete;
DELIMITER //
CREATE TRIGGER after_sign_reading_delete
AFTER DELETE
ON `sign_reading` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"sign_reading",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦reading¦",COALESCE(`old`.`reading`,'NULL'),"¦value¦",COALESCE(`old`.`value`,'NULL'),"¦frequency¦",COALESCE(`old`.`frequency`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END //
DELIMITER ;