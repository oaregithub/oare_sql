DROP PROCEDURE `merge_2_words`;
DELIMITER $$
CREATE PROCEDURE `merge_2_words`(IN this_uuid CHAR(36), IN that_uuid CHAR(36))
BEGIN
DECLARE this_obj_in_text, that_obj_in_text, this_word_on_tablet, that_word_on_tablet INT DEFAULT 0;
DECLARE this_text_uuid, this_tree_uuid, this_parent_uuid, that_text_uuid, that_tree_uuid, that_parent_uuid CHAR(36) DEFAULT '';
DECLARE this_type, that_type, this_explicit_spelling, that_explicit_spelling VARCHAR(250) DEFAULT '';

		SELECT `type` INTO this_type FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT `type` INTO that_type FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT explicit_spelling INTO this_explicit_spelling FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT explicit_spelling INTO that_explicit_spelling FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT text_uuid INTO that_text_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT tree_uuid INTO this_tree_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;  
        SELECT tree_uuid INTO that_tree_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;  
		SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT parent_uuid INTO that_parent_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT obj_in_text INTO that_obj_in_text FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT word_on_tablet INTO this_word_on_tablet FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        SELECT word_on_tablet INTO that_word_on_tablet FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 

        IF this_type IN ('word', 'number') 
        AND that_type IN ('word', 'number')
		AND this_text_uuid = that_text_uuid
		AND this_tree_uuid = that_tree_uuid
        AND this_word_on_tablet = that_word_on_tablet-1
        THEN
            UPDATE text_epigraphy SET discourse_uuid = this_uuid WHERE discourse_uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
            CALL update_discourse_spellings(this_uuid);
            CALL update_discourse_transcription(this_uuid);
            CALL `text_discourse_iterate_on_delete`(that_uuid);
            DELETE FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci; 
        END IF;
END $$
DELIMITER ;