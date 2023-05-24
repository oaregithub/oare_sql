CREATE TRIGGER `before_person_insert` BEFORE INSERT ON `person` FOR EACH ROW BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "person");
END