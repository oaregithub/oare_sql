CREATE DEFINER=`oare`@`%` PROCEDURE `update_discourse_spellings`(IN this_discourse_uuid CHAR(36))
BEGIN
    DECLARE previous_sign_type, previous_sign_reading, sign_type, sign_reading, sign_char_on_tablet, markup_type, previous_markup_type, num_value, last_sign VARCHAR(20) CHARSET utf8mb4 DEFAULT NULL;
	DECLARE previous_char_on_tablet INT DEFAULT NULL;
	DECLARE discourse_spelling VARCHAR(250) CHARSET utf8mb4 DEFAULT '';
	DECLARE sign_uuid, last_sign_uuid CHAR(36) CHARSET latin1 DEFAULT NULL;
    DECLARE finished, LÁ_var, non_num, logogram_w_number INTEGER DEFAULT 0;
    DECLARE spelling_cursor CURSOR FOR 
		SELECT t1.uuid, t2.`type`, t1.reading, t1.char_on_tablet, t3.`type`, t3.num_value FROM (SELECT * FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci) AS t1 
			LEFT JOIN sign_reading AS t2
				ON t1.reading_uuid = t2.uuid
			LEFT JOIN (SELECT * FROM text_markup WHERE `type` = 'undeterminedSigns') AS t3
				ON t1.uuid = t3.reference_uuid
			ORDER BY t1.char_on_tablet;	
                    
	DECLARE CONTINUE HANDLER FOR NOT FOUND 
	SET finished = 1;
    IF ((SELECT `type` FROM text_discourse WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci) IN ("number", "word")) THEN    
        SELECT uuid INTO last_sign_uuid FROM text_epigraphy WHERE discourse_uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci ORDER BY object_on_tablet DESC LIMIT 1;
        OPEN spelling_cursor;

			get_signs: LOOP
				FETCH spelling_cursor INTO sign_uuid, sign_type, sign_reading, sign_char_on_tablet, markup_type, num_value;
				IF finished = 1 THEN 
					SET LÁ_var = 0;
                    			SET non_num = 0;
					SET logogram_w_number = 0;
					IF (discourse_spelling = 'NULL') THEN
						SET discourse_spelling = NULL;
                    			END IF;
					UPDATE text_discourse SET explicit_spelling = discourse_spelling, spelling = discourse_spelling WHERE uuid = CONVERT(this_discourse_uuid USING latin1) COLLATE latin1_swedish_ci;
					-- SELECT discourse_spelling;
					LEAVE get_signs;
				END IF;
                IF ((sign_reading NOT REGEXP '(^[0-9])') AND (sign_reading != 'LÁ')) THEN
					SET non_num = 1;
                END IF;
				IF ((previous_sign_reading IS NOT NULL) AND (sign_reading IS NULL)) THEN
					IF (previous_sign_reading = 'LÁ') THEN #add LÁ before breaks
						SET discourse_spelling := CONCAT(discourse_spelling, '+', previous_sign_reading);
                    END IF;
                    IF ((num_value IS NOT NULL) AND (num_value != '-1')) THEN
						SET discourse_spelling := CONCAT(discourse_spelling, '-', REPEAT('x', num_value));
					ELSEIF num_value = '-1' THEN
						SET discourse_spelling := CONCAT(discourse_spelling, '-…');
                    ELSE
						SET discourse_spelling := CONCAT(discourse_spelling, '-NULL');
					END IF;
                ELSEIF sign_reading IS NULL THEN
					IF previous_char_on_tablet IS NULL THEN
						IF (markup_type = 'undeterminedSigns') THEN
							SET non_num := 1;
                        END IF;
						IF ((num_value IS NOT NULL) AND (num_value != '-1')) THEN
							SET discourse_spelling := CONCAT(discourse_spelling, REPEAT('x', num_value));
						ELSEIF num_value = '-1' THEN
							SET discourse_spelling := CONCAT(discourse_spelling, '…');
						ELSE
							SET discourse_spelling := CONCAT(discourse_spelling, 'NULL');
						END IF;
					ELSEIF previous_sign_reading IS NULL THEN
						IF ((num_value IS NOT NULL) AND (num_value != '-1')) THEN
							SET discourse_spelling := CONCAT(discourse_spelling, '-', REPEAT('x', num_value));
						ELSEIF num_value = '-1' THEN
							SET discourse_spelling := CONCAT(discourse_spelling, '-…');
						ELSE
							SET discourse_spelling := CONCAT(discourse_spelling, '-NULL');
						END IF;
                    END IF;
				ELSEIF ((previous_char_on_tablet IS NULL) AND (sign_type = 'determinative')) THEN
					SET discourse_spelling := CONCAT(discourse_spelling, '(', sign_reading);
				ELSEIF ((previous_char_on_tablet IS NULL) AND (sign_reading IS NOT NULL)) THEN
					SET discourse_spelling := CONCAT(discourse_spelling, sign_reading);
				ELSEIF ((LÁ_var = '1') AND (sign_reading REGEXP '(^[0-9])')) THEN
						IF (non_num != 1) THEN
							SET discourse_spelling := discourse_spelling - sign_reading;
						ELSE
							SET discourse_spelling := CONCAT(discourse_spelling, '+', sign_reading);
                        END IF;
                ELSEIF ((sign_reading REGEXP '(^[0-9])') AND (previous_sign_reading REGEXP '(^[0-9])')) THEN
						IF (non_num != 1) THEN
							SET discourse_spelling := discourse_spelling + sign_reading;
						ELSE
							SET discourse_spelling := CONCAT(discourse_spelling, '+', sign_reading);
                        END IF;
				ELSEIF ((sign_reading REGEXP '(^[0-9])') AND (previous_char_on_tablet IS NOT NULL)) THEN
					#adding logic to support LÁ+#, as it currently is rendering LÁ.#
                    IF (previous_markup_type = 'undeterminedSigns') THEN
						SET discourse_spelling := CONCAT(discourse_spelling, '-', sign_reading);
                    END IF;
					IF ((previous_sign_type = 'logogram')) THEN
						IF (previous_sign_reading = 'LÁ') THEN
							SET discourse_spelling := CONCAT(discourse_spelling, '+', sign_reading);
						ELSE
							SET discourse_spelling := CONCAT(discourse_spelling, '.', sign_reading);
                        	SET logogram_w_number = 1;
                        END IF;
					ELSEIF ((previous_sign_type != 'logogram')) THEN
						SET discourse_spelling := CONCAT(discourse_spelling, '-', sign_reading);
                    END IF;
                ELSEIF ((previous_sign_type = 'number') AND (sign_reading = 'TA')) THEN
					SET discourse_spelling := CONCAT(discourse_spelling, '.', sign_reading);
				ELSEIF ((logogram_w_number = 1) AND (previous_sign_reading REGEXP '(^[0-9])')) THEN
					SET discourse_spelling := CONCAT(discourse_spelling, '.', sign_reading);
					SET logogram_w_number = 0;
				ELSEIF ((sign_reading = 'LÁ') AND (previous_sign_reading REGEXP '(^[0-9])')) THEN
                    SET LÁ_var = 1;
				ELSEIF ((previous_sign_reading = 'LÁ') AND (sign_reading REGEXP '(^[0-9])')) THEN
					IF (non_num != 1) THEN
						SET discourse_spelling := discourse_spelling - sign_reading; 
					ELSE
						SET discourse_spelling := CONCAT(discourse_spelling, '+', sign_reading);
					END IF;
				ELSEIF ((previous_sign_type = 'logogram') AND (sign_type = 'logogram')) THEN
					SET discourse_spelling := CONCAT(discourse_spelling, '.', sign_reading);
				ELSEIF previous_sign_type != 'determinative' AND sign_type = 'determinative' THEN
					IF (sign_uuid = last_sign_uuid) THEN
						SET discourse_spelling := CONCAT(discourse_spelling, '(', sign_reading, ')');
					ELSEIF (sign_reading ='ki') THEN
						SET discourse_spelling := CONCAT(discourse_spelling, '(', sign_reading);
					ELSE
						SET discourse_spelling := CONCAT(discourse_spelling, '-(', sign_reading);
					END IF;
				ELSEIF previous_sign_type = 'determinative' AND sign_type = 'determinative' THEN
					SET discourse_spelling := CONCAT(discourse_spelling, ')(', sign_reading);
				ELSEIF (((previous_sign_type = 'determinative') AND (sign_type != 'determinative')) AND (previous_sign_reading = 'ki')) THEN
					SET discourse_spelling := CONCAT(discourse_spelling, ')-', sign_reading);
				ELSEIF previous_sign_type = 'determinative' THEN
					SET discourse_spelling := CONCAT(discourse_spelling, ')', sign_reading);
				ELSEIF sign_type = 'determinative' THEN
					SET discourse_spelling := CONCAT(discourse_spelling, '(', sign_reading);
                ELSEIF sign_type = 'determinative_2' THEN
 					SET discourse_spelling := CONCAT(discourse_spelling, '(', sign_reading, ')'); 
				ELSEIF (discourse_spelling = 'ma-na' AND sign_reading = 'TA') THEN
					SET discourse_spelling := CONCAT(discourse_spelling, '.', sign_reading);
                ELSE
                    SET discourse_spelling := CONCAT(discourse_spelling, '-', sign_reading);
                END IF;
                SET previous_markup_type := markup_type;
 				SET previous_sign_type := sign_type;
				SET previous_sign_reading := sign_reading;
				SET previous_char_on_tablet := sign_char_on_tablet;
			END LOOP get_signs;
		CLOSE spelling_cursor;
	END IF;
END