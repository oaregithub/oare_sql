CREATE PROCEDURE `split_first_sign_off`(IN this_uuid CHAR(36))
BEGIN
		DECLARE this_obj_in_text, this_child_num, this_word_on_tablet, this_te_id INT DEFAULT 0;
		DECLARE this_spell_uuid, new_spell_uuid, this_text_uuid, this_tree_uuid, this_parent_uuid, sign_to_split, this_reading_uuid, this_sign_uuid, that_reading_uuid CHAR(36) DEFAULT '';
		DECLARE this_explicit_spelling, new_explicit_spelling, prep_explicit_spelling, this_type, this_sign_type, this_sign_reading VARCHAR(60) DEFAULT '';

			SELECT `type` INTO this_type FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT word_on_tablet INTO this_word_on_tablet FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT child_num INTO this_child_num FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT tree_uuid INTO this_tree_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			SELECT uuid INTO sign_to_split FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND id IN (SELECT MIN(id) FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci);
			SELECT reading_uuid INTO this_reading_uuid FROM text_epigraphy WHERE uuid = CONVERT(sign_to_split USING latin1) COLLATE latin1_swedish_ci;
            SELECT sign_uuid INTO this_sign_uuid FROM text_epigraphy WHERE uuid = CONVERT(sign_to_split USING latin1) COLLATE latin1_swedish_ci;
            SELECT reading INTO this_sign_reading FROM text_epigraphy WHERE uuid = CONVERT(sign_to_split USING latin1) COLLATE latin1_swedish_ci;
			SELECT `type` INTO this_sign_type FROM sign_reading WHERE uuid IN (SELECT reading_uuid FROM text_epigraphy WHERE uuid = CONVERT(sign_to_split USING latin1) COLLATE latin1_swedish_ci);
            
			SET @new_phrase_uuid := UUID(); 
            SET @new_uuid := UUID();
			SET FOREIGN_KEY_CHECKS=0;
			CALL `oarebyue_0.3`.`iterate_obj_in_text_inclusive_insert`(this_uuid);
			INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`)
				VALUES (@new_phrase_uuid, 'phrase', this_obj_in_text, this_child_num, this_text_uuid, this_tree_uuid, this_parent_uuid);
			CALL `oarebyue_0.3`.`iterate_obj_in_text_inclusive_insert`(this_uuid);
			CALL `oarebyue_0.3`.`iterate_word_on_tablet_inclusive_insert`(this_uuid);
			INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`word_on_tablet`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`)
				VALUES (@new_uuid, 'word', this_obj_in_text+1, this_word_on_tablet, '1', this_text_uuid, this_tree_uuid, @new_phrase_uuid);
			UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '2' WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
            UPDATE text_epigraphy SET discourse_uuid = @new_uuid WHERE uuid = CONVERT(sign_to_split USING latin1) COLLATE latin1_swedish_ci;
            
            IF (this_sign_type = "determinative") THEN
				SELECT uuid INTO that_reading_uuid FROM sign_reading WHERE `type` = "logogram" AND `value` = this_sign_reading AND reference_uuid = CONVERT(this_sign_uuid USING latin1) COLLATE latin1_swedish_ci;
				IF (that_reading_uuid != '') THEN
					UPDATE text_epigraphy SET reading_uuid = that_reading_uuid WHERE uuid = CONVERT(sign_to_split USING latin1) COLLATE latin1_swedish_ci;
					UPDATE text_discourse SET explicit_spelling = this_sign_reading WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
                END IF;
            END IF;
			SET FOREIGN_KEY_CHECKS=1;
			CALL update_discourse_spellings(@new_uuid);
			CALL update_discourse_transcription(@new_uuid);
			CALL update_discourse_spellings(this_uuid);
			CALL update_discourse_transcription(this_uuid);
   END