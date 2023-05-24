CREATE DEFINER=`oare`@`%` PROCEDURE `newFormPN`(IN new_form VARCHAR(250), ref_uuid CHAR(36))
BEGIN
    SET @new_uuidA := UUID();
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
    SET @new_uuid3 := UUID();
    SET @new_uuid4 := UUID();
    
    INSERT INTO dictionary_form (`uuid`,`reference_uuid`,`form`) VALUES (@new_uuidA, ref_uuid ,new_form);
    
    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid,@new_uuidA,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","7ef55f42-4cfc-446f-6d47-f83b725b34d5",NULL,"Parse"),
	(@new_uuid2,@new_uuidA,@new_uuid,'1','5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286','2543c975-7768-fb7b-16d8-6246d935d26b',NULL,"Noun"),
    (@new_uuid3,@new_uuidA,@new_uuid2,'2','c5a0f22a-00cd-e643-bea8-8434fca0b056','071167a8-94c6-0f0f-b654-a79b40ea4201',NULL,"Singular"),
    (@new_uuid4,@new_uuidA,@new_uuid2,'2','e0092e36-fb94-a4dc-cd04-5883ab861fd6','dd54b5af-8e97-5ee1-7662-486b8d195a86',NULL,"Nominative"),
    (UUID(),@new_uuidA,@new_uuid2,'2','e0092e36-fb94-a4dc-cd04-5883ab861fd6','e9e175d1-c1f8-b938-6c68-3846515d9387',NULL,"Genitive"),
    (UUID(),@new_uuidA,@new_uuid2,'2','e0092e36-fb94-a4dc-cd04-5883ab861fd6','5844ffb8-86e5-d516-69c3-21df50cce115',NULL,"Accusative"),
    (UUID(),@new_uuidA,@new_uuid2,'2','1c1ea525-b0ad-2ec0-b833-297c7779985c','6b5c796b-cab6-4796-0855-8bd8bbb59597',NULL,"Status Rectus");
    
   END