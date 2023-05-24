DROP PROCEDURE enphrase_PN_DUMUPhrase_cnctPerson;
DELIMITER //
CREATE PROCEDURE `enphrase_PN_DUMUPhrase_cnctPerson`(IN this_uuid CHAR(36), IN that_uuid CHAR(36), IN person_uuid CHAR(36))
BEGIN
	DECLARE new_uuid CHAR(36) DEFAULT '';
    CALL `enphrase_2_elements`(this_uuid, that_uuid);
    SELECT uuid INTO new_uuid FROM text_discourse WHERE id = LAST_INSERT_ID();
    CALL `CnctExprs2Person`(new_uuid, person_uuid);
   END //
DELIMITER ;