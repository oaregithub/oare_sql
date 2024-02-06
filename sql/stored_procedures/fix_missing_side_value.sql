CREATE PROCEDURE `fix_missing_side_value`() 
	BEGIN
        -- This procedure checks for and fixes text_epigraphy.side values that are NULL and whose type is not "epigraphicUnit"
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid CHAR(36) DEFAULT NULL;
        DECLARE par_side, count INT DEFAULT 0;
		DECLARE cur1 CURSOR FOR SELECT par.side AS par_side, te.uuid FROM text_epigraphy AS te LEFT JOIN text_epigraphy AS par ON te.parent_uuid = par.uuid WHERE te.side IS NULL AND te.`type` != 'epigraphicUnit';
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO par_side, this_uuid;
			IF done THEN
				LEAVE read_loop;
			END IF;
			IF (par_side IS NOT NULL) THEN
				UPDATE text_epigraphy SET side = par_side WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
            END IF;
		END LOOP;
		CLOSE cur1;
    END