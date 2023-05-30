CREATE TRIGGER before_collection_update
BEFORE UPDATE
ON `collection` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"collection",`old`.`uuid`,concat("name",COALESCE(`old`.`name`,'NULL')));
END