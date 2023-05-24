DROP PROCEDURE insert_spell_in_dict;
DELIMITER //
CREATE PROCEDURE `insert_spell_in_dict`(
	IN form_uuid CHAR(36), 
    IN this_explicit_spelling VARCHAR(250))
BEGIN
    DECLARE this_id INT DEFAULT 0;
    DECLARE mash VARCHAR(50);

    SET @uuid := UUID();
    SELECT MIN(id) INTO this_id FROM dictionary_spelling 
    WHERE reference_uuid = CONVERT(form_uuid USING latin1) COLLATE latin1_swedish_ci
    AND explicit_spelling = this_explicit_spelling;
    SET mash = wordmash(explicit_spelling);
    
    IF (this_id = 0) THEN
        INSERT INTO dictionary_spelling (`uuid`,`reference_uuid`,`explicit_spelling`,`mash`) 
        VALUES (@uuid,form_uuid,this_explicit_spelling, mash);
    END IF;
END //
DELIMITER ;