CREATE PROCEDURE `insert_sign_in_word`(IN this_discourse_uuid CHAR(36), IN this_reading VARCHAR(250), IN sign_pos INT)
BEGIN
    DECLARE min_chot, min_chol, min_objot, max_objot, this_side, this_column, this_line INT DEFAULT 0;
    DECLARE this_text_uuid,this_tree_uuid,this_parent_uuid, that_uuid CHAR(36) DEFAULT '';
    DECLARE this_type VARCHAR(250) DEFAULT '';

    SET @uuid := UUID();
    SELECT MIN(char_on_tablet)-1 INTO min_chot FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
    SELECT MIN(char_on_line)-1 INTO min_chol FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
    SELECT MIN(object_on_tablet)-1 INTO min_objot FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
    SELECT MAX(object_on_tablet) INTO max_objot FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;

    SELECT side INTO this_side FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci LIMIT 1;
    SELECT `column` INTO this_column FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci LIMIT 1;
    SELECT `line` INTO this_line FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci LIMIT 1;

    SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci LIMIT 1;
    SELECT tree_uuid INTO this_tree_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci LIMIT 1; 
    SELECT parent_uuid INTO this_parent_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci LIMIT 1; 

    IF (this_reading REGEXP ('([0-9])')) THEN
        SET this_type = 'number';
    ELSE
        SET this_type = 'sign';
    END IF;
    
    IF (sign_pos = 1) THEN
        SELECT uuid INTO that_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci AND object_on_tablet = min_objot+sign_pos;
        CALL text_epigraphy_iterate_before_insert(that_uuid);
    ELSEIF ((sign_pos+min_objot) = (max_objot+1)) THEN
        SELECT uuid INTO that_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci AND object_on_tablet = max_objot;
        CALL text_epigraphy_iterate_after_insert(that_uuid);
    ELSE
        SELECT uuid INTO that_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci AND object_on_tablet = min_objot+sign_pos;
        CALL text_epigraphy_iterate_before_insert(that_uuid);
    END IF;
    SET FOREIGN_KEY_CHECKS = 0;
    INSERT INTO text_epigraphy (uuid,`type`,text_uuid,tree_uuid,parent_uuid,object_on_tablet,side,`column`,`line`,char_on_line,char_on_tablet,reading,discourse_uuid) VALUES (@uuid,this_type,this_text_uuid,this_tree_uuid,this_parent_uuid,min_objot+sign_pos,this_side,this_column,this_line,min_chol+sign_pos,min_chot+sign_pos,this_reading,this_discourse_uuid);
	SET FOREIGN_KEY_CHECKS = 1;
    CALL update_discourse_spellings(this_discourse_uuid);
    CALL update_discourse_transcription(this_discourse_uuid);
END