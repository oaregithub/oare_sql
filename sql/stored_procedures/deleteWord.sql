DROP PROCEDURE `deleteWord`;
DELIMITER $$
CREATE PROCEDURE `deleteWord`(IN del_uuid CHAR(36))
BEGIN
	
    SET FOREIGN_KEY_CHECKS=0;
    
    DELETE FROM alias WHERE reference_uuid = del_uuid;
    DELETE FROM item_properties WHERE reference_uuid = del_uuid;
    DELETE FROM dictionary_word WHERE uuid = del_uuid;
    DELETE FROM bibliography WHERE reference_uuid = del_uuid;
    -- what to do about notes and comments?
	-- DELETE FROM comments WHERE reference_uuid = del_uuid;
    DELETE FROM hierarchy WHERE reference_uuid = del_uuid;
    DELETE FROM field WHERE reference_uuid = del_uuid;
    DELETE FROM uuid WHERE uuid = del_uuid;
    
	SET FOREIGN_KEY_CHECKS=1;

   END $$
DELIMITER ;