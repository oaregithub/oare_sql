CREATE TRIGGER before_text_epigraphy_insert
BEFORE INSERT
ON `text_epigraphy` FOR EACH ROW
BEGIN
   INSERT INTO uuid (uuid, table_reference) VALUES (`new`.uuid, "text_epigraphy");
    IF NEW.reading <=> 'DELETE' THEN
        SET NEW.reading_uuid = NULL;
        SET NEW.sign_uuid = NULL;
        SET NEW.sign = NULL;
    ELSEIF (NEW.type <=> 'region') AND (NEW.reading IS NOT NULL) THEN
        SET NEW.reading_uuid = NULL;
        SET NEW.sign_uuid = NULL;
        SET NEW.sign = NULL;
	ELSEIF (NEW.reading IS NOT NULL) THEN
		IF (NEW.reading_uuid IS NOT NULL) AND (NEW.sign IS NOT NULL) AND (NEW.sign_uuid IS NOT NULL) THEN
			SET NEW.reading = NEW.reading;
        ELSEIF NEW.reading LIKE '(%)' THEN
            SET NEW.reading = substr(NEW.reading,2, LENGTH(NEW.reading) - 2);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE reading = NEW.reading AND type IN ('determinative','determinative_2'));
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND type IN ('determinative','determinative_2')));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND type IN ('determinative','determinative_2')));
        ELSEIF NEW.reading LIKE ':%:' THEN 
            SET NEW.reading = substr(NEW.reading,2, LENGTH(NEW.reading) - 2);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE reading = NEW.reading AND `type` = 'uninterpreted');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND `type` = 'uninterpreted'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND `type` = 'uninterpreted'));
        ELSEIF NEW.reading LIKE ':%' THEN
            SET NEW.reading = substr(NEW.reading,2);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE reading = NEW.reading AND `type` = 'uninterpreted');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND `type` = 'uninterpreted'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND `type` = 'uninterpreted'));
        ELSEIF NEW.reading REGEXP '(^[0-9]+DIŠ)' THEN
            SET NEW.reading = substr(NEW.reading,1,1);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('DIŠ','MIN','EŠ₅','LIMMU₅','ÍA','ÀŠ','IMIN','USSU','ILIMMU'));
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('DIŠ','MIN','EŠ₅','LIMMU₅','IÁ','ÀŠ','IMIN','USSU','ILIMMU')));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('DIŠ','MIN','EŠ₅','LIMMU₅','IÁ','ÀŠ','IMIN','USSU','ILIMMU')));
        ELSEIF NEW.reading REGEXP '(^[0-9]+DIŠ2)' THEN
            SET NEW.reading = substr(NEW.reading,1,1);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND reading = 'LIMMU');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND reading = 'LIMMU'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND reading = 'LIMMU'));
        ELSEIF NEW.reading REGEXP '(^[0-9]+AŠ)' THEN
            SET NEW.reading = substr(NEW.reading,1,1);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('AŠ','MIN₅','EŠ₅','LÍMMU','IA₇','AŠ₄','ÍMIN','ÚSSU','ÍLIMMU'));
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('AŠ','MIN₅','EŠ₅','LÍMMU','IA₇','AŠ₄','ÍMIN','ÚSSU','ÍLIMMU')));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('AŠ','MIN₅','EŠ₅','LÍMMU','IA₇','AŠ₄','ÍMIN','ÚSSU','ÍLIMMU')));
        ELSEIF NEW.reading REGEXP '(^[0-9]+AŠ2)' THEN
            SET NEW.reading = substr(NEW.reading,1,1);
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND reading = 'MIN₆');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND reading = 'MIN₆'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND reading = 'MIN₆'));
        ELSEIF NEW.reading REGEXP '(^[0-9]+U)' THEN
            SET NEW.reading = concat(substr(NEW.reading,1,1),'0');
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('U','NIŠ','ÙŠU','NIMIN','NINNU','LX','SEVENU','EIGHTU','NINEU'));
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('U','NIŠ','ÙŠU','NIMIN','NINNU','LX','SEVENU','EIGHTU','NINEU')));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('U','NIŠ','ÙŠU','NIMIN','NINNU','LX','SEVENU','EIGHTU','NINEU')));
        ELSEIF NEW.reading REGEXP '(^[0-9]+0)' THEN
            SET NEW.reading = concat(substr(NEW.reading,1,1),'0');
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('U','NIŠ','ÙŠU','NIMIN','NINNU','LX','SEVENU','EIGHTU','NINEU'));
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('U','NIŠ','ÙŠU','NIMIN','NINNU','LX','SEVENU','EIGHTU','NINEU')));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND num_name IN ('U','NIŠ','ÙŠU','NIMIN','NINNU','LX','SEVENU','EIGHTU','NINEU')));
        ELSEIF NEW.reading LIKE '1/6' THEN 
            SET NEW.reading = '0.16666';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONESIXTH');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONESIXTH'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONESIXTH'));
        ELSEIF NEW.reading LIKE '1/4' THEN 
            SET NEW.reading = '0.25';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONEQUARTER');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONEQUARTER'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONEQUARTER'));
        ELSEIF NEW.reading LIKE '1/3' THEN 
            SET NEW.reading = '0.33333';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠUŠANA');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠUŠANA'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠUŠANA'));
        ELSEIF NEW.reading LIKE '1/2' THEN 
            SET NEW.reading = '0.5';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'MAŠ');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'MAŠ'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'MAŠ'));
        ELSEIF NEW.reading LIKE '2/3' THEN 
            SET NEW.reading = '0.66666';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠANABI');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠANABI'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠANABI'));
        ELSEIF NEW.reading LIKE '5/6' THEN 
            SET NEW.reading = '0.83333';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'KINGUSILA');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'KINGUSILA'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'KINGUSILA'));
        ELSEIF NEW.reading LIKE '⅙' THEN 
            SET NEW.reading = '0.16666';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONESIXTH');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONESIXTH'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONESIXTH'));
        ELSEIF NEW.reading LIKE '¼' THEN 
            SET NEW.reading = '0.25';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONEQUARTER');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONEQUARTER'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'OAONEQUARTER'));
        ELSEIF NEW.reading LIKE '⅓' THEN 
            SET NEW.reading = '0.33333';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠUŠANA');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠUŠANA'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠUŠANA'));
        ELSEIF NEW.reading LIKE '½' THEN 
            SET NEW.reading = '0.5';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'MAŠ');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'MAŠ'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'MAŠ'));
        ELSEIF NEW.reading LIKE '⅔' THEN 
            SET NEW.reading = '0.66666';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠANABI');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠANABI'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'ŠANABI'));
        ELSEIF NEW.reading LIKE '⅚' THEN 
            SET NEW.reading = '0.83333';
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'KINGUSILA');
            SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'KINGUSILA'));
            SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE `value` = NEW.reading AND `reading` = 'KINGUSILA'));
        ELSE 
            SET NEW.reading_uuid = (SELECT uuid FROM sign_reading WHERE reading = NEW.reading AND `type` NOT IN ('uninterpreted','determinative','determinative_2'));
			SET NEW.sign_uuid = (SELECT uuid FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND `type` NOT IN ( 'uninterpreted','determinative','determinative_2')));
			SET NEW.sign = (SELECT `name` FROM sign WHERE uuid = (SELECT reference_uuid FROM sign_reading WHERE reading = NEW.reading AND `type` NOT IN ( 'uninterpreted','determinative','determinative_2')));
        END IF;
        IF NEW.reading_uuid <=> NULL THEN
            SET @error_string = concat('A reading for "',NEW.reading,'" was not found in the sign list. uuid = "',NEW.uuid,'"');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @error_string;
        END IF;
    END IF;
END