CREATE PROCEDURE `iterate_char_on_line_exclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		DECLARE this_char_on_line INT DEFAULT 0;
		DECLARE this_parent_uuid CHAR(36) DEFAULT '';
		SELECT parent_uuid INTO this_parent_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		IF ((SELECT `type` FROM text_epigraphy WHERE uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci) = 'line') THEN
			SELECT char_on_line INTO this_char_on_line FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
			UPDATE text_epigraphy SET char_on_line = (char_on_line+1) WHERE parent_uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci AND char_on_line IS NOT NULL AND char_on_line >= (this_char_on_line+1) AND uuid != this_uuid  ORDER BY object_on_tablet ASC;
		END IF;
    END