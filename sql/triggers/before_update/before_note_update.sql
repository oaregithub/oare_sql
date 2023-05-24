DROP TRIGGER before_note_update;
DELIMITER //
CREATE TRIGGER before_note_update
BEFORE UPDATE
ON `note` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"note",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦title¦",COALESCE(`old`.`title`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦primacy¦",COALESCE(`old`.`primacy`,'NULL'),"¦date¦",COALESCE(`old`.`date`,'NULL'),"¦private¦",COALESCE(`old`.`private`,'NULL'),"¦author_uuid¦",COALESCE(`old`.`author_uuid`,'NULL')));
END //
DELIMITER ;
