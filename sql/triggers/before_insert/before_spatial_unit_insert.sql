CREATE TRIGGER before_spatial_unit_insert
BEFORE INSERT
ON `spatial_unit` FOR EACH ROW
BEGIN
	INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "spatial_unit");
END
