DROP PROCEDURE text_epigraphy_de_iterate_line;
DELIMITER //
CREATE PROCEDURE text_epigraphy_de_iterate_line(IN this_text_uuid CHAR(36), IN this_line decimal(5,2))
	BEGIN
		DECLARE done INT DEFAULT FALSE;
		DECLARE that_uuid CHAR(36);
		DECLARE that_parent_uuid CHAR(36);
        DECLARE that_line decimal(5,2);
		DECLARE cur1 CURSOR FOR SELECT uuid, parent_uuid, line FROM text_epigraphy WHERE parent_uuid IN (SELECT uuid FROM text_epigraphy WHERE text_uuid = this_text_uuid AND `type` = 'line');
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        SET @line:=this_line-2;
		UPDATE text_epigraphy SET `line` = @line := @line+1 WHERE text_uuid = this_text_uuid AND `type` = 'line' AND `line` >= this_line;
        
        		OPEN cur1;
	
		read_loop: LOOP
			FETCH cur1 INTO that_uuid, that_parent_uuid, that_line;
			IF done THEN
			LEAVE read_loop;
			END IF;
			
            UPDATE text_epigraphy SET line = (SELECT line FROM text_epigraphy WHERE uuid = that_parent_uuid) WHERE uuid = that_uuid;

		END LOOP;
		CLOSE cur1;
        
    END //
DELIMITER ;