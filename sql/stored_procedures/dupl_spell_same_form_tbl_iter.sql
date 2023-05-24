DROP PROCEDURE dupl_spell_same_form_tbl_iter;
DELIMITER //
CREATE PROCEDURE `dupl_spell_same_form_tbl_iter`()
BEGIN
  DECLARE this_explicit_spelling VARCHAR(25) CHARACTER SET utf8mb4 DEFAULT '';
  DECLARE this_count INT(2) DEFAULT 0;
  DECLARE this_form_uuid CHAR(36) DEFAULT '';
  DECLARE n INT(8) DEFAULT 0;
  DECLARE i INT(8) DEFAULT 0;
  DECLARE i2 INT DEFAULT 0;
  DECLARE keep_this_uuid CHAR(36) DEFAULT '';
  DECLARE kill_this_uuid CHAR(36) DEFAULT '';
  SELECT COUNT(*) FROM tmp_tbl_dupl_spellb INTO n;
  WHILE i<n DO
    SELECT col_A INTO this_explicit_spelling FROM tmp_tbl_dupl_spellb LIMIT i,1;
    SELECT col_B INTO this_count FROM tmp_tbl_dupl_spellb LIMIT i,1;
	SELECT col_C INTO this_form_uuid FROM tmp_tbl_dupl_spellb LIMIT i,1;
	SELECT uuid INTO keep_this_uuid FROM dictionary_spelling WHERE explicit_spelling = this_explicit_spelling AND reference_uuid = this_form_uuid LIMIT 0,1;
	WHILE i2<this_count DO
      SELECT uuid INTO kill_this_uuid FROM dictionary_spelling 
	   WHERE explicit_spelling = this_explicit_spelling 
       AND reference_uuid = this_form_uuid
       AND uuid <> keep_this_uuid 
       LIMIT 1;
     UPDATE text_discourse SET spelling_uuid = keep_this_uuid WHERE spelling_uuid = kill_this_uuid;
     SET SQL_SAFE_UPDATES=0;
     DELETE FROM dictionary_spelling WHERE uuid = kill_this_uuid;
     SET SQL_SAFE_UPDATES=1;
     SET i2=i2+1;
    END WHILE;
	SET i = i+1;
    SET i2 = 0;
  END WHILE;
END //
DELIMITER ;