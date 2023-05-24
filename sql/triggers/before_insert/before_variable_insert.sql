DROP TRIGGER before_variable_insert;
DELIMITER //
CREATE TRIGGER before_variable_insert
BEFORE INSERT
ON `variable` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "variable");
END //
DELIMITER ;