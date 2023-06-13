CREATE PROCEDURE `text_epigraphy_iterate_on_delete`(IN this_uuid CHAR(36))
	BEGIN
		CALL iterate_char_on_line_on_delete(this_uuid);
		CALL iterate_char_on_tablet_on_delete(this_uuid);
		CALL iterate_object_on_tablet_on_delete(this_uuid);
    END