CREATE TRIGGER before_hierarchy_update
BEFORE UPDATE
ON `hierarchy` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"hierarchy",`old`.`uuid`,concat("type",COALESCE(`old`.`type`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦role¦",COALESCE(`old`.`role`,'NULL'),"¦published¦",COALESCE(`old`.`published`,'NULL'),"¦hierarchy_uuid¦",COALESCE(`old`.`object_uuid`,'NULL'),"¦hierarchy_parent_uuid¦",COALESCE(`old`.`obj_parent_uuid`,'NULL')));
END