CREATE TRIGGER `before_variable_update` BEFORE UPDATE ON `variable` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"variable",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL')));
	DELETE FROM uuid 
WHERE
    uuid.uuid = `old`.uuid;
END