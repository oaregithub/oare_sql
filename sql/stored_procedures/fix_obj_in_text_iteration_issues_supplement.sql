CREATE PROCEDURE `fix_obj_in_text_iteration_issues_supplement`()
BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_uuid, previous_text_uuid, previous_parent_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_obj_in_text, this_word_on_tablet, this_child_num, iter, eval INT DEFAULT 0;
        DECLARE this_order_num, comp DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur2 CURSOR FOR 
			SELECT uuid, text_uuid, parent_uuid, `type`, obj_in_text, order_num, word_on_tablet, child_num FROM temp_result_table ORDER BY text_uuid, order_num;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        OPEN cur2;
		read_loop: LOOP
		FETCH cur2 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_order_num, this_word_on_tablet, this_child_num;
			IF done THEN
				IF (eval = 1) THEN
					SET eval = 0;
					CALL fix_obj_in_text_iteration_issues_supplement;
				ELSE 
					LEAVE read_loop;
				END IF;
			END IF;
        
           --  SELECT this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_order_num, this_word_on_tablet, this_child_num;
			IF (this_order_num LIKE "%.9__") THEN
				SET comp = (SELECT MIN(order_num) FROM temp_result_table WHERE parent_uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci ORDER BY obj_in_text);
				IF (comp < this_order_num) THEN
					SET eval = 1;
					SET this_order_num = comp-0.001;
                    UPDATE temp_result_table SET order_num = this_order_num WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
				END IF;
			END IF;
		END LOOP;
		CLOSE cur2;
    END