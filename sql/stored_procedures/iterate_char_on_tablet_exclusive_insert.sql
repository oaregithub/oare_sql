CREATE PROCEDURE `iterate_char_on_tablet_exclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		DECLARE this_char_on_tablet INT DEFAULT 0;
		DECLARE this_text_uuid CHAR(36) DEFAULT '';
		DECLARE parent_type VARCHAR(250) DEFAULT '';
		SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT `type` INTO parent_type FROM text_epigraphy WHERE uuid IN (SELECT parent_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci); 
		SELECT char_on_tablet INTO this_char_on_tablet FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		UPDATE text_epigraphy SET char_on_tablet = (char_on_tablet+1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND parent_type = "line" AND char_on_tablet >= (this_char_on_tablet+1) AND uuid != CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci ORDER BY object_on_tablet ASC;
    END