CREATE DEFINER=`oare`@`%` TRIGGER `before_resource_update` BEFORE UPDATE ON `resource` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"resource",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦format¦",COALESCE(`old`.`format`,'NULL')));
END