CREATE DEFINER=`oare`@`%` TRIGGER `after_concept_delete` AFTER DELETE ON `concept` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"concept",`old`.`uuid`,NULL);
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END