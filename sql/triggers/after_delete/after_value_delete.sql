CREATE TRIGGER `after_value_delete` AFTER DELETE ON `value` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`) VALUES ("DELETE",SYSDATE(),"value",`old`.`uuid`);
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END