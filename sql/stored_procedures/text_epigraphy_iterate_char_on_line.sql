CREATE PROCEDURE `text_epigraphy_iterate_char_on_line`(IN this_parent_uuid CHAR(36), IN this_char_on_line INT(2))
BEGIN
		SET @charOnLine:=this_char_on_line;
		UPDATE text_epigraphy SET `char_on_line` = @charOnLine := @charOnLine+1 WHERE parent_uuid = this_parent_uuid AND (`type` = 'sign' OR `type` = 'number' OR `type` = 'missingSigns' OR `type` = 'separator' OR `type` = 'combiningSign') AND `char_on_line` >= (this_char_on_line+1);
	END
