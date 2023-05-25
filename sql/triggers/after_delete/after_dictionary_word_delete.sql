CREATE TRIGGER after_dictionary_word_delete
AFTER DELETE
ON `dictionary_word` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"dictionary_word",`old`.`uuid`,concat("word¦",COALESCE(`old`.`word`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END