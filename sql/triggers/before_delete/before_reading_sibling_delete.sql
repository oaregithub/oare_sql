DROP TRIGGER before_reading_sibling_delete;
DELIMITER //
CREATE TRIGGER before_reading_sibling_delete
BEFORE DELETE
ON `reading_sibling` FOR EACH ROW
BEGIN

END //
DELIMITER ;