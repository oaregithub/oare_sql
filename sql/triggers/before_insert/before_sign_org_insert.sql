CREATE TRIGGER before_sign_org_insert
BEFORE INSERT
ON `sign_org` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "sign_org");
END