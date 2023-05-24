CREATE PROCEDURE `add_properties`(IN this_uuid CHAR(36),IN prop_type INT)
BEGIN
	DECLARE OAREAn_SyntAn, PhrFlav_NomPhr, PhrFlav_AmountDes, PhrFlav_SpecDes CHAR(36) DEFAULT NULL;
	DECLARE exist1, exist3 BOOL DEFAULT FALSE; 
	SET @new_property_uuid := UUID();
	SET @new_property_uuid1 := UUID();
	SET @new_property_uuid2 := UUID();

    IF (prop_type IN (1,2,3)) THEN 
		SELECT uuid INTO OAREAn_SyntAn FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "b0e447c9-e5a8-e3e2-bd0b-3a998ace801d" AND value_uuid = "ef87ffac-259c-810a-8870-ef7515bb93c2";
		SELECT uuid INTO PhrFlav_NomPhr FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "d4e822ea-7804-f9b6-d54f-9cd9aacf9860" AND value_uuid = "e08ce6db-0514-29fb-cec4-48c18c0e1cfe";
		SELECT uuid INTO PhrFlav_AmountDes FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "d4e822ea-7804-f9b6-d54f-9cd9aacf9860" AND value_uuid = "5221aa4e-5134-4eea-9f48-8cc37cfcc43d";
		SELECT uuid INTO PhrFlav_SpecDes FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "d4e822ea-7804-f9b6-d54f-9cd9aacf9860" AND value_uuid = "3ddfeb4e-bef9-492c-b922-0622e35471b0";

		IF (OAREAn_SyntAn IS NOT NULL) THEN
			SET @new_property_uuid := OAREAn_SyntAn;
        END IF;
        IF (PhrFlav_NomPhr IS NOT NULL) THEN
			SET @new_property_uuid1 := PhrFlav_NomPhr;
		END IF;
		IF (PhrFlav_AmountDes IS NOT NULL) THEN
			SET exist1 = TRUE;
		-- 	SET @new_property_uuid2 := PhrFlav_AmountDes;
		END IF;
		IF (PhrFlav_SpecDes IS NOT NULL) THEN
			SET exist3 = TRUE;
		-- 	SET @new_property_uuid2 := PhrFlav_SpecDes;
		END IF;

        IF (OAREAn_SyntAn IS NULL) THEN
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid,this_uuid,NULL,NULL,"b0e447c9-e5a8-e3e2-bd0b-3a998ace801d","ef87ffac-259c-810a-8870-ef7515bb93c2",NULL,"Syntactical Analysis");
		END IF;
		IF (PhrFlav_NomPhr IS NULL) THEN
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid1,this_uuid,@new_property_uuid,1,"d4e822ea-7804-f9b6-d54f-9cd9aacf9860","e08ce6db-0514-29fb-cec4-48c18c0e1cfe",NULL,"Nominal Phrase");
		END IF;
		IF ((prop_type = 1) AND (exist1 = FALSE)) THEN #amount description
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid2,this_uuid,@new_property_uuid1,2,"d4e822ea-7804-f9b6-d54f-9cd9aacf9860","5221aa4e-5134-4eea-9f48-8cc37cfcc43d",NULL,"Amount Description");
		ELSEIF ((prop_type = 3) AND (exist3 = FALSE)) THEN #specie description
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid2,this_uuid,@new_property_uuid1,2,"d4e822ea-7804-f9b6-d54f-9cd9aacf9860","3ddfeb4e-bef9-492c-b922-0622e35471b0",NULL,"Specie Description");
		END IF;
		END IF;
   END