CREATE TRIGGER after_resource_delete
AFTER DELETE
ON `resource` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"resource",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦format¦",COALESCE(`old`.`format`,'NULL'),"¦link¦",COALESCE(`old`.`link`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END