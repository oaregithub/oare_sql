DROP TRIGGER before_asset_update;
DELIMITER //
CREATE TRIGGER before_asset_update
BEFORE UPDATE
ON `asset` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"asset",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦sign_spell_num¦",COALESCE(`old`.`sign_spell_num`,'NULL'),"¦reading_uuid¦",COALESCE(`old`.`reading_uuid`,'NULL'),"¦reading¦",COALESCE(`old`.`reading`,'NULL'),"¦sign_uuid¦",COALESCE(`old`.`sign_uuid`,'NULL')));
END //
DELIMITER ;