CREATE TRIGGER `before_sign_reading_insert` BEFORE INSERT ON `sign_reading` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "sign_reading");
END