CREATE DEFINER=`oare`@`%` PROCEDURE `update_spelling_and_transcription_for_procedures`(IN this_spelling_uuid CHAR(36))
BEGIN
	DECLARE this_uuid CHAR(36) DEFAULT NULL;
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE curSpellAndTransUpdate 
		CURSOR FOR 
			SELECT uuid FROM text_discourse WHERE spelling_uuid = CONVERT(this_spelling_uuid USING latin1) COLLATE latin1_swedish_ci;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

    OPEN curSpellAndTransUpdate;
     getOldSpellings: LOOP
		FETCH curSpellAndTransUpdate INTO this_uuid;

	    
		IF finished = 1 THEN
			LEAVE getOldSpellings;
		END IF;
	
		CALL update_discourse_spellings(this_uuid);
        CALL update_discourse_transcription(this_uuid);
            
	 END LOOP getOldSpellings;
	CLOSE curSpellAndTransUpdate;
    
   END