CREATE PROCEDURE `iterate_object_on_tablet_on_delete`(IN this_uuid CHAR(36))
	BEGIN
        DECLARE this_object_on_tablet INT DEFAULT 0;
		DECLARE this_text_uuid CHAR(36) DEFAULT '';
        SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci; 
		SELECT object_on_tablet INTO this_object_on_tablet FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		UPDATE text_epigraphy SET object_on_tablet = (object_on_tablet-1) WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci AND object_on_tablet >= this_object_on_tablet ORDER BY object_on_tablet ASC;
    END