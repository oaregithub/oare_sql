CREATE DEFINER=`oare`@`%` TRIGGER `before_item_properties_insert` BEFORE INSERT ON `item_properties` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "item_properties");
END