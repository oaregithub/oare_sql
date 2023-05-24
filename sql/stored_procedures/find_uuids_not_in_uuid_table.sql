DROP PROCEDURE `find_uuids_not_in_uuid_table`;
DELIMITER //
CREATE PROCEDURE find_uuids_not_in_uuid_table() 
	BEGIN
    #EXCLUDES the following tables which lack a uuid column or whose uuids should not appear in uuid.uuid
	#cache_status
	#knex_migrations
	#knex_migrations_lock
	#logging (will have deleted uuid's)
	#oare_group
	#page_content
	#permissions
	#quarantine_text
	#search_failure
	#temp_prep_split
	#temp_theo
	#user_group
	#word_sort
		IF ((SELECT uuid FROM alias WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "alias") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "alias" FROM alias WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "alias");
		END IF;
		IF ((SELECT uuid FROM archive WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "archive") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "archive" FROM archive WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "archive");
		END IF;
		IF ((SELECT uuid FROM asset WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "asset") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "asset" FROM asset WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "asset");
		END IF;
		IF ((SELECT uuid FROM bibliography WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "bibliography") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "bibliography" FROM bibliography WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "bibliography");
		END IF;
		IF ((SELECT uuid FROM collection WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "collection") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "collection" FROM collection WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "collection");
		END IF;
		IF ((SELECT uuid FROM comments WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "comments") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "comments" FROM comments WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "comments");
		END IF;
		IF ((SELECT uuid FROM concept WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "concept") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "concept" FROM concept WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "concept");
		END IF;
		IF ((SELECT uuid FROM dictionary_form WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_form") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "dictionary_form" FROM dictionary_form WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_form");
		END IF;
		IF ((SELECT uuid FROM dictionary_spelling WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_spelling") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "dictionary_spelling" FROM dictionary_spelling WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_spelling");
		END IF;
		IF ((SELECT uuid FROM dictionary_spelling_epigraphy WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_spelling_epigraphy") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "dictionary_spelling_epigraphy" FROM dictionary_spelling_epigraphy WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_spelling_epigraphy");
		END IF;
		IF ((SELECT uuid FROM dictionary_word WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_word") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "dictionary_word" FROM dictionary_word WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "dictionary_word");
		END IF;
		IF ((SELECT uuid FROM editor_credit WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "editor_credit") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "editor_credit" FROM editor_credit WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "editor_credit");
		END IF;
		IF ((SELECT uuid FROM `errors` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "errors") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "errors" FROM `errors` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "errors");
		END IF;
		IF ((SELECT uuid FROM `event` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "event") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "event" FROM `event` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "event");
		END IF;
		IF ((SELECT uuid FROM field WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "field") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "field" FROM field WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "field");
		END IF;
		IF ((SELECT uuid FROM group_allowlist WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "group_allowlist") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "group_allowlist" FROM group_allowlist WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "group_allowlist");
		END IF;
		IF ((SELECT uuid FROM group_edit_permissions WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "group_edit_permissions") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "group_edit_permissions" FROM group_edit_permissions WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "group_edit_permissions");
		END IF;
		IF ((SELECT uuid FROM hierarchy WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "hierarchy") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "hierarchy" FROM hierarchy WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "hierarchy");
		END IF;
		IF ((SELECT uuid FROM item_properties WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "item_properties") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "item_properties" FROM item_properties WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "item_properties");
		END IF;
		IF ((SELECT uuid FROM link WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "link") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "link" FROM link WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "link");
		END IF;
		IF ((SELECT uuid FROM note WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "note") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "note" FROM note WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "note");
		END IF;
		IF ((SELECT uuid FROM period WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "period") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "period" FROM period WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "period");
		END IF;
		IF ((SELECT uuid FROM person WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "person") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "person" FROM person WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "person");
		END IF;
		IF ((SELECT uuid FROM predefinition WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "predefinition") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "predefinition" FROM predefinition WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "predefinition");
		END IF;
		IF ((SELECT uuid FROM public_denylist WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "public_denylist") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "public_denylist" FROM public_denylist WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "public_denylist");
		END IF;
		IF ((SELECT uuid FROM reading_sibling WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "reading_sibling") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "reading_sibling" FROM reading_sibling WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "reading_sibling");
		END IF;
		IF ((SELECT uuid FROM reset_password_links WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "reset_password_links") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "reset_password_links" FROM reset_password_links WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "reset_password_links");
		END IF;
		IF ((SELECT uuid FROM `resource` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "resource") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "resource" FROM `resource` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "resource");
		END IF;
		IF ((SELECT uuid FROM sign WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "sign" FROM sign WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign");
		END IF;
		IF ((SELECT uuid FROM sign_org WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign_org") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "sign_org" FROM sign_org WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign_org");
		END IF;
		IF ((SELECT uuid FROM sign_reading WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign_reading") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "sign_reading" FROM sign_reading WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign_reading");
		END IF;
		IF ((SELECT uuid FROM sign_sibling WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign_sibling") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "sign_sibling" FROM sign_sibling WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "sign_sibling");
		END IF;
		IF ((SELECT uuid FROM spatial_unit WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "spatial_unit") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "spatial_unit" FROM spatial_unit WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "spatial_unit");
		END IF;
		IF ((SELECT uuid FROM `text` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "text" FROM `text` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text");
		END IF;
		IF ((SELECT uuid FROM text_discourse WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_discourse") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "text_discourse" FROM text_discourse WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_discourse");
		END IF;
		IF ((SELECT uuid FROM text_drafts WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_drafts") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "text_drafts" FROM text_drafts WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_drafts");
		END IF;
		IF ((SELECT uuid FROM text_epigraphy WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_epigraphy") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "text_epigraphy" FROM text_epigraphy WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_epigraphy");
		END IF;
		IF ((SELECT uuid FROM text_markup WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_markup") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "text_markup" FROM text_markup WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "text_markup");
		END IF;
		IF ((SELECT uuid FROM threads WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "threads") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "threads" FROM threads WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "threads");
		END IF;
		IF ((SELECT uuid FROM tree WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "tree") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "tree" FROM tree WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "tree");
		END IF;
		IF ((SELECT uuid FROM unique_spellings WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "unique_spellings") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "unique_spellings" FROM unique_spellings WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "unique_spellings");
		END IF;
		IF ((SELECT uuid FROM `user` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "user") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "user" FROM `user` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "user");
		END IF;
		IF ((SELECT uuid FROM `value` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "value") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "value" FROM `value` WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "value");
		END IF;
		IF ((SELECT uuid FROM variable WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "variable") LIMIT 1) IS NOT NULL) THEN 
			SELECT uuid, "variable" FROM variable WHERE uuid NOT IN (SELECT uuid FROM uuid WHERE table_reference = "variable");
		END IF;
    END //
DELIMITER ;