CREATE PROCEDURE `text_discourse_iterate_inclusive_insert`(IN this_uuid CHAR(36))
	BEGIN
		CALL iterate_child_num_inclusive_insert(this_uuid);
		CALL iterate_word_on_tablet_inclusive_insert(this_uuid);
		CALL iterate_obj_in_text_inclusive_insert(this_uuid);
 	END