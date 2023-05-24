CREATE PROCEDURE `add_InactivePerson_properties_NoConnect`(IN this_uuid CHAR(36))
BEGIN

	SET @new_property_uuid := UUID();
	SET @new_property_uuid1 := UUID();

	INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid,this_uuid,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","b3040ef6-7fc3-44b5-942d-a46d7e1c1241",NULL,"Prosopographic Analysis");
	INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid1,this_uuid,@new_property_uuid,1,"f5853716-9280-4120-aa22-1799ce946b64",NULL,NULL,NULL);
   END