DROP TRIGGER before_text_epigraphy_update;
DELIMITER //
CREATE TRIGGER before_text_epigraphy_update
BEFORE UPDATE
ON `text_epigraphy` FOR EACH ROW
BEGIN
	IF NOT(NEW.reading <=> OLD.reading) THEN
		IF NEW.`type` = 'sign' OR NEW.`type` = 'number' OR NEW.`type` = 'separator' THEN
			IF NEW.reading IS NULL THEN
				SET NEW.reading_uuid = NULL;
				SET NEW.sign_uuid = NULL;
				SET NEW.sign = NULL;
			ELSEIF NEW.reading <=> 'DELETE' THEN
				SET NEW.reading_uuid = NULL;
				SET NEW.sign_uuid = NULL;
				SET NEW.sign = NULL;
			ELSEIF NEW.reading <=> 'Seal Impression' THEN
				SET NEW.reading_uuid = NULL;
				SET NEW.sign_uuid = NULL;
				SET NEW.sign = NULL;
			 ELSEIF (NOT(NEW.reading <=> OLD.reading) OR (NEW.reading <=> OLD.reading)) THEN
				IF NEW.reading LIKE '(%)' THEN
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
		END IF;
	END IF;
    #WIP for renumbering signs whose parent line number has been updated
--     IF (NOT(NEW.line <=> OLD.line) AND (NEW.`type` = 'line')) THEN
-- 		UPDATE text_epigraphy SET `line` = NEW.line WHERE parent_uuid = NEW.uuid;
-- 		SET NEW.line = (SELECT line FROM text_epigraphy WHERE parent_uuid = NEW.uuid);
--     END IF;
    INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"text_epigraphy",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦text_uuid¦",COALESCE(`old`.`text_uuid`,'NULL'),"¦tree_uuid¦",COALESCE(`old`.`tree_uuid`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦side¦",COALESCE(`old`.`side`,'NULL'),"¦column¦",COALESCE(`old`.`column`,'NULL'),"¦line¦",COALESCE(`old`.`line`,'NULL'),"¦char_on_line¦",COALESCE(`old`.`char_on_line`,'NULL'),"¦char_on_tablet¦",COALESCE(`old`.`char_on_tablet`,'NULL'),"¦sign_uuid¦",COALESCE(`old`.`sign_uuid`,'NULL'),"¦sign¦",COALESCE(`old`.`sign`,'NULL'),"¦reading_uuid¦",COALESCE(`old`.`reading_uuid`,'NULL'),"¦reading¦",COALESCE(`old`.`reading`,'NULL'),"¦discourse_uuid¦",COALESCE(`old`.`discourse_uuid`,'NULL')));
END 
//
DELIMITER ;