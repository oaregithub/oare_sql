CREATE TRIGGER after_dictionary_spelling_epigraphy_delete
AFTER DELETE
ON `dictionary_spelling_epigraphy` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"dictionary_spelling_epigraphy",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦sign_spell_num¦",COALESCE(`old`.`sign_spell_num`,'NULL'),"¦reading_uuid¦",COALESCE(`old`.`reading_uuid`,'NULL'),"¦reading¦",COALESCE(`old`.`reading`,'NULL'),"¦sign_uuid¦",COALESCE(`old`.`sign_uuid`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END