CREATE PROCEDURE `iterate_word_on_tablet_inclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		DECLARE this_word_on_tablet INT DEFAULT 0;
		DECLARE this_text_uuid CHAR(36) DEFAULT '';
		SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT word_on_tablet INTO this_word_on_tablet FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		-- might need to adjust logic to more explicity identify actual words			   
		UPDATE text_discourse SET word_on_tablet = (word_on_tablet+1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND word_on_tablet IS NOT NULL AND word_on_tablet >= this_word_on_tablet ORDER BY obj_in_text ASC;
    END