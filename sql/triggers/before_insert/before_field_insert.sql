CREATE DEFINER=`oare`@`%` TRIGGER `before_field_insert` BEFORE INSERT ON `field` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "field");
END