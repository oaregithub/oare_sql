DROP PROCEDURE merge_forms_simple;
DELIMITER //
CREATE PROCEDURE `merge_forms_simple`(IN old_form CHAR(36), IN new_form CHAR(36))
BEGIN
	
    SET FOREIGN_KEY_CHECKS = 0;
	UPDATE dictionary_spelling SET reference_uuid = new_form WHERE reference_uuid = CONVERT(old_form USING latin1) COLLATE latin1_swedish_ci;
	SET FOREIGN_KEY_CHECKS = 1;
   END //
   DELIMITER ;