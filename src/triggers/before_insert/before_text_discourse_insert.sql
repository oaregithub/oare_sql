CREATE DEFINER=`oare`@`%` TRIGGER `before_text_discourse_insert` BEFORE INSERT ON `text_discourse` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "text_discourse");
END