CREATE PROCEDURE `iterate_child_num_after_insert`(IN this_uuid CHAR(36))
	BEGIN
		DECLARE this_child_num INT DEFAULT 0;
		DECLARE this_parent_uuid CHAR(36) DEFAULT '';
		SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT child_num INTO this_child_num FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		UPDATE text_discourse SET child_num = (child_num+1) WHERE parent_uuid = CONVERT(this_parent_uuid USING latin1) COLLATE latin1_swedish_ci AND child_num >= (this_child_num+1) AND uuid != this_uuid  ORDER BY obj_in_text ASC;
    END