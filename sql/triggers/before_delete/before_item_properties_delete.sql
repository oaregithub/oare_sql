DROP TRIGGER before_item_properties_delete;
DELIMITER //
CREATE TRIGGER before_item_properties_delete
BEFORE DELETE
ON `item_properties` FOR EACH ROW
BEGIN

END //
DELIMITER ;