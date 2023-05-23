CREATE DEFINER=`oare`@`%` PROCEDURE `merge_form`(IN old_form CHAR(36), IN new_form CHAR(36))
BEGIN
    DECLARE this_spelling_uuid, that_spelling_uuid, this_reference_uuid CHAR(36) DEFAULT NULL;
    DECLARE finished INTEGER DEFAULT 0;
	DECLARE this_explicit_spelling VARCHAR(250) DEFAULT NULL;

	DECLARE curDuplicates 
		CURSOR FOR 
			SELECT u.uuid,
                u.reference_uuid, u.explicit_spelling
            FROM `dictionary_spelling` AS u, (SELECT uuid, explicit_spelling, 
                        COUNT(*) AS count 
                        FROM `dictionary_spelling` WHERE reference_uuid IN (CONVERT(old_form USING latin1) COLLATE latin1_swedish_ci, CONVERT(new_form USING latin1) COLLATE latin1_swedish_ci)  
                        GROUP BY explicit_spelling 
                        HAVING count > 1) AS te
            WHERE  u.explicit_spelling = te.explicit_spelling AND reference_uuid = CONVERT(old_form USING latin1) COLLATE latin1_swedish_ci;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

    OPEN curDuplicates;
     getDuplicates: LOOP
		FETCH curDuplicates INTO this_spelling_uuid,this_reference_uuid,this_explicit_spelling;
		
		SELECT uuid INTO that_spelling_uuid FROM dictionary_spelling WHERE reference_uuid = CONVERT(new_form USING latin1) COLLATE latin1_swedish_ci AND explicit_spelling = CONVERT(this_explicit_spelling USING utf8mb4) COLLATE utf8mb4_bin;
	    
		IF finished = 1 THEN
			LEAVE getDuplicates;
		END IF;

        CALL merge_spelling(this_spelling_uuid,that_spelling_uuid);
		
	 END LOOP getDuplicates;
	CLOSE curDuplicates;
    
    SET FOREIGN_KEY_CHECKS = 0;
	UPDATE dictionary_spelling SET reference_uuid = new_form WHERE reference_uuid = CONVERT(old_form USING latin1) COLLATE latin1_swedish_ci;
	SET FOREIGN_KEY_CHECKS = 1;
	
   END