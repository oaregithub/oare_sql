CREATE DEFINER=`oare`@`%` PROCEDURE `enphrase_3_words`(IN this_uuid CHAR(36), IN that_uuid CHAR(36), IN other_uuid CHAR(36))
BEGIN
       DECLARE this_obj_in_text, that_obj_in_text INT(4) DEFAULT 0;
       DECLARE max_td_id INT(12) DEFAULT 0;
	   DECLARE this_parent_uuid, that_parent_uuid, this_text_uuid, that_text_uuid, this_tree_uuid, that_tree_uuid, new_phrase_uuid CHAR(36) DEFAULT '';
       DECLARE this_type, that_type VARCHAR(60) DEFAULT '';
       DECLARE this_id, that_id, other_id, this_child_num INT(12) DEFAULT NULL;
		
	SELECT id INTO this_id FROM text_discourse WHERE uuid = this_uuid;
    SELECT id INTO that_id FROM text_discourse WHERE uuid = that_uuid;
    SELECT id INTO other_id FROM text_discourse WHERE uuid = other_uuid;
    SELECT `type` INTO this_type FROM text_discourse WHERE uuid = this_uuid;
	SELECT `type` INTO that_type FROM text_discourse WHERE uuid = that_uuid;
	SELECT obj_in_text INTO this_obj_in_text FROM text_discourse WHERE uuid = this_uuid;
	SELECT obj_in_text INTO that_obj_in_text FROM text_discourse WHERE uuid = that_uuid;
	SELECT parent_uuid INTO this_parent_uuid FROM text_discourse WHERE uuid = this_uuid;
	SELECT parent_uuid INTO that_parent_uuid FROM text_discourse WHERE uuid = that_uuid;
	SELECT text_uuid INTO this_text_uuid FROM text_discourse WHERE uuid = this_uuid;
	SELECT text_uuid INTO that_text_uuid FROM text_discourse WHERE uuid = that_uuid;
	SELECT tree_uuid INTO this_tree_uuid FROM text_discourse WHERE uuid = this_uuid;
	SELECT tree_uuid INTO that_tree_uuid FROM text_discourse WHERE uuid = that_uuid;
    SELECT child_num INTO this_child_num FROM text_discourse WHERE uuid = this_uuid;
	SELECT MAX(id) INTO max_td_id FROM text_discourse;
                
	/* IF this_type IN ('word', 'number') 
		AND that_type IN ('word', 'number')
		AND this_text_uuid = that_text_uuid
		AND this_parent_uuid = that_parent_uuid
		AND this_tree_uuid = that_tree_uuid
		AND this_obj_in_text+1 = that_obj_in_text
	THEN
    */
		CALL `oarebyue_0.3`.`iterate_obj_in_text_before_insert`(this_uuid);
		INSERT INTO text_discourse (`uuid`,`type`,`obj_in_text`,`child_num`,`text_uuid`,`tree_uuid`,`parent_uuid`) VALUES (UUID(), 'phrase', this_obj_in_text, this_child_num, this_text_uuid, this_tree_uuid, this_parent_uuid);
		SELECT uuid INTO new_phrase_uuid FROM text_discourse WHERE id = max_td_id+1;
		UPDATE text_discourse SET parent_uuid = new_phrase_uuid, child_num = '1' WHERE id = this_id;
		UPDATE text_discourse SET parent_uuid = new_phrase_uuid, child_num = '2' WHERE id = that_id;
        UPDATE text_discourse SET parent_uuid = new_phrase_uuid, child_num = '3' WHERE id = other_id;
	/*
	END IF;
    */
   END