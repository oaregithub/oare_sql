CREATE TRIGGER after_spatial_unit_delete
AFTER DELETE
ON `spatial_unit` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`) VALUES ("DELETE",SYSDATE(),"spatial_unit",`old`.`uuid`);
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
END