CREATE TRIGGER `before_archive_insert` BEFORE INSERT ON `archive` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "archive");
END