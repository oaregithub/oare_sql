CREATE TRIGGER after_item_properties_delete
AFTER DELETE
ON `item_properties` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"item_properties",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦level¦",COALESCE(`old`.`level`,'NULL'),"¦variable_uuid¦",COALESCE(`old`.`variable_uuid`,'NULL'),"¦value_uuid¦",COALESCE(`old`.`value_uuid`,'NULL'),"¦value¦",COALESCE(`old`.`value`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END