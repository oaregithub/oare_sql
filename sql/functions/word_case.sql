CREATE FUNCTION `word_case`(spell_uuid CHAR(36), this_case VARCHAR(36)) RETURNS tinyint
BEGIN
	DECLARE wrd_case1, wrd_case2 VARCHAR(36);
    DECLARE flag BOOL DEFAULT FALSE;
  
	SELECT ip.value INTO wrd_case1 FROM dictionary_spelling ds
	INNER JOIN dictionary_form df ON df.uuid = ds.reference_uuid
	INNER JOIN item_properties ip ON ip.reference_uuid = df.uuid
	WHERE ds.uuid = spell_uuid
	AND ip.level = 2
    AND ip.variable_uuid = 'e0092e36-fb94-a4dc-cd04-5883ab861fd6'
    AND ip.value = this_case;
    
    IF wrd_case1 IS NOT NULL THEN
      SET flag = TRUE;
	END IF;
      
RETURN flag;
  END