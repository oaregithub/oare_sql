CREATE DEFINER=`oare`@`%` PROCEDURE `iterate_char_on_tablet_after_insert`(IN this_uuid CHAR(36))
BEGIN
        DECLARE this_char_on_line, this_char_on_tablet, this_object_on_tablet INT DEFAULT 0;
		DECLARE this_text_uuid, this_parent_uuid CHAR(36) DEFAULT '';
		
        SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT parent_uuid INTO this_parent_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT char_on_line INTO this_char_on_line FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT char_on_tablet INTO this_char_on_tablet FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT object_on_tablet INTO this_object_on_tablet FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
        
		UPDATE text_epigraphy SET char_on_tablet = (char_on_tablet+1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND char_on_tablet IS NOT NULL AND char_on_tablet >= (this_char_on_tablet+1) AND uuid != this_uuid  ORDER BY object_on_tablet ASC;
    END