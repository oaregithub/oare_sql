CREATE DEFINER=`oare`@`%` FUNCTION `word_type`(spell_uuid VARCHAR(36)) RETURNS varchar(36) CHARSET latin1
BEGIN
	DECLARE wrd_type1, wrd_type2 VARCHAR(36);
  
	SELECT ip.value INTO wrd_type1 FROM dictionary_spelling ds
	INNER JOIN dictionary_form df ON df.uuid = ds.reference_uuid
	INNER JOIN dictionary_word dw ON dw.uuid = df.reference_uuid
	INNER JOIN item_properties ip ON ip.reference_uuid = dw.uuid
	WHERE ds.uuid = spell_uuid
	AND (ip.level = 1 OR ip.level IS NULL)
    AND variable_uuid = '11be11d9-f2e8-e12b-520d-88d7f653b746'
    LIMIT 1;
    
    IF wrd_type1 IS NOT NULL THEN
      SET wrd_type2 = wrd_type1;
	ELSE
      SET wrd_type2 = 'No type';
	END IF;
      
RETURN wrd_type2;
  END