DROP TRIGGER before_predefinition_insert;
DELIMITER //
CREATE TRIGGER before_predefinition_insert
BEFORE INSERT
ON `predefinition` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "predefinition");
END //
DELIMITER ;