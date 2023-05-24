DROP PROCEDURE cnsldt_LmB_into_A;
DELIMITER //
CREATE PROCEDURE `cnsldt_LmB_into_A`(uuidA CHAR(36), uuidB CHAR(36))
BEGIN
	DECLARE wordA, wordB, newWord VARCHAR(25) CHARSET utf8mb4 DEFAULT NULL;
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
UPDATE dictionary_form SET reference_uuid = uuidA WHERE reference_uuid = uuidB;
UPDATE item_properties SET reference_uuid = uuidA WHERE reference_uuid = uuidB;
SELECT word INTO wordA FROM dictionary_word WHERE uuid IN (uuidA);
SELECT word INTO wordB FROM dictionary_word WHERE uuid = uuidB;
SET newWord := CONCAT(wordA,"/",wordB);
UPDATE dictionary_word SET word = newWord WHERE uuid = uuidA;
DELETE FROM dictionary_word WHERE uuid = uuidB;
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;
END //
DELIMITER ;