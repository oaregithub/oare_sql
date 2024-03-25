CREATE TRIGGER before_sign_sibling_insert
BEFORE INSERT
ON `sign_sibling` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "sign_sibling");
END