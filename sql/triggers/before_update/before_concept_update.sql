CREATE DEFINER=`oare`@`%` TRIGGER `before_concept_update` BEFORE UPDATE ON `concept` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"concept",`old`.`uuid`,NULL);
END