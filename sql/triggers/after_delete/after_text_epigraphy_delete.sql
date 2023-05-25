CREATE TRIGGER after_text_epigraphy_delete
AFTER DELETE
ON `text_epigraphy` FOR EACH ROW
BEGIN
	INSERT INTO `logging`(`type`, `time`, `reference_table`, `uuid`, `object_values`) VALUES ("DELETE",SYSDATE(),"text_epigraphy",`old`.`uuid`,concat("type¦",COALESCE(`old`.`type`,'NULL'),"¦text_uuid¦",COALESCE(`old`.`text_uuid`,'NULL'),"¦tree_uuid¦",COALESCE(`old`.`tree_uuid`,'NULL'),"¦parent_uuid¦",COALESCE(`old`.`parent_uuid`,'NULL'),"¦side¦",COALESCE(`old`.`side`,'NULL'),"¦column¦",COALESCE(`old`.`column`,'NULL'),"¦line¦",COALESCE(`old`.`line`,'NULL'),"¦char_on_line¦",COALESCE(`old`.`char_on_line`,'NULL'),"¦char_on_tablet¦",COALESCE(`old`.`char_on_tablet`,'NULL'),"¦sign_uuid¦",COALESCE(`old`.`sign_uuid`,'NULL'),"¦sign¦",COALESCE(`old`.`sign`,'NULL'),"¦reading_uuid¦",COALESCE(`old`.`reading_uuid`,'NULL'),"¦reading¦",COALESCE(`old`.`reading`,'NULL'),"¦discourse_uuid¦",COALESCE(`old`.`discourse_uuid`,'NULL')));
	DELETE FROM uuid WHERE uuid.uuid = `old`.uuid;
   IF (`old`.`type` IN ("number","sign","undeterminedSigns") AND (SELECT COUNT(discourse_uuid) FROM text_epigraphy WHERE discourse_uuid = `old`.discourse_uuid) <= 1) THEN
      CALL text_discourse_iterate_on_delete(`old`.discourse_uuid);
      DELETE FROM text_discourse WHERE uuid = `old`.discourse_uuid;
	END IF;
END