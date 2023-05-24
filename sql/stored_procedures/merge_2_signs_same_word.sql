CREATE DEFINER=`oare`@`%` PROCEDURE `merge_2_signs_same_word`(IN this_uuid CHAR(36), that_uuid CHAR(36), new_reading VARCHAR(10))
BEGIN
        
        CALL `text_epigraphy_de_iterate_before_delete`(this_uuid);
        DELETE FROM text_epigraphy WHERE uuid = this_uuid;
		UPDATE text_epigraphy SET reading = new_reading WHERE uuid = that_uuid;
		
    END