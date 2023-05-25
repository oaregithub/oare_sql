CREATE TRIGGER after_asset_delete
AFTER DELETE
ON `asset` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"asset",`old`.`uuid`,concat("prim_archive¦",COALESCE(`old`.`prim_archive`,'NULL'),"¦asset_ser_no¦",COALESCE(`old`.`asset_ser_no`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END