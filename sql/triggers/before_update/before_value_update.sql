CREATE DEFINER=`oare`@`%` TRIGGER `before_value_update` BEFORE UPDATE ON `value` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`) VALUES ("UPDATE",SYSDATE(),"value",`old`.`uuid`);
END