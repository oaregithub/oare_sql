CREATE TRIGGER before_note_insert
BEFORE INSERT
ON `note` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "note");
END