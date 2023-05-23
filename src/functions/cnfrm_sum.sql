CREATE DEFINER=`oare`@`%` FUNCTION `cnfrm_sum`(this_num VARCHAR(64)) RETURNS varchar(15) CHARSET latin1
BEGIN
	DECLARE that_num, fract, cn_sum VARCHAR(36);
    DECLARE tens, ones, fraction DECIMAL;
    DECLARE int_num INT;
    DECLARE flag BOOL DEFAULT FALSE;
  
	IF this_num REGEXP '^[0-9]0\\+[0-9]\\+?0?\\.?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$' 
      THEN
		IF this_num REGEXP '^[0-9]0\\+[0-9]$' THEN
			SELECT CAST(LEFT(this_num,2) AS DECIMAL) INTO tens;
            SELECT CAST(RIGHT(this_num,1) AS DECIMAL) INTO ones;
            SET that_num = tens+ones;
		ELSE 
			SELECT CAST(LEFT(this_num,2) AS DECIMAL) INTO tens;
            SELECT CAST(MID(this_num,4,1) AS DECIMAL) INTO ones;
            SET int_num = tens+ones;
            SELECT MID(this_num,6) INTO fraction;
            SET fraction = CAST(fraction AS DECIMAL (5,4));
            IF fraction BETWEEN 0.165 AND 0.168 THEN
				SET fract = ' 1/6';
			ELSEIF fraction BETWEEN 0.24 AND 0.26 THEN
				SET fract = ' 1/4';
			ELSEIF fraction BETWEEN 0.32 AND 0.34 THEN 
				SET fract = ' 1/3';
			ELSEIF fraction BETWEEN 0.49 AND 0.51 THEN
                SET fract = ' 1/2';
			ELSEIF fraction BETWEEN 0.6 AND 0.68 THEN
				SET fract = ' 2/3';
			ELSEIF fraction BETWEEN 0.74 AND 0.76 THEN
				SET fract = ' 3/4';
			ELSEIF fraction BETWEEN 0.832 AND 0.834 THEN
				SET fract = ' 5/6';
			ELSE SET fract = '';
            END IF;
            SET that_num = CONCAT(int_num,fract);
		END IF;
	ELSEIF this_num REGEXP '^[0-9]\\+0\\.[0-9][0-9]?[0-9]?[0-9]?[0-9]?$'
	   THEN
		SELECT LEFT(this_num,1) INTO ones;
		SELECT CAST(MID(this_num,3) AS DECIMAL (5,4)) INTO fraction;
		IF fraction < 0.168 THEN
			SET fract = '1/6';
		ELSEIF fraction < 0.26 THEN
			SET fract = '1/4';
		ELSEIF fraction < 0.34 THEN 
			SET fract = '1/3';
		ELSEIF fraction < 0.51 THEN
			SET fract = '1/2';
		ELSEIF fraction < 0.68 THEN
			SET fract = '2/3';
		ELSEIF fraction < 0.76 THEN
			SET fract = '3/4';
		ELSEIF fraction < 0.834 THEN
			SET fract = '5/6';
		ELSE 
			SET fract = '';
		END IF;
		SET that_num = CONCAT(ones," ",fract);
	 ELSEIF this_num REGEXP '^0\\.[0-9][0-9]?[0-9]?[0-9]?[0-9]?$' THEN
		SELECT CAST(this_num AS DECIMAL (4,3)) INTO fraction;
		IF fraction < 0.168 THEN
			SET fract = '1/6';
		ELSEIF fraction < 0.26 THEN
			SET fract = '1/4';
		ELSEIF fraction < 0.34 THEN 
			SET fract = '1/3';
		ELSEIF fraction < 0.51 THEN
			SET fract = '1/2';
		ELSEIF fraction < 0.68 THEN
			SET fract = '2/3';
		ELSEIF fraction < 0.76 THEN
			SET fract = '3/4';
		ELSEIF fraction < 0.834 THEN
			SET fract = '5/6';
		ELSE 
			SET fract = '';
		END IF;
		SET that_num = fract;
	 else
		SET that_num = this_num;
	 END IF;
      
RETURN that_num;
  END