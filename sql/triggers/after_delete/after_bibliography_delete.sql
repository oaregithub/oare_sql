CREATE TRIGGER after_bibliography_delete
AFTER DELETE
ON `bibliography` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"asset",`old`.`uuid`,concat("zot_item_key¦",COALESCE(`old`.`zot_item_key`,'NULL'),"¦short_cit¦",COALESCE(`old`.`short_cit`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END