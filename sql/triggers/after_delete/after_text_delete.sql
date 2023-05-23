CREATE DEFINER=`oare`@`%` TRIGGER `after_text_delete` AFTER DELETE ON `text` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"text",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦cdli_num¦",COALESCE(`old`.`cdli_num`,'NULL'),"¦translit_status¦",COALESCE(`old`.`translit_status`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END