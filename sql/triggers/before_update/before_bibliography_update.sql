CREATE TRIGGER before_bibliography_update
BEFORE UPDATE
ON `bibliography` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"asset",`old`.`uuid`,concat("zot_item_key¦",COALESCE(`old`.`zot_item_key`,'NULL'),"¦short_cit¦",COALESCE(`old`.`short_cit`,'NULL')));
END