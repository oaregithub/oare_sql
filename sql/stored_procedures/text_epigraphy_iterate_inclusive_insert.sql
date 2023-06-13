CREATE PROCEDURE `text_epigraphy_iterate_inclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		CALL iterate_char_on_line_inclusive_insert(this_uuid);
		CALL iterate_char_on_tablet_inclusive_insert(this_uuid);
		CALL iterate_object_on_tablet_inclusive_insert(this_uuid);
    END