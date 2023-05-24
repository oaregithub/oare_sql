DROP TRIGGER before_person_text_occurrences_insert;
DELIMITER //
CREATE TRIGGER before_person_text_occurrences_insert
BEFORE INSERT
ON `person_text_occurrences` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "person_text_occurrences");
END //
DELIMITER ;