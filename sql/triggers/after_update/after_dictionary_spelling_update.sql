CREATE TRIGGER after_dictionary_spelling_update
AFTER UPDATE
ON `dictionary_spelling` FOR EACH ROW
BEGIN
	CALL add_dictionary_spelling_epigraphy(NEW.uuid);
END