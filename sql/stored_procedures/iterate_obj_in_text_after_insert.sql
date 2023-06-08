CREATE PROCEDURE `iterate_obj_in_text_after_insert`(IN this_uuid CHAR(36))
	BEGIN
		DECLARE this_obj_in_text INT DEFAULT 0;
		DECLARE this_text_uuid CHAR(36) DEFAULT '';
		SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		UPDATE text_discourse SET obj_in_text = (obj_in_text+1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND obj_in_text >= (this_obj_in_text+1) ORDER BY obj_in_text ASC;
    END