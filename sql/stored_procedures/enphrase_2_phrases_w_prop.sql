CREATE PROCEDURE `enphrase_2_phrases_w_prop`(IN this_uuid CHAR(36), IN that_uuid CHAR(36), IN prop_type INT)
BEGIN
       DECLARE this_obj_in_text, that_obj_in_text, max_td_id, this_child_num, that_child_num INT DEFAULT 0;
	DECLARE this_parent_uuid, that_parent_uuid, this_text_uuid, that_text_uuid, this_tree_uuid, that_tree_uuid, new_phrase_uuid CHAR(36) DEFAULT '';
       DECLARE this_type, that_type VARCHAR(60) DEFAULT '';
	SET @new_phrase_uuid := UUID();
       SET @new_property_uuid := UUID();
	SET @new_property_uuid1 := UUID();
	SET @new_property_uuid2 := UUID();	 
	SELECT `type` INTO this_type FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT `type` INTO that_type FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT obj_in_text INTO that_obj_in_text FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT parent_uuid INTO that_parent_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT text_uuid INTO that_text_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT tree_uuid INTO this_tree_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT tree_uuid INTO that_tree_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT MAX(id) INTO max_td_id FROM text_discourse;
	SELECT `child_num` INTO this_child_num FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
    SELECT `child_num` INTO that_child_num FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	
	IF this_type = 'phrase'
		AND that_type = 'phrase'
		AND this_text_uuid = that_text_uuid
		AND this_parent_uuid = that_parent_uuid
		AND this_tree_uuid = that_tree_uuid
	    AND this_child_num = that_child_num-1
	THEN
        CALL `iterate_obj_in_text_inclusive_insert`(this_uuid);
        CALL `iterate_child_num_on_delete`(this_uuid);
		INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`) VALUES (@new_phrase_uuid, 'phrase', this_obj_in_text, this_child_num, this_text_uuid, this_tree_uuid, this_parent_uuid);
		UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '1' WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '2' WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
        IF (prop_type = 1) THEN #amount description
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid,@new_phrase_uuid,NULL,NULL,"b0e447c9-e5a8-e3e2-bd0b-3a998ace801d","ef87ffac-259c-810a-8870-ef7515bb93c2",NULL,"Syntactical Analysis");
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid1,@new_phrase_uuid,@new_property_uuid,1,"d4e822ea-7804-f9b6-d54f-9cd9aacf9860","e08ce6db-0514-29fb-cec4-48c18c0e1cfe",NULL,"Nominal Phrase");
			INSERT INTO `item_properties` (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`object_uuid`,`value`) VALUES (@new_property_uuid2,@new_phrase_uuid,@new_property_uuid1,2,"d4e822ea-7804-f9b6-d54f-9cd9aacf9860","5221aa4e-5134-4eea-9f48-8cc37cfcc43d",NULL,"Amount Description");
		    	SET FOREIGN_KEY_CHECKS = 0;
		    	DELETE ip1.*
				FROM `item_properties` AS ip1
				WHERE reference_uuid IN (SELECT reference_uuid
					FROM (SELECT reference_uuid 
						FROM item_properties 
							WHERE reference_uuid IN
							(CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci, CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci) 
							AND ((variable_uuid = "b0e447c9-e5a8-e3e2-bd0b-3a998ace801d" AND value_uuid = "e08ce6db-0514-29fb-cec4-48c18c0e1cfe") OR (variable_uuid = "b0e447c9-e5a8-e3e2-bd0b-3a998ace801d" AND value_uuid = "ef87ffac-259c-810a-8870-ef7515bb93c2") OR (variable_uuid = "d4e822ea-7804-f9b6-d54f-9cd9aacf9860" AND value_uuid = "5221aa4e-5134-4eea-9f48-8cc37cfcc43d")))
				AS ip2);
		    	SET FOREIGN_KEY_CHECKS = 1;
		END IF;
	END IF;
   END