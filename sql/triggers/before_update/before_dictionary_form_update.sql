CREATE TRIGGER `before_dictionary_form_update` BEFORE UPDATE ON `dictionary_form` FOR EACH ROW BEGIN
	IF NOT(NEW.form <=> OLD.form) THEN
    	UPDATE text_discourse SET transcription = NEW.form WHERE spelling_uuid IN (SELECT uuid FROM dictionary_spelling WHERE parent_uuid = NEW.uuid);
    END IF;
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"dictionary_form",`old`.`uuid`,concat("reference_uuid¦",COALESCE(`old`.`reference_uuid`,'NULL'),"¦form¦",COALESCE(`old`.`form`,'NULL')));
END