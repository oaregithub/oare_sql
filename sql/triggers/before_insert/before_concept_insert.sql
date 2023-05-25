CREATE TRIGGER before_concept_insert
BEFORE INSERT
ON `concept` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "concept");
END