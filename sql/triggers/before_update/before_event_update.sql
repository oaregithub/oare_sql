CREATE TRIGGER before_event_update
BEFORE UPDATE
ON `event` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"event",`old`.`uuid`,concat("parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦name¦",COALESCE(`old`.`name`,'NULL'),"¦event_ser_no¦",COALESCE(`old`.`event_ser_no`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END