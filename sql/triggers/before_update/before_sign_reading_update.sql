DROP TRIGGER before_sign_reading_update;
DELIMITER //
CREATE TRIGGER before_sign_reading_update
BEFORE UPDATE
ON `sign_reading` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"sign_reading",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦reading¦",COALESCE(`old`.`reading`,'NULL'),"¦value¦",COALESCE(`old`.`value`,'NULL'),"¦frequency¦",COALESCE(`old`.`frequency`,'NULL')));
END //
DELIMITER ;