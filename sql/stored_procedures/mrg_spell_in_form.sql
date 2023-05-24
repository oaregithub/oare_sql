DROP PROCEDURE mrg_spell_in_form;
DELIMITER //
CREATE PROCEDURE `mrg_spell_in_form`(IN this_uuid CHAR(36), that_uuid CHAR(36))
BEGIN
		DECLARE this_ct, that_ct INT(6) DEFAULT 0;
        
        SELECT COUNT(id) INTO this_ct FROM text_discourse WHERE spelling_uuid = this_uuid;
        SELECT COUNT(id) INTO that_ct FROM text_discourse WHERE spelling_uuid = that_uuid;
        
		SET SQL_SAFE_UPDATES=0;
        
        IF this_ct >= that_ct THEN
		UPDATE text_discourse SET spelling_uuid = this_uuid WHERE spelling_uuid = that_uuid;
        DELETE FROM dictionary_spelling WHERE uuid = that_uuid;
        ELSE
        UPDATE text_discourse SET spelling_uuid = that_uuid WHERE spelling_uuid = this_uuid;
		DELETE FROM dictionary_spelling WHERE uuid = this_uuid;
        END IF;
		
		SET SQL_SAFE_UPDATES=1;
    END //
DELIMITER ;