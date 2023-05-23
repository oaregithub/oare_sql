CREATE DEFINER=`oare`@`%` FUNCTION `cnfrm_fract`(this_num DECIMAL(7,5)) RETURNS varchar(15) CHARSET latin1
BEGIN
	DECLARE that_num, fract, cn_sum VARCHAR(36);
    DECLARE fraction DECIMAL;
    DECLARE whole INT;
    DECLARE flag BOOL DEFAULT FALSE;
    
    SET whole = TRUNCATE(this_num,0);
    SET fraction = this_num - whole;
    IF fraction > 0.001 THEN
		SET fraction = TRUNCATE(fraction, 3);
	ELSE SET fraction = NULL;
    END IF;
    
    SET whole = CAST(whole AS CHAR);
    
	IF fraction BETWEEN 0.165 AND 0.168 THEN
		SET fract = '⅙';
	ELSEIF fraction BETWEEN 0.24 AND 0.26 THEN
		SET fract = '¼';
	ELSEIF fraction BETWEEN 0.332 AND 0.334 THEN
		SET fract = '⅓';
	ELSEIF fraction BETWEEN 0.499 AND 0.511 THEN
		SET fract = '½';
	ELSEIF fraction BETWEEN 0.665 AND 0.668 THEN
		SET fract = '⅔';
	ELSEIF fraction BETWEEN 0.74 AND 0.76 THEN
		SET fract = '¾';
	ELSEIF fraction BETWEEN 0.832 AND 0.834 THEN
		SET fract = '⅚';
	ELSE 
		SET fract = NULL;
	END IF;
    
    IF fract IS NOT NULL THEN
		SET that_num = CONCAT(whole," ",fract);
	ELSE
		SET that_num = whole;
	END IF;
	
RETURN fraction;
  END