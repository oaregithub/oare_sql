-- shorthand and instructions for formulating the properties strings can be found at the following adress:
-- https://docs.google.com/spreadsheets/d/17_P7DN6nympvO1RxT7sbm7sJMqnKg1QVtcuVxTIk8qY/edit?usp=sharing
CREATE PROCEDURE `add_lemma`(IN word_uuid CHAR(36), this_string VARCHAR (250))
BEGIN
	DECLARE uuid1,sub1_uuid1,sub1_uuid2,sub1_uuid3,sub2_uuid1,sub2_uuid2,sub2_uuid3,sub2_uuid4,sub2_uuid5,sub3_uuid1,sub1_uuid4,sub1_uuid5,sub2_uuid6,sub2_uuid7,sub3_uuid2,sub1_uuid6,sub1_uuid7,sub1_uuid8,sub1_uuid9 CHAR(36) DEFAULT NULL;
	DECLARE dummy1 VARCHAR(250) CHARSET utf8mb4 DEFAULT '';
	DECLARE dummy2 INT DEFAULT NULL;
	SET uuid1 = UUID(); SET sub1_uuid1 = UUID(); SET sub1_uuid2 = UUID(); SET sub1_uuid3 = UUID(); SET sub2_uuid1 = UUID(); SET sub2_uuid2 = UUID(); SET sub2_uuid3 = UUID(); SET sub2_uuid4 = UUID(); SET sub2_uuid5 = UUID(); SET sub3_uuid1 = UUID(); SET sub1_uuid4 = UUID(); SET sub1_uuid5 = UUID(); SET sub2_uuid6 = UUID(); SET sub2_uuid7 = UUID(); SET sub3_uuid2 = UUID(); SET sub1_uuid6 = UUID(); SET sub1_uuid7 = UUID(); SET sub1_uuid8 = UUID(); SET sub1_uuid9 = UUID();
	SET this_string = REGEXP_REPLACE(this_string,"[.]"," ");
	IF (this_string != "") THEN
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES (uuid1,word_uuid,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","8a6062db-8a6b-f102-98aa-9fa5989bd0a5","ParsLemmae");
	END IF;
	IF (SELECT this_string REGEXP "^drph " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^drph ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid1,word_uuid,uuid1,1,"35893e7f-1f36-7b1e-c5a0-ed56d14d5344","5fb7e0fb-2aae-6f77-eba5-da1b0d8a0494","Dialect root phonemes");
		IF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		END IF;
		IF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		END IF;
		IF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		END IF;
		IF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid1,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		END IF;
	END IF;	
	IF (SELECT this_string REGEXP "^erph " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^erph ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid2,word_uuid,uuid_1,1,"35893e7f-1f36-7b1e-c5a0-ed56d14d5344","26986c51-6a8a-77f8-ee39-b928e6a1a897","Etymological Root Phonemes");
		IF (SELECT this_string REGEXP "^ḏ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḏ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5b484cea-9e33-0345-d1f4-89ad9e562340","Proto-Semitic ḏ");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^ś_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ś_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","46d757f9-74e3-d984-085d-dd7ecddc6fe1","Proto-Semitic ś");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		ELSEIF (SELECT this_string REGEXP "^ḥ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḥ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5511f30a-b8e7-468a-8616-a76ac4ef86cb","Proto-Semitic ḥ");
		ELSEIF (SELECT this_string REGEXP "^ʿ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʿ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","e013d9f3-6760-4a47-bcc3-8c1de0a61fb6","Proto-Semitic ʿ");
		ELSEIF (SELECT this_string REGEXP "^h_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^h_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","fe73ca8a-4555-4673-8513-3641bbe63789","Proto-Semitic h");
		ELSEIF (SELECT this_string REGEXP "^ġ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ġ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","693d6b52-49f9-4d56-8727-8718bd14c844","Proto-Semitic ġ");
		ELSEIF (SELECT this_string REGEXP "^ẓ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ẓ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","5dcee592-0ea6-43c4-8d66-09155ca654b4","Proto-Semitic ẓ");
		ELSEIF (SELECT this_string REGEXP "^ṯ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṯ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"243ce492-c8a1-2372-fa07-86fd92d6dc5f","d1176413-6836-421f-8013-46ab28d4726d","Proto-Semitic ṯ");
		END IF;
		IF (SELECT this_string REGEXP "^ḏ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḏ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5b484cea-9e33-0345-d1f4-89ad9e562340","Proto-Semitic ḏ");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^ś_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ś_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","46d757f9-74e3-d984-085d-dd7ecddc6fe1","Proto-Semitic ś");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		ELSEIF (SELECT this_string REGEXP "^ḥ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḥ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5511f30a-b8e7-468a-8616-a76ac4ef86cb","Proto-Semitic ḥ");
		ELSEIF (SELECT this_string REGEXP "^ʿ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʿ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","e013d9f3-6760-4a47-bcc3-8c1de0a61fb6","Proto-Semitic ʿ");
		ELSEIF (SELECT this_string REGEXP "^h_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^h_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","fe73ca8a-4555-4673-8513-3641bbe63789","Proto-Semitic h");
		ELSEIF (SELECT this_string REGEXP "^ġ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ġ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","693d6b52-49f9-4d56-8727-8718bd14c844","Proto-Semitic ġ");
		ELSEIF (SELECT this_string REGEXP "^ẓ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ẓ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","5dcee592-0ea6-43c4-8d66-09155ca654b4","Proto-Semitic ẓ");
		ELSEIF (SELECT this_string REGEXP "^ṯ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṯ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"3914e4c1-f237-dab0-6d2e-ae4dade0fa32","d1176413-6836-421f-8013-46ab28d4726d","Proto-Semitic ṯ");
		END IF;
		IF (SELECT this_string REGEXP "^ḏ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḏ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5b484cea-9e33-0345-d1f4-89ad9e562340","Proto-Semitic ḏ");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^ś_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ś_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","46d757f9-74e3-d984-085d-dd7ecddc6fe1","Proto-Semitic ś");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		ELSEIF (SELECT this_string REGEXP "^ḥ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḥ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5511f30a-b8e7-468a-8616-a76ac4ef86cb","Proto-Semitic ḥ");
		ELSEIF (SELECT this_string REGEXP "^ʿ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʿ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","e013d9f3-6760-4a47-bcc3-8c1de0a61fb6","Proto-Semitic ʿ");
		ELSEIF (SELECT this_string REGEXP "^h_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^h_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","fe73ca8a-4555-4673-8513-3641bbe63789","Proto-Semitic h");
		ELSEIF (SELECT this_string REGEXP "^ġ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ġ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","693d6b52-49f9-4d56-8727-8718bd14c844","Proto-Semitic ġ");
		ELSEIF (SELECT this_string REGEXP "^ẓ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ẓ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","5dcee592-0ea6-43c4-8d66-09155ca654b4","Proto-Semitic ẓ");
		ELSEIF (SELECT this_string REGEXP "^ṯ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṯ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"9cbdfdab-d530-17a2-8702-ce8c39b79dc5","d1176413-6836-421f-8013-46ab28d4726d","Proto-Semitic ṯ");
		END IF;
		IF (SELECT this_string REGEXP "^ḏ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḏ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5b484cea-9e33-0345-d1f4-89ad9e562340","Proto-Semitic ḏ");
		ELSEIF (SELECT this_string REGEXP "^d_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^d_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","793231e8-4ea8-73b3-a4b0-9484df9c62e1","Proto-Semitic d");
		ELSEIF (SELECT this_string REGEXP "^e_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","acc8e95e-b9ab-36b5-d652-938782b0bb59","Proto-Semitic e");
		ELSEIF (SELECT this_string REGEXP "^g_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^g_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","8adfbd30-e40f-a49c-d4a7-0d70d2b580a4","Proto-Semitic g");
		ELSEIF (SELECT this_string REGEXP "^ḫ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḫ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","50ad1f84-0c8d-2d06-4cb7-72d315adff31","Proto-Semitic ḫ");
		ELSEIF (SELECT this_string REGEXP "^i_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5e5804b0-eb07-8f73-5168-4ad4ab67bd62","Proto-Semitic i");
		ELSEIF (SELECT this_string REGEXP "^l_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^l_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","1ad46ea6-ba2a-60e0-50ab-6fd1eeb9cab9","Proto-Semitic l");
		ELSEIF (SELECT this_string REGEXP "^a_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","93471585-1394-5fc6-5dbd-bcccd883fb66","Proto-Semitic a");
		ELSEIF (SELECT this_string REGEXP "^n_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^n_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","880ee30e-9838-5d94-8d31-16bc8c135ca5","Proto-Semitic n");
		ELSEIF (SELECT this_string REGEXP "^m_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","3799bf0c-3d86-b2f0-c1fd-df35dbe12b21","Proto-Semitic m");
		ELSEIF (SELECT this_string REGEXP "^r_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^r_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","fcbc328b-3bb2-7486-a78a-6d555ad33fd4","Proto-Semitic r");
		ELSEIF (SELECT this_string REGEXP "^s_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^s_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","c5893a39-13bc-0de9-09d5-fc116fe0bcb6","Proto-Semitic s");
		ELSEIF (SELECT this_string REGEXP "^t_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^t_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5bf68155-4f46-f251-a519-65b838f8020f","Proto-Semitic t");
		ELSEIF (SELECT this_string REGEXP "^w_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^w_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","0db10b69-c709-a68b-effd-86144dd43a04","Proto-Semitic w");
		ELSEIF (SELECT this_string REGEXP "^y_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^y_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","e101569c-cf3f-6807-4334-8b033ee30cec","Proto-Semitic y");
		ELSEIF (SELECT this_string REGEXP "^ś_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ś_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","46d757f9-74e3-d984-085d-dd7ecddc6fe1","Proto-Semitic ś");
		ELSEIF (SELECT this_string REGEXP "^b_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^b_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","ec55b2c7-4af2-9655-871f-b6414e128f41","Proto-Semitic b");
		ELSEIF (SELECT this_string REGEXP "^ṣ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṣ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","b9888c07-5777-29c4-8c22-edf32e61be2e","Proto-Semitic ṣ");
		ELSEIF (SELECT this_string REGEXP "^š_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^š_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","d734471d-2afa-d90e-ee42-efdc7b418018","Proto-Semitic š");
		ELSEIF (SELECT this_string REGEXP "^z_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^z_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","78a6d5a1-69b9-19ae-c891-1ef63f53a6bd","Proto-Semitic z");
		ELSEIF (SELECT this_string REGEXP "^q_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^q_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","4b8fad39-5e98-29fe-1a43-ffdfb097d5d6","Proto-Semitic q");
		ELSEIF (SELECT this_string REGEXP "^k_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^k_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","85336bdb-adf6-c198-2c0d-55fdc0630405","Proto-Semitic k");
		ELSEIF (SELECT this_string REGEXP "^ṭ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṭ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","cf56f5ba-0a8c-8994-8546-d21308e016a5","Proto-Semitic ṭ");
		ELSEIF (SELECT this_string REGEXP "^p_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^p_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","a1b7dc75-d35a-75a1-e492-341c3556fe76","Proto-Semitic p");
		ELSEIF (SELECT this_string REGEXP "^ʾ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʾ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","350a807f-e02b-41c4-2c12-9c720943b286","Proto-Semitic ʾ");
		ELSEIF (SELECT this_string REGEXP "^u_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","fff2bfe8-ab55-964d-c07d-2b056fa60239","Proto-Semitic u");
		ELSEIF (SELECT this_string REGEXP "^ḥ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ḥ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5511f30a-b8e7-468a-8616-a76ac4ef86cb","Proto-Semitic ḥ");
		ELSEIF (SELECT this_string REGEXP "^ʿ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ʿ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","e013d9f3-6760-4a47-bcc3-8c1de0a61fb6","Proto-Semitic ʿ");
		ELSEIF (SELECT this_string REGEXP "^h_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^h_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","fe73ca8a-4555-4673-8513-3641bbe63789","Proto-Semitic h");
		ELSEIF (SELECT this_string REGEXP "^ġ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ġ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","693d6b52-49f9-4d56-8727-8718bd14c844","Proto-Semitic ġ");
		ELSEIF (SELECT this_string REGEXP "^ẓ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ẓ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","5dcee592-0ea6-43c4-8d66-09155ca654b4","Proto-Semitic ẓ");
		ELSEIF (SELECT this_string REGEXP "^ṯ_phon " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ṯ_phon ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid2,2,"cfda411b-7a71-49fb-8e9e-0d775f95ede5","d1176413-6836-421f-8013-46ab28d4726d","Proto-Semitic ṯ");
		END IF;
	END IF;
	IF (SELECT this_string REGEXP "^adj " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^adj ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","81eeb01f-f247-2b19-2dc2-c95812bf5789","Adjective");
		IF (SELECT this_string REGEXP "^decl " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^decl ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid1,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","c1548ea6-0385-3352-af92-55b624165c1b","(Declined)");
			IF (SELECT this_string REGEXP "^num " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^num ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","780b8a2a-1190-a1e3-6cbc-673d419a77ac","Numeral");
				IF (SELECT this_string REGEXP "^ord " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^ord ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","9211746f-6ae4-776c-765b-e8dcf0b62eb6","Ordinal");
				END IF;
			ELSEIF (SELECT this_string REGEXP "^vb_adj " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^vb_adj ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","c6069b7e-9036-25ee-8a1c-cbc50b1b8e20","Verbal Adjective");
			ELSEIF (SELECT this_string REGEXP "^demonstr " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^demonstr ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","ee5a48c4-b5bc-3c46-6aa1-f71c8ad07efc","Demonstrative");
			ELSEIF (SELECT this_string REGEXP "^ana " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^ana ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","d100384c-3154-34d9-3fee-2d8345b36e8c","Anaphoric");
			ELSEIF (SELECT this_string REGEXP "^nisbe " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^nisbe ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","3c201753-ffe0-45de-8205-e8c301b19452","Nisbe adjective");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^indec " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^indec ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid2,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","59b26c7e-5269-171b-0da3-1beed6ec08bc","(Indeclinable)");
			IF (SELECT this_string REGEXP "^indef " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^indef ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","d7e22ad8-5f7b-8336-81e7-f223be68eea0","Indefinite");
			ELSEIF (SELECT this_string REGEXP "^interr " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^interr ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","1b41cf0e-6a09-4f49-0394-85edf6f74b53","Interrogative");
			END IF;
		END IF;
	ELSEIF (SELECT this_string REGEXP "^adv " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^adv ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","36e4ca3d-2cc6-bb9d-d57c-ce19cacb1a0c","Adverb");
		IF (SELECT this_string REGEXP "^interr " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^interr ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","1b41cf0e-6a09-4f49-0394-85edf6f74b53","Interrogative");
		ELSEIF (SELECT this_string REGEXP "^neg " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^neg ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","cc040505-c471-8cc8-43cf-dabbd75ce78a","Negative");
		ELSEIF (SELECT this_string REGEXP "^indef " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^indef ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","d7e22ad8-5f7b-8336-81e7-f223be68eea0","Indefinite");
		END IF;
		IF (SELECT this_string REGEXP "^place " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^place ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"4b138675-48d7-41b8-bb8a-17391234eff1","869b5bdd-9ebe-4d09-bcfb-0104aca1ca35","place");
		ELSEIF (SELECT this_string REGEXP "^time " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^time ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"4b138675-48d7-41b8-bb8a-17391234eff1","9aa736ed-ff1c-43c2-bff7-95ce2ff00e02","time");
		ELSEIF (SELECT this_string REGEXP "^man " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^man ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"4b138675-48d7-41b8-bb8a-17391234eff1","e770aae0-0e3b-4308-ae33-878fbe07af79","manner");
		ELSEIF (SELECT this_string REGEXP "^degree " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^degree ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"4b138675-48d7-41b8-bb8a-17391234eff1","127d9bef-965c-4d6c-b661-5c77cf796d96","degree");
		ELSEIF (SELECT this_string REGEXP "^evident " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^evident ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"4b138675-48d7-41b8-bb8a-17391234eff1","5251871b-1a2c-4054-9ce8-376fe3b596f7","evidentiary");
		ELSEIF (SELECT this_string REGEXP "^epist " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^epist ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"4b138675-48d7-41b8-bb8a-17391234eff1","a601fd26-cc57-42a2-86b7-c311d4301894","epistemic");
		END IF;
	ELSEIF (SELECT this_string REGEXP "^cnj " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^cnj ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","c978258d-8754-adc5-e19d-21b42e559055","Conjunction");
	ELSEIF (SELECT this_string REGEXP "^itj " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^itj ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","4f96bb15-09e7-850d-3fac-60be3be7c88c","Interjection");
	ELSEIF (SELECT this_string REGEXP "^noun " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^noun ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","2543c975-7768-fb7b-16d8-6246d935d26b","Noun");
		IF (SELECT this_string REGEXP "^prop_noun " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^prop_noun ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid1,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","45ba95f5-951c-e524-94a1-9c3028c1352b","Proper noun");
			IF (SELECT this_string REGEXP "^PN " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PN ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub2_uuid2,word_uuid,sub1_uuid3,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","9ffdc924-953b-d695-3230-abc990884992","Personal name");
				IF (SELECT this_string REGEXP "^adv_phrase " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^adv_phrase ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub2_uuid2,4,"859939fd-bdf6-fa7b-fa93-3f42207e1005","a427b30c-7cd3-0ae4-3d7c-7b921932fd33","Adverbial Phrase");
				ELSEIF (SELECT this_string REGEXP "^nomphrs " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^nomphrs ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub2_uuid2,4,"859939fd-bdf6-fa7b-fa93-3f42207e1005","e08ce6db-0514-29fb-cec4-48c18c0e1cfe","Nominal Phrase");
				ELSEIF (SELECT this_string REGEXP "^verb_phrase " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^verb_phrase ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub2_uuid2,4,"859939fd-bdf6-fa7b-fa93-3f42207e1005","f12572cd-0568-bd25-ef3b-1437ca4ea16d","Verbal Phrase");
				ELSEIF (SELECT this_string REGEXP "^hypochor " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^hypochor ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub2_uuid2,4,"859939fd-bdf6-fa7b-fa93-3f42207e1005","a050f8ec-ef54-c7d2-677a-3e5701d0407d","Hypochoristic");
				ELSEIF (SELECT this_string REGEXP "^sent_name " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sent_name ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub2_uuid2,4,"859939fd-bdf6-fa7b-fa93-3f42207e1005","7e750fdc-b9ae-4d73-8a08-74152f72cb5e","Sentence Name");
				END IF;
			ELSEIF (SELECT this_string REGEXP "^GN " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^GN ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub2_uuid2,word_uuid,sub1_uuid3,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","ea1e6ed0-c7ce-43d6-1dcf-9d35e3970220","Geographic name");
			ELSEIF (SELECT this_string REGEXP "^DN " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^DN ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub2_uuid2,word_uuid,sub1_uuid3,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","7858c01e-60af-fa93-d2be-3bdc37f1ab71","Divine Name");
			END IF;
		END IF;
		IF (SELECT this_string REGEXP "^less_three_root " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^less_three_root ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid3,word_uuid,sub1_uuid3,2,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","a4a7c6e9-36d2-42e3-aa64-22e00d3a23bf","Less than three 'root' consonants");
			IF (SELECT this_string REGEXP "^PaS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","474e6759-2523-4d45-a196-830284f7aac6","PaS");
			ELSEIF (SELECT this_string REGEXP "^PiS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","a8eead2f-ca21-42d0-9528-62caaf2ed224","PiS");
			ELSEIF (SELECT this_string REGEXP "^PuS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","45482b60-e5eb-4b10-923c-c237f7d19611","PuS");
			ELSEIF (SELECT this_string REGEXP "^PaSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","0edf1039-492c-466a-b0af-8b40c0d22fc8","PaSt");
			ELSEIF (SELECT this_string REGEXP "^PiSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","36490071-39cf-44e2-bf94-199af1cd917d","PiSt");
			ELSEIF (SELECT this_string REGEXP "^PuSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","7307be36-0d10-4881-9b41-5fe155e134d3","PuSt");
			ELSEIF (SELECT this_string REGEXP "^PaSāt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaSāt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e1a237bc-6926-4b30-84d7-c2e2b3900196","PaSāt");
			ELSEIF (SELECT this_string REGEXP "^PiSāt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiSāt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","26921e94-534c-448f-8c8e-cba9766991b5","PiSāt");
			END IF;
		END IF;
		IF (SELECT this_string REGEXP "^three_root " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^three_root ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid3,word_uuid,sub1_uuid3,2,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","173badf4-4b2d-4601-b159-917fd58b52b7","Three 'root' consonants");
			IF (SELECT this_string REGEXP "^PaRS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","b424e9d4-30aa-419b-8417-b9b19f95ef3a","PaRS");
			ELSEIF (SELECT this_string REGEXP "^PaRSat " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRSat ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","95d0c0c0-4eb8-4172-8317-1740eeebb480","PaRSat");
			ELSEIF (SELECT this_string REGEXP "^PiRS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiRS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","df41452d-f0f1-424f-bb50-c1b4bee816a8","PiRS");
			ELSEIF (SELECT this_string REGEXP "^PiRSat " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiRSat ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","f89717d0-8a21-47b5-af2a-57323bde5826","PiRSat");
			ELSEIF (SELECT this_string REGEXP "^PuRS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","6c75c7f6-d299-471e-a5ae-b6dcf054d0bb","PuRS");
			ELSEIF (SELECT this_string REGEXP "^PuRSat " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRSat ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","c9138130-a9f4-4fde-a005-a522228a941c","PuRSat");
			ELSEIF (SELECT this_string REGEXP "^PaRRaS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRRaS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","5c5663f1-3ecf-4bed-864c-55403e3dcf5d","PaRRaS");
			ELSEIF (SELECT this_string REGEXP "^PaRiS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRiS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","87291f4a-2624-4ecd-a7b4-22dd21fbca81","PaRiS");
			ELSEIF (SELECT this_string REGEXP "^PaRiSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRiSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","5c169f19-4444-488b-b44a-190637c0a051","PaRiSt");
			ELSEIF (SELECT this_string REGEXP "^PaRuS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRuS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","6c34fb27-2ff3-4a12-8062-391ca48dfdd6","PaRuS");
			ELSEIF (SELECT this_string REGEXP "^PaRuSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRuSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","39fcb1c7-ed41-498c-9e39-42b90ed8df59","PaRuSt");
			ELSEIF (SELECT this_string REGEXP "^PaRāS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRāS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","ef9ba390-4a4b-48a6-90fe-574f5342bcd9","PaRāS");
			ELSEIF (SELECT this_string REGEXP "^PaRāSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRāSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","f56840cb-93a3-40da-9216-4a08f70681ea","PaRāSt");
			ELSEIF (SELECT this_string REGEXP "^PaRīS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRīS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e072c8d5-8590-4457-ab64-07d0d299b51c","PaRīS");
			ELSEIF (SELECT this_string REGEXP "^PaRīSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRīSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","867a8cfb-65a1-40f2-8a13-24661d0f43e1","PaRīSt");
			ELSEIF (SELECT this_string REGEXP "^ParūS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^ParūS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","831bd8dc-ba42-4319-b528-18d8611a1782","ParūS");
			ELSEIF (SELECT this_string REGEXP "^ParūSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^ParūSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","d84d082a-c8ca-4cf1-b507-8b01b3888b97","ParūSt");
			ELSEIF (SELECT this_string REGEXP "^PiRiSS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiRiSS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","dd4fec5f-c9fb-43ba-95ea-a7d980b98785","PiRiSS");
			ELSEIF (SELECT this_string REGEXP "^iPRiS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^iPRiS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","cd27fcb0-6b5c-42a0-80b6-656144bb4c2a","iPRiS");
			ELSEIF (SELECT this_string REGEXP "^PiRiSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PiRiSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","aba69fab-b618-4107-8bf0-a04a29fac6e4","PiRiSt");
			ELSEIF (SELECT this_string REGEXP "^PuRuSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRuSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","3dea8820-491d-41f3-91ab-ab4670c1addc","PuRuSt");
			ELSEIF (SELECT this_string REGEXP "^PuRūS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRūS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","a9217a3c-5045-4f20-a2fd-dfc9e7cdef9f","PuRūS");
			ELSEIF (SELECT this_string REGEXP "^PuRuSS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRuSS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e491878d-2f51-4ba6-a400-6db7fd6efb1d","PuRuSS");
			ELSEIF (SELECT this_string REGEXP "^PuRuSSat " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRuSSat ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","ca6c405e-1ca3-41db-aa15-52446a2229c2","PuRuSSat");
			ELSEIF (SELECT this_string REGEXP "^PuRāS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRāS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e47b0588-4057-4f63-a2a2-e160c21ce355","PuRāS");
			ELSEIF (SELECT this_string REGEXP "^PuRuSSāʾ " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PuRuSSāʾ ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","6e8b2a42-6950-486b-ba48-a78baed42632","PuRuSSāʾ");
			ELSEIF (SELECT this_string REGEXP "^PaRRāS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRRāS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","f7048b7b-4983-4a47-971b-2581a809088a","PaRRāS");
			ELSEIF (SELECT this_string REGEXP "^PaRRuSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PaRRuSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","314f5134-5663-4bac-8416-cc0cfecdf951","PaRRuSt");
			ELSEIF (SELECT this_string REGEXP "^maPRaS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRaS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","693f08cb-9f4f-45c7-ad09-8df255a294ad","maPRaS");
			ELSEIF (SELECT this_string REGEXP "^maPRaSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRaSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","635bbe2b-538b-45f6-ac76-bb4b8d06a3b5","maPRaSt");
			ELSEIF (SELECT this_string REGEXP "^maPRāS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRāS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","7e41e857-e010-42e9-aeb5-a8534d0efa5b","maPRāS");
			ELSEIF (SELECT this_string REGEXP "^maPRiS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRiS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","0cc17013-e5e8-4f6f-bc37-6a487a3908cc","maPRiS");
			ELSEIF (SELECT this_string REGEXP "^maPRiSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRiSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e772b801-f434-404d-ac98-444a04928c64","maPRiSt");
			ELSEIF (SELECT this_string REGEXP "^maPRuS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRuS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","17c63f6a-8ec7-4688-8338-35c6d2e6e109","maPRuS");
			ELSEIF (SELECT this_string REGEXP "^maPRuSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^maPRuSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","9d6296e0-a4f9-44c2-8b62-a90feb1beffd","maPRuSt");
			ELSEIF (SELECT this_string REGEXP "^mu_stem " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^mu_stem ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","03400bf6-edcf-4632-8f41-94e478ab2492","mu- stem");
			ELSEIF (SELECT this_string REGEXP "^šaPRuSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^šaPRuSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","9cf1fccb-1e08-469e-8c2a-8a2c92ef72c1","šaPRuSt");
			ELSEIF (SELECT this_string REGEXP "^šaPRaS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^šaPRaS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","5ebf465a-ad36-490d-8804-52bb2f16018c","šaPRaS");
			ELSEIF (SELECT this_string REGEXP "^šaPRāS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^šaPRāS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e4f5fbd4-b8a6-417c-9f00-dd0529df6c4f","šaPRāS");
			ELSEIF (SELECT this_string REGEXP "^taPRiSt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^taPRiSt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","03a54a33-f65f-4066-b528-083d7a4fb3c1","taPRiSt");
			ELSEIF (SELECT this_string REGEXP "^PitRuS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PitRuS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e006cd8f-94d2-40e8-8270-b8ddd3270d63","PitRuS");
			ELSEIF (SELECT this_string REGEXP "^PitRāS " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^PitRāS ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid3,3,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","cc80ebb7-afbc-498a-9ac0-007396c83dc8","PitRāS");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^four_cons " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^four_cons ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid3,word_uuid,sub1_uuid3,2,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","e48205d0-98ee-4c6d-9489-a38cfc92fb3d","Four consonants");
		ELSEIF (SELECT this_string REGEXP "^five_cons " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^five_cons ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid3,word_uuid,sub1_uuid3,2,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","12d9a610-b852-4b92-97c2-eb33d8c09bf1","Five consonants");
		ELSEIF (SELECT this_string REGEXP "^deverb " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^deverb ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid3,word_uuid,sub1_uuid3,2,"8c814b38-f925-ae6d-8d65-c4bc58944b6f","6c684f64-c2ce-4130-82bb-dc56ce221005","Deverbal");
		END IF;
		IF (SELECT this_string REGEXP "^m " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^m ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid4,word_uuid,sub1_uuid3,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
			IF (SELECT this_string REGEXP "^prim " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^prim ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid4,3,"b63b5e02-3e1f-6d64-4fd2-3aaf47adad92","7af8b2f6-d4af-1893-70e3-4b97f5dfc382","Primary Frequency");
			ELSEIF (SELECT this_string REGEXP "^neut " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^neut ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid4,3,"b63b5e02-3e1f-6d64-4fd2-3aaf47adad92","0fc69e0a-3733-12ed-cf04-a5d70fcc1c5d","Neutral Frequency");
			ELSEIF (SELECT this_string REGEXP "^rare " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^rare ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid4,3,"b63b5e02-3e1f-6d64-4fd2-3aaf47adad92","f0c32a4f-bbfb-917d-d383-581d330f681f","Rare Frequncy");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^f " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^f ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid4,word_uuid,sub1_uuid3,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
			IF (SELECT this_string REGEXP "^prim " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^prim ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid4,3,"b63b5e02-3e1f-6d64-4fd2-3aaf47adad92","7af8b2f6-d4af-1893-70e3-4b97f5dfc382","Primary Frequency");
			ELSEIF (SELECT this_string REGEXP "^neut " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^neut ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid4,3,"b63b5e02-3e1f-6d64-4fd2-3aaf47adad92","0fc69e0a-3733-12ed-cf04-a5d70fcc1c5d","Neutral Frequency");
			ELSEIF (SELECT this_string REGEXP "^rare " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^rare ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid4,3,"b63b5e02-3e1f-6d64-4fd2-3aaf47adad92","f0c32a4f-bbfb-917d-d383-581d330f681f","Rare Frequncy");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^unkn " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^unkn ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid4,word_uuid,sub1_uuid3,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","551e1c33-244c-4c00-b04c-e32d99c2da31","Unknown");
		END IF;
		IF (SELECT this_string REGEXP "^prim_noun " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^prim_noun ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid5,word_uuid,sub1_uuid3,2,"45af7973-41fb-4b93-853b-e7930a804401","1d18cdd4-e259-4883-a6a7-6767756cdd79","Primary Noun");
		ELSEIF (SELECT this_string REGEXP "^deverb_noun " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^deverb_noun ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid5,word_uuid,sub1_uuid3,2,"45af7973-41fb-4b93-853b-e7930a804401","8e5a565c-75f5-4a81-b579-335222092938","Deverbal Noun");
		ELSEIF (SELECT this_string REGEXP "^denom_noun " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^denom_noun ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid5,word_uuid,sub1_uuid3,2,"45af7973-41fb-4b93-853b-e7930a804401","6ad1c328-bbfa-423d-9f86-94bb620fe10e","Denominal Noun");
		END IF;
	ELSEIF (SELECT this_string REGEXP "^num " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^num ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","780b8a2a-1190-a1e3-6cbc-673d419a77ac","Numeral");
	ELSEIF (SELECT this_string REGEXP "^part " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^part ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","73184ba8-1d66-44ae-bda6-c78249120bdd","Particle");
	ELSEIF (SELECT this_string REGEXP "^prep " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^prep ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","67a5cc67-55f7-3ade-2aff-c676d7996b17","Preposition");
	ELSEIF (SELECT this_string REGEXP "^prn " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^prn ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","73c4621c-b8ca-223e-fe1c-f603c480691f","Pronoun");
		IF (SELECT this_string REGEXP "^indef " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^indef ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","d7e22ad8-5f7b-8336-81e7-f223be68eea0","Indefinite");
		ELSEIF (SELECT this_string REGEXP "^interr " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^interr ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","1b41cf0e-6a09-4f49-0394-85edf6f74b53","Interrogative");
		ELSEIF (SELECT this_string REGEXP "^pers_pronoun " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^pers_pronoun ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid1,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","d9ab753b-af7b-8c2f-bd7d-ee9542b77e6b","Personal Pronoun");
			IF (SELECT this_string REGEXP "^indep " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^indep ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub3_uuid1,word_uuid,sub2_uuid1,3,"11be11d9-f2e8-e12b-520d-88d7f653b746","7fa58d93-1dab-b27d-e6c5-c03b7218b219","Independent personal pronoun");
				IF (SELECT this_string REGEXP "^first " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^second ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^third ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^c " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^c ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				ELSEIF (SELECT this_string REGEXP "^m " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^m ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^f ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				END IF;
				IF (SELECT this_string REGEXP "^sg " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^pl ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid1,4,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
				END IF;
			END IF;
		END IF;
		IF (SELECT this_string REGEXP "^suf " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^suf ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid2,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
			IF (SELECT this_string REGEXP "^dat " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^dat ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","6dd4a486-8211-4be3-2094-ba51b36cc5aa","Dative");
			ELSEIF (SELECT this_string REGEXP "^gen " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^gen ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
			ELSEIF (SELECT this_string REGEXP "^acc " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^acc ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","5844ffb8-86e5-d516-69c3-21df50cce115","Accusative");
			END IF;
			IF (SELECT this_string REGEXP "^sg " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^sg ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
			ELSEIF (SELECT this_string REGEXP "^pl " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^pl ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
			END IF;
		END IF;
		IF (SELECT this_string REGEXP "^indep_poss " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^indep_poss ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid2,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","88a5d094-1e27-8e01-d358-dd3a59fe4c5f","Independent possessive");
			IF (SELECT this_string REGEXP "^first " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^first ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
			ELSEIF (SELECT this_string REGEXP "^second " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^second ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
			ELSEIF (SELECT this_string REGEXP "^third " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^third ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
			END IF;
			IF (SELECT this_string REGEXP "^m " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^m ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
			ELSEIF (SELECT this_string REGEXP "^f " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^f ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
			ELSEIF (SELECT this_string REGEXP "^c " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^c ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
			END IF;
			IF (SELECT this_string REGEXP "^sg " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^sg ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
			ELSEIF (SELECT this_string REGEXP "^pl " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^pl ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid2,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^rel_det " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^rel_det ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid2,word_uuid,sub1_uuid3,2,"11be11d9-f2e8-e12b-520d-88d7f653b746","b1173fdd-8263-4098-9a8d-cdefbd79d72d","Relative/Determinative");
		END IF;
	ELSEIF (SELECT this_string REGEXP "^verb " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^verb ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid3,word_uuid,uuid1,1,"11be11d9-f2e8-e12b-520d-88d7f653b746","e8f7ff00-1efe-af07-3385-244f7646e99d","Verb");
		IF (SELECT this_string REGEXP "^a_a " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_a ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"84279fdd-070e-48b0-9547-40fefbc08722","23a3ffdd-9011-37d7-0df7-b16be0287ac8","a/a-Class");
		ELSEIF (SELECT this_string REGEXP "^a_i " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_i ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"84279fdd-070e-48b0-9547-40fefbc08722","e8cfddd2-1c08-4d77-8efe-8d94952509d7","a/i-Class");
		ELSEIF (SELECT this_string REGEXP "^a_u " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^a_u ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"84279fdd-070e-48b0-9547-40fefbc08722","c74ff2dc-b8bd-2ecb-ca88-bdefde60ebca","a/u-Class");
		ELSEIF (SELECT this_string REGEXP "^e_e " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^e_e ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"84279fdd-070e-48b0-9547-40fefbc08722","65451f9f-4a1a-4104-9f03-b9eefcae9443","e/e-Class");
		ELSEIF (SELECT this_string REGEXP "^i_i " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^i_i ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"84279fdd-070e-48b0-9547-40fefbc08722","533e331a-afce-74e7-db86-b4101fcf564b","i/i-Class");
		ELSEIF (SELECT this_string REGEXP "^u_u " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^u_u ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"84279fdd-070e-48b0-9547-40fefbc08722","68548582-bd49-a9aa-9eea-8bf601f55582","u/u-Class");
		END IF;
		IF (SELECT this_string REGEXP "^trans " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^trans ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","32baa262-e73a-4661-b0d9-c6377afd8011","transitive");
		ELSEIF (SELECT this_string REGEXP "^intrans " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^intrans ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","510d4bdb-c608-463c-9d56-fe8114105e84","intransitive");
		ELSEIF (SELECT this_string REGEXP "^atelic " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^atelic ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","19df000d-0ff5-4b3d-b7ae-5db14bb2e3c5","atelic activity");
		ELSEIF (SELECT this_string REGEXP "^adjectival " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^adjectival ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","e558f3ee-05ed-41ca-b7ba-211b91e0ce1b","adjectival");
		ELSEIF (SELECT this_string REGEXP "^fient " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^fient ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","3665002e-0b13-43e2-84d3-449e44edf655","fientive");
		ELSEIF (SELECT this_string REGEXP "^punct " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^punct ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","3bee5315-b121-4273-a677-8bc3c422275c","punctual");
		ELSEIF (SELECT this_string REGEXP "^dur " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^dur ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","bd8361f0-ac08-4818-88ad-472028582e11","durative");
		ELSEIF (SELECT this_string REGEXP "^denom " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^denom ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","244c4d97-238c-45e5-8812-ee9f4ab73338","denominal");
		ELSEIF (SELECT this_string REGEXP "^stat " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^stat ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"d5b3e2cb-ad46-46bb-a5ca-8e82dc47a8a6","ceda555e-462b-4b29-833f-b1ed1c3c2ca6","stative");
		END IF;
		IF (SELECT this_string REGEXP "^II_ā " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^II_ā ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","6341380d-4faf-475a-b731-49b532de7958","II/ā");
		ELSEIF (SELECT this_string REGEXP "^II_ī " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^II_ī ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","4f6b4494-0a81-452e-aaef-965bdb22ccd3","II/ī");
		ELSEIF (SELECT this_string REGEXP "^II_ī_ē " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^II_ī_ē ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","f4e1129a-c27c-4b47-a08a-127de5e5bf73","II/ī or ē");
		ELSEIF (SELECT this_string REGEXP "^II_ū " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^II_ū ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","658f8d90-56a4-4d6e-9f87-2d5b18038b40","II/ū");
		ELSEIF (SELECT this_string REGEXP "^III_ī " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^III_ī ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","99817b57-1ea6-4fe3-be0c-ccfb84ac95d3","III/ī");
		ELSEIF (SELECT this_string REGEXP "^III_ū " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^III_ū ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","7faabfdf-05dc-4f98-ac58-d53d9ed80740","III/ū");
		ELSEIF (SELECT this_string REGEXP "^I_w " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^I_w ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127c50f9-b8ef-11ec-bcc3-0282f921eac9","I/w");
		ELSEIF (SELECT this_string REGEXP "^I_y " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^I_y ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d1ce0-b8ef-11ec-bcc3-0282f921eac9","I/*y");
		ELSEIF (SELECT this_string REGEXP "^I_a " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^I_a ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d21a4-b8ef-11ec-bcc3-0282f921eac9","I/a");
		ELSEIF (SELECT this_string REGEXP "^I_e " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^I_e ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d2407-b8ef-11ec-bcc3-0282f921eac9","I/e");
		ELSEIF (SELECT this_string REGEXP "^I_n " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^I_n ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d2ae0-b8ef-11ec-bcc3-0282f921eac9","I/n");
		ELSEIF (SELECT this_string REGEXP "^II_al " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^II_al ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d2dd1-b8ef-11ec-bcc3-0282f921eac9","II/aleph");
		ELSEIF (SELECT this_string REGEXP "^II_gem " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^II_gem ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d2fd4-b8ef-11ec-bcc3-0282f921eac9","II/gem");
		ELSEIF (SELECT this_string REGEXP "^III_ā " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^III_ā ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d3383-b8ef-11ec-bcc3-0282f921eac9","III/ā");
		ELSEIF (SELECT this_string REGEXP "^III_ē " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^III_ē ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid3,2,"fb87fc51-b8ea-11ec-bcc3-0282f921eac9","127d3555-b8ef-11ec-bcc3-0282f921eac9","III/ē");
		END IF;
	END IF;
	IF (SELECT this_string REGEXP "^uom " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^uom ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid4,word_uuid,uuid1,1,"69ed2768-ad6a-52c4-9a0e-b780e46bddff","2539f4bc-759c-4a14-a933-ff7358a33e73","Unit of measure");
		IF (SELECT this_string REGEXP "^volume " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^volume ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid4,2,"b446398d-8f35-d249-c350-e1b38e6b0b1f","4cf89eb0-7e59-cb6c-d5b2-1766c8c637cb","Volume");
		ELSEIF (SELECT this_string REGEXP "^mass " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^mass ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid4,2,"b446398d-8f35-d249-c350-e1b38e6b0b1f","2400788a-bdde-4902-b222-3af1508b1453","Mass");
		END IF;
	ELSEIF (SELECT this_string REGEXP "^phys_obj " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^phys_obj ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid5,word_uuid,uuid1,1,"69ed2768-ad6a-52c4-9a0e-b780e46bddff","db2bef08-dac5-4087-8f0f-14c50bb3641a","Physical Object");
		IF (SELECT this_string REGEXP "^jewel " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^jewel ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","0850aa9e-6f7c-44ec-8f3c-2ad6d8ac3383","Jewelry/decorative wear");
		ELSEIF (SELECT this_string REGEXP "^textile " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^textile ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","777dfcc4-69cf-4ed4-9ff2-5993245cf1ab","Textile");
		ELSEIF (SELECT this_string REGEXP "^tool " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^tool ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","f661a2c9-cc5c-4665-834e-372558d51e73","Tool");
		ELSEIF (SELECT this_string REGEXP "^house_furn " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^house_furn ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","8cd948c7-e311-47a5-86c7-5af8645067f2","Household furnishing");
		ELSEIF (SELECT this_string REGEXP "^utensil " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^utensil ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","974c196a-4294-49ec-9379-fa33d28e6f6d","Food production utensil");
		ELSEIF (SELECT this_string REGEXP "^build_mat " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^build_mat ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","92d7a83b-1db7-4042-a4e7-717fa1ca64dd","Building material/architectural element");
		ELSEIF (SELECT this_string REGEXP "^cont " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^cont ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","743239e0-1c03-4d2e-b358-bd157d8dda3f","Container");
		ELSEIF (SELECT this_string REGEXP "^cloth " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^cloth ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","b1ace1d0-c4ea-49bb-963a-2cc13beceda6","Clothing");
		ELSEIF (SELECT this_string REGEXP "^animal_prod " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^animal_prod ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","dc1b7d8a-55f1-4243-aa2e-57089916a80a","Animal Product");
		ELSEIF (SELECT this_string REGEXP "^food " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^food ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","af549af6-0042-43c2-b3d9-a1d3fe3bcb5a","Foodstuff");
		ELSEIF (SELECT this_string REGEXP "^precious " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^precious ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","dc227f6e-3490-43f5-9f43-a9e31a8ea9ec","Preciousity");
		ELSEIF (SELECT this_string REGEXP "^ec_good " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ec_good ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid6,word_uuid,sub1_uuid5,2,"7090998c-26b7-48df-a392-e1b31f332927","23dfbdf5-d1ed-b4ee-f633-946a90e8b42e","Economic Good");
			IF (SELECT this_string REGEXP "^cnt " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^cnt ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid6,3,"b446398d-8f35-d249-c350-e1b38e6b0b1f","9aa094fb-28b6-9afa-a4ac-883e52ee8e5a","Measured by Count");
			ELSEIF (SELECT this_string REGEXP "^volume " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^volume ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid6,3,"b446398d-8f35-d249-c350-e1b38e6b0b1f","4cf89eb0-7e59-cb6c-d5b2-1766c8c637cb","Volume");
			ELSEIF (SELECT this_string REGEXP "^mass " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^mass ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid6,3,"b446398d-8f35-d249-c350-e1b38e6b0b1f","2400788a-bdde-4902-b222-3af1508b1453","Mass");
			END IF;
		END IF;
		IF (SELECT this_string REGEXP "^metal " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^metal ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid7,word_uuid,sub1_uuid5,2,"331e9152-60fc-4168-9811-9a7c1373eb94","73c10548-ea41-4519-99cf-8eef6f59fd1d","Metal");
			IF (SELECT this_string REGEXP "^cop " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^cop ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","1a010a81-2dbb-dbdb-34d9-f5bf126a6432","Copper");
			ELSEIF (SELECT this_string REGEXP "^gold " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^gold ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","93c38dfb-95bb-1583-ec67-e36516791b5f","Gold");
			ELSEIF (SELECT this_string REGEXP "^iron " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^iron ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","05330faf-7363-daee-15ac-cf768ac22a7c","Iron");
			ELSEIF (SELECT this_string REGEXP "^silver " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^silver ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","d6f5e180-43f8-2f5f-f3fc-06bb2935e294","Silver");
			ELSEIF (SELECT this_string REGEXP "^tin " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^tin ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","5677b722-da43-d773-79ea-06537b9211d0","Tin");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^stone " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^stone ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid7,word_uuid,sub1_uuid5,2,"331e9152-60fc-4168-9811-9a7c1373eb94","3c16a35b-8f23-464b-88f5-ef351b033790","Stone");
		ELSEIF (SELECT this_string REGEXP "^fab " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^fab ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid7,word_uuid,sub1_uuid5,2,"331e9152-60fc-4168-9811-9a7c1373eb94","2334e71b-ac4c-401d-8a38-5d13f46e551a","Fabric");
			IF (SELECT this_string REGEXP "^wool " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^wool ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","06ba0c5d-1c6c-429d-84b7-339d57984645","Wool (sheep)");
			ELSEIF (SELECT this_string REGEXP "^plant_based " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^plant_based ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","704ad422-2f32-40ff-9392-d1aecd13a9d8","Plant-based");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^plant " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^plant ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid7,word_uuid,sub1_uuid5,2,"331e9152-60fc-4168-9811-9a7c1373eb94","4469e700-5ab2-4c13-8e10-1ac7aa7176f4","Plantae");
			IF (SELECT this_string REGEXP "^cereal " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^cereal ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub3_uuid2,word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","737f6eb4-009f-4aeb-81b0-f08f1786e265","cereal");
				IF (SELECT this_string REGEXP "^barley " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^barley ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid2,4,"331e9152-60fc-4168-9811-9a7c1373eb94","5deb8baa-b24d-44dc-8434-d1bd569e41e9","Hordeum vulgare (barley)");
				ELSEIF (SELECT this_string REGEXP "^wheat " = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^wheat ","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),word_uuid,sub3_uuid2,4,"331e9152-60fc-4168-9811-9a7c1373eb94","cf563ff6-1c8d-42d7-92b7-c7649d02d435","Triticum aestivum (wheat)");
				END IF;
			ELSEIF (SELECT this_string REGEXP "^tree " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^tree ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub3_uuid2,word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","53713071-fc08-486b-af3f-178995f82c5a","tree/shrub");
			ELSEIF (SELECT this_string REGEXP "^herb " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^herb ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(sub3_uuid2,word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","161bd0aa-c509-4ebb-a58b-af7748277da5","non-cereal herbaceous");
			END IF;
		ELSEIF (SELECT this_string REGEXP "^ceramic " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^ceramic ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid7,word_uuid,sub1_uuid5,2,"331e9152-60fc-4168-9811-9a7c1373eb94","02d33572-1f08-4021-9639-d9c3a3126c2b","Ceramic");
		ELSEIF (SELECT this_string REGEXP "^anim_based " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^anim_based ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(sub2_uuid7,word_uuid,sub1_uuid5,2,"331e9152-60fc-4168-9811-9a7c1373eb94","18507170-1770-4fba-acda-457c5e714f55","Animal-based");
			IF (SELECT this_string REGEXP "^wool " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^wool ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","06ba0c5d-1c6c-429d-84b7-339d57984645","Wool (sheep)");
			ELSEIF (SELECT this_string REGEXP "^hair " = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^hair ","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),word_uuid,sub2_uuid7,3,"331e9152-60fc-4168-9811-9a7c1373eb94","3fa1f0f9-ba5c-4c15-b5d7-6ed75c1bd82d","Hair (goat, horse, etc.)");
			END IF;
		END IF;
	END IF;
	IF (SELECT this_string REGEXP "^action " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^action ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid6,word_uuid,uuid1,1,"69ed2768-ad6a-52c4-9a0e-b780e46bddff","2c994ced-d302-4be1-99b1-5137eda5fc69","Action");
		IF (SELECT this_string REGEXP "^transport " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^transport ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid6,2,"d6dcf0b0-4dfc-4ea8-9b7b-f9ddca34b45b","bd08d7df-a44f-4dbf-8b86-acbb3a037608","Transport");
		ELSEIF (SELECT this_string REGEXP "^fient " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^fient ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid6,2,"d6dcf0b0-4dfc-4ea8-9b7b-f9ddca34b45b","a2b50d8a-78b0-4cc0-ab2d-68e7efff32bd","Fientive");
		END IF;
	END IF;
	IF (SELECT this_string REGEXP "^dom_life " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^dom_life ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid7,word_uuid,uuid1,1,"69ed2768-ad6a-52c4-9a0e-b780e46bddff","b1c6b4df-562e-44b7-aebe-914814a3bf92","Domain of life");
		IF (SELECT this_string REGEXP "^legal " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^legal ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid7,2,"22f843e3-bb18-40e2-b43f-8336cdfed82d","6aadacdf-bea3-43ce-8a4c-b09fd6704097","Legal");
		ELSEIF (SELECT this_string REGEXP "^comm " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^comm ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid7,2,"22f843e3-bb18-40e2-b43f-8336cdfed82d","2d1b96b0-1b43-4963-956f-81530cbb4f5b","Commercial");
		ELSEIF (SELECT this_string REGEXP "^fam " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^fam ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid7,2,"22f843e3-bb18-40e2-b43f-8336cdfed82d","8eacdbfd-3af4-4740-b310-d3ed94483698","Familial");
		ELSEIF (SELECT this_string REGEXP "^social " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^social ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid7,2,"22f843e3-bb18-40e2-b43f-8336cdfed82d","3337906f-bccf-4051-9967-f4e59466a311","Social");
		ELSEIF (SELECT this_string REGEXP "^political " = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^political ","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),word_uuid,sub1_uuid7,2,"22f843e3-bb18-40e2-b43f-8336cdfed82d","b6be23f9-64ea-4ccc-b266-1ba838232d3c","Political");
		END IF;
	END IF;
	IF (SELECT this_string REGEXP "^index_data " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^index_data ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid8,word_uuid,uuid1,1,"69ed2768-ad6a-52c4-9a0e-b780e46bddff","8bb88aaf-3d9e-40db-a9b9-f152ff1f2500","Indexing Data");
	END IF;
	IF (SELECT this_string REGEXP "^mat " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^mat ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(sub1_uuid9,word_uuid,uuid1,1,"69ed2768-ad6a-52c4-9a0e-b780e46bddff","a98a5fbe-25f3-41ac-8701-b2ec11712b7e","Material");	
	END IF;
	IF (SELECT this_string REGEXP "^ass " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^ass ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","94b087c2-3fde-4047-ac37-50282a2543dd","Assyrian");
	ELSEIF (SELECT this_string REGEXP "^bab " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^bab ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","f028561f-183a-46d3-9094-e089102ec05d","Babylonian");
	ELSEIF (SELECT this_string REGEXP "^hitt " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^hitt ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","5ca02a04-2348-44a9-aa61-adb688d9b452","Hittite");
	ELSEIF (SELECT this_string REGEXP "^anat " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^anat ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","14948315-fade-476f-8e5a-92899b29d450","Anatolian");
	ELSEIF (SELECT this_string REGEXP "^hatt " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^hatt ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","3b0e448d-12c6-4ce0-851a-05d7feacb737","Hattian");
	ELSEIF (SELECT this_string REGEXP "^luw " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^luw ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","062f3e31-a3e3-4f9c-9728-51c7f96d6b03","Luwian");
	ELSEIF (SELECT this_string REGEXP "^hurr " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^hurr ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","82b22d55-72e9-40a9-801b-4d360762b70a","Hurrian");
	ELSEIF (SELECT this_string REGEXP "^sumerian " = 1) THEN
		SET this_string = REGEXP_REPLACE(this_string,"^sumerian ","");
		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		(UUID(),word_uuid,sub1_uuid9,2,"4b9577f1-fc26-4a22-bfa3-7fba017f7a0e","167b30b9-991a-493c-8ba1-fdd3f040289e","Sumerian");
	END IF;
	IF (this_string != "") THEN
		SELECT this_string;
	END IF;
END