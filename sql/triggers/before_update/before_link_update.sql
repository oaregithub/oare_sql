CREATE DEFINER=`oare`@`%` TRIGGER `before_link_update` BEFORE UPDATE ON `link` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"link",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦obj_uuid¦",COALESCE(`old`.`obj_uuid`,'NULL')));
END