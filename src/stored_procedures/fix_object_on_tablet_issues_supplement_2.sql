CREATE DEFINER=`oare`@`%` PROCEDURE `fix_object_on_tablet_issues_supplement_2`()
BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, this_discourse_uuid, previous_uuid, previous_text_uuid, previous_parent_uuid, previous_discourse_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line, this_min, this_max, this_previous_min, this_previous_max, iter, eval, istrue INT DEFAULT 0;
        DECLARE this_order_num, comp DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur3 CURSOR FOR 
			SELECT uuid,text_uuid,parent_uuid,`type`,object_on_tablet,order_num,char_on_tablet,char_on_line, min, max,`previous_min`,`previous_max`,discourse_uuid FROM temp_result_table ORDER BY text_uuid,order_num;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        OPEN cur3;
		read_loop: LOOP
		FETCH cur3 INTO this_uuid,this_text_uuid,this_parent_uuid,this_type,this_object_on_tablet,this_order_num,this_char_on_tablet,this_char_on_line,this_min,this_max,this_previous_min,this_previous_max,this_discourse_uuid;
			IF done THEN
				LEAVE read_loop;
			END IF;
			IF (this_text_uuid != previous_text_uuid) THEN
				SET iter = 0;
            END IF;
            SET iter = iter+1;
			IF (this_object_on_tablet != iter) THEN
				SET istrue = 1;
				-- SELECT uuid, text_uuid, parent_uuid,`type`,object_on_tablet,iter,order_num,char_on_tablet,char_on_line, min, max,`previous_min`,`previous_max`,discourse_uuid FROM temp_result_table WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;
				UPDATE text_epigraphy SET object_on_tablet = iter WHERE uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci;			
			END IF;
            SET previous_text_uuid = this_text_uuid;
		END LOOP;
		CLOSE cur3;
--         SELECT * FROM temp_result_table ORDER BY text_uuid, order_num;
		IF (istrue = 0) THEN
			SELECT "No numbering issues found!";
        ELSE
            SELECT "fixed numbering issues";
			SELECT * FROM temp_result_table ORDER BY text_uuid,order_num;
		END IF;
    END