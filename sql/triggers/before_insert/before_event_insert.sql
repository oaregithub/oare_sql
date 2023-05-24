DROP TRIGGER before_event_insert;
DELIMITER //
DELIMITER //
CREATE TRIGGER before_event_insert
BEFORE INSERT
ON `event` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "event");
END //
DELIMITER ;