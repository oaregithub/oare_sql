CREATE TRIGGER `before_value_insert` BEFORE INSERT ON `value` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "value");
END