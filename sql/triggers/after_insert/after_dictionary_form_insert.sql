CREATE DEFINER=`oare`@`%` TRIGGER `after_dictionary_form_insert` AFTER INSERT ON `dictionary_form` FOR EACH ROW BEGIN
	CALL `update_trns_on_form_update`(NEW.form, NEW.uuid);
END