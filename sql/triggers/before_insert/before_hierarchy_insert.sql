CREATE TRIGGER before_hierarchy_insert
BEFORE INSERT
ON `hierarchy` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "hierarchy");
END