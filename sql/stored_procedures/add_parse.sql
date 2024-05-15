CREATE PROCEDURE `add_parse`(IN form_uuid CHAR(36), pos VARCHAR (250), this_string VARCHAR (250))
BEGIN
		DECLARE uuid1,uuid2,uuid3,uuid4,uuid5,uuid6,uuid7,uuid8,uuid9,uuid10 CHAR(36) DEFAULT NULL;
        DECLARE dummy1 VARCHAR(250) CHARSET utf8mb4 DEFAULT '';
        DECLARE dummy2 INT DEFAULT NULL;
        SET uuid1 = UUID(); SET uuid2 = UUID(); SET uuid3 = UUID(); SET uuid4 = UUID(); SET uuid5 = UUID(); SET uuid6 = UUID();
		IF (this_string != "") THEN
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES (uuid1,form_uuid,NULL,NULL,"859939fd-bdf6-fa7b-fa93-3f42207e1005","7ef55f42-4cfc-446f-6d47-f83b725b34d5","Parse");
        END IF;
		IF (pos = "prep") THEN 
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","67a5cc67-55f7-3ade-2aff-c676d7996b17","Preposition");
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid5,form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				END IF;
				IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
			END IF;
			IF (SELECT this_string REGEXP "^\-ma\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^\-ma\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c8851206-aba2-ca18-e219-91f8e45eb5ad","-ma");
			END IF;
		END IF;
		IF (pos = "adv") THEN 
			 INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","2543c975-7768-fb7b-16d8-6246d935d26b","Adverb");
			 IF (SELECT this_string REGEXP "^interr\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^interr\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","1b41cf0e-6a09-4f49-0394-85edf6f74b53","Interrogative");
			ELSEIF (SELECT this_string REGEXP "^neg\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^neg\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","cc040505-c471-8cc8-43cf-dabbd75ce78a","Negative");
			END IF;
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid5,form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				END IF;
				IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
			END IF;
		END IF;
		IF (pos = "prn") THEN 
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
    		(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","73c4621c-b8ca-223e-fe1c-f603c480691f","Pronoun");
			IF (SELECT this_string REGEXP "^indef\." = 1) THEN
		  		SET this_string = REGEXP_REPLACE(this_string,"^indef\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","d7e22ad8-5f7b-8336-81e7-f223be68eea0","Indefinite");
			ELSEIF (SELECT this_string REGEXP "^interr\." = 1) THEN
		  		SET this_string = REGEXP_REPLACE(this_string,"^interr\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		  		(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","1b41cf0e-6a09-4f49-0394-85edf6f74b53","Interrogative");
			ELSEIF (SELECT this_string REGEXP "^indep_poss\." = 1) THEN
		  		SET this_string = REGEXP_REPLACE(this_string,"^indep_poss\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		  		(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","88a5d094-1e27-8e01-d358-dd3a59fe4c5f","Independent possessive");
			ELSEIF (SELECT this_string REGEXP "^indep\." = 1) THEN
		  		SET this_string = REGEXP_REPLACE(this_string,"^indep\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
	   			(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","7fa58d93-1dab-b27d-e6c5-c03b7218b219","Independent personal pronoun");
			ELSEIF (SELECT this_string REGEXP "^suf\." = 1) THEN -- STEM
		  		SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
		  		INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
		  		(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
			ELSEIF (SELECT this_string REGEXP "^ana_prn\." = 1) THEN
		  		SET this_string = REGEXP_REPLACE(this_string,"^ana_prn\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","5a593ec8-83ab-4abd-9a44-9a4972afd254","Anaphoric Pronoun");
	   		END IF;
			IF (SELECT this_string REGEXP "^first\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
			ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
			ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
			END IF;
			IF (SELECT this_string REGEXP "^m\." = 1) THEN -- GENDER
				SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
			ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
			ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
			END IF;
			IF (SELECT this_string REGEXP "^sg\." = 1) THEN -- GRAM #
				SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
			ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
			END IF;
			IF (SELECT this_string REGEXP "^nom\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^nom\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","dd54b5af-8e97-5ee1-7662-486b8d195a86","Nominative");
			ELSEIF (SELECT this_string REGEXP "^gen\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
			ELSEIF (SELECT this_string REGEXP "^acc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^acc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","5844ffb8-86e5-d516-69c3-21df50cce115","Accusative");
			ELSEIF (SELECT this_string REGEXP "^dat\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^dat\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","6dd4a486-8211-4be3-2094-ba51b36cc5aa","Dative");
			END IF;
			IF (SELECT this_string REGEXP "^abs\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^abs\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4ed769b8-1e49-f4c8-9217-d19aa0194448","Absolute state");
			ELSEIF (SELECT this_string REGEXP "^rct\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^rct\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","6b5c796b-cab6-4796-0855-8bd8bbb59597","Status Rectus");
			ELSEIF (SELECT this_string REGEXP "^cstr\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^cstr\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","7aaebe3e-1d85-13fa-301b-ac7ea78ef6ab","Construct State");
			ELSEIF (SELECT this_string REGEXP "^suf_state\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^suf_state\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","0c8a202c-b923-a07b-8069-6991ee87101f","Suffixed State");  
			ELSEIF (SELECT this_string REGEXP "^stv\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^stv\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4df0933f-8e88-7e98-16e7-aa7c31ec42f8","Stative");
				IF (SELECT this_string REGEXP "^ind\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^ind\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"381441d4-695e-246e-d777-bc1c9c3da39d","79e360dc-87c6-fcc5-723a-0f94588be6f1","Indicative");
				ELSEIF (SELECT this_string REGEXP "^sbj\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^sbj\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"381441d4-695e-246e-d777-bc1c9c3da39d","15b2920d-ccc5-048c-1ac4-bdc9dbd55a22","Subjunctive");
				END IF;	 
			END IF;
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid5,form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				END IF;
				IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
			END IF;
		END IF;
		IF (pos = "adj") THEN 
     	    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","81eeb01f-f247-2b19-2dc2-c95812bf5789","Adjective");
             IF (SELECT this_string REGEXP "^vb_adj\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^vb_adj\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","c6069b7e-9036-25ee-8a1c-cbc50b1b8e20","Verbal Adjective");
            ELSEIF (SELECT this_string REGEXP "^demonstr\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^demonstr\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","ee5a48c4-b5bc-3c46-6aa1-f71c8ad07efc","Demonstrative");
            ELSEIF (SELECT this_string REGEXP "^ana\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^ana\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","d100384c-3154-34d9-3fee-2d8345b36e8c","Anaphoric");
            ELSEIF (SELECT this_string REGEXP "^ord\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^ord\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","9211746f-6ae4-776c-765b-e8dcf0b62eb6","Ordinal");
            ELSEIF (SELECT this_string REGEXP "^indef\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^indef\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","d7e22ad8-5f7b-8336-81e7-f223be68eea0","Indefinite");
			ELSEIF (SELECT this_string REGEXP "^interr\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^interr\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","1b41cf0e-6a09-4f49-0394-85edf6f74b53","Interrogative");
            END IF;
        	IF (SELECT this_string REGEXP "^m\." = 1) THEN -- GENDER
				SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
			ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
			END IF;
			IF (SELECT this_string REGEXP "^sg\." = 1) THEN -- GRAM #
				SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
			ELSEIF (SELECT this_string REGEXP "^du\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^du\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Dual");
			ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
			END IF;
			IF (SELECT this_string REGEXP "^nom\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^nom\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","dd54b5af-8e97-5ee1-7662-486b8d195a86","Nominative");
			END IF;
			IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
			END IF;
			IF (SELECT this_string REGEXP "^acc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^acc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","5844ffb8-86e5-d516-69c3-21df50cce115","Accusative");
			END IF;
			IF (SELECT this_string REGEXP "^loc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^loc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4370aa93-0ebe-8762-af15-c47920393efe","Locative-Adverbial");
			END IF;
			IF (SELECT this_string REGEXP "^term\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^term\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","da04e5f3-f10b-165c-4e71-a635c6a10b6b","Terminative-Adverbial");
			END IF;	
			IF (SELECT this_string REGEXP "^oblq\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^oblq\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e107d0e4-bd44-3aac-80ef-a1c6f6bc6962","Oblique");			
			END IF;
			IF (SELECT this_string REGEXP "^abs\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^abs\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4ed769b8-1e49-f4c8-9217-d19aa0194448","Absolute state");
			END IF;
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid5,form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				END IF;
				IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
			END IF;
        END IF;
		IF (pos = "noun") THEN 
     	    INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","2543c975-7768-fb7b-16d8-6246d935d26b","Noun");
             IF (SELECT this_string REGEXP "^ptcpl\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^ptcpl\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","7cde137c-4f04-b872-e358-9cd6aa8e5812","Participle");
				IF (SELECT this_string REGEXP "^Gtn\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Gtn\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","ebaee812-011f-59d5-fe0f-083e0965d266","Gtn");
				ELSEIF (SELECT this_string REGEXP "^Gt\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Gt\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","6ef4493b-ffa6-ef0f-3084-36461541cc3e","Gt");
				ELSEIF (SELECT this_string REGEXP "^G\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^G\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","42f9c637-53c5-f701-1ca3-0970eeda89a7","G");
				ELSEIF (SELECT this_string REGEXP "^Dtn\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Dtn\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","32b1bc02-3c4c-cca1-e52f-112550886806","Dtn");
				ELSEIF (SELECT this_string REGEXP "^Dt\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Dt\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","c9292de7-a686-e1e3-83a7-9c461e68b2b5","Dt");
				ELSEIF (SELECT this_string REGEXP "^D\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^D\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","089fddd0-828c-567c-344a-3605870a4e6e","D");
				ELSEIF (SELECT this_string REGEXP "^Štn\." = 1) THEN
          			SET this_string = REGEXP_REPLACE(this_string,"^Štn\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","233e8729-a412-1c81-fc53-418d1ace6572","Štn");
				ELSEIF (SELECT this_string REGEXP "^Št\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Št\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","00d4f953-17f7-dc15-d6a2-7731b1804fca","Št");
				ELSEIF (SELECT this_string REGEXP "^Š\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Š\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","438eb904-101a-a1cf-e25c-be74048d3631","Š");  
				ELSEIF (SELECT this_string REGEXP "^Ntn\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Ntn\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","6bffd75d-737f-3dbf-39de-da6cff2c1a2a","Ntn");
				ELSEIF (SELECT this_string REGEXP "^Nt\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^Nt\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","36f34ffb-60fd-0a75-32eb-f88b5439e23e","Nt");
				ELSEIF (SELECT this_string REGEXP "^N\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^N\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","c52d46f8-1240-38bd-f864-3b1ffb9c3a2b","N");
				END IF;
            ELSEIF (SELECT this_string REGEXP "^card\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^card\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","79c46ab8-baeb-1fee-7f41-5c23a61a9dcc","Cardinal");
            ELSEIF (SELECT this_string REGEXP "^fract\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^fract\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","83b47d49-1495-7e6f-e96b-d65536d53b18","Fraction");
            ELSEIF (SELECT this_string REGEXP "^mult\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^mult\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","ee3d392f-2992-9c2d-fe41-0d3b81a37199","Multiple");
            ELSEIF (SELECT this_string REGEXP "^prop_noun\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^prop_noun\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","45ba95f5-951c-e524-94a1-9c3028c1352b","Proper noun");
				IF (SELECT this_string REGEXP "^GN\." = 1) THEN -- STEM
					SET this_string = REGEXP_REPLACE(this_string,"^GN\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","ea1e6ed0-c7ce-43d6-1dcf-9d35e3970220","Geographic name");
				ELSEIF (SELECT this_string REGEXP "^PN\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^PN\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid3,3,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","9ffdc924-953b-d695-3230-abc990884992","Personal name");
				END IF;
            END IF;
        	IF (SELECT this_string REGEXP "^m\." = 1) THEN -- GENDER
				SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
			ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
			END IF;
			IF (SELECT this_string REGEXP "^sg\." = 1) THEN -- GRAM #
				SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
			ELSEIF (SELECT this_string REGEXP "^du\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^du\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Dual");
			ELSEIF (SELECT this_string REGEXP "^pl_tant\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^pl_tant\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","7856562e-a0a6-b89c-71b0-70c3f77c6b84","Pluralis Tantum");
			ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
			END IF;
			IF (SELECT this_string REGEXP "^nom\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^nom\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","dd54b5af-8e97-5ee1-7662-486b8d195a86","Nominative");
			ELSEIF (SELECT this_string REGEXP "^gen\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
			ELSEIF (SELECT this_string REGEXP "^acc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^acc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","5844ffb8-86e5-d516-69c3-21df50cce115","Accusative");
			ELSEIF (SELECT this_string REGEXP "^loc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^loc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4370aa93-0ebe-8762-af15-c47920393efe","Locative-Adverbial");
			ELSEIF (SELECT this_string REGEXP "^term\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^term\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","da04e5f3-f10b-165c-4e71-a635c6a10b6b","Terminative-Adverbial");			
			END IF;
			IF (SELECT this_string REGEXP "^abs\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^abs\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4ed769b8-1e49-f4c8-9217-d19aa0194448","Absolute state");
			ELSEIF (SELECT this_string REGEXP "^rct\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^rct\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","6b5c796b-cab6-4796-0855-8bd8bbb59597","Status Rectus");
			ELSEIF (SELECT this_string REGEXP "^cstr\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^cstr\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","7aaebe3e-1d85-13fa-301b-ac7ea78ef6ab","Construct State");
			ELSEIF (SELECT this_string REGEXP "^suf_state\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^suf_state\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","0c8a202c-b923-a07b-8069-6991ee87101f","Suffixed State");	
			ELSEIF (SELECT this_string REGEXP "^stv\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^stv\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid4,form_uuid,uuid2,2,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4df0933f-8e88-7e98-16e7-aa7c31ec42f8","Stative");
				IF (SELECT this_string REGEXP "^ind\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^ind\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,3,"381441d4-695e-246e-d777-bc1c9c3da39d","79e360dc-87c6-fcc5-723a-0f94588be6f1","Indicative");
				ELSEIF (SELECT this_string REGEXP "^sbj\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^sbj\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,3,"381441d4-695e-246e-d777-bc1c9c3da39d","15b2920d-ccc5-048c-1ac4-bdc9dbd55a22","Subjunctive");
				END IF;			
			END IF;
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid5,form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				END IF;
				IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
			END IF;
        END IF;
		IF (pos = "verb") THEN
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","e8f7ff00-1efe-af07-3385-244f7646e99d","Verb");
            IF (SELECT this_string REGEXP "^inf\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^inf\.","");
                INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","866a5018-ef53-730a-37b0-27adef5941be","Infinitive");
			ELSEIF (SELECT this_string REGEXP "^stv\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^stv\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","4df0933f-8e88-7e98-16e7-aa7c31ec42f8","Stative");
			ELSEIF (SELECT this_string REGEXP "^finite_verb\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^finite_verb\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid3,form_uuid,uuid2,2,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","bbf675cd-9e0d-9385-e923-331906782ca4","Finite verb");
            END IF;
		IF (SELECT this_string REGEXP "^Gtn\." = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^Gtn\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","ebaee812-011f-59d5-fe0f-083e0965d266","Gtn");
			ELSEIF (SELECT this_string REGEXP "^Gt\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Gt\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","6ef4493b-ffa6-ef0f-3084-36461541cc3e","Gt");
			ELSEIF (SELECT this_string REGEXP "^G\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^G\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","42f9c637-53c5-f701-1ca3-0970eeda89a7","G");
			ELSEIF (SELECT this_string REGEXP "^Dtn\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Dtn\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","32b1bc02-3c4c-cca1-e52f-112550886806","Dtn");
			ELSEIF (SELECT this_string REGEXP "^Dt\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Dt\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","c9292de7-a686-e1e3-83a7-9c461e68b2b5","Dt");
			ELSEIF (SELECT this_string REGEXP "^D\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^D\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","089fddd0-828c-567c-344a-3605870a4e6e","D");
			ELSEIF (SELECT this_string REGEXP "^Štn\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Štn\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","233e8729-a412-1c81-fc53-418d1ace6572","Štn");				
			ELSEIF (SELECT this_string REGEXP "^Št\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Št\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","00d4f953-17f7-dc15-d6a2-7731b1804fca","Št");
			ELSEIF (SELECT this_string REGEXP "^Š\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Š\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","438eb904-101a-a1cf-e25c-be74048d3631","Š");
			ELSEIF (SELECT this_string REGEXP "^Ntn\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Ntn\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","6bffd75d-737f-3dbf-39de-da6cff2c1a2a","Ntn");
			ELSEIF (SELECT this_string REGEXP "^Nt\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^Nt\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","36f34ffb-60fd-0a75-32eb-f88b5439e23e","Nt");
			ELSEIF (SELECT this_string REGEXP "^N\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^N\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"f0d1ed89-75a2-1199-95f9-9ad12c460cbb","c52d46f8-1240-38bd-f864-3b1ffb9c3a2b","N");
			END IF;
            IF (SELECT this_string REGEXP "^imv\." = 1) THEN -- TENSE
				SET this_string = REGEXP_REPLACE(this_string,"^imv\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"2b2280a5-44f0-2091-3d69-93327d4b5541","8e3f33e9-9b03-525f-4f3c-31b2ffa89699","Imperative");
            ELSEIF (SELECT this_string REGEXP "^prt\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^prt\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"2b2280a5-44f0-2091-3d69-93327d4b5541","0b59b24b-cf15-f11b-2dfd-d9845962d191","Preterite");
            ELSEIF (SELECT this_string REGEXP "^prs\." = 1) THEN -- TENSE
				SET this_string = REGEXP_REPLACE(this_string,"^prs\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"2b2280a5-44f0-2091-3d69-93327d4b5541","87f41424-f5c6-e290-7abc-047093e9f0c8","Present");
            ELSEIF (SELECT this_string REGEXP "^pf\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^pf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"2b2280a5-44f0-2091-3d69-93327d4b5541","9672446f-6d09-5bfc-5d5e-1c4db50d9d74","Perfect");
            ELSEIF (SELECT this_string REGEXP "^prec\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^prec\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"2b2280a5-44f0-2091-3d69-93327d4b5541","43d8496c-23d6-5491-8a2b-56e9852b6278","Precative");
            END IF;
			IF (SELECT this_string REGEXP "^first\." = 1) THEN -- PERSON
				SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
			ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
			ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
			END IF;
            IF (SELECT this_string REGEXP "^m\." = 1) THEN -- GENDER
				SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
			ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
			ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
			END IF;
            IF (SELECT this_string REGEXP "^sg\." = 1) THEN -- GRAM #
				SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
			ELSEIF (SELECT this_string REGEXP "^du\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^du\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Dual");
			ELSEIF (SELECT this_string REGEXP "^pl_tant\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^pl_tant\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","7856562e-a0a6-b89c-71b0-70c3f77c6b84","Pluralis Tantum");
			ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Plural");
            END IF;
			IF (SELECT this_string REGEXP "^nom\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^nom\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","dd54b5af-8e97-5ee1-7662-486b8d195a86","Nominative");
			ELSEIF (SELECT this_string REGEXP "^gen\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
			ELSEIF (SELECT this_string REGEXP "^acc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^acc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","5844ffb8-86e5-d516-69c3-21df50cce115","Accusative");
			ELSEIF (SELECT this_string REGEXP "^loc\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^loc\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4370aa93-0ebe-8762-af15-c47920393efe","Locative-Adverbial");
			ELSEIF (SELECT this_string REGEXP "^term\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^term\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","da04e5f3-f10b-165c-4e71-a635c6a10b6b","Terminative-Adverbial");			
			ELSEIF (SELECT this_string REGEXP "^oblq\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^oblq\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e107d0e4-bd44-3aac-80ef-a1c6f6bc6962","Oblique");			
			END IF;
			IF (SELECT this_string REGEXP "^abs\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^abs\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4ed769b8-1e49-f4c8-9217-d19aa0194448","Absolute state");
			ELSEIF (SELECT this_string REGEXP "^rct\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^rct\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","6b5c796b-cab6-4796-0855-8bd8bbb59597","Status Rectus");
			ELSEIF (SELECT this_string REGEXP "^cstr\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^cstr\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","7aaebe3e-1d85-13fa-301b-ac7ea78ef6ab","Construct State");
			ELSEIF (SELECT this_string REGEXP "^suf_state\." = 1) THEN 
				SET this_string = REGEXP_REPLACE(this_string,"^suf_state\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","0c8a202c-b923-a07b-8069-6991ee87101f","Suffixed State");	
			ELSEIF (SELECT this_string REGEXP "^stv\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^stv\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","4df0933f-8e88-7e98-16e7-aa7c31ec42f8","Stative");
			END IF;
            IF (SELECT this_string REGEXP "^ind\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^ind\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"381441d4-695e-246e-d777-bc1c9c3da39d","79e360dc-87c6-fcc5-723a-0f94588be6f1","Indicative");
			ELSEIF (SELECT this_string REGEXP "^sbj\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^sbj\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"381441d4-695e-246e-d777-bc1c9c3da39d","15b2920d-ccc5-048c-1ac4-bdc9dbd55a22","Subjunctive");
			END IF;
            IF (SELECT this_string REGEXP "^vent\." = 1) THEN -- CLITIC
 				SET this_string = REGEXP_REPLACE(this_string,"^vent\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid3,3,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","a8fc493e-c66a-338e-61af-e043aee78afc","Ventive");
			END IF;
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN -- CLITIC
 				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid4,form_uuid,uuid3,3,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN -- PERSON
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN -- GENDER
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN -- GRAM #
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				ELSEIF (SELECT this_string REGEXP "^du\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^du\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"c5a0f22a-00cd-e643-bea8-8434fca0b056","56c6c3ab-4ddd-f63e-7a91-3cc67c4295cb","Dual");
				END IF;
				IF (SELECT this_string REGEXP "^dat\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^dat\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","6dd4a486-8211-4be3-2094-ba51b36cc5aa","Dative");
 				ELSEIF (SELECT this_string REGEXP "^acc\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^acc\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","5844ffb8-86e5-d516-69c3-21df50cce115","Accusative");
				ELSEIF (SELECT this_string REGEXP "^gen\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid4,4,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
            END IF;
		END IF;         
		IF (pos = "itj") THEN 
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","4f96bb15-09e7-850d-3fac-60be3be7c88c7","Interjection");
			IF (SELECT this_string REGEXP "^suf\." = 1) THEN 
 				SET this_string = REGEXP_REPLACE(this_string,"^suf\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(uuid5,form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c6329de2-2db3-44a2-d39b-ff423f1d3e6e","Suffix pronoun");
				IF (SELECT this_string REGEXP "^first\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^first\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","1bb5c53c-83ec-fb05-8378-9cc7ff04f961","First Person");
				ELSEIF (SELECT this_string REGEXP "^second\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^second\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","87ba5a1c-89e2-ac30-02e8-9d3abe9df6ef","Second Person");
				ELSEIF (SELECT this_string REGEXP "^third\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^third\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"b3b45c2f-83f9-7077-20fe-0f9587a9870c","01412cae-e7d2-1fe7-ef2b-4d6d701dfc45","Third Person");
				END IF;
				IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				ELSEIF (SELECT this_string REGEXP "^c\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^c\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","026a4013-6a9f-51ab-9e24-d3322cdaafc1","Common gender");
				END IF;
				IF (SELECT this_string REGEXP "^sg\." = 1) THEN
					SET this_string = REGEXP_REPLACE(this_string,"^sg\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","071167a8-94c6-0f0f-b654-a79b40ea4201","Singular");
				ELSEIF (SELECT this_string REGEXP "^pl\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^pl\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"c5a0f22a-00cd-e643-bea8-8434fca0b056","ea47986d-f2ad-ecca-489e-00e807cc11a0","Plural");
				END IF;
				IF (SELECT this_string REGEXP "^gen\." = 1) THEN 
 					SET this_string = REGEXP_REPLACE(this_string,"^gen\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"e0092e36-fb94-a4dc-cd04-5883ab861fd6","e9e175d1-c1f8-b938-6c68-3846515d9387","Genitive");
				END IF;
			END IF;
			IF (SELECT this_string REGEXP "^\-ma\." = 1) THEN
				SET this_string = REGEXP_REPLACE(this_string,"^\-ma\.","");
				INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
				(UUID(),form_uuid,uuid2,2,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c8851206-aba2-ca18-e219-91f8e45eb5ad","-ma");
			END IF;
		END IF;
		IF (pos = "cnj") THEN 
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","c978258d-8754-adc5-e19d-21b42e559055","Conjunction");
		END IF;
		IF (pos = "part") THEN 
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","73184ba8-1d66-44ae-bda6-c78249120bdd","Particle");
		END IF;
		IF (pos = "num") THEN 
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(uuid2,form_uuid,uuid1,1,"5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286","780b8a2a-1190-a1e3-6cbc-673d419a77ac","Numeral");
			IF (SELECT this_string REGEXP "^m\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^m\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","2f66a05b-87f6-0cbc-b778-5dde673616ac","Masculine");
				ELSEIF (SELECT this_string REGEXP "^f\." = 1) THEN 
					SET this_string = REGEXP_REPLACE(this_string,"^f\.","");
					INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
					(UUID(),form_uuid,uuid5,3,"46c78931-2cb6-5d45-3049-f9903dc4177e","d501f42b-62d1-a4cf-a6d3-15e5048a9134","Feminine");
				END IF;
		END IF;
		IF (SELECT this_string REGEXP "^\-ma\." = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^\-ma\.","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),form_uuid,uuid1,1,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","c8851206-aba2-ca18-e219-91f8e45eb5ad","-ma");
		ELSEIF (SELECT this_string REGEXP "^\-mi\." = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^\-mi\.","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),form_uuid,uuid1,1,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","de4b79bf-0b6f-434f-8349-dffeae9ef45e","-mi");
		ELSEIF (SELECT this_string REGEXP "^\irr\." = 1) THEN
			SET this_string = REGEXP_REPLACE(this_string,"^\irr\.","");
			INSERT INTO item_properties (uuid,reference_uuid,parent_uuid,`level`,variable_uuid, value_uuid, `value`) VALUES 
			(UUID(),form_uuid,uuid1,1,"04c0ca79-ead3-79a0-a8f9-6de075e4c549","ca850aae-1613-4680-a1bd-8c4453b72696","Irrealis -man/-men");
		END IF;
		IF (this_string != "") THEN
			SELECT this_string;
		END IF;
END