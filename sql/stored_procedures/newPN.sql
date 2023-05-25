CREATE PROCEDURE `newPN`(IN new_name VARCHAR(250), gender CHAR(1), lang VARCHAR(250))
BEGIN
	DECLARE lang_uuid CHAR(36);
    SET @new_uuidA := UUID();
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
    SET @new_uuid3 := UUID();
    SET @new_uuid4 := UUID();
    SET lang_uuid = (SELECT v.uuid FROM value v INNER JOIN hierarchy h ON h.object_uuid = v.uuid WHERE v.name = lang AND h.obj_parent_uuid = 'bdd3aa3e-b68d-11ec-bcc3-0282f921eac9');
    
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
	(UUID(),@new_uuidA,@new_uuid,'1','4b9577f1-fc26-4a22-bfa3-7fba017f7a0e',lang_uuid,NULL,lang);
END IF;

   END   