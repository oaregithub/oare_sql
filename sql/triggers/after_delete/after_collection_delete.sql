CREATE TRIGGER after_collection_delete
AFTER DELETE
ON `collection` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"collection",`old`.`uuid`,concat("prim_archive¦",COALESCE(`old`.`name`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END