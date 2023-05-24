CREATE PROCEDURE `bibProp_hcpy_pl_pubnum`(IN ref_uuid CHAR(36), bib_uuid CHAR(36), start_plate varchar(250), end_plate varchar(250), pubnum varchar(250))
BEGIN
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
    
    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid,ref_uuid,NULL,NULL,"4cff300e-4541-49c9-b77c-fb2c06d4835a","18f55a96-173a-11ec-8b77-024de1c1cc1d",NULL,"Bibliographic reference"),
	(UUID(),ref_uuid,@new_uuid,'1','b3938276-173b-11ec-8b77-024de1c1cc1d',NULL,bib_uuid,NULL),
    (UUID(),ref_uuid,@new_uuid,'1','fcdb16df-37de-9e05-3ebe-024326352854','32166b84-dd0c-a346-8aee-1119b110dbaa',NULL,'Handcopy'),
	(@new_uuid2,ref_uuid,@new_uuid,'1','b3a2c705-173b-11ec-8b77-024de1c1cc1d','bdd3aa3e-b68d-11ec-bcc3-0282f921eac9',NULL,'Referring location'),
    (UUID(),ref_uuid,@new_uuid2,'2','5d42c28a-b1fe-11ec-bcc3-0282f921eac9',NULL,NULL,start_plate);

IF (end_plate != 'NULL') THEN
	INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(UUID(),ref_uuid,@new_uuid2,'2','5d600469-b1fe-11ec-bcc3-0282f921eac9',NULL,NULL,end_plate);
END IF;

IF (pubnum != 'NULL') THEN
	INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
    (UUID(),ref_uuid,@new_uuid2,'2','5d771785-b1fe-11ec-bcc3-0282f921eac9',NULL,NULL,pubnum);
END IF;

   END