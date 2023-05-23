CREATE DEFINER=`oare`@`%` PROCEDURE `fix_object_on_tablet_issues`()
BEGIN
        DECLARE done INT DEFAULT FALSE;
		DECLARE this_uuid, this_text_uuid, this_parent_uuid, this_discourse_uuid, previous_uuid, previous_text_uuid, previous_parent_uuid, previous_discourse_uuid, this_parent CHAR(36) DEFAULT NULL;
		DECLARE this_type CHAR(250);
        DECLARE this_object_on_tablet, this_char_on_tablet, this_char_on_line INT DEFAULT 0;
        DECLARE this_order_num, this_min, this_max, previous_min, previous_max, temp DECIMAL(7,3) DEFAULT NULL;
		DECLARE cur1 CURSOR FOR 
			SELECT te1.uuid, te1.text_uuid, te1.parent_uuid, te1.`type`, te1.object_on_tablet, te1.char_on_tablet, te1.char_on_line, te2.min, te2.max, te1.discourse_uuid, te3.parent FROM text_epigraphy AS te1
			LEFT JOIN (SELECT DISTINCT parent_uuid AS parent FROM text_epigraphy) AS te3
				ON te1.uuid = te3.parent
			LEFT JOIN (SELECT *, MIN(object_on_tablet) AS min, MAX(object_on_tablet) AS max FROM text_epigraphy WHERE parent_uuid IS NOT NULL GROUP BY parent_uuid) AS te2                
				ON te2.parent_uuid = te3.parent
		WHERE te1.text_uuid NOT IN ("01195371-7ade-4f25-b943-5d2f654f6376",
			"0893ecd4-7eb0-4fcc-bd1c-38acda07835e",
			"0f42f658-3eba-bc75-a1ad-414af3e4af65",
			"1102b6cc-898d-adf9-a7b0-5a743019cbd9",
			"16436919-731f-4ef6-813b-cb988b6a1578",
			"1845cbc2-54e9-44f0-8963-a81967285921",
			"265504bd-1853-0145-1564-8e01e3ac648b",
			"2d15e11d-aea9-460b-b4fc-ded0439d2e1a",
			"311470a1-7909-49cc-8a83-4f7ffea85386",
			"33b778c4-0066-4873-89b4-4834de8e4ef6",
			"3bd12cbd-d29c-540d-1658-a7162345118e",
			"43a8fc7a-5090-de2c-5be5-c37d59c00d17",
			"44d4fd8f-d659-2b8e-f29b-09b050c74c5a",
			"48b6fd2f-f03c-4351-acc7-44c77e02679d",
			"4a40458f-a59b-4b0e-82e0-f67e3eb713e8",
			"4cce0418-d5ac-4331-9793-a99d9efe2fce",
			"4db63f91-70d7-44cc-8752-26f1b22ae4cc",
			"4e0989cb-914f-4ae0-bce0-2f8fc887251f",
			"4f893d5a-9a25-4af1-982f-e3e4aed196a8",
			"508241bc-4dd8-b9bc-b598-ece9cb6e6df4",
			"5639bdce-3649-1d65-c0bb-22d703f51ee1",
			"5c2a8b8b-c6f0-484c-84cc-ebb4dbca0f3d",
			"5ece431a-f3e7-e5b6-f0d1-fc4dc626055c",
			"63c6e7fd-64a3-c9e6-3668-87057d28aaae",
			"63f8f863-25fc-40ff-a84b-cc122e5d9db5",
			"65c64db6-787f-456e-907f-565e056d613d",
			"66817e98-86a0-44b8-a23d-b1406354ae2a",
			"7001e026-5609-48e3-bef5-7d1d6c1dda55",
			"7d936c9b-cdd5-401d-b82c-499d1e40301b",
			"7f971689-4cd0-47b2-9f6c-66a35f716671",
			"83a74655-4a3e-4b89-b1a7-534aab81bd0f",
			"840803e4-6811-4da1-9bb6-1c49e10d93e0",
			"8bf2c1df-63d4-4f24-bea3-0fb595ae0a7a",
			"93040b8b-6de2-48b9-8ad8-5587252fabfc",
			"96dc42f5-f4cf-45cd-8fb0-47043fda9569",
			"9aba4a5b-8fc3-4850-8a4e-39c037446999",
			"9b719138-b735-4ba1-9e11-cfd65050487e",
			"9b777791-39c9-4df0-9b8d-dea89df132e2",
			"9d63f7d9-4edb-30a4-6648-1a668d844131",
			"a0a706ba-7851-4725-a5d2-a89054fce24a",
			"ab5dd556-42d7-57e2-cd9e-dff681615468",
			"b46698b8-d062-4504-9574-19412ea971a6",
			"b55dd7b4-a6f7-4552-ac21-1b4414c56a1c",
			"bb22e215-9fcf-4860-9134-ec3dfb212277",
			"bedbf8c2-3a95-66a3-5afd-52309b9a8e1f",
			"cb9a6c7b-5cff-45f2-91ba-20d1f1c34c5f",
			"d51169e2-735d-e583-938d-42a2c1b7f2d4",
			"d7da233c-2b02-4684-985f-783ec2ded1f0",
			"da9827fe-4d2e-47bd-8ac0-a55572bb9d53",
			"e0255830-ef60-4bf4-8c9b-cfbcc6312cab",
			"e4dfcc94-c920-40a9-9099-e26ddc91411d",
			"e7d4f4fc-4419-8aa3-9fdb-976ed3fe3f81",
			"e81a8a28-23a8-40ac-a925-4fe1166abf1e",
			"e977e211-2123-4081-85b6-6abbb815e810",
			"f2b0402b-1c69-4d5f-92ed-1240b94339c4",
			"f6c982ab-e1b3-4064-a905-5ef57ef5553f",
			"fa3d6ead-0021-4d26-a73f-3ebaf71f92fb")
		ORDER BY text_uuid, object_on_tablet;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
		CREATE TEMPORARY TABLE IF NOT EXISTS temp_result_table (
		  `uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NOT NULL,
		  `text_uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NULL,
		  `parent_uuid` CHAR(36) CHARACTER SET 'latin1' NULL,
		  `type` VARCHAR(20) NULL,
		  `object_on_tablet` INT NULL,
		  `order_num` DECIMAL(7,3) NULL,
          `char_on_tablet` INT NULL,
		  `char_on_line` INT NULL,
		  `min` DECIMAL(7,3) NULL,
		  `max` DECIMAL(7,3) NULL,
		  `previous_min` DECIMAL(7,3) NULL,
		  `previous_max` DECIMAL(7,3) NULL,
          `discourse_uuid` CHAR(36) CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci' NULL,
		  PRIMARY KEY (`uuid`),
		  INDEX `uuid` (`uuid` ASC),
		  INDEX `text_uuid` (`text_uuid` ASC),
		  INDEX `parent_uuid` (`parent_uuid` ASC))
		ENGINE = InnoDB
		DEFAULT CHARACTER SET = utf8mb4
		COLLATE = utf8mb4_bin;
        
        OPEN cur1;
		read_loop: LOOP
		FETCH cur1 INTO this_uuid, this_text_uuid, this_parent_uuid, this_type, this_object_on_tablet, this_char_on_tablet, this_char_on_line, this_min, this_max, this_discourse_uuid, this_parent;
			IF done THEN
				LEAVE read_loop;
			END IF;

            IF (this_parent IS NULL) THEN
				IF (this_type IN ('number','sign','undeterminedSigns','separator','stamp')) THEN
					SET this_min = (SELECT MIN(object_on_tablet) FROM text_epigraphy WHERE parent_uuid = CONVERT(this_parent_uuid USING LATIN1) COLLATE latin1_swedish_ci ORDER BY object_on_tablet);
					IF (this_char_on_line IS NULL) THEN
						SET this_char_on_line = 1;
                    END IF;
                    IF (CHAR_LENGTH(this_char_on_line) = 1) THEN
						SET temp = CONCAT('0.00', this_char_on_line);
					ELSE
						SET temp = CONCAT('0.0', this_char_on_line);
					END IF;
					SET this_order_num = this_min+temp;
				ELSE 
					SET this_order_num = this_object_on_tablet;
                END IF;
            ELSE
				SET this_order_num = this_min-0.001;
            END IF;
			INSERT INTO temp_result_table (uuid,text_uuid,parent_uuid,`type`,object_on_tablet,order_num,char_on_tablet,char_on_line, min, max,`previous_min`,`previous_max`,discourse_uuid) VALUES (this_uuid,this_text_uuid,this_parent_uuid,this_type,this_object_on_tablet,this_order_num,this_char_on_tablet,this_char_on_line,this_min,this_max,previous_min,previous_max,this_discourse_uuid);
		    SET previous_min = this_min;
			SET previous_max = this_max;
       END LOOP;
		CLOSE cur1;
		CALL fix_object_on_tablet_issues_supplement;
-- 		SELECT * FROM temp_result_table WHERE text_uuid = "099fae97-3e91-fdfb-9e82-4a912c1c901c" ORDER BY text_uuid,min,char_on_line,order_num;
--      SELECT * FROM temp_result_table ORDER BY text_uuid,order_num;
		DROP TABLE temp_result_table;
    END