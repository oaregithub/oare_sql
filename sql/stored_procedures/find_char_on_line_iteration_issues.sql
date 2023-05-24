DROP PROCEDURE `find_char_on_line_iteration_issues`;
DELIMITER //
CREATE PROCEDURE find_char_on_line_iteration_issues() 
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_parent_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line, previous_col  INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR SELECT uuid, text_uuid, parent_uuid, `type`, object_on_tablet, char_on_tablet, char_on_line FROM text_epigraphy WHERE parent_uuid IN (SELECT uuid FROM text_epigraphy WHERE `type` = "line") ORDER BY parent_uuid, char_on_line;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line;
			IF done THEN
			LEAVE read_loop;
			END IF;
			IF (previous_parent_uuid IS NULL) THEN
				SET previous_col = 0;
			ELSEIF (previous_parent_uuid != this_parent_uuid) THEN
				SET previous_col = 0;
            END IF;
            IF (this_char_on_line != previous_col+1) THEN
				-- SELECT this_uuid, this_parent_uuid, this_text_uuid, this_char_on_line, previous_col;
				INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,objectOnTabletORobjInText,charOnTabletORwordOnTablet,charOnLineORchildNum,previous,affected_column) VALUES (this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line, previous_col, "char_on_line");
            END IF;
		SET previous_col = this_char_on_line;
        SET previous_parent_uuid = this_parent_uuid;
		END LOOP;
		CLOSE cur1;
    END //
DELIMITER ;