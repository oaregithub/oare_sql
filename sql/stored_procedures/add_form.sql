CREATE PROCEDURE `add_form`(IN word_uuid CHAR(36), form VARCHAR (250), spelling VARCHAR (250), pos VARCHAR (250), this_string VARCHAR (250))
BEGIN
	DECLARE uuid1 CHAR(36) DEFAULT NULL;
	SET uuid1 = UUID();
    INSERT INTO dictionary_form (uuid, reference_uuid, form) VALUES 
    (uuid1,word_uuid,form);
     IF (spelling != "" ) THEN
		INSERT INTO dictionary_spelling (uuid, reference_uuid, explicit_spelling) VALUES
		(UUID(),uuid1,spelling);
    END IF;
    IF (this_string != "" AND pos != "") THEN
	    CALL add_parse(uuid1, pos, this_string);
    END IF;
END