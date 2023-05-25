CREATE PROCEDURE `mrg_det`(this_td_id VARCHAR(64))
BEGIN
	DECLARE that_num, this_rdg, new_rdg, new_explicit_spelling, new_form VARCHAR(36);
    DECLARE that_td_id, this_te_id, this_wot, spell_ct INT;
    DECLARE this_text, this_td_uuid, that_td_uuid, spell_uuid, new_rdg_uuid CHAR(36);
    DECLARE flag BOOL DEFAULT FALSE;
    
    SELECT text_uuid INTO this_text FROM text_discourse WHERE id = this_td_id;
    SELECT uuid INTO this_td_uuid FROM text_discourse WHERE id = this_td_id;
    SELECT id INTO this_te_id FROM text_epigraphy WHERE discourse_uuid  = this_td_uuid;
    SELECT word_on_tablet INTO this_wot FROM text_discourse WHERE id = this_td_id;
    SELECT id INTO that_td_id FROM text_discourse WHERE text_uuid = this_text AND word_on_tablet = this_wot+1;
    SELECT uuid INTO that_td_uuid FROM text_discourse WHERE id = that_td_id;
    SELECT reading INTO this_rdg FROM text_epigraphy WHERE id = this_te_id;
    
		UPDATE text_epigraphy SET discourse_uuid = that_td_uuid WHERE id = this_te_id;
        SET new_rdg = CONCAT("(",this_rdg,")"); 
        UPDATE text_epigraphy SET reading = new_rdg WHERE id = this_te_id;
		CALL `oarebyue_0.3`.`text_discourse_iterate_on_delete`(this_td_uuid);
		DELETE FROM text_discourse WHERE id = this_td_id;
        SELECT explicit_spelling INTO new_explicit_spelling FROM text_discourse WHERE id = that_td_id;
        SELECT COUNT(explicit_spelling) INTO spell_ct FROM dictionary_spelling WHERE explicit_spelling = new_explicit_spelling;
		IF spell_ct <=> 1 THEN
			SELECT uuid INTO spell_uuid FROM dictionary_spelling WHERE explicit_spelling = new_explicit_spelling;
            SELECT form INTO new_form FROM dictionary_form WHERE uuid = (SELECT reference_uuid FROM dictionary_spelling WHERE uuid = spell_uuid);
            UPDATE text_discourse SET spelling_uuid = spell_uuid, transcription = new_form WHERE id = that_td_id;
            CALL update_discourse_transcription(that_td_id);
        ELSE
			UPDATE text_discourse SET spelling_uuid = NULL, transcription = NULL WHERE id = that_td_id;
        END IF;
  END