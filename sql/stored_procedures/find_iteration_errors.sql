CREATE PROCEDURE `find_iteration_errors`() 
	BEGIN
		CREATE TEMPORARY TABLE IF NOT EXISTS temp_result_table (
			uuid CHAR(36),
			text_uuid CHAR(36),
			parent_uuid CHAR(36),
			`type` VARCHAR(250),
			num INT,
			previous VARCHAR(250),
            affected_column VARCHAR(250)
		);
		CALL find_obj_in_text_iteration_issues(); 
		CALL find_object_on_tablet_iteration_issues();
        SELECT * FROM temp_result_table;
        DROP TABLE temp_result_table;
    END