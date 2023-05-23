CREATE DEFINER=`oare`@`%` PROCEDURE `merge_spelling`(IN old_spelling CHAR(36), IN new_spelling CHAR(36))
BEGIN
    SET FOREIGN_KEY_CHECKS = 0;
	UPDATE text_discourse SET spelling_uuid = new_spelling WHERE spelling_uuid = CONVERT(old_spelling USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM dictionary_spelling WHERE uuid = CONVERT(old_spelling USING latin1) COLLATE latin1_swedish_ci;
	SET FOREIGN_KEY_CHECKS = 1;
	CALL update_spelling_and_transcription_for_procedures(new_spelling);
   END