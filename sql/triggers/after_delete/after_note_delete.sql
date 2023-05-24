CREATE TRIGGER `after_note_delete` AFTER DELETE ON `note` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"note",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦title¦",COALESCE(`old`.`title`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦primacy¦",COALESCE(`old`.`primacy`,'NULL'),"¦date¦",COALESCE(`old`.`date`,'NULL'),"¦private¦",COALESCE(`old`.`private`,'NULL'),"¦author_uuid¦",COALESCE(`old`.`author_uuid`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END