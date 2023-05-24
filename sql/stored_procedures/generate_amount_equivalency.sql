DROP PROCEDURE generate_amount_equivalency;
DELIMITER $$
CREATE PROCEDURE `generate_amount_equivalency`(IN this_uuid CHAR(36))
BEGIN
DECLARE finished, low, high, this_bool, this_parent_obj_in_text, layer1, highest, this_highest_child, that_highest_child, no_number, no_word INT DEFAULT 0;
DECLARE total, temp_num, subtract DECIMAL(15,5) DEFAULT 0;
DECLARE this_text_uuid, this_parent_uuid, child_uuid, child_spelling_uuid, this_prop_uuid, that_prop_uuid, this_grandparent_uuid, last_uuid CHAR(36) DEFAULT "";
DECLARE this_type, child_type, child_explicit_spelling, final_value, last_child_type VARCHAR(60) DEFAULT "";
DECLARE curChildren CURSOR FOR
SELECT uuid, type, spelling_uuid, explicit_spelling FROM text_discourse WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND obj_in_text > low AND obj_in_text < high AND type NOT IN ("phrase") ORDER BY obj_in_text;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

SELECT `type` INTO this_type FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT parent_uuid INTO this_grandparent_uuid FROM text_discourse WHERE uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT obj_in_text INTO this_parent_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT obj_in_text INTO low FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT MAX(obj_in_text) INTO layer1 FROM text_discourse WHERE parent_uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT MAX(obj_in_text) INTO highest FROM text_discourse WHERE `type` = "phrase" AND text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci;
-- SELECT MAX(obj_in_text) INTO this_highest_child FROM text_discourse WHERE `type` IN ("number","word") AND parent_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT MAX(obj_in_text) INTO this_highest_child FROM text_discourse WHERE parent_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT `type` INTO last_child_type FROM text_discourse WHERE obj_in_text = this_highest_child AND text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci;
    SELECT uuid INTO last_uuid FROM text_discourse WHERE obj_in_text = this_highest_child AND text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci;

IF (low = highest) THEN
	SELECT MAX(obj_in_text)+1 INTO high FROM text_discourse WHERE obj_in_text > low AND text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci;
   --  SELECT "1";
ELSEIF (low = layer1) THEN
	SELECT MIN(obj_in_text) INTO high FROM text_discourse WHERE obj_in_text > low AND parent_uuid = CONVERT(this_grandparent_uuid USING latin1) COLLATE latin1_swedish_ci;
	IF ((high IS NULL) AND (this_highest_child !=0)) THEN
		IF (last_child_type IN ("number","word")) THEN
			SET high = this_highest_child+1;
        ELSEIF (last_child_type = "phrase") THEN
			SELECT MAX(obj_in_text) INTO that_highest_child FROM text_discourse WHERE `type` IN ("number","word") AND parent_uuid = CONVERT(last_uuid USING latin1) COLLATE latin1_swedish_ci;
			SET high = that_highest_child+1;
        ELSE
			SET high = this_highest_child+1;
        END IF;
      --   SELECT 2.5;
    END IF;
    -- SELECT "2", low, high, this_grandparent_uuid;
ELSE
	SELECT MIN(obj_in_text) INTO high FROM text_discourse WHERE obj_in_text > (SELECT max(obj_in_text) FROM text_discourse WHERE parent_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci) AND parent_uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci;
	-- SELECT "3";
END IF;
SELECT uuid INTO this_prop_uuid FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "d4e822ea-7804-f9b6-d54f-9cd9aacf9860" AND value_uuid = "5221aa4e-5134-4eea-9f48-8cc37cfcc43d";

OPEN curChildren;
getChildren: LOOP FETCH curChildren INTO child_uuid, child_type, child_spelling_uuid, child_explicit_spelling;
IF (finished = 1) THEN
	IF (subtract != 0) THEN
		SET total = subtract - total;
	END IF;
    SET final_value = total; SET final_value := ROUND(total, 5); SET final_value:= TRIM(TRAILING 0 FROM final_value); SET final_value := TRIM(TRAILING "." FROM final_value);
    IF ((this_bool = 0) AND (this_type = "phrase") AND (no_word = 1)) THEN #Could this no_word exclude something we want to keep?
		IF (this_uuid IN (SELECT reference_uuid FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "d1edc463-9043-451a-9816-9b5977181fd2")) THEN
            SELECT uuid INTO that_prop_uuid FROM item_properties WHERE reference_uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = "d1edc463-9043-451a-9816-9b5977181fd2";
            UPDATE item_properties SET `value` = final_value WHERE uuid = CONVERT(that_prop_uuid USING latin1) COLLATE latin1_swedish_ci;
		ELSE
            INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value`) VALUES (UUID(),this_uuid,this_prop_uuid,3,'d1edc463-9043-451a-9816-9b5977181fd2',final_value);
		END IF;
	END IF;
	LEAVE getChildren;
END IF;
IF (child_type = "number") THEN
	SET no_number = 1;
	IF (child_explicit_spelling LIKE "%x%") THEN
		SET this_bool = 1;
	ELSEIF (child_explicit_spelling LIKE "%…%") THEN
		SET this_bool = 1;
	ELSEIF (NOT(child_explicit_spelling REGEXP("^[0-9]"))) THEN 
		SET this_bool = 1;
    ELSEIF (NOT(child_explicit_spelling REGEXP("[0-9]"))) THEN 
		SET this_bool = 1;
    ELSEIF (child_explicit_spelling IN (SELECT explicit_spelling FROM dictionary_spelling WHERE reference_uuid IN (SELECT uuid FROM dictionary_form WHERE reference_uuid = "a62ab452-f1f4-d2e0-15be-8ea7c409e719"))) THEN
		SET subtract = total;
		-- SELECT "ζ", total, temp_num;
        SET temp_num = 0;
        SET total = 0;
	ELSE
		SET temp_num = child_explicit_spelling;
	END IF;
ELSEIF (child_type = "word") THEN
	SET no_word = 1;
	IF (no_number=0) THEN #Could this exclude something we want to keep?
		SET this_bool = 1;
    ELSEIF (child_explicit_spelling IN (SELECT explicit_spelling FROM dictionary_spelling WHERE reference_uuid IN (SELECT uuid FROM dictionary_form WHERE reference_uuid = "7193b4dd-c00a-f958-a391-657d2be97092"))) THEN 
        SET total = total + (3600 * temp_num);
		-- SELECT "α", total, temp_num;
        SET temp_num = 0;
	ELSEIF (child_explicit_spelling IN (SELECT explicit_spelling FROM dictionary_spelling WHERE reference_uuid IN (SELECT uuid FROM dictionary_form WHERE reference_uuid = "b11fb7e1-dc2c-f75c-a481-74dea88bf0b0"))) THEN 
        SET total = total + (60 * temp_num);
		-- SELECT "β", total, temp_num;
        SET temp_num = 0;
	ELSEIF (child_explicit_spelling IN (SELECT explicit_spelling FROM dictionary_spelling WHERE reference_uuid IN (SELECT uuid FROM dictionary_form WHERE reference_uuid = "1fb60ee4-2f80-9b26-317e-bc3df43e7225"))) THEN 
		SET total = total + temp_num;
		-- SELECT "γ", total, temp_num;
        SET temp_num = 0;
	ELSEIF (child_explicit_spelling IN (SELECT explicit_spelling FROM dictionary_spelling WHERE reference_uuid IN (SELECT uuid FROM dictionary_form WHERE reference_uuid = "ed8df3b9-07f9-4fb2-992c-075b85661f99"))) THEN 
        SET total = total + (0.00556 * temp_num); 
		-- SELECT "δ", total, temp_num;
        SET temp_num = 0;
    ELSE
		-- SELECT "ε", total, temp_num;
		SET this_bool = 1;
		SET total = 0;
		SET temp_num = 0;
    END IF;
END IF;
END LOOP getChildren;
CLOSE curChildren;
END $$
DELIMITER ;