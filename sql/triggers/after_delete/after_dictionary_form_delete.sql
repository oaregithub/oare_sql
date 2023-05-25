CREATE TRIGGER after_dictionary_form_delete
AFTER DELETE
ON `dictionary_form` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"dictionary_form",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦form¦",COALESCE(`old`.`form`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END