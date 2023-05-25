CREATE TRIGGER before_tree_insert
BEFORE INSERT
ON `tree` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "tree");
END