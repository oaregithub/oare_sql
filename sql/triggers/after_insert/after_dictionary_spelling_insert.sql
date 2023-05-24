CREATE TRIGGER `after_dictionary_spelling_insert` AFTER INSERT ON `dictionary_spelling` FOR EACH ROW BEGIN
	CALL add_dictionary_spelling_epigraphy(NEW.uuid);
END