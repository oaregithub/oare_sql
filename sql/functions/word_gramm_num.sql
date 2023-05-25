CREATE FUNCTION `word_gramm_num`(spell_uuid CHAR(36), this_num VARCHAR(36)) RETURNS tinyint(1)
BEGIN
	DECLARE wrd_num VARCHAR(36);
    DECLARE flag BOOL DEFAULT FALSE;
  
	SELECT ip.value INTO wrd_num FROM dictionary_spelling ds
	INNER JOIN dictionary_form df ON df.uuid = ds.reference_uuid
	INNER JOIN item_properties ip ON ip.reference_uuid = df.uuid
	WHERE ds.uuid = spell_uuid
	AND ip.level = 2
    AND ip.variable_uuid = 'c5a0f22a-00cd-e643-bea8-8434fca0b056'
    AND ip.value = this_num;
    
    IF wrd_num IS NOT NULL THEN
      SET flag = TRUE;
	END IF;
      
RETURN flag;
  END