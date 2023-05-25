CREATE PROCEDURE `CnctExprs2Person_w_Names`(IN td_uuid CHAR(36), IN PN_Uuid CHAR(36), IN rel VARCHAR(10), IN Patro_Uuid CHAR(36))
BEGIN
    DECLARE p_uuid CHAR(36);
    SET @new_uuid := UUID();
    SET @new_uuid2 := UUID();
   
	SELECT uuid INTO p_uuid FROM person WHERE name_uuid = PN_Uuid AND relation = rel AND relation_name_uuid = Patro_Uuid;
    
    INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES 
	(@new_uuid,td_uuid,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","b3040ef6-7fc3-44b5-942d-a46d7e1c1241",NULL,"Prosopographic Analysis"),
	(@new_uuid2,td_uuid,@new_uuid,'1','f5853716-9280-4120-aa22-1799ce946b64',NULL,p_uuid,NULL);
END