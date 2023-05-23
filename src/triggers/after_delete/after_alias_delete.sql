CREATE DEFINER=`oare`@`%` TRIGGER `after_alias_delete` AFTER DELETE ON `alias` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"alias",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦name¦",COALESCE(`old`.`name`,'NULL'),"¦name_type¦",COALESCE(`old`.`name_type`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦primacy¦",COALESCE(`old`.`primacy`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END