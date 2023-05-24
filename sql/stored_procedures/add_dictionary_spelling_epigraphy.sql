DROP PROCEDURE `add_dictionary_spelling_epigraphy`;
DELIMITER //
CREATE PROCEDURE add_dictionary_spelling_epigraphy(IN this_spelling_uuid CHAR(36)) 
BEGIN
	#Filter out those with spacesa such as áb ša-ra-ni 
    #should I add support for when there are existing readings? probably easiest to delete and insrt new instead.
	DECLARE this_explicit_spelling,this_reading,raw,original_spelling,sign_type VARCHAR(250) DEFAULT '';
	DECLARE finished, numb INT DEFAULT 0;
    DECLARE this_reading_uuid, this_sign_uuid CHAR(36) DEFAULT '';
    DECLARE this_var, that_var VARCHAR(10000) DEFAULT '';
	DECLARE curLoop CURSOR FOR 
		SELECT `explicit_spelling` FROM dictionary_spelling WHERE uuid = CONVERT( this_spelling_uuid USING LATIN1) COLLATE latin1_swedish_ci;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    SELECT `explicit_spelling` INTO original_spelling FROM dictionary_spelling WHERE uuid = CONVERT( this_spelling_uuid USING LATIN1) COLLATE latin1_swedish_ci;
	SET original_spelling = REPLACE(original_spelling, '-', '.');
	SET original_spelling = REPLACE(original_spelling, '=', '.');
	SET original_spelling = REPLACE(original_spelling, '(.)', '');
    SET original_spelling = REPLACE(original_spelling, ' ', '');
    SET original_spelling = REPLACE(original_spelling,'+','.');
    IF ((SELECT COUNT(reference_uuid) FROM dictionary_spelling_epigraphy WHERE reference_uuid = this_spelling_uuid GROUP BY reference_uuid) > 0) THEN
		SET this_explicit_spelling = '';
    END IF;
OPEN curLoop;
getLoop: LOOP FETCH curLoop INTO this_explicit_spelling ;
IF (this_explicit_spelling = '') THEN
	LEAVE getLoop;
END IF;
	SET this_explicit_spelling = REPLACE(this_explicit_spelling, '-', '.');
	SET this_explicit_spelling = REPLACE(this_explicit_spelling, '=', '.');
	SET this_explicit_spelling = REPLACE(this_explicit_spelling, '(.)', '');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling, ' ', '');
	SET this_explicit_spelling = REPLACE(this_explicit_spelling,'(ki).','(ki)');
	SET this_explicit_spelling = REPLACE(this_explicit_spelling,'+','.');
	-- SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling,'.$','');     #not working, FIX
    IF (this_explicit_spelling LIKE '(%)%') THEN
		SET this_explicit_spelling = REPLACE(this_explicit_spelling, '(', 'ϝ');
		SET this_explicit_spelling = REPLACE(this_explicit_spelling, ')','ṇ');
		SET raw = SUBSTRING_INDEX(SUBSTRING_INDEX(this_explicit_spelling, 'ṇ', 1),'ϝ',-1);
		SET this_reading = CONCAT('ϝ',raw,'ṇ');
        SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading),'');     
        SET this_explicit_spelling = REPLACE(this_explicit_spelling, 'ϝ', '(');
		SET this_explicit_spelling = REPLACE(this_explicit_spelling, 'ṇ',')');
        SET this_reading = REPLACE(this_reading, 'ϝ', '(');
		SET this_reading = REPLACE(this_reading, 'ṇ',')');
        SET this_var = CONCAT(this_var,this_reading);
        -- SELECT this_var,original_spelling,'α';
    ELSEIF (this_explicit_spelling LIKE '%.%') THEN
		SET raw = '';
        SET this_reading = SUBSTRING_INDEX(this_explicit_spelling, '.', 1);
		SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading,'\.'),'');
        SET this_var = CONCAT(this_var,this_reading,'.');
		-- SELECT this_var,original_spelling,'β';
	ELSEIF (this_explicit_spelling LIKE '%(ki)%') THEN
		SET raw = '';
        SET this_reading = SUBSTRING_INDEX(this_explicit_spelling, '(', 1);
		SET this_explicit_spelling = CONCAT('(',REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading,'\.'),''));
        SET this_var = CONCAT(this_var,this_reading);
        -- SELECT this_var,original_spelling,'γ';
    ELSE
		SET raw = '';
        SET this_reading = this_explicit_spelling;
        SET this_var = CONCAT(this_var,this_reading);
        -- SELECT this_var,original_spelling,'δ';
		SET this_explicit_spelling = '';
    END IF;

    SET this_var = REPLACE(this_var,'','.');
END LOOP getLoop;
CLOSE curLoop;

IF (((SELECT this_var NOT REGEXP '\(ki\)$') = 1) AND (this_explicit_spelling LIKE '%(ki)%')) THEN
	SET this_var = REPLACE(this_var,'(ki)','(ki).');
END IF; 

IF (this_var = original_spelling) THEN
DELETE FROM dictionary_spelling_epigraphy WHERE reference_uuid = this_spelling_uuid; 
OPEN curLoop;
getLoop: LOOP FETCH curLoop INTO this_explicit_spelling;
IF (this_explicit_spelling = '') THEN
	LEAVE getLoop;
END IF;
	SET numb = numb+1;
	SET this_explicit_spelling = REPLACE(this_explicit_spelling, '-', '.');
	SET this_explicit_spelling = REPLACE(this_explicit_spelling, '=', '.');
	SET this_explicit_spelling = REPLACE(this_explicit_spelling, '(.)', '');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling, ' ', '');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'(ki).','(ki)');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'0.25','¼');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'0.5','½');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'0.33333','⅓');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'0.66666','⅔');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'0.16666','⅙');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'0.83333','⅚');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'{','.');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'}','');
    SET this_explicit_spelling = REPLACE(this_explicit_spelling,'+','.');
    IF (this_explicit_spelling LIKE '(%)%') THEN
		SET this_explicit_spelling = REPLACE(this_explicit_spelling, '(', 'ϝ');
		SET this_explicit_spelling = REPLACE(this_explicit_spelling, ')','ṇ');
		SET raw = SUBSTRING_INDEX(SUBSTRING_INDEX(this_explicit_spelling, 'ṇ', 1),'ϝ',-1);
		SET this_reading = CONCAT('ϝ',raw,'ṇ');
        SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading),'');     
        SET this_explicit_spelling = REPLACE(this_explicit_spelling, 'ϝ', '(');
		SET this_explicit_spelling = REPLACE(this_explicit_spelling, 'ṇ',')');
        SET this_reading = REPLACE(this_reading, 'ϝ', '(');
		SET this_reading = REPLACE(this_reading, 'ṇ',')');
		SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = raw AND `type` = "determinative";
        SELECT reference_uuid INTO this_sign_uuid FROM sign_reading WHERE uuid = this_reading_uuid;
		INSERT INTO dictionary_spelling_epigraphy (uuid,reference_uuid,sign_spell_num,reading_uuid,reading,sign_uuid) VALUES (UUID(),this_spelling_uuid,numb,this_reading_uuid,raw,this_sign_uuid);
        -- SELECT numb,raw,this_reading,this_explicit_spelling,this_reading_uuid,this_sign_uuid,'α';
   ELSEIF ((SELECT this_explicit_spelling REGEXP '^[1-9]') = 1) THEN
		SET raw = SUBSTRING_INDEX(this_explicit_spelling, '.', 1);
        IF ((SELECT this_explicit_spelling REGEXP '^[1-9]0') = 1) THEN
			SET this_explicit_spelling = REPLACE(this_explicit_spelling, '0', 'U');
            SET this_reading = SUBSTRING_INDEX(this_explicit_spelling, '.', 1);
		ELSE
			SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling, '^[1-9]', CONCAT(raw,'DIŠ'));
            SET this_reading = SUBSTRING_INDEX(this_explicit_spelling, '.', 1);
		END IF;
        IF ((SELECT this_explicit_spelling REGEXP '^4DIŠ') = 1) THEN
			SET this_reading_uuid = '0b5be50c-3a4d-4a9c-b563-c2fb0cc8972d';
		ELSE
			SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` = "number";
        END IF;
        SELECT reference_uuid INTO this_sign_uuid FROM sign_reading WHERE uuid = this_reading_uuid;
		IF (((SELECT this_explicit_spelling REGEXP '^[1-9]$') = 1) OR ((SELECT this_explicit_spelling REGEXP '^[1-9]U$') = 1)) THEN
			SET this_explicit_spelling = '';
		ELSE
             SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading,'\.'),'');
        END IF;
        INSERT INTO dictionary_spelling_epigraphy (uuid,reference_uuid,sign_spell_num,reading_uuid,reading,sign_uuid) VALUES (UUID(),this_spelling_uuid,numb,this_reading_uuid,raw,this_sign_uuid);
		-- SELECT numb,raw,this_reading,this_explicit_spelling,this_reading_uuid,this_sign_uuid,'num';
   ELSEIF (this_explicit_spelling LIKE '%.%') THEN
		SET raw = '';
        SET this_reading = SUBSTRING_INDEX(this_explicit_spelling, '.', 1);
        IF ((SELECT `type` FROM sign_reading WHERE reading = this_reading AND `type` IN ("phonogram","logogram")) IN ("phonogram","logogram")) THEN
             SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` IN ("phonogram","logogram");
		ELSEIF ((SELECT `type` FROM sign_reading WHERE reading = this_reading AND `type` = "number") = "number") THEN
			SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` = "number";
		ELSE
            SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` = "uninterpreted";
 		END IF;
		SELECT reference_uuid INTO this_sign_uuid FROM sign_reading WHERE uuid = this_reading_uuid;
		SET this_explicit_spelling = REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading,'\.'),'');
		INSERT INTO dictionary_spelling_epigraphy (uuid,reference_uuid,sign_spell_num,reading_uuid,reading,sign_uuid) VALUES (UUID(),this_spelling_uuid,numb,this_reading_uuid,this_reading,this_sign_uuid);
		-- SELECT numb,raw,this_reading,this_explicit_spelling,this_reading_uuid,this_sign_uuid,'β';
	ELSEIF (this_explicit_spelling LIKE '%(ki)%') THEN
		SET raw = '';
        SET this_reading = SUBSTRING_INDEX(this_explicit_spelling, '(', 1);
        IF ((SELECT `type` FROM sign_reading WHERE reading = this_reading AND `type` IN ("phonogram","logogram")) IN ("phonogram","logogram")) THEN
			SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` IN ("phonogram","logogram");
        ELSE 
			SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` = "uninterpreted";
		END IF;
		SELECT reference_uuid INTO this_sign_uuid FROM sign_reading WHERE uuid = this_reading_uuid;
		SET this_explicit_spelling = CONCAT('(',REGEXP_REPLACE(this_explicit_spelling,CONCAT('^',this_reading,'\.'),''));
		INSERT INTO dictionary_spelling_epigraphy (uuid,reference_uuid,sign_spell_num,reading_uuid,reading,sign_uuid) VALUES (UUID(),this_spelling_uuid,numb,this_reading_uuid,this_reading,this_sign_uuid);
		-- SELECT numb,raw,this_reading,this_explicit_spelling,this_reading_uuid,this_sign_uuid,'γ';
    ELSE
		SET raw = '';
        SET this_reading = this_explicit_spelling;
		SET this_explicit_spelling = '';
        IF ((SELECT `type` FROM sign_reading WHERE reading = this_reading AND `type` IN ("phonogram","logogram")) IN ("phonogram","logogram")) THEN
			SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` IN ("phonogram","logogram");
        ELSE 
			SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE reading = this_reading AND `type` = "uninterpreted";
		END IF;
		SELECT reference_uuid INTO this_sign_uuid FROM sign_reading WHERE uuid = this_reading_uuid;
		INSERT INTO dictionary_spelling_epigraphy (uuid,reference_uuid,sign_spell_num,reading_uuid,reading,sign_uuid) VALUES (UUID(),this_spelling_uuid,numb,this_reading_uuid,this_reading,this_sign_uuid);
		-- SELECT numb,raw,this_reading,this_explicit_spelling,this_reading_uuid,this_sign_uuid,'δ';
    END IF;
END LOOP getLoop;
CLOSE curLoop;
ELSE
	SELECT this_var, original_spelling,this_spelling_uuid;
END IF;
END //
DELIMITER ;