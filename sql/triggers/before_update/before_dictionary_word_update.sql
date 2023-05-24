CREATE TRIGGER `before_dictionary_word_update` BEFORE UPDATE ON `dictionary_word` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"dictionary_word",`old`.`uuid`,concat("word¦",COALESCE(`old`.`word`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL')));
END