DROP PROCEDURE `fix_obj_in_text_iteration_issues_supplement_2`;
DELIMITER //
CREATE PROCEDURE fix_obj_in_text_iteration_issues_supplement_2()
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_uuid, previous_text_uuid, previous_parent_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_obj_in_text, this_word_on_tablet, this_child_num, iter, eval INT DEFAULT 0;
        DECLARE this_order_num, comp DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur3 CURSOR FOR 
			SELECT uuid, text_uuid, parent_uuid, `type`, obj_in_text, order_num, word_on_tablet, child_num FROM temp_result_table ORDER BY text_uuid, order_num;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        OPEN cur3;
		read_loop: LOOP
		FETCH cur3 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_order_num, this_word_on_tablet, this_child_num;
			IF done THEN
				LEAVE read_loop;
			END IF;
			IF (this_text_uuid != previous_text_uuid) THEN
				SET iter = 0;
            END IF;
            SET iter = iter+1;
            IF (this_obj_in_text != iter) THEN
				UPDATE text_discourse SET obj_in_text = iter WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
			END IF;
            SET previous_text_uuid = this_text_uuid;
		END LOOP;
		CLOSE cur3;
    END //
DELIMITER ;