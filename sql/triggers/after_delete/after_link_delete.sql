CREATE TRIGGER after_link_delete
AFTER DELETE
ON `link` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"link",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦obj_uuid¦",COALESCE(`old`.`obj_uuid`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END