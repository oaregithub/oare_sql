CREATE PROCEDURE `add_word`(word VARCHAR (250), word_type VARCHAR (250), this_string VARCHAR (250), form VARCHAR (250), spellings VARCHAR (250), that_string VARCHAR (250))
BEGIN
	DECLARE uuid1, uuid2 CHAR(36) DEFAULT NULL;
	SET uuid1 = UUID(); SET uuid2 = UUID();
    INSERT INTO dictionary_word (uuid,word,`type`) VALUES 
    (uuid1,word,word_type);
    IF (this_string != "") THEN
		  CALL add_lemma(uuid1, this_string);
    END IF;
    IF (form != "") THEN
        CALL `add_form`(uuid1,form,spellings,that_string);
    END IF;
END