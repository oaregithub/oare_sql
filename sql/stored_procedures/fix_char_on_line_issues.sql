DROP PROCEDURE `fix_char_on_line_issues`;
DELIMITER //
CREATE PROCEDURE fix_char_on_line_issues()
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, this_discourse_uuid, previous_parent_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type CHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line, num, iter INT DEFAULT 0;
        DECLARE this_order_num DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur1 CURSOR FOR 
			SELECT te1.uuid, te1.text_uuid, te1.parent_uuid, te1.`type`, te1.object_on_tablet, te1.char_on_tablet, te1.char_on_line, te1.discourse_uuid FROM text_epigraphy AS te1
			WHERE te1.text_uuid NOT IN (SELECT text_uuid FROM text_epigraphy 
			WHERE discourse_uuid IS NOT NULL
			GROUP BY discourse_uuid, char_on_line
			HAVING COUNT(char_on_line) > 1
			ORDER BY COUNT(char_on_line) DESC)
			AND parent_uuid IN (SELECT uuid FROM text_epigraphy WHERE `type` = "line")
			ORDER BY parent_uuid, char_on_line;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line, this_discourse_uuid;
			IF done THEN
				LEAVE read_loop;
			END IF;
			IF (this_parent_uuid != previous_parent_uuid) THEN 
				SET num = 0;
            END IF;
            SET num = num+1;
            IF (this_char_on_line != num) THEN
				-- SELECT this_uuid, this_text_uuid, this_parent_uuid, this_object_on_tablet, this_char_on_line, num;
				UPDATE text_epigraphy SET char_on_line = num WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
                SET iter = iter+1;
            END IF;
            SET previous_parent_uuid = this_parent_uuid;
       END LOOP;
		CLOSE cur1;
        SELECT iter AS `number of instances corrected`;
    END //
DELIMITER ;