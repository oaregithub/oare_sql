CREATE DEFINER=`oare`@`%` PROCEDURE `lemma_POS_properties`(IN this_uuid CHAR(36), pos_uuid CHAR(36), pos varchar(250))
BEGIN
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
    SET @new_uuid3 := UUID();
    
    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,level,variable_uuid,value_uuid,object_uuid,value) VALUES 
	(@new_uuid,this_uuid,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","8a6062db-8a6b-f102-98aa-9fa5989bd0a5",NULL,"Lemma"),
	(UUID(),this_uuid,@new_uuid,"1","11be11d9-f2e8-e12b-520d-88d7f653b746",pos_uuid,NULL,pos);

   END