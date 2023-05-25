CREATE PROCEDURE `fix_display_name` (IN this_uuid CHAR(36))
BEGIN
DECLARE this_excavation_prfx, this_excavation_no, this_publication_prfx, this_publication_no, this_museum_prfx, this_museum_no, this_name, this_display_name VARCHAR(255);
DECLARE that_parent_uuid CHAR(36);
DECLARE that_line decimal(5,2);
SET @display_name := '';
SELECT excavation_prfx INTO this_excavation_prfx FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT excavation_no INTO this_excavation_no FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT publication_prfx INTO this_publication_prfx FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT publication_no INTO this_publication_no FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT museum_prfx INTO this_museum_prfx FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT museum_no INTO this_museum_no FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT `name` INTO this_name FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
SELECT display_name INTO this_display_name FROM `text` WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;

IF (this_excavation_prfx REGEXP ('Kt')) THEN
	SET @display_name := CONCAT(this_excavation_prfx, ' ', this_excavation_no);
	IF ((this_publication_prfx IS NOT NULL) AND (this_publication_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', this_publication_prfx, ' ', this_publication_no, ')');
    ELSEIF ((this_museum_prfx IS NOT NULL) AND (this_museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', this_museum_prfx, ' ', this_museum_no, ')');
    END IF;
ELSEIF ((this_publication_prfx IS NOT NULL) AND (this_publication_no IS NOT NULL)) THEN
	SET @display_name := CONCAT(this_publication_prfx, ' ', this_publication_no);
    IF ((this_excavation_prfx IS NOT NULL) AND (this_excavation_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@excavation_prfx, ' (', this_excavation_no, ' ', this_museum_no, ')');
	 ELSEIF ((this_museum_prfx IS NOT NULL) AND (this_museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', this_museum_prfx, ' ', this_museum_no, ')');
	END IF;
ELSEIF ((this_excavation_prfx IS NOT NULL) AND (this_excavation_no IS NOT NULL)) THEN
	SET @display_name := CONCAT(this_excavation_prfx, ' ', this_excavation_no);
    IF ((this_museum_prfx IS NOT NULL) AND (this_museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', this_museum_prfx, ' ', this_museum_no, ')');
	END IF;
ELSEIF ((this_museum_prfx IS NOT NULL) AND (this_museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(this_museum_prfx, ' ', this_museum_no);
ELSE
	SET @display_name := this_name;
END IF;
IF (this_display_name != @display_name) THEN
	 UPDATE `text` SET display_name = @display_name WHERE uuid = CONVERT(this_uuid USING latin1) COLLATE latin1_swedish_ci;
END IF;
END