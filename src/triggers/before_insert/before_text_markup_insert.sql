CREATE DEFINER=`oare`@`%` TRIGGER `before_text_markup_insert` BEFORE INSERT ON `text_markup` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "text_markup");
END