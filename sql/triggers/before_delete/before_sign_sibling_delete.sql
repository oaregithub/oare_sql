CREATE TRIGGER before_sign_sibling_delete
BEFORE DELETE
ON `sign_sibling` FOR EACH ROW
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.object_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
END