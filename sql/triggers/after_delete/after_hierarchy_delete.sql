CREATE DEFINER=`oare`@`%` TRIGGER `after_hierarchy_delete` AFTER DELETE ON `hierarchy` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"hierarchy",`old`.`uuid`,concat("type",COALESCE(`old`.`type`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦role¦",COALESCE(`old`.`role`,'NULL'),"¦published¦",COALESCE(`old`.`published`,'NULL'),"¦object_uuid¦",COALESCE(`old`.`object_uuid`,'NULL'),"¦obj_parent_uuid¦",COALESCE(`old`.`obj_parent_uuid`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END