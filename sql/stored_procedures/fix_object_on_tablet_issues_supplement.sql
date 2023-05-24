CREATE PROCEDURE `fix_object_on_tablet_issues_supplement`()
BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, this_discourse_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line, this_min, this_max, this_previous_min, this_previous_max, iter, eval INT DEFAULT 0;
        DECLARE this_order_num, comp DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur2 CURSOR FOR 
			SELECT uuid,text_uuid,parent_uuid,`type`,object_on_tablet,order_num,char_on_tablet,char_on_line, min, max,`previous_min`,`previous_max`,discourse_uuid  FROM temp_result_table ORDER BY text_uuid, order_num;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        OPEN cur2;
		read_loop: LOOP
		FETCH cur2 INTO this_uuid,this_text_uuid,this_parent_uuid,this_type,this_object_on_tablet,this_order_num,this_char_on_tablet,this_char_on_line,this_min,this_max,this_previous_min,this_previous_max, this_discourse_uuid;
			IF done THEN
				IF (eval = 1) THEN
					SET eval = 0;
					CALL fix_object_on_tablet_issues_supplement;
				ELSE 
					CALL fix_object_on_tablet_issues_supplement_2;
					LEAVE read_loop;
				END IF;
			END IF;
			IF (this_max IS NULL) THEN
                UPDATE temp_result_table SET `max` = this_order_num WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
            END IF;
            IF (this_min IS NULL) THEN
                UPDATE temp_result_table SET `min` = this_order_num WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
            END IF;
			IF (this_order_num IS NULL) THEN
				SET comp = (SELECT MIN(order_num) FROM temp_result_table WHERE parent_uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci ORDER BY object_on_tablet);
				SET this_order_num = comp-0.001;
				UPDATE temp_result_table SET order_num = this_order_num WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
            ELSEIF (this_order_num LIKE "%.9__") THEN
				SET comp = (SELECT MIN(order_num) FROM temp_result_table WHERE parent_uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci ORDER BY object_on_tablet);
				IF (comp < this_order_num) THEN
					SET eval = 1;
					SET this_order_num = comp-0.001;
                    UPDATE temp_result_table SET order_num = this_order_num WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
				END IF;
			END IF;
		END LOOP;
		CLOSE cur2;
--         SELECT * FROM temp_result_table ORDER BY text_uuid, order_num;
    END