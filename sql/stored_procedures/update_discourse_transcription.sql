CREATE PROCEDURE `update_discourse_transcription`(IN this_discourse_uuid CHAR(36))
BEGIN
        DECLARE new_spell_uuid, possible_spelling_uuid CHAR(36) DEFAULT NULL;
		DECLARE old_transcription, new_transcription, new_type, new_explicit_spelling VARCHAR(250) CHARSET utf8mb4 DEFAULT '';
        DECLARE new_spelling_count INT DEFAULT NULL;
		
        SELECT uuid INTO new_spell_uuid FROM dictionary_spelling WHERE uuid IN (SELECT spelling_uuid FROM text_discourse WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci);
        SELECT transcription INTO old_transcription FROM text_discourse WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
        SELECT form INTO new_transcription FROM dictionary_form WHERE uuid = (SELECT reference_uuid FROM dictionary_spelling WHERE uuid = CONVERT(new_spell_uuid USING latin1) COLLATE latin1_swedish_ci);
		SELECT spelling_uuid INTO new_spell_uuid FROM text_discourse WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
        SELECT `type` INTO new_type FROM text_discourse WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT COUNT(explicit_spelling) INTO new_spelling_count FROM dictionary_spelling WHERE explicit_spelling = new_explicit_spelling GROUP BY explicit_spelling;
		SELECT uuid INTO possible_spelling_uuid FROM dictionary_spelling WHERE explicit_spelling = new_explicit_spelling GROUP BY explicit_spelling;
        IF ((new_spell_uuid = '') OR (new_type = 'number')) THEN
			UPDATE text_discourse SET transcription = NULL WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;        
		ELSEIF (new_type = 'region') THEN
            UPDATE text_discourse SET transcription = old_transcription WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci; 
        ELSE
			IF (new_transcription != old_transcription) THEN
			    IF (new_transcription = '') THEN
				    UPDATE text_discourse SET transcription = NULL WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci; 
                ELSE
                    UPDATE text_discourse SET transcription = new_transcription WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci; 
                END IF;
            END IF;
		END IF;
        IF (new_spelling_count = 1) THEN
			UPDATE text_discourse SET spelling_uuid = possible_spelling_uuid, transcription = new_transcription WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci; 
		ELSE 
			UPDATE text_discourse SET spelling_uuid = NULL, transcription = NULL WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci; 
        END IF;
END