CREATE TRIGGER before_dictionary_spelling_update
BEFORE UPDATE
ON `dictionary_spelling` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"dictionary_spelling",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦spelling¦",COALESCE(`old`.`spelling`,'NULL'),"¦explicit_spelling¦",COALESCE(`old`.`explicit_spelling`,'NULL')));
END