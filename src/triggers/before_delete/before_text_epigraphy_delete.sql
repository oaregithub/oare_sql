CREATE DEFINER=`oare`@`%` TRIGGER `before_text_epigraphy_delete` BEFORE DELETE ON `text_epigraphy` FOR EACH ROW BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM item_properties WHERE item_properties.reference_uuid = `old`.uuid;
    SET FOREIGN_KEY_CHECKS=1;
    DELETE FROM text_markup WHERE reference_uuid = `old`.uuid;
    DELETE FROM alias WHERE alias.reference_uuid = `old`.uuid;
END