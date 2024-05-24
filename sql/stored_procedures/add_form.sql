CREATE PROCEDURE `add_form`(IN word_uuid CHAR(36), form VARCHAR (250), spellings VARCHAR (250), this_string VARCHAR (250))
BEGIN
	DECLARE uuid1 CHAR(36) DEFAULT NULL;
    DECLARE spelling,str VARCHAR(250) DEFAULT NULL;
    DECLARE strLen,i INT DEFAULT 0;
	SET uuid1 = UUID();
    INSERT INTO dictionary_form (uuid, reference_uuid, form) VALUES 
    (uuid1,word_uuid,form);
    IF (spellings != "" ) THEN
        IF (SELECT spellings REGEXP "^.*, " = 1) THEN
		    SET spellings = REGEXP_REPLACE(spellings,", "," ");
		    SET i = 1;
            WHILE strLen < LENGTH(spellings)  DO
                SET str = SUBSTRING_INDEX(spellings, ' ', i);
                SET strLen = LENGTH(str);
                SET i = i+1;
                INSERT INTO dictionary_spelling (uuid, reference_uuid, explicit_spelling) VALUES
                (UUID(),uuid1,SUBSTRING_INDEX(str, ' ', -1));
            END WHILE;
	    ELSE
		    INSERT INTO dictionary_spelling (uuid, reference_uuid, explicit_spelling) VALUES
		    (UUID(),uuid1,spellings);
	    END IF;
    END IF;
    IF (this_string != "") THEN
	    CALL add_parse(uuid1, this_string);
    END IF;
END