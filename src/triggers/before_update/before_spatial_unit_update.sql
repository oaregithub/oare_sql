CREATE DEFINER=`oare`@`%` TRIGGER `before_spatial_unit_update` BEFORE UPDATE ON `spatial_unit` FOR EACH ROW BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`) VALUES ("UPDATE",SYSDATE(),"spatial_unit",`old`.`uuid`);
END