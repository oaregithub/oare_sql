CREATE PROCEDURE `fix_obj_in_text_iteration_issues`()
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_uuid, previous_text_uuid, previous_parent_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_obj_in_text, this_word_on_tablet, this_child_num INT DEFAULT 0;
        DECLARE this_order_num DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur1 CURSOR FOR 
			SELECT td1.uuid, td1.text_uuid, td1.parent_uuid, td1.`type`, td1.obj_in_text, te.min, td1.word_on_tablet, td1.child_num FROM text_discourse as td1
			LEFT JOIN (SELECT *, MIN(object_on_tablet) AS min FROM text_epigraphy WHERE discourse_uuid IS NOT NULL GROUP BY discourse_uuid ORDER BY text_uuid, object_on_tablet) AS te
				ON te.discourse_uuid = td1.uuid
			ORDER BY text_uuid, obj_in_text;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		CREATE TEMPORARY TABLE IF NOT EXISTS temp_result_table (
		  `uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NOT NULL,
		  `text_uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NULL,
		  `parent_uuid` CHAR(36) CHARACTER SET 'latin1' NULL,
		  `type` VARCHAR(20) NULL,
		  `obj_in_text` INT(11) NULL,
		  `order_num` DECIMAL(7,3) NULL,
		  `word_on_tablet` INT(11) NULL,
		  `child_num` INT(11) NULL,
		  PRIMARY KEY (`uuid`),
		  INDEX `uuid` (`uuid` ASC),
		  INDEX `text_uuid` (`text_uuid` ASC),
		  INDEX `parent_uuid` (`parent_uuid` ASC))
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8mb4
		COLLATE = utf8mb4_bin;

        OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_order_num, this_word_on_tablet, this_child_num;
			IF done THEN
				LEAVE read_loop;
			END IF;
			IF (this_order_num IS NULL) THEN
				SET this_order_num = (SELECT MIN(object_on_tablet) FROM text_epigraphy WHERE discourse_uuid IN (SELECT uuid FROM text_discourse WHERE parent_uuid = CONVERT(this_uuid USING LATIN1) COLLATE latin1_swedish_ci ORDER BY obj_in_text))-0.001;
            END IF;
 			INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,obj_in_text,order_num,word_on_tablet,child_num) VALUES (this_uuid, this_text_uuid, this_parent_uuid, this_type, this_obj_in_text, this_order_num, this_word_on_tablet, this_child_num);
        END LOOP;
		CLOSE cur1;
		CALL fix_obj_in_text_iteration_issues_supplement;
 		-- SELECT * FROM temp_result_table ORDER BY text_uuid, order_num;
		DROP TABLE temp_result_table;
    END