DROP PROCEDURE merge_2_persons;
DELIMITER //
CREATE PROCEDURE `merge_2_persons`(IN old_person CHAR(36), IN new_person CHAR(36))
m2p: BEGIN
	DECLARE old_type, new_type, oldRelation, newRelation VARCHAR(25) DEFAULT '';
    DECLARE oldPNuuid, newPNuuid, oldRelationPNuuid, newRelationPNuuid CHAR(36) DEFAULT NULL;
    SELECT `type` INTO old_type FROM person WHERE uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	SELECT `type` INTO new_type FROM person WHERE uuid = CONVERT(new_person USING latin1) COLLATE latin1_swedish_ci;
	IF old_type != new_type THEN
		LEAVE m2p;
	END IF;
    /*
    All of this compares name_uuid, relation, and name_relation_uuid as a check
    -- this is just to prevent unintended execution of this sp in 'safe mode' I'll need to
    create a version without this check - to only be used carefully, when it is clear that the
    person is the same, even when names are not yet the same. But this one shoudl work first */
    SELECT `name_uuid` INTO oldPNuuid FROM person WHERE uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	SELECT `name_uuid` INTO newPNuuid FROM person WHERE uuid = CONVERT(new_person USING latin1) COLLATE latin1_swedish_ci;
	SELECT `relation_name_uuid` INTO oldRelationPNuuid FROM person WHERE uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	SELECT `relation_name_uuid` INTO newRelationPNuuid FROM person WHERE uuid = CONVERT(new_person USING latin1) COLLATE latin1_swedish_ci;
    SELECT `relation` INTO oldRelation FROM person WHERE uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	SELECT `relation` INTO newRelation FROM person WHERE uuid = CONVERT(new_person USING latin1) COLLATE latin1_swedish_ci;
    IF oldPNuuid != newPNuuid THEN
		LEAVE m2p;
	END IF;
    IF oldRelationPNuuid != newRelationPNuuid THEN
		LEAVE m2p;
	END IF;
    IF oldRelation != newRelation THEN
		LEAVE m2p;
	END IF;
    SET FOREIGN_KEY_CHECKS = 0;
	UPDATE item_properties SET object_uuid = new_person WHERE object_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE period SET official1_uuid = new_person WHERE official1_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE period SET official2_uuid = new_person WHERE official2_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE person SET relation_name_uuid = new_person WHERE relation_name_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE link SET reference_uuid = new_person WHERE reference_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE link SET obj_uuid = new_person WHERE obj_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE threads SET reference_uuid = new_person WHERE reference_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	UPDATE item_properties SET reference_uuid = new_person WHERE reference_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM alias WHERE reference_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	DELETE FROM hierarchy WHERE object_uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
    DELETE FROM person WHERE uuid = CONVERT(old_person USING latin1) COLLATE latin1_swedish_ci;
	SET FOREIGN_KEY_CHECKS = 1;
   END //
   DELIMITER ;