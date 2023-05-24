CREATE DEFINER=`oare`@`%` PROCEDURE `bib_props_no_pages`(IN item_uuid CHAR(36), bib_uuid CHAR(36))
BEGIN
    SET @new_uuid := UUID();

    INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES 
	(@new_uuid,item_uuid,NULL,NULL,"4cff300e-4541-49c9-b77c-fb2c06d4835a","18f55a96-173a-11ec-8b77-024de1c1cc1d",NULL,"Bibliographic reference"),
	(UUID(),item_uuid,@new_uuid,'1','b3938276-173b-11ec-8b77-024de1c1cc1d',NULL,bib_uuid,NULL);
   END