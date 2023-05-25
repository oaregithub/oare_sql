CREATE TRIGGER `after_text_markup_delete` 
AFTER DELETE 
ON `text_markup` FOR EACH ROW 
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"text_markup",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦num_value¦",COALESCE(`old`.`num_value`,'NULL'),"¦alt_reading_uuid¦",COALESCE(`old`.`alt_reading_uuid`,'NULL'),"¦alt_reading¦",COALESCE(`old`.`alt_reading`,'NULL'),"¦start_char¦",COALESCE(`old`.`start_char`,'NULL'),"¦end_char¦",COALESCE(`old`.`end_char`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END