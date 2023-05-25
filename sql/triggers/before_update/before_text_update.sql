CREATE TRIGGER before_text_update
BEFORE UPDATE
ON `text` FOR EACH ROW
BEGIN
SET @display_name := '';
IF (NEW.excavation_prfx REGEXP ('Kt')) THEN
	SET @display_name := CONCAT(NEW.excavation_prfx, ' ', NEW.excavation_no);
    IF (NEW.object_type IS NOT NULL) THEN
		SET @display_name := CONCAT(@display_name, ' ', NEW.object_type);
    END IF;
	IF ((NEW.publication_prfx IS NOT NULL) AND (NEW.publication_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', NEW.publication_prfx, ' ', NEW.publication_no, ')');
    ELSEIF ((NEW.museum_prfx IS NOT NULL) AND (NEW.museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', NEW.museum_prfx, ' ', NEW.museum_no, ')');
    END IF;
ELSEIF ((NEW.publication_prfx IS NOT NULL) AND (NEW.publication_no IS NOT NULL)) THEN
	SET @display_name := CONCAT(NEW.publication_prfx, ' ', NEW.publication_no);
	IF (NEW.object_type IS NOT NULL) THEN
		SET @display_name := CONCAT(@display_name, ' ', NEW.object_type);
    END IF;
    IF ((NEW.excavation_prfx IS NOT NULL) AND (NEW.excavation_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@excavation_prfx, ' (', NEW.excavation_no, ' ', NEW.museum_no, ')');
	 ELSEIF ((NEW.museum_prfx IS NOT NULL) AND (NEW.museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', NEW.museum_prfx, ' ', NEW.museum_no, ')');
	END IF;
ELSEIF ((NEW.excavation_prfx IS NOT NULL) AND (NEW.excavation_no IS NOT NULL)) THEN
	SET @display_name := CONCAT(NEW.excavation_prfx, ' ', NEW.excavation_no);
	IF (NEW.object_type IS NOT NULL) THEN
		SET @display_name := CONCAT(@display_name, ' ', NEW.object_type);
    END IF;
    IF ((NEW.museum_prfx IS NOT NULL) AND (NEW.museum_no IS NOT NULL)) THEN
		SET @display_name := CONCAT(@display_name, ' (', NEW.museum_prfx, ' ', NEW.museum_no, ')');
	END IF;
ELSEIF ((NEW.museum_prfx IS NOT NULL) AND (NEW.museum_no IS NOT NULL)) THEN
	SET @display_name := CONCAT(@display_name, ' (', NEW.museum_prfx, ' ', NEW.museum_no, ')');
	IF (NEW.object_type IS NOT NULL) THEN
		SET @display_name := CONCAT(@display_name, ' ', NEW.object_type);
    END IF;
ELSE
	SET @display_name := NEW.`name`;
END IF;
IF (NEW.display_name != @display_name) THEN
	SET NEW.display_name = @display_name;
ELSEIF ((NEW.display_name IS NULL) AND (@display_name IS NOT NULL)) THEN
	SET NEW.display_name = @display_name;
END IF;
INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("UPDATE",SYSDATE(),"text",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦language¦",COALESCE(`old`.`language`,'NULL'),"¦cdli_num¦",COALESCE(`old`.`cdli_num`,'NULL'),"¦translit_status¦",COALESCE(`old`.`translit_status`,'NULL')));
END