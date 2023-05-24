CREATE PROCEDURE `merge_2_lemmas`(IN old_lemma CHAR(36), IN new_lemma CHAR(36))
BEGIN
	DECLARE this_type VARCHAR(15) DEFAULT '';
    DECLARE that_hertel_parent, that_special_classification, that_primary_classification CHAR(36) DEFAULT NULL;
    
    SELECT `type` INTO this_type FROM dictionary_word 
		WHERE uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci; 
    SELECT DISTINCT `parent_uuid` INTO that_hertel_parent FROM item_properties 
		WHERE reference_uuid = CONVERT(new_lemma USING latin1) COLLATE latin1_swedish_ci 
        AND variable_uuid = "6248061a-7b31-44af-8ca2-1dee06270252"; 
	SELECT DISTINCT `uuid` INTO that_special_classification FROM item_properties 
		WHERE reference_uuid = CONVERT(new_lemma USING latin1) COLLATE latin1_swedish_ci 
        AND variable_uuid = "69ed2768-ad6a-52c4-9a0e-b780e46bddff"; 
    SELECT DISTINCT `uuid` INTO that_primary_classification FROM item_properties 
		WHERE reference_uuid = CONVERT(new_lemma USING latin1) COLLATE latin1_swedish_ci 
        AND variable_uuid = "859939fd-bdf6-fa7b-fa93-3f42207e1005" AND value_uuid = "8a6062db-8a6b-f102-98aa-9fa5989bd0a5"; 
    
    SET FOREIGN_KEY_CHECKS = 0;

	IF (this_type = 'PN') THEN
		IF (that_primary_classification IS NULL) THEN
			SET @prim_class_uuid := UUID();
			SET @spec_class_uuid := UUID();
			INSERT INTO item_properties 
				(uuid,reference_uuid,parent_uuid,`level`,variable_uuid,value_uuid,object_uuid,`value`) 
					VALUES 
						(@prim_class_uuid,new_lemma,NULL,NULL,
                        "859939fd-bdf6-fa7b-fa93-3f42207e1005",
                        "8a6062db-8a6b-f102-98aa-9fa5989bd0a5",
                        NULL,"Lemma");
			INSERT INTO item_properties 
				(uuid,reference_uuid,parent_uuid,`level`,variable_uuid,value_uuid,object_uuid,`value`) 
					VALUES 
						(@spec_class_uuid,new_lemma,@prim_class_uuid,1,
                        "69ed2768-ad6a-52c4-9a0e-b780e46bddff",
                        "8bb88aaf-3d9e-40db-a9b9-f152ff1f2500",
                        NULL,"Indexing Data");
			UPDATE item_properties 
				SET reference_uuid = new_lemma, parent_uuid = @spec_class_uuid 
                WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci 
                AND variable_uuid = "6248061a-7b31-44af-8ca2-1dee06270252";
        ELSEIF (that_special_classification IS NULL) THEN
			SET @spec_class_uuid := UUID();
			INSERT INTO item_properties 
				(uuid,reference_uuid,parent_uuid,`level`,variable_uuid,value_uuid,object_uuid,`value`) 
					VALUES 
						(@spec_class_uuid,new_lemma,that_primary_classification,1,
                        "69ed2768-ad6a-52c4-9a0e-b780e46bddff",
                        "8bb88aaf-3d9e-40db-a9b9-f152ff1f2500",
                        NULL,"Indexing Data");
			UPDATE item_properties 
				SET reference_uuid = new_lemma, parent_uuid = @spec_class_uuid 
				WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci 
					AND variable_uuid = "6248061a-7b31-44af-8ca2-1dee06270252";
		ELSE
			UPDATE item_properties 
				SET reference_uuid = new_lemma, parent_uuid = that_hertel_parent 
                WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci 
					AND variable_uuid = "6248061a-7b31-44af-8ca2-1dee06270252";
		END IF;
	END IF;

	UPDATE dictionary_form 
		SET reference_uuid = new_lemma 
		WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE period
		SET official1PN_uuid = new_lemma
        WHERE official1PN_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE period
		SET official2PN_uuid = new_lemma
        WHERE official2PN_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE period
		SET official1PTR_PN_uuid = new_lemma
        WHERE official1PTR_PN_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE period
		SET official2PTR_PN_uuid = new_lemma
        WHERE official2PTR_PN_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE person
		SET name_uuid = new_lemma
        WHERE name_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE person
		SET relation_name_uuid = new_lemma
        WHERE relation_name_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE link 
		SET reference_uuid = new_lemma 
		WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	UPDATE threads
		SET reference_uuid = new_lemma 
		WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM item_properties 
		WHERE reference_uuid = 	CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM alias 
		WHERE reference_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM hierarchy 
		WHERE object_uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
    DELETE FROM dictionary_word 
		WHERE uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM dictionary_word 
		WHERE uuid = CONVERT(old_lemma USING latin1) COLLATE latin1_swedish_ci;
        
	SET FOREIGN_KEY_CHECKS = 1;
   END