CREATE TRIGGER `before_dictionary_spelling_epigraphy_insert` BEFORE INSERT ON `dictionary_spelling_epigraphy` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "dictionary_spelling_epigraphy");
END