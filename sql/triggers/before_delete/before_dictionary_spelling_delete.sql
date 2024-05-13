CREATE TRIGGER before_dictionary_spelling_delete
BEFORE DELETE
ON `dictionary_spelling` FOR EACH ROW
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	UPDATE text_discourse SET spelling_uuid = NULL, transcription = NULL WHERE text_discourse.spelling_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.object_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
END