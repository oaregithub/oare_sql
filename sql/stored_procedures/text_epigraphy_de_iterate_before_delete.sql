DROP PROCEDURE text_epigraphy_de_iterate_before_delete;
DELIMITER //
CREATE PROCEDURE `text_epigraphy_de_iterate_before_delete`(IN this_uuid CHAR(36))
BEGIN
        DECLARE this_char_on_line, this_char_on_tablet, this_object_on_tablet INT DEFAULT 0;
		DECLARE this_text_uuid, this_parent_uuid CHAR(36) DEFAULT '';
		
        SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE uuid = this_uuid; 
		SELECT parent_uuid INTO this_parent_uuid FROM text_epigraphy WHERE uuid = this_uuid; 
		SELECT char_on_line INTO this_char_on_line FROM text_epigraphy WHERE uuid = this_uuid; 
		SELECT char_on_tablet INTO this_char_on_tablet FROM text_epigraphy WHERE uuid = this_uuid; 
		SELECT object_on_tablet INTO this_object_on_tablet FROM text_epigraphy WHERE uuid = this_uuid; 
        
		UPDATE text_epigraphy SET char_on_tablet = (char_on_tablet-1) WHERE text_uuid = this_text_uuid AND `type` IN ('sign','number','separator','undeterminedSigns') AND char_on_tablet > this_char_on_tablet;
		UPDATE text_epigraphy SET char_on_line = (char_on_line-1) WHERE parent_uuid = this_parent_uuid AND `type` IN ('sign','number','separator','undeterminedSigns') AND char_on_line > this_char_on_line;
		UPDATE text_epigraphy SET object_on_tablet = (object_on_tablet-1) WHERE text_uuid = this_text_uuid AND object_on_tablet > this_object_on_tablet;
    END //
	DELIMITER ;