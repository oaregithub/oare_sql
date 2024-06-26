CREATE TRIGGER before_dictionary_word_delete
BEFORE DELETE
ON `dictionary_word` FOR EACH ROW
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM dictionary_form WHERE dictionary_form.reference_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.object_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
END