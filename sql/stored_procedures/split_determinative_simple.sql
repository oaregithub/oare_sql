CREATE PROCEDURE `split_determinative_simple`(IN that_td_id INT, IN this_te_id INT, IN this_df_uuid CHAR(36), 
	this_explicit_spell VARCHAR(60), that_explicit_spell VARCHAR(60), that_spell_uuid CHAR(36))
BEGIN
        
       DECLARE that_obj_in_text, that_child_num, that_word_on_tablet INT DEFAULT 0;
	   DECLARE new_spell_uuid, this_spell_uuid, that_uuid, that_text_uuid, that_tree_uuid, that_parent_uuid CHAR(36) DEFAULT '';
       DECLARE that_explicit_spelling, new_explicit_spelling, prep_explicit_spelling, that_form, that_type VARCHAR(60) DEFAULT '';

		SET SQL_SAFE_UPDATES=0;
		SET FOREIGN_KEY_CHECKS=0;
                 -- gather information on target row
			SELECT uuid INTO that_uuid FROM text_discourse WHERE id = that_td_id;
			SELECT `type` INTO that_type FROM text_discourse WHERE id = that_td_id;
			SELECT obj_in_text INTO that_obj_in_text FROM text_discourse WHERE id = that_td_id;
			SELECT word_on_tablet INTO that_word_on_tablet FROM text_discourse WHERE id = that_td_id;
			SELECT child_num INTO that_child_num FROM text_discourse WHERE id = that_td_id;
			SELECT text_uuid INTO that_text_uuid FROM text_discourse WHERE id = that_td_id;
			SELECT tree_uuid INTO that_tree_uuid FROM text_discourse WHERE id = that_td_id;
			SELECT parent_uuid INTO that_parent_uuid FROM text_discourse WHERE id = that_td_id;
            SELECT uuid INTO this_spell_uuid FROM dictionary_spelling WHERE explicit_spelling = this_explicit_spell;
				
				-- INSERT phrase row with same parent_uuid as thating word
			CALL `oarebyue_0.3`.`iterate_obj_in_text_before_insert`(that_uuid);
			SET @new_phrase_uuid := UUID(); 
			INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`) VALUES (@new_phrase_uuid, 'phrase', that_obj_in_text, that_child_num, that_text_uuid, that_tree_uuid, that_parent_uuid);
				-- INSERT the preposition
		    CALL `oarebyue_0.3`.`iterate_obj_in_text_before_insert`(that_uuid);
			CALL `oarebyue_0.3`.`iterate_word_on_tablet_before_insert`(that_uuid); 
			SET @prep_uuid := UUID();
			INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`word_on_tablet`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`,`explicit_spelling`) 
						VALUES (@prep_uuid, 'word', that_obj_in_text+1, that_word_on_tablet, '1', that_text_uuid, that_tree_uuid, @new_phrase_uuid, this_explicit_spell);
			   -- UPDATE the original row to no longer have the preposition and update spelling_uuid
			UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '2', explicit_spelling = that_explicit_spell, spelling_uuid = that_spell_uuid WHERE id = that_td_id;
               -- UPDATE text_epigraphy to reassign discourse_uuid -- no need to do damage because that is all epigraphy!
			UPDATE text_epigraphy SET discourse_uuid = @prep_uuid WHERE id = this_te_id;
		SET SQL_SAFE_UPDATES=1;
		SET FOREIGN_KEY_CHECKS=1;
   END