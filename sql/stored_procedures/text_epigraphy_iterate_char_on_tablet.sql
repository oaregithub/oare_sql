CREATE DEFINER=`oare`@`%` PROCEDURE `text_epigraphy_iterate_char_on_tablet`(IN this_text_uuid CHAR(36), IN this_char_on_tablet INT(4))
BEGIN
		SET @charOnTablet:=this_char_on_tablet;
		UPDATE text_epigraphy SET char_on_tablet = @charOnTablet := @charOnTablet+1 WHERE text_uuid = this_text_uuid AND (`type` = 'sign' OR `type` = 'number' OR `type` = 'missingSigns' OR `type` = 'separator' OR `type` = 'combiningSign') AND char_on_tablet >= (this_char_on_tablet+1);
	END