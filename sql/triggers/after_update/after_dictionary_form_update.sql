DROP TRIGGER after_dictionary_form_update;
DELIMITER //
CREATE TRIGGER after_dictionary_form_update
AFTER UPDATE
ON `dictionary_form` FOR EACH ROW
BEGIN
	CALL `update_trns_on_form_update`(NEW.form, NEW.uuid);
END //
DELIMITER ;