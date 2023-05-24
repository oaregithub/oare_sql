CREATE DEFINER=`oare`@`%` TRIGGER `before_dictionary_form_insert` BEFORE INSERT ON `dictionary_form` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "dictionary_form");
END