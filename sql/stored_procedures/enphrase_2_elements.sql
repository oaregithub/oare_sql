CREATE PROCEDURE `enphrase_2_elements`(IN this_uuid CHAR(36), IN that_uuid CHAR(36))
BEGIN
       DECLARE this_obj_in_text, that_obj_in_text, max_td_id, this_child_num INT DEFAULT 0;
	   DECLARE this_parent_uuid, that_parent_uuid, this_text_uuid, that_text_uuid, this_tree_uuid, that_tree_uuid, new_phrase_uuid CHAR(36) DEFAULT '';
       DECLARE this_type, that_type VARCHAR(60) DEFAULT '';
	   SET @new_phrase_uuid := UUID();
	   
	SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT obj_in_text INTO that_obj_in_text FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT parent_uuid INTO that_parent_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT text_uuid INTO that_text_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT tree_uuid INTO this_tree_uuid FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT tree_uuid INTO that_tree_uuid FROM text_discourse WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	SELECT MAX(id) INTO max_td_id FROM text_discourse;
	SELECT `child_num` INTO this_child_num FROM text_discourse WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
    
	IF this_text_uuid = that_text_uuid
		AND this_parent_uuid = that_parent_uuid
		AND this_tree_uuid = that_tree_uuid
		AND this_obj_in_text = that_obj_in_text-1
	THEN
        CALL `iterate_obj_in_text_before_insert`(this_uuid);
        CALL `iterate_child_num_on_delete`(this_uuid);
		INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`) VALUES (@new_phrase_uuid, 'phrase', this_obj_in_text, this_child_num, this_text_uuid, this_tree_uuid, this_parent_uuid);
		
        UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '1' WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		UPDATE text_discourse SET parent_uuid = @new_phrase_uuid, child_num = '2' WHERE uuid = CONVERT(that_uuid USING latin1) COLLATE latin1_swedish_ci;
	END IF;
   END