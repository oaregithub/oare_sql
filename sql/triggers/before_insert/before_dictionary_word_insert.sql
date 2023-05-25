CREATE TRIGGER before_dictionary_word_insert
BEFORE INSERT
ON `dictionary_word` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "dictionary_word");
END