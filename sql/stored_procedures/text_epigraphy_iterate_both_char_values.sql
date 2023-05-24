DROP PROCEDURE text_epigraphy_iterate_both_char_values;
DELIMITER //
CREATE PROCEDURE `text_epigraphy_iterate_both_char_values`(IN this_text_uuid CHAR(36), IN this_parent_uuid CHAR(36), IN this_char_on_tablet INT(4), IN this_char_on_line INT(2))
BEGIN
		SET @charOnTablet:=this_char_on_tablet;
		SET @charOnLine:=this_char_on_line;
		UPDATE text_epigraphy SET `char_on_line` = @charOnLine := @charOnLine+1 WHERE parent_uuid = this_parent_uuid AND (`type` = 'sign' OR `type` = 'number' OR `type` = 'missingSigns' OR `type` = 'separator' OR `type` = 'combiningSign') AND `char_on_line` >= (this_char_on_line+1);
		UPDATE text_epigraphy SET char_on_tablet = @charOnTablet := @charOnTablet+1 WHERE text_uuid = this_text_uuid AND (`type` = 'sign' OR `type` = 'number' OR `type` = 'missingSigns' OR `type` = 'separator' OR `type` = 'combiningSign') AND char_on_tablet >= (this_char_on_tablet+1);
    END //
	DELIMITER ;