CREATE PROCEDURE `text_epigraphy_de_iterate_line`(IN this_uuid CHAR(36))
BEGIN
		DECLARE this_text_uuid CHAR(36);
		DECLARE this_line, this_decimal DECIMAL(5,2);
        DECLARE this_whole INT;
        DECLARE this_remainder VARCHAR(250);

        SELECT line INTO this_line FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SELECT text_uuid INTO this_text_uuid FROM text_epigraphy WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
		SET this_whole = TRUNCATE(this_line,0);
		SET this_decimal = this_line - this_whole;
        SET this_remainder = REPLACE(this_decimal, "0.", ".");
        SET this_remainder = CONCAT("\\",this_remainder);
		
		UPDATE text_epigraphy SET line = line-1 
			WHERE text_uuid = CONVERT(this_text_uuid USING latin1) COLLATE latin1_swedish_ci 
 			AND line >= this_line
            AND line REGEXP this_remainder;
	END