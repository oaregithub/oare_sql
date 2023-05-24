CREATE DEFINER=`oare`@`%` PROCEDURE `iterate_child_num_before_insert`(IN this_uuid CHAR(36))
BEGIN
		DECLARE this_child_num, this_word_on_tablet, this_obj_in_text INT DEFAULT 0;
		DECLARE this_text_uuid, this_parent_uuid CHAR(36) DEFAULT '';

		SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT child_num INTO this_child_num FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT word_on_tablet INTO this_word_on_tablet FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
			   
		UPDATE text_discourse SET child_num = (child_num+1) WHERE parent_uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci AND child_num >= this_child_num  AND uuid != this_uuid ORDER BY obj_in_text ASC;
    END