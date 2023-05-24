CREATE TRIGGER `after_predefinition_delete` AFTER DELETE ON `predefinition` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`) VALUES ("DELETE",SYSDATE(),"predefinition",`old`.`uuid`);
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END