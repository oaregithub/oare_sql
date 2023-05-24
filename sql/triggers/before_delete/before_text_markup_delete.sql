CREATE DEFINER=`oare`@`%` TRIGGER `before_text_markup_delete` BEFORE DELETE ON `text_markup` FOR EACH ROW BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
END