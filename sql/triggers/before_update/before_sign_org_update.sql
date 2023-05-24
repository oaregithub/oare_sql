DROP TRIGGER before_sign_org_update;
DELIMITER //
CREATE TRIGGER before_sign_org_update
BEFORE UPDATE
ON `sign_org` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"sign_org",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦org_num¦",COALESCE(`old`.`org_num`,'NULL')));
END //
DELIMITER ;