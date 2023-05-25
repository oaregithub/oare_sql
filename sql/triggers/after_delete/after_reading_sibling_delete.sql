CREATE TRIGGER after_reading_sibling_delete
AFTER DELETE
ON `reading_sibling` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"reading_sibling",`old`.`uuid`,concat("rdg_uuid¦",COALESCE(`old`.`rdg_uuid`,'NULL'),"¦sibling_uuid¦",COALESCE(`old`.`sibling_uuid`,'NULL'),"¦sibling_relation¦",COALESCE(`old`.`sibling_relation`,'NULL'),"¦sequence¦",COALESCE(`old`.`sequence`,'NULL'),"¦sequence_order¦",COALESCE(`old`.`sequence_order`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END