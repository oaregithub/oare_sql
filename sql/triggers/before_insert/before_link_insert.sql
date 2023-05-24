CREATE TRIGGER `before_link_insert` BEFORE INSERT ON `link` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "link");
END