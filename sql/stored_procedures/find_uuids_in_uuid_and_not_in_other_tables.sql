CREATE PROCEDURE `find_uuids_in_uuid_and_not_in_other_tables`() 
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
		IF ((SELECT uuid FROM uuid WHERE table_reference = "alias" AND uuid NOT IN (SELECT uuid FROM `alias`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "alias" AND uuid NOT IN (SELECT uuid FROM `alias`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "archive" AND uuid NOT IN (SELECT uuid FROM `archive`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "archive" AND uuid NOT IN (SELECT uuid FROM `archive`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "asset" AND uuid NOT IN (SELECT uuid FROM `asset`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "asset" AND uuid NOT IN (SELECT uuid FROM `asset`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "bibliography" AND uuid NOT IN (SELECT uuid FROM `bibliography`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "bibliography" AND uuid NOT IN (SELECT uuid FROM `bibliography`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "collection" AND uuid NOT IN (SELECT uuid FROM `collection`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "collection" AND uuid NOT IN (SELECT uuid FROM `collection`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "comments" AND uuid NOT IN (SELECT uuid FROM `comments`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "comments" AND uuid NOT IN (SELECT uuid FROM `comments`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "concept" AND uuid NOT IN (SELECT uuid FROM `concept`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "concept" AND uuid NOT IN (SELECT uuid FROM `concept`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "dictionary_form" AND uuid NOT IN (SELECT uuid FROM `dictionary_form`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "dictionary_form" AND uuid NOT IN (SELECT uuid FROM `dictionary_form`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "dictionary_spelling" AND uuid NOT IN (SELECT uuid FROM `dictionary_spelling`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "dictionary_spelling" AND uuid NOT IN (SELECT uuid FROM `dictionary_spelling`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "dictionary_spelling_epigraphy" AND uuid NOT IN (SELECT uuid FROM `dictionary_spelling_epigraphy`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "dictionary_spelling_epigraphy" AND uuid NOT IN (SELECT uuid FROM `dictionary_spelling_epigraphy`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "dictionary_word" AND uuid NOT IN (SELECT uuid FROM `dictionary_word`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "dictionary_word" AND uuid NOT IN (SELECT uuid FROM `dictionary_word`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "editor_credit" AND uuid NOT IN (SELECT uuid FROM `editor_credit`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "editor_credit" AND uuid NOT IN (SELECT uuid FROM `editor_credit`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "errors" AND uuid NOT IN (SELECT uuid FROM `errors`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "errors" AND uuid NOT IN (SELECT uuid FROM `errors`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "event" AND uuid NOT IN (SELECT uuid FROM `event`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "event" AND uuid NOT IN (SELECT uuid FROM `event`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "field" AND uuid NOT IN (SELECT uuid FROM `field`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "field" AND uuid NOT IN (SELECT uuid FROM `field`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "group_allowlist" AND uuid NOT IN (SELECT uuid FROM `group_allowlist`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "group_allowlist" AND uuid NOT IN (SELECT uuid FROM `group_allowlist`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "group_edit_permissions" AND uuid NOT IN (SELECT uuid FROM `group_edit_permissions`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "group_edit_permissions" AND uuid NOT IN (SELECT uuid FROM `group_edit_permissions`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "hierarchy" AND uuid NOT IN (SELECT uuid FROM `hierarchy`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "hierarchy" AND uuid NOT IN (SELECT uuid FROM `hierarchy`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "item_properties" AND uuid NOT IN (SELECT uuid FROM `item_properties`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "item_properties" AND uuid NOT IN (SELECT uuid FROM `item_properties`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "link" AND uuid NOT IN (SELECT uuid FROM `link`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "link" AND uuid NOT IN (SELECT uuid FROM `link`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "note" AND uuid NOT IN (SELECT uuid FROM `note`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "note" AND uuid NOT IN (SELECT uuid FROM `note`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "period" AND uuid NOT IN (SELECT uuid FROM `period`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "period" AND uuid NOT IN (SELECT uuid FROM `period`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "person" AND uuid NOT IN (SELECT uuid FROM `person`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "person" AND uuid NOT IN (SELECT uuid FROM `person`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "predefinition" AND uuid NOT IN (SELECT uuid FROM `predefinition`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "predefinition" AND uuid NOT IN (SELECT uuid FROM `predefinition`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "public_denylist" AND uuid NOT IN (SELECT uuid FROM `public_denylist`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "public_denylist" AND uuid NOT IN (SELECT uuid FROM `public_denylist`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "reading_sibling" AND uuid NOT IN (SELECT uuid FROM `reading_sibling`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "reading_sibling" AND uuid NOT IN (SELECT uuid FROM `reading_sibling`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "reset_password_links" AND uuid NOT IN (SELECT uuid FROM `reset_password_links`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "reset_password_links" AND uuid NOT IN (SELECT uuid FROM `reset_password_links`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "resource" AND uuid NOT IN (SELECT uuid FROM `resource`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "resource" AND uuid NOT IN (SELECT uuid FROM `resource`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "sign" AND uuid NOT IN (SELECT uuid FROM `sign`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "sign" AND uuid NOT IN (SELECT uuid FROM `sign`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "sign_org" AND uuid NOT IN (SELECT uuid FROM `sign_org`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "sign_org" AND uuid NOT IN (SELECT uuid FROM `sign_org`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "sign_reading" AND uuid NOT IN (SELECT uuid FROM `sign_reading`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "sign_reading" AND uuid NOT IN (SELECT uuid FROM `sign_reading`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "sign_sibling" AND uuid NOT IN (SELECT uuid FROM `sign_sibling`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "sign_sibling" AND uuid NOT IN (SELECT uuid FROM `sign_sibling`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "spatial_unit" AND uuid NOT IN (SELECT uuid FROM `spatial_unit`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "spatial_unit" AND uuid NOT IN (SELECT uuid FROM `spatial_unit`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "text" AND uuid NOT IN (SELECT uuid FROM `text`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "text" AND uuid NOT IN (SELECT uuid FROM `text`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "text_discourse" AND uuid NOT IN (SELECT uuid FROM `text_discourse`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "text_discourse" AND uuid NOT IN (SELECT uuid FROM `text_discourse`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "text_drafts" AND uuid NOT IN (SELECT uuid FROM `text_drafts`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "text_drafts" AND uuid NOT IN (SELECT uuid FROM `text_drafts`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "text_epigraphy" AND uuid NOT IN (SELECT uuid FROM `text_epigraphy`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "text_epigraphy" AND uuid NOT IN (SELECT uuid FROM `text_epigraphy`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "text_markup" AND uuid NOT IN (SELECT uuid FROM `text_markup`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "text_markup" AND uuid NOT IN (SELECT uuid FROM `text_markup`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "threads" AND uuid NOT IN (SELECT uuid FROM `threads`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "threads" AND uuid NOT IN (SELECT uuid FROM `threads`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "tree" AND uuid NOT IN (SELECT uuid FROM `tree`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "tree" AND uuid NOT IN (SELECT uuid FROM `tree`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "unique_spellings" AND uuid NOT IN (SELECT uuid FROM `unique_spellings`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "unique_spellings" AND uuid NOT IN (SELECT uuid FROM `unique_spellings`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "user" AND uuid NOT IN (SELECT uuid FROM `user`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "user" AND uuid NOT IN (SELECT uuid FROM `user`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "value" AND uuid NOT IN (SELECT uuid FROM `value`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "value" AND uuid NOT IN (SELECT uuid FROM `value`);
		END IF;
		IF ((SELECT uuid FROM uuid WHERE table_reference = "variable" AND uuid NOT IN (SELECT uuid FROM `variable`) LIMIT 1) IS NOT NULL) THEN
			SELECT uuid, table_reference FROM uuid WHERE table_reference = "variable" AND uuid NOT IN (SELECT uuid FROM `variable`);
		END IF;
    END