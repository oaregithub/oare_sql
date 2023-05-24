CREATE DEFINER=`oare`@`%` FUNCTION `splUuid2Wrd`(spell_uuid CHAR(36)) RETURNS varchar(36) CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	DECLARE wrd1, wrd2 VARCHAR(36);
  
	SELECT dw.word INTO wrd1 FROM dictionary_spelling ds
	INNER JOIN dictionary_form df ON df.uuid = ds.reference_uuid
	INNER JOIN dictionary_word dw ON dw.uuid = df.reference_uuid
	WHERE ds.uuid = spell_uuid;
    
    IF wrd1 IS NOT NULL THEN
      SET wrd2 = wrd1;
	ELSE
      SET wrd2 = 'No resolution';
	END IF;
      
RETURN wrd2;
  END