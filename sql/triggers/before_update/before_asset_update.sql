CREATE TRIGGER before_asset_update
BEFORE UPDATE
ON `asset` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"asset",`old`.`uuid`,concat("prim_archive¦",COALESCE(`old`.`prim_archive`,'NULL'),"¦asset_ser_no¦",COALESCE(`old`.`asset_ser_no`,'NULL')));
END