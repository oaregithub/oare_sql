CREATE PROCEDURE `split_prepositions`(IN this_id INT)
BEGIN
	   DECLARE ct1 INT DEFAULT 4;
       DECLARE ct2, max1, max2, prep_object_on_tablet, exist_obj_in_text, exist_child_num, exist_word_on_tablet INT DEFAULT 0;
       DECLARE exist_id, max_td_id, te_id INT DEFAULT 0;
	   DECLARE df_uuid, new_spell_uuid, prep_spell_uuid, exist_uuid, exist_text_uuid, exist_tree_uuid, exist_parent_uuid CHAR(36) DEFAULT '';
       DECLARE exist_explicit_spelling, new_explicit_spelling, prep_explicit_spelling, new_form, exist_type VARCHAR(60) DEFAULT '';
		
       /* SELECT MAX(id) INTO max1 FROM temp_prep_split; */
       SET max1 = 4;
       SET SQL_SAFE_UPDATES=0;
       SET FOREIGN_KEY_CHECKS = 0;
       WHILE ct1 <= max1 DO

			SET ct2 = 1;
			SELECT explicit_spelling INTO exist_explicit_spelling FROM temp_prep_split WHERE id=ct1;
			SELECT new_explicit_spelling INTO new_explicit_spelling FROM temp_prep_split WHERE id=ct1;
			SELECT prep_expl_spell INTO prep_explicit_spelling FROM temp_prep_split WHERE id=ct1;
			SELECT form INTO new_form FROM temp_prep_split WHERE id=ct1;
			SELECT df_uuid INTO df_uuid FROM temp_prep_split WHERE id=ct1;
			SELECT count INTO max2 FROM temp_prep_split WHERE id=ct1;
			SELECT uuid INTO new_spell_uuid FROM dictionary_spelling WHERE reference_uuid = df_uuid AND explicit_spelling = new_explicit_spelling;
            SELECT uuid INTO prep_spell_uuid FROM dictionary_spelling WHERE explicit_spelling = prep_explicit_spelling;

           WHILE ct2 <= max2 DO
                 -- gather information on target row
				SELECT id INTO exist_id FROM text_discourse WHERE explicit_spelling = exist_explicit_spelling AND spelling_uuid IS NULL LIMIT 1;
				SELECT uuid INTO exist_uuid FROM text_discourse WHERE id = exist_id;
				SELECT `type` INTO exist_type FROM text_discourse WHERE id = exist_id;
				SELECT obj_in_text INTO exist_obj_in_text FROM text_discourse WHERE id = exist_id;
				SELECT word_on_tablet INTO exist_word_on_tablet FROM text_discourse WHERE id = exist_id;
				SELECT child_num INTO exist_child_num FROM text_discourse WHERE id = exist_id;
				SELECT text_uuid INTO exist_text_uuid FROM text_discourse WHERE id = exist_id;
				SELECT tree_uuid INTO exist_tree_uuid FROM text_discourse WHERE id = exist_id;
				SELECT parent_uuid INTO exist_parent_uuid FROM text_discourse WHERE id = exist_id;
                SELECT MAX(id) INTO max_td_id FROM text_discourse;
				
				-- INSERT phrase row with same parent_uuid as existing word
                CALL `oarebyue_0.3`.`iterate_obj_in_text_before_insert`(exist_uuid);
                SET @new_phrase_uuid := UUID(); 
			    INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`) VALUES (@new_phrase_uuid, 'phrase', exist_obj_in_text, exist_child_num, exist_text_uuid, exist_tree_uuid, exist_parent_uuid);
				-- INSERT the preposition
                CALL `oarebyue_0.3`.`iterate_obj_in_text_before_insert`(exist_uuid);
                CALL `oarebyue_0.3`.`iterate_word_on_tablet_before_insert`(exist_uuid);
                SET @prep_uuid := UUID();
				INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`word_on_tablet`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`,`spelling_uuid`,`explicit_spelling`,`transcription`) 
                                  VALUES (@prep_uuid, 'word', exist_obj_in_text+1, exist_word_on_tablet, '1', exist_text_uuid, exist_tree_uuid, @new_phrase_uuid, prep_spell_uuid, prep_explicit_spelling, prep_explicit_spelling);
                  	-- UPDATE the original row to no longer have the preposition and update spelling_uuid
                UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '2', explicit_spelling = new_explicit_spelling, spelling_uuid = new_spell_uuid, transcription = new_form WHERE id = exist_id;
               -- UPDATE text_epigraphy to reassign discourse_uuid -- no need to do damage because that is all epigraphy!
			    SELECT MIN(object_on_tablet) INTO prep_object_on_tablet FROM text_epigraphy WHERE discourse_uuid = exist_uuid;
                SELECT id INTO te_id FROM text_epigraphy WHERE discourse_uuid = exist_uuid AND object_on_tablet = prep_object_on_tablet;
				UPDATE text_epigraphy SET discourse_uuid = @prep_uuid WHERE id = te_id;
			
				
               SET ct2 = ct2+1;
               END WHILE;
			
           SET ct1 = ct+1;
           END WHILE;
	   SET SQL_SAFE_UPDATES=1;
       SET FOREIGN_KEY_CHECKS = 1;
   END