CREATE PROCEDURE `text_epigraphy_iterate_exclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		CALL iterate_char_on_line_exclusive_insert(this_uuid);
		CALL iterate_char_on_tablet_exclusive_insert(this_uuid);
		CALL iterate_object_on_tablet_exclusive_insert(this_uuid);
	END