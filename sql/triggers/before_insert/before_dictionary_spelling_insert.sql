CREATE TRIGGER `before_dictionary_spelling_insert` BEFORE INSERT ON `dictionary_spelling` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "dictionary_spelling");
END