DROP PROCEDURE `fix_object_on_tablet_issues`;
DELIMITER //
CREATE PROCEDURE fix_object_on_tablet_issues()
	BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, this_discourse_uuid, previous_uuid, previous_text_uuid, this_parent CHAR(36) DEFAULT NULL;
		DECLARE this_type CHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line INT DEFAULT 0;
        DECLARE this_order_num, this_min, this_max, previous_min, previous_max, temp DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur1 CURSOR FOR 
			SELECT te1.uuid, te1.text_uuid, te1.parent_uuid, te1.`type`, te1.object_on_tablet, te1.char_on_tablet, te1.char_on_line, te2.min, te2.max, te1.discourse_uuid, te3.parent FROM text_epigraphy AS te1
			LEFT JOIN (SELECT DISTINCT parent_uuid AS parent FROM text_epigraphy) AS te3
				ON te1.uuid = te3.parent
			LEFT JOIN (SELECT *, MIN(object_on_tablet) AS min, MAX(object_on_tablet) AS max FROM text_epigraphy WHERE parent_uuid IS NOT NULL GROUP BY parent_uuid) AS te2                
				ON te2.parent_uuid = te3.parent
		WHERE te1.text_uuid NOT IN 
			(SELECT text_uuid FROM text_epigraphy 
			WHERE discourse_uuid IS NOT NULL
			GROUP BY discourse_uuid, char_on_line
			HAVING COUNT(char_on_line) > 1
			ORDER BY COUNT(char_on_line) DESC)
		ORDER BY text_uuid, object_on_tablet;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS temp_result_table (
		  `uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NOT NULL,
		  `text_uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NULL,
		  `parent_uuid` CHAR(36) CHARACTER SET 'latin1' NULL,
		  `type` VARCHAR(20) NULL,
		  `object_on_tablet` INT NULL,
		  `order_num` DECIMAL(7,3) NULL,
          `char_on_tablet` INT NULL,
		  `char_on_line` INT NULL,
		  `min` DECIMAL(7,3) NULL,
		  `max` DECIMAL(7,3) NULL,
		  `previous_min` DECIMAL(7,3) NULL,
		  `previous_max` DECIMAL(7,3) NULL,
          `discourse_uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NULL,
		  PRIMARY KEY (`uuid`),
		  INDEX `uuid` (`uuid` ASC),
		  INDEX `text_uuid` (`text_uuid` ASC),
		  INDEX `parent_uuid` (`parent_uuid` ASC))
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8mb4
		COLLATE = utf8mb4_bin;
        
        OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line, this_min, this_max, this_discourse_uuid, this_parent;
			IF done THEN
				LEAVE read_loop;
			END IF;

            IF (this_parent IS NULL) THEN
				IF (this_type IN ('number','sign','undeterminedSigns','separator','stamp')) THEN
					SET this_min = (SELECT MIN(object_on_tablet) FROM text_epigraphy WHERE parent_uuid = CONVERT(this_parent_uuid USING LATIN1) COLLATE latin1_swedish_ci ORDER BY object_on_tablet);
					IF (this_char_on_line IS NULL) THEN
						SET this_char_on_line = 1;
                    END IF;
                    IF (CHAR_LENGTH(this_char_on_line) = 1) THEN
						SET temp = CONCAT('0.00', this_char_on_line);
					ELSE
						SET temp = CONCAT('0.0', this_char_on_line);
					END IF;
					SET this_order_num = this_min+temp;
				ELSE 
					SET this_order_num = this_object_on_tablet;
                END IF;
            ELSE
				SET this_order_num = this_min-0.001;
            END IF;
			INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,object_on_tablet,order_num,char_on_tablet,char_on_line, min, max,`previous_min`,`previous_max`,discourse_uuid) VALUES (this_uuid,this_text_uuid,this_parent_uuid,this_type,this_object_on_tablet,this_order_num,this_char_on_tablet,this_char_on_line,this_min,this_max,previous_min,previous_max,this_discourse_uuid);
		    SET previous_min = this_min;
			SET previous_max = this_max;
       END LOOP;
		CLOSE cur1;
		CALL fix_object_on_tablet_issues_supplement;
		DROP TABLE temp_result_table;
    END //
DELIMITER ;