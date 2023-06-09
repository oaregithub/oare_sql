CREATE PROCEDURE `text_discourse_iterate_inclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		DECLARE this_child_num, this_word_on_tablet, this_obj_in_text INT DEFAULT 0;
		DECLARE this_text_uuid, this_parent_uuid CHAR(36) DEFAULT '';

		SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT child_num INTO this_child_num FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT word_on_tablet INTO this_word_on_tablet FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		
        IF (this_word_on_tablet != 0) THEN
		UPDATE text_discourse SET word_on_tablet = (word_on_tablet+1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND word_on_tablet IS NOT NULL AND word_on_tablet >= this_word_on_tablet ORDER BY obj_in_text ASC;
		END IF;
        UPDATE text_discourse SET child_num = (child_num+1) WHERE parent_uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci AND child_num >= this_child_num ORDER BY obj_in_text ASC;
		UPDATE text_discourse SET obj_in_text = (obj_in_text+1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND obj_in_text >= this_obj_in_text ORDER BY obj_in_text ASC;
    END