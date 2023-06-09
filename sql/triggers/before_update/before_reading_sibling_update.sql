CREATE TRIGGER before_reading_sibling_update
BEFORE UPDATE
ON `reading_sibling` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"reading_sibling",`old`.`uuid`,concat("rdg_uuid¦",COALESCE(`old`.`rdg_uuid`,'NULL'),"¦sibling_uuid¦",COALESCE(`old`.`sibling_uuid`,'NULL'),"¦sibling_relation¦",COALESCE(`old`.`sibling_relation`,'NULL'),"¦sequence¦",COALESCE(`old`.`sequence`,'NULL'),"¦sequence_order¦",COALESCE(`old`.`sequence_order`,'NULL')));
END