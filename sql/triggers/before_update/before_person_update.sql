DROP TRIGGER before_person_update;
DELIMITER //
CREATE TRIGGER before_person_update
BEFORE UPDATE
ON `person` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"person",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL')));
END //
DELIMITER ;