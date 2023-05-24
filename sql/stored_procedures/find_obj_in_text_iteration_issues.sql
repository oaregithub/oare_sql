CREATE PROCEDURE `find_obj_in_text_iteration_issues`()
BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_text_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_obj_in_text, this_word_on_tablet, this_child_num, previous_oit  INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR SELECT uuid, text_uuid, parent_uuid, `type`, obj_in_text, word_on_tablet, child_num FROM text_discourse ORDER BY text_uuid, obj_in_text;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_word_on_tablet, this_child_num;
			IF done THEN
			LEAVE read_loop;
			END IF;
			IF (previous_text_uuid IS NULL) THEN
				SET previous_oit = 0;
			ELSEIF (previous_text_uuid != this_text_uuid) THEN
				SET previous_oit = 0;
            END IF;
            IF (this_obj_in_text != previous_oit+1) THEN
				INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,objectOnTabletORobjInText,charOnTabletORwordOnTablet,charOnLineORchildNum,previous,affected_column) VALUES (this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_word_on_tablet, this_child_num, previous_oit, "obj_in_text");
               --  SELECT this_uuid, this_text_uuid, this_obj_in_text, previous_oit;
			END IF;
		SET previous_oit = this_obj_in_text;
        SET previous_text_uuid = this_text_uuid;
		END LOOP;
		CLOSE cur1;
    END