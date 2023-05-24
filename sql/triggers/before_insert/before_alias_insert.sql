CREATE TRIGGER `before_alias_insert` BEFORE INSERT ON `alias` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "alias");
END