CREATE TRIGGER before_text_discourse_update
BEFORE UPDATE
ON `text_discourse` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"text_discourse",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦child_num¦",COALESCE(`old`.`child_num`,'NULL'),"¦word_on_tablet¦",COALESCE(`old`.`word_on_tablet`,'NULL'),"¦text_uuid¦",COALESCE(`old`.`text_uuid`,'NULL'),"¦tree_uuid¦",COALESCE(`old`.`tree_uuid`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦spelling_uuid¦",COALESCE(`old`.`spelling_uuid`,'NULL'),"¦spelling¦",COALESCE(`old`.`spelling`,'NULL'),"¦explicit_spelling¦",COALESCE(`old`.`explicit_spelling`,'NULL'),"¦transcription¦",COALESCE(`old`.`transcription`,'NULL')));
END