CREATE TRIGGER `after_person_delete` AFTER DELETE ON `person` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"person",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END