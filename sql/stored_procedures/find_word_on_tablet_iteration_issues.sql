DROP PROCEDURE `find_word_on_tablet_iteration_issues`;
DELIMITER //
CREATE PROCEDURE find_word_on_tablet_iteration_issues() 
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_text_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_obj_in_text, this_word_on_tablet, this_child_num, previous_wot INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR SELECT uuid, text_uuid, parent_uuid, `type`, obj_in_text, word_on_tablet, child_num FROM text_discourse WHERE `type` IN ("word","number","region") ORDER BY text_uuid, word_on_tablet;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_word_on_tablet, this_child_num;
			IF done THEN
			LEAVE read_loop;
			END IF;
			IF (previous_text_uuid IS NULL) THEN
				SET previous_wot = 0;
			ELSEIF (previous_text_uuid != this_text_uuid) THEN
				SET previous_wot = 0;
            END IF;
            IF (this_word_on_tablet != previous_wot+1) THEN
				INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,objectOnTabletORobjInText,charOnTabletORwordOnTablet,charOnLineORchildNum,previous,affected_column) VALUES (this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_word_on_tablet, this_child_num, previous_wot, "word_on_tablet");
            END IF;
		SET previous_wot = this_word_on_tablet;
        SET previous_text_uuid = this_text_uuid;
		END LOOP;
		CLOSE cur1;
    END //
DELIMITER ;