CREATE DEFINER=`oare`@`%` TRIGGER `after_sign_org_delete` AFTER DELETE ON `sign_org` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"sign_org",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦org_num¦",COALESCE(`old`.`org_num`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END