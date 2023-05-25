CREATE PROCEDURE `split_sign_in_same_word`(IN this_uuid CHAR(36), IN this_reading VARCHAR(15), IN that_reading VARCHAR(15), IN this_reading_type VARCHAR(15))
    BEGIN
DECLARE this_char_on_line, this_char_on_tablet, this_object_on_tablet, this_side, this_column INT DEFAULT 0;
DECLARE this_text_uuid, this_tree_uuid, this_parent_uuid, this_reading_uuid, this_sign_uuid, this_discourse_uuid CHAR(36) DEFAULT '';
DECLARE this_line DECIMAL(5,2) DEFAULT NULL;
DECLARE this_type, this_sign VARCHAR(250) DEFAULT '';

		SELECT `type` INTO this_type FROM text_epigraphy WHERE uuid = this_uuid;
		SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE uuid = this_uuid;
        SELECT tree_uuid INTO this_tree_uuid FROM text_epigraphy WHERE uuid = this_uuid; 
		SELECT parent_uuid INTO this_parent_uuid FROM text_epigraphy WHERE uuid = this_uuid;
		SELECT object_on_tablet INTO this_object_on_tablet FROM text_epigraphy WHERE uuid = this_uuid;
		SELECT side INTO this_side FROM text_epigraphy WHERE uuid = this_uuid;
		SELECT `column` INTO this_column FROM text_epigraphy WHERE uuid = this_uuid;
		SELECT line INTO this_line FROM text_epigraphy WHERE uuid = this_uuid;
        SELECT char_on_line INTO this_char_on_line FROM text_epigraphy WHERE uuid = this_uuid;
		SELECT char_on_tablet INTO this_char_on_tablet FROM text_epigraphy WHERE uuid = this_uuid;
        
        SELECT uuid INTO this_reading_uuid FROM sign_reading WHERE `value` = that_reading AND `type` = this_reading_type;
        SELECT `name` INTO this_sign FROM sign WHERE uuid IN (SELECT reference_uuid FROM sign_reading WHERE uuid = this_reading_uuid);
		SELECT reference_uuid INTO this_sign_uuid FROM sign_reading WHERE uuid = this_reading_uuid;
		SELECT discourse_uuid INTO this_discourse_uuid FROM text_epigraphy WHERE uuid = this_uuid;

CALL text_epigraphy_iterate_after_insert(this_uuid);

UPDATE text_epigraphy SET reading = this_reading WHERE uuid = this_uuid;
-- SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `text_epigraphy`(`uuid`, `type`, `text_uuid`, `tree_uuid`, `parent_uuid`, `object_on_tablet`, `side`, `column`, `line`, `char_on_line`, `char_on_tablet`, `sign_uuid`, `sign`, `reading_uuid`, `reading`, `discourse_uuid`) VALUES (UUID(), this_type, this_text_uuid, this_tree_uuid, this_parent_uuid, this_object_on_tablet+1, this_side, this_column, this_line, this_char_on_line+1, this_char_on_tablet+1, this_sign_uuid, this_sign, this_reading_uuid, that_reading, this_discourse_uuid);
-- SET FOREIGN_KEY_CHECKS = 1;
END