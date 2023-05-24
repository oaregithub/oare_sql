DROP TRIGGER before_period_insert;
DELIMITER //
CREATE TRIGGER before_period_insert
BEFORE INSERT
ON `period` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "period");
END //
DELIMITER ;