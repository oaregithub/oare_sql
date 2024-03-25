CREATE TRIGGER before_sign_sibling_update
BEFORE UPDATE
ON `sign_sibling` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"sign_sibling",`old`.`uuid`,concat("sign_uuid¦",COALESCE(`old`.`sign_uuid`,'NULL'),"¦sibling_uuid¦",COALESCE(`old`.`sibling_uuid`,'NULL'),"¦gestalt¦",COALESCE(`old`.`gestalt`,'NULL'),"¦leading¦",COALESCE(`old`.`leading`,'NULL'),"¦trailing¦",COALESCE(`old`.`trailing`,'NULL'),"¦upper¦",COALESCE(`old`.`upper`,'NULL'),"¦lower¦",COALESCE(`old`.`lower`,'NULL'),"¦mid¦",COALESCE(`old`.`mid`,'NULL'),"¦component¦",COALESCE(`old`.`component`,'NULL')));
END