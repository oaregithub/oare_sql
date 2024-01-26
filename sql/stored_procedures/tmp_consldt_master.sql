CREATE PROCEDURE `tmp_consldt_master`()
BEGIN
	DECLARE uuidA, uuidB, formA, formB, spellA, spellB CHAR(36) CHARSET utf8mb4 DEFAULT NULL;
	DECLARE explSpell1, explSpell2 VARCHAR(50) CHARSET utf8mb4 DEFAULT NULL;
	DECLARE maxid, n1, n2 INT DEFAULT 1;

SELECT MAX(id) INTO maxid FROM tmp_doubled_dict_spellings_PN;
-- SET maxid := 10;
-- consolidate all relevant lemmas
WHILE n1 < maxid DO
	SET uuidA := NULL; 
    SET uuidB := NULL; 
	SELECT expl_spell INTO explSpell1 FROM tmp_doubled_dict_spellings_PN WHERE id = n1;
	SELECT expl_spell INTO explSpell2 FROM tmp_doubled_dict_spellings_PN WHERE id = n1+1; 
	SELECT word_uuid INTO uuidA FROM tmp_doubled_dict_spellings_PN WHERE id IN (n1,n1+1) AND word_A = '1';
	SELECT word_uuid INTO uuidB FROM tmp_doubled_dict_spellings_PN WHERE id IN (n1,n1+1) AND word_A = '0' LIMIT 1;
    IF ((explSpell1 = explSpell2) AND (uuidA IS NOT NULL)) THEN
		CALL `cnsldt_LmB_into_A` (uuidA, uuidB);
	END IF;
    SET n1 := n1+2;
END WHILE;
-- SELECT MAX(id) INTO maxid FROM tmp_doubled_dict_spellings_PN;
-- consolidate all relevant spellings
WHILE n2 <= maxid DO
	SET uuidA := NULL; 
    SET uuidB := NULL; 
	SELECT expl_spell INTO explSpell1 FROM tmp_doubled_dict_spellings_PN WHERE id = n2;
	SELECT expl_spell INTO explSpell2 FROM tmp_doubled_dict_spellings_PN WHERE id = n2+1; 
	SELECT spell_uuid INTO uuidA FROM tmp_doubled_dict_spellings_PN WHERE id IN (n2,n2+1) AND spell_A = '1';
	SELECT spell_uuid INTO uuidB FROM tmp_doubled_dict_spellings_PN WHERE id IN (n2,n2+1) AND spell_A = '0' LIMIT 1;
    IF ((explSpell1 = explSpell2) AND (uuidA IS NOT NULL)) THEN
		CALL `cnsldt_spell_B_to_A` (uuidA, uuidB);
	END IF;
    SET n2 := n2+2;
END WHILE;

END