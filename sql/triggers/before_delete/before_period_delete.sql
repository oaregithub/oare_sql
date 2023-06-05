
CREATE TRIGGER before_period_delete
BEFORE DELETE
ON `period` FOR EACH ROW
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.object_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
END