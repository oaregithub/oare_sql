CREATE TRIGGER `before_sign_insert` BEFORE INSERT ON `sign` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "sign");
END