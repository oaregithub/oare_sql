CREATE PROCEDURE `bibliography_properties`(IN this_uuid CHAR(36), this_object_uuid CHAR(36), start_page varchar(250), end_page varchar(250))
BEGIN
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
    SET @new_uuid3 := UUID();
    
IF (end_page = NULL) THEN 
    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid,this_uuid,NULL,NULL,"4cff300e-4541-49c9-b77c-fb2c06d4835a","18f55a96-173a-11ec-8b77-024de1c1cc1d",NULL,"Bibliographic reference"),
	(UUID(),this_uuid,@new_uuid,'1','b3938276-173b-11ec-8b77-024de1c1cc1d',NULL,this_object_uuid,NULL),
	(@new_uuid2,this_uuid,@new_uuid,'1','b3a2c705-173b-11ec-8b77-024de1c1cc1d','d77b99ff-173c-11ec-8b77-024de1c1cc1d',NULL,'Begin'),
    (UUID(),this_uuid,@new_uuid2,'2','b3b2fe05-173b-11ec-8b77-024de1c1cc1d',NULL,NULL,start_page);	
ELSE
	INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid,this_uuid,NULL,NULL,"4cff300e-4541-49c9-b77c-fb2c06d4835a","18f55a96-173a-11ec-8b77-024de1c1cc1d",NULL,"Bibliographic reference"),
	(UUID(),this_uuid,@new_uuid,'1','b3938276-173b-11ec-8b77-024de1c1cc1d',NULL,this_object_uuid,NULL),
	(@new_uuid2,this_uuid,@new_uuid,'1','b3a2c705-173b-11ec-8b77-024de1c1cc1d','d77b99ff-173c-11ec-8b77-024de1c1cc1d',NULL,'Begin'),
    (@new_uuid3,this_uuid,@new_uuid,'1','b3a2c705-173b-11ec-8b77-024de1c1cc1d','d789fc46-173c-11ec-8b77-024de1c1cc1d',NULL,'End'),
    (UUID(),this_uuid,@new_uuid2,'2','b3b2fe05-173b-11ec-8b77-024de1c1cc1d',NULL,NULL,start_page),
    (UUID(),this_uuid,@new_uuid3,'2','b3b2fe05-173b-11ec-8b77-024de1c1cc1d',NULL,NULL,end_page);
END IF;
   END