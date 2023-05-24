CREATE PROCEDURE `NewLFS_PN`(IN new_name VARCHAR(250), gender CHAR(1), lang VARCHAR(250), new_form VARCHAR(250), new_spelling VARCHAR(250))
BEGIN
	DECLARE lang_uuid CHAR(36);
    SET @new_uuidA := UUID();
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
    SET @new_uuid3 := UUID();
    SET @new_uuid4 := UUID();
    SET lang_uuid = (SELECT v.uuid FROM value AS v INNER JOIN hierarchy AS h ON h.object_uuid = v.uuid WHERE v.name = lang AND h.obj_parent_uuid = 'bdd3aa3e-b68d-11ec-bcc3-0282f921eac9');
    
    SET @new_uuid_formA := UUID();
    SET @new_uuid_form := UUID();
    SET @new_uuid_form2 := UUID();
    SET @new_uuid_form3 := UUID();
    SET @new_uuid_form4 := UUID();
    
    SET @new_uuid_spellA := UUID();
    
    INSERT INTO dictionary_word (`uuid`,`word`,`type`) VALUES (@new_uuidA, new_name, 'PN');
    
    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid,@new_uuidA,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","8a6062db-8a6b-f102-98aa-9fa5989bd0a5",NULL,"Lemma"),
	(@new_uuid2,@new_uuidA,@new_uuid,'1','11be11d9-f2e8-e12b-520d-88d7f653b746','2543c975-7768-fb7b-16d8-6246d935d26b',NULL,"Noun"),
    (@new_uuid3,@new_uuidA,@new_uuid2,'2','11be11d9-f2e8-e12b-520d-88d7f653b746','45ba95f5-951c-e524-94a1-9c3028c1352b',NULL,"Proper noun"),
    (@new_uuid4,@new_uuidA,@new_uuid3,'3','11be11d9-f2e8-e12b-520d-88d7f653b746','9ffdc924-953b-d695-3230-abc990884992',NULL,"Personal name");
 
IF (gender = 'm') THEN
	INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(UUID(),@new_uuidA,@new_uuid2,'2','46c78931-2cb6-5d45-3049-f9903dc4177e','2f66a05b-87f6-0cbc-b778-5dde673616ac',NULL,'Masculine');
END IF;

IF (gender = 'f') THEN
	INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(UUID(),@new_uuidA,@new_uuid2,'2','46c78931-2cb6-5d45-3049-f9903dc4177e','d501f42b-62d1-a4cf-a6d3-15e5048a9134',NULL,'Feminine');
END IF;

IF (lang != 'NULL') THEN
	INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
 	(UUID(),@new_uuidA,@new_uuid,'1','5cf077ed-b68f-11ec-bcc3-0282f921eac9',lang_uuid,NULL,lang);
END IF;

    INSERT INTO dictionary_form (`uuid`,`reference_uuid`,`form`) VALUES (@new_uuid_formA, @new_uuidA ,new_form);
    
    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid_form,@new_uuid_formA,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","7ef55f42-4cfc-446f-6d47-f83b725b34d5",NULL,"Parse"),
	(@new_uuid_form2,@new_uuid_formA,@new_uuid_form,'1','5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286','2543c975-7768-fb7b-16d8-6246d935d26b',NULL,"Noun"),
    (@new_uuid_form3,@new_uuid_formA,@new_uuid_form2,'2','c5a0f22a-00cd-e643-bea8-8434fca0b056','071167a8-94c6-0f0f-b654-a79b40ea4201',NULL,"Singular"),
    (@new_uuid_form4,@new_uuid_formA,@new_uuid_form2,'2','e0092e36-fb94-a4dc-cd04-5883ab861fd6','dd54b5af-8e97-5ee1-7662-486b8d195a86',NULL,"Nominative"),
    (UUID(),@new_uuid_formA,@new_uuid_form2,'2','e0092e36-fb94-a4dc-cd04-5883ab861fd6','e9e175d1-c1f8-b938-6c68-3846515d9387',NULL,"Genitive"),
    (UUID(),@new_uuid_formA,@new_uuid_form2,'2','e0092e36-fb94-a4dc-cd04-5883ab861fd6','5844ffb8-86e5-d516-69c3-21df50cce115',NULL,"Accusative"),
    (UUID(),@new_uuid_formA,@new_uuid_form2,'2','1c1ea525-b0ad-2ec0-b833-297c7779985c','6b5c796b-cab6-4796-0855-8bd8bbb59597',NULL,"Status Rectus");
    
    INSERT INTO dictionary_spelling (`uuid`,`reference_uuid`,`spelling`,`explicit_spelling`) VALUES (@new_uuid_spellA, @new_uuid_formA, NULL, new_spelling);
    
    SET FOREIGN_KEY_CHECKS=0;
    SET SQL_SAFE_UPDATES=0;
    UPDATE text_discourse SET spelling_uuid = @new_uuid_spellA WHERE explicit_spelling = new_spelling;
    SET FOREIGN_KEY_CHECKS=1;
    SET SQL_SAFE_UPDATES=1;
    
   END