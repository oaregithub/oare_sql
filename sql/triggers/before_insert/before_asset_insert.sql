CREATE TRIGGER `before_asset_insert` BEFORE INSERT ON `asset` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "asset");
END