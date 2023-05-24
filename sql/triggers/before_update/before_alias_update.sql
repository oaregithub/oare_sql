DROP TRIGGER before_alias_update;
DELIMITER //
CREATE TRIGGER before_alias_update
BEFORE UPDATE
ON `alias` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"alias",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦name¦",COALESCE(`old`.`name`,'NULL'),"¦name_type¦",COALESCE(`old`.`name_type`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦language¦",COALESCE(`old`.`primacy`,'NULL')));
END //
DELIMITER ;