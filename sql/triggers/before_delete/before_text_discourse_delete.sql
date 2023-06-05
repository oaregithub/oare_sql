CREATE TRIGGER before_text_discourse_delete
BEFORE DELETE
ON `text_discourse` FOR EACH ROW
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
	DELETE FROM item_properties WHERE item_properties.object_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
    UPDATE item_properties SET object_uuid = (SELECT uuid FROM text_discourse WHERE uuid IN (SELECT uuid FROM text_discourse WHERE text_uuid IN (SELECT text_uuid FROM text_discourse WHERE uuid = `old`.uuid) AND `type` = "discourseUnit")) WHERE object_uuid = `old`.uuid;
    UPDATE link SET reference_uuid = (SELECT uuid FROM text_discourse WHERE uuid IN (SELECT uuid FROM text_discourse WHERE text_uuid IN (SELECT text_uuid FROM text_discourse WHERE uuid = `old`.uuid) AND `type` = "discourseUnit")) WHERE reference_uuid = `old`.uuid;
    DELETE FROM field WHERE field.reference_uuid = `old`.uuid;
	DELETE FROM alias WHERE alias.reference_uuid = `old`.uuid;
END