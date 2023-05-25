CREATE TRIGGER before_person_delete
BEFORE DELETE
ON `person` FOR EACH ROW
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
END