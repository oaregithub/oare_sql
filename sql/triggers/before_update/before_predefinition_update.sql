CREATE TRIGGER before_predefinition_update
BEFORE UPDATE
ON `predefinition` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`) VALUES ("UPDATE",SYSDATE(),"predefinition",`old`.`uuid`);
END