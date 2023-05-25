CREATE TRIGGER after_text_epigraphy_update
AFTER UPDATE
ON `text_epigraphy` FOR EACH ROW
BEGIN
	IF (`old`.`type` IN ('number','sign','undeterminedSigns')) THEN
		CALL update_discourse_spellings(`old`.discourse_uuid);
		CALL update_discourse_transcription(`old`.discourse_uuid);
	END IF;
END