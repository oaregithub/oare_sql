CREATE DEFINER=`oare`@`%` TRIGGER `before_resource_insert` BEFORE INSERT ON `resource` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "resource");
END