CREATE DEFINER=`oare`@`%` PROCEDURE `find_object_on_tablet_iteration_issues`()
BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, previous_text_uuid CHAR(36) DEFAULT NULL;
		DECLARE this_type VARCHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line, previous_oot  INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR SELECT uuid, text_uuid, parent_uuid, `type`, object_on_tablet, char_on_tablet, char_on_line FROM text_epigraphy ORDER BY text_uuid, object_on_tablet;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line;
			IF done THEN
			LEAVE read_loop;
			END IF;
			IF (previous_text_uuid IS NULL) THEN
				SET previous_oot = 0;
			ELSEIF (previous_text_uuid != this_text_uuid) THEN
				SET previous_oot = 0;
            END IF;
            IF (this_object_on_tablet != previous_oot+1) THEN
				-- SELECT this_uuid, this_parent_uuid, this_text_uuid, this_object_on_tablet, previous_oot;
                INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,objectOnTabletORobjInText,charOnTabletORwordOnTablet,charOnLineORchildNum,previous,affected_column) VALUES (this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line, previous_oot, "object_on_tablet");
			END IF;
		SET previous_oot = this_object_on_tablet;
        SET previous_text_uuid = this_text_uuid;
		END LOOP;
		CLOSE cur1;
    END