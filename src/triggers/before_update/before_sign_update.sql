CREATE DEFINER=`oare`@`%` TRIGGER `before_sign_update` BEFORE UPDATE ON `sign` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"sign",`old`.`uuid`,concat("name¦",COALESCE(`old`.`name`,'NULL')));
END