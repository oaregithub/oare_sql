CREATE DEFINER=`oare`@`%` TRIGGER `after_field_delete` AFTER DELETE ON `field` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"field",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦primacy¦",COALESCE(`old`.`primacy`,'NULL'),"¦field¦",COALESCE(`old`.`field`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END