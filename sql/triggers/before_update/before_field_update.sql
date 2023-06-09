CREATE TRIGGER before_field_update
BEFORE UPDATE
ON `field` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"field",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦type¦",COALESCE(`old`.`type`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦primacy¦",COALESCE(`old`.`primacy`,'NULL'),"¦field¦",COALESCE(`old`.`field`,'NULL')));
END