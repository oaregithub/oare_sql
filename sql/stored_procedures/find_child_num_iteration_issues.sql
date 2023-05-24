DROP PROCEDURE `find_child_num_iteration_issues`;
DELIMITER //
CREATE PROCEDURE find_child_num_iteration_issues() 
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_parent_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_obj_in_text, this_word_on_tablet, this_child_num, previous_child_num  INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR SELECT uuid, text_uuid, parent_uuid, `type`, obj_in_text, word_on_tablet, child_num FROM text_discourse WHERE parent_uuid IN (SELECT DISTINCT parent_uuid FROM text_discourse) ORDER BY parent_uuid, child_num;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_word_on_tablet, this_child_num;
			IF done THEN
			LEAVE read_loop;
			END IF;
			IF (previous_parent_uuid IS NULL) THEN
				SET previous_child_num = 0;
			ELSEIF (previous_parent_uuid != this_parent_uuid) THEN
				SET previous_child_num = 0;
            END IF;
            IF (this_child_num != previous_child_num+1) THEN
				-- SELECT this_uuid, this_parent_uuid, this_text_uuid, this_child_num, previous_child_num;
                INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,objectOnTabletORobjInText,charOnTabletORwordOnTablet,charOnLineORchildNum,previous,affected_column) VALUES (this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_word_on_tablet, this_child_num, previous_child_num, "child_num");
			END IF;
		SET previous_child_num = this_child_num;
        SET previous_parent_uuid = this_parent_uuid;
		END LOOP;
		CLOSE cur1;
    END //
DELIMITER ;