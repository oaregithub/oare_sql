CREATE TRIGGER before_reading_sibling_insert
BEFORE INSERT
ON `reading_sibling` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "reading_sibling");
END