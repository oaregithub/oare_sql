CREATE PROCEDURE `find_orphaned_discourse`()
	BEGIN
        CREATE TEMPORARY TABLE IF NOT EXISTS temp_result_table (
		  `uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NOT NULL,
          `uuid2` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NOT NULL,
		  `text_uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NULL,
		  `parent_uuid` CHAR(36) CHARACTER SET 'latin1' NULL,
          `parent_uuid2` CHAR(36) CHARACTER SET 'latin1' NULL,
		  `type` VARCHAR(20) NULL,
          `type2` VARCHAR(20) NULL,
		  `obj_in_text` INT(11) NULL,
          `obj_in_text2` INT(11) NULL,
		  `child_num` INT(11) NULL,
          `child_num2` INT(11) NULL,
          `explicit_spelling` VARCHAR(250),
          `explicit_spelling2` VARCHAR(250),
		  `level` INT(11) NULL,
		  `level2` INT(11) NULL,
		  PRIMARY KEY (`uuid`),
		  INDEX `uuid` (`uuid` ASC),
          INDEX `uuid2` (`uuid2` ASC),
		  INDEX `text_uuid` (`text_uuid` ASC),
		  INDEX `parent_uuid` (`parent_uuid` ASC),
		  INDEX `parent_uuid2` (`parent_uuid2` ASC))
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8mb4
		COLLATE = utf8mb4_bin;
        INSERT INTO temp_result_table (uuid,uuid2,text_uuid,parent_uuid,parent_uuid2,`type`,`type2`,obj_in_text,obj_in_text2,child_num,child_num2,explicit_spelling,explicit_spelling2) 
			SELECT td1.uuid,td2.uuid,td1.text_uuid,td1.parent_uuid,td2.parent_uuid,td1.`type`,td2.`type`,td1.obj_in_text,td2.obj_in_text,td1.child_num,td2.child_num,td1.explicit_spelling,td2.explicit_spelling 
			FROM text_discourse AS td1
			INNER JOIN text_discourse AS td2
				ON td1.text_uuid = td2.text_uuid 
				AND td1.obj_in_text+1 = td2.obj_in_text
			-- WHERE td1.text_uuid = "fee00b3b-fb3b-cb1b-b361-8dcc6b3183a8"
			ORDER BY td1.text_uuid, td1.obj_in_text;
        -- #to a maximum depth of 50
        UPDATE temp_result_table SET `level` = 1 WHERE `type` = "discourseUnit";
        UPDATE temp_result_table SET `level` = 2 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 1);
		UPDATE temp_result_table SET `level` = 3 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 2);
		UPDATE temp_result_table SET `level` = 4 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 3);
		UPDATE temp_result_table SET `level` = 5 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 4);
        UPDATE temp_result_table SET `level` = 6 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 5);
        UPDATE temp_result_table SET `level` = 7 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 6);
        UPDATE temp_result_table SET `level` = 8 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 7);
        UPDATE temp_result_table SET `level` = 9 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 8);
        UPDATE temp_result_table SET `level` = 10 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 9);
        UPDATE temp_result_table SET `level` = 11 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 10);
		UPDATE temp_result_table SET `level` = 12 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 11);
		UPDATE temp_result_table SET `level` = 13 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 12);
		UPDATE temp_result_table SET `level` = 14 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 13);
		UPDATE temp_result_table SET `level` = 15 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 14);
        UPDATE temp_result_table SET `level` = 16 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 15);
		UPDATE temp_result_table SET `level` = 17 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 16);
		UPDATE temp_result_table SET `level` = 18 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 17);
		UPDATE temp_result_table SET `level` = 19 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 18);
		UPDATE temp_result_table SET `level` = 20 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 19);
		UPDATE temp_result_table SET `level` = 21 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 20);
		UPDATE temp_result_table SET `level` = 22 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 21);
		UPDATE temp_result_table SET `level` = 23 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 22);
		UPDATE temp_result_table SET `level` = 24 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 23);
		UPDATE temp_result_table SET `level` = 25 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 24);
        UPDATE temp_result_table SET `level` = 26 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 25);
		UPDATE temp_result_table SET `level` = 27 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 26);
		UPDATE temp_result_table SET `level` = 28 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 27);
		UPDATE temp_result_table SET `level` = 29 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 28);
		UPDATE temp_result_table SET `level` = 30 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 29);
		UPDATE temp_result_table SET `level` = 31 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 30);
		UPDATE temp_result_table SET `level` = 32 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 31);
		UPDATE temp_result_table SET `level` = 33 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 32);
		UPDATE temp_result_table SET `level` = 34 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 33);
		UPDATE temp_result_table SET `level` = 35 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 34);
		UPDATE temp_result_table SET `level` = 36 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 35);
		UPDATE temp_result_table SET `level` = 37 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 36);
		UPDATE temp_result_table SET `level` = 38 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 37);
		UPDATE temp_result_table SET `level` = 39 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 38);
		UPDATE temp_result_table SET `level` = 40 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 39);
		UPDATE temp_result_table SET `level` = 41 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 40);
		UPDATE temp_result_table SET `level` = 42 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 41);
		UPDATE temp_result_table SET `level` = 43 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 42);
		UPDATE temp_result_table SET `level` = 44 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 43);
		UPDATE temp_result_table SET `level` = 45 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 44);
		UPDATE temp_result_table SET `level` = 46 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 45);
		UPDATE temp_result_table SET `level` = 47 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 46);
		UPDATE temp_result_table SET `level` = 48 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 47);
		UPDATE temp_result_table SET `level` = 49 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 48);
		UPDATE temp_result_table SET `level` = 50 WHERE parent_uuid IN (SELECT uuid FROM temp_result_table WHERE `level` = 49);

		UPDATE temp_result_table SET `level2` = 2 WHERE parent_uuid2 IN (SELECT uuid FROM temp_result_table WHERE `type` = "discourseUnit");
		UPDATE temp_result_table SET `level2` = 3 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 2);
		UPDATE temp_result_table SET `level2` = 4 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 3);
		UPDATE temp_result_table SET `level2` = 5 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 4);
        UPDATE temp_result_table SET `level2` = 6 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 5);
        UPDATE temp_result_table SET `level2` = 7 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 6);
        UPDATE temp_result_table SET `level2` = 8 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 7);
        UPDATE temp_result_table SET `level2` = 9 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 8);
        UPDATE temp_result_table SET `level2` = 10 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 9);
        UPDATE temp_result_table SET `level2` = 11 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 10);
		UPDATE temp_result_table SET `level2` = 12 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 11);
		UPDATE temp_result_table SET `level2` = 13 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 12);
		UPDATE temp_result_table SET `level2` = 14 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 13);
		UPDATE temp_result_table SET `level2` = 15 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 14);
        UPDATE temp_result_table SET `level2` = 16 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 15);
		UPDATE temp_result_table SET `level2` = 17 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 16);
		UPDATE temp_result_table SET `level2` = 18 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 17);
		UPDATE temp_result_table SET `level2` = 19 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 18);
		UPDATE temp_result_table SET `level2` = 20 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 19);
		UPDATE temp_result_table SET `level2` = 21 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 20);
		UPDATE temp_result_table SET `level2` = 22 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 21);
		UPDATE temp_result_table SET `level2` = 23 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 22);
		UPDATE temp_result_table SET `level2` = 24 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 23);
		UPDATE temp_result_table SET `level2` = 25 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 24);
        UPDATE temp_result_table SET `level2` = 26 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 25);
		UPDATE temp_result_table SET `level2` = 27 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 26);
		UPDATE temp_result_table SET `level2` = 28 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 27);
		UPDATE temp_result_table SET `level2` = 29 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 28);
		UPDATE temp_result_table SET `level2` = 30 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 29);
		UPDATE temp_result_table SET `level2` = 31 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 30);
		UPDATE temp_result_table SET `level2` = 32 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 31);
		UPDATE temp_result_table SET `level2` = 33 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 32);
		UPDATE temp_result_table SET `level2` = 34 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 33);
		UPDATE temp_result_table SET `level2` = 35 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 34);
		UPDATE temp_result_table SET `level2` = 36 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 35);
		UPDATE temp_result_table SET `level2` = 37 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 36);
		UPDATE temp_result_table SET `level2` = 38 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 37);
		UPDATE temp_result_table SET `level2` = 39 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 38);
		UPDATE temp_result_table SET `level2` = 40 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 39);
		UPDATE temp_result_table SET `level2` = 41 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 40);
		UPDATE temp_result_table SET `level2` = 42 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 41);
		UPDATE temp_result_table SET `level2` = 43 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 42);
		UPDATE temp_result_table SET `level2` = 44 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 43);
		UPDATE temp_result_table SET `level2` = 45 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 44);
		UPDATE temp_result_table SET `level2` = 46 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 45);
		UPDATE temp_result_table SET `level2` = 47 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 46);
		UPDATE temp_result_table SET `level2` = 48 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 47);
		UPDATE temp_result_table SET `level2` = 49 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 48);
		UPDATE temp_result_table SET `level2` = 50 WHERE parent_uuid2 IN (SELECT uuid2 FROM temp_result_table WHERE `level2` = 49);
    SELECT * FROM temp_result_table WHERE `level`+1 < `level2` ORDER BY text_uuid, obj_in_text;
    DROP TABLE temp_result_table;
    END


