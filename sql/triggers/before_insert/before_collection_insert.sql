CREATE TRIGGER before_collection_insert
BEFORE INSERT
ON `collection` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "collection");
END