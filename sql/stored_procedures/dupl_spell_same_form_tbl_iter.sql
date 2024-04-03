CREATE PROCEDURE `dupl_spell_same_form_tbl_iter`()
BEGIN
  DECLARE this_explicit_spelling VARCHAR(25) CHARACTER SET utf8mb4 DEFAULT '';
  DECLARE this_count INT DEFAULT 0;
  DECLARE this_form_uuid CHAR(36) DEFAULT '';
  DECLARE n INT DEFAULT 0;
  DECLARE i INT DEFAULT 0;
  DECLARE i2 INT DEFAULT 0;
  DECLARE keep_this_uuid CHAR(36) DEFAULT '';
  DECLARE kill_this_uuid CHAR(36) DEFAULT '';
  
  CREATE TEMPORARY TABLE IF NOT EXISTS tmp_tbl_dupl_spellb (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    spelling_uuid CHAR(36) CHARACTER SET latin1 DEFAULT NULL,
	form_uuid CHAR(36) CHARACTER SET latin1 DEFAULT NULL,
    explicit_spelling VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
	form VARCHAR(250) COLLATE utf8mb4_bin NOT NULL,
	`count` INT,
    PRIMARY KEY (`id`),
    KEY spelling_uuid (spelling_uuid),
    KEY form_uuid (form_uuid)
  );
  
  INSERT INTO tmp_tbl_dupl_spellb (spelling_uuid,form_uuid,explicit_spelling,form,`count`)
	SELECT ds.uuid AS spelling_uuid, df.uuid AS form_uuid, ds.explicit_spelling, df.form, COUNT(ds.explicit_spelling) AS `count` FROM dictionary_spelling AS ds
	INNER JOIN dictionary_form AS df ON df.uuid = ds.reference_uuid
	GROUP BY ds.explicit_spelling, df.uuid HAVING COUNT(ds.explicit_spelling) > 1
	ORDER BY COUNT(ds.explicit_spelling) DESC, ds.explicit_spelling;

  SELECT COUNT(*) FROM tmp_tbl_dupl_spellb INTO n;
  WHILE i<n DO
    SELECT explicit_spelling INTO this_explicit_spelling FROM tmp_tbl_dupl_spellb LIMIT i,1;
    SELECT `count` INTO this_count FROM tmp_tbl_dupl_spellb LIMIT i,1;
	SELECT form_uuid INTO this_form_uuid FROM tmp_tbl_dupl_spellb LIMIT i,1;
	SELECT uuid INTO keep_this_uuid FROM dictionary_spelling WHERE explicit_spelling = this_explicit_spelling AND reference_uuid = this_form_uuid LIMIT 0,1;
	WHILE i2<this_count DO
      SELECT uuid INTO kill_this_uuid FROM dictionary_spelling 
	   WHERE explicit_spelling = this_explicit_spelling 
       AND reference_uuid = this_form_uuid
       AND uuid <> keep_this_uuid 
       LIMIT 1;
     UPDATE text_discourse SET spelling_uuid = keep_this_uuid WHERE spelling_uuid = CONVERT(kill_this_uuid USING latin1) COLLATE latin1_swedish_ci;
     SET SQL_SAFE_UPDATES=0;
     DELETE FROM dictionary_spelling WHERE uuid = CONVERT(kill_this_uuid USING latin1) COLLATE latin1_swedish_ci;
     SET SQL_SAFE_UPDATES=1;
     SET i2=i2+1;
    END WHILE;
	SET i = i+1;
    SET i2 = 0;
  END WHILE;
  DROP TABLE tmp_tbl_dupl_spellb;
END