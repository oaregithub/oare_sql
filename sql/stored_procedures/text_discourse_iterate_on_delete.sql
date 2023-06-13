CREATE PROCEDURE `text_discourse_iterate_on_delete`(IN this_uuid CHAR(36))
	BEGIN
		CALL iterate_child_num_on_delete(this_uuid);
		CALL iterate_word_on_tablet_on_delete(this_uuid);
		CALL iterate_obj_in_text_on_delete(this_uuid);
    END