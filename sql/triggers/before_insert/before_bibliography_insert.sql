CREATE TRIGGER `before_bibliography_insert` BEFORE INSERT ON `bibliography` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "bibliography");
END