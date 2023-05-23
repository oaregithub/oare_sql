CREATE DEFINER=`oare`@`%` TRIGGER `after_dictionary_spelling_delete` AFTER DELETE ON `dictionary_spelling` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"dictionary_spelling",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦spelling¦",COALESCE(`old`.`spelling`,'NULL'),"¦explicit_spelling¦",COALESCE(`old`.`explicit_spelling`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
	DELETE FROM dictionary_spelling_epigraphy WHERE reference_uuid = `old`.uuid;
END