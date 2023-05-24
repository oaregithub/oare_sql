CREATE TRIGGER `before_period_update` BEFORE UPDATE ON `period` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"period",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦tree_uuid¦",COALESCE(`old`.`tree_uuid`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL')));
END