CREATE PROCEDURE `CreateConnect_NewPerson`(IN PN_Uuid CHAR(36), relation VARCHAR(10), Patro_Uuid CHAR(36), ip_id INT)
BEGIN
/* only to be used for unique new person*/
    DECLARE PN VARCHAR(50);
    DECLARE PTR VARCHAR(50);
    DECLARE new_label VARCHAR (102);
    SET @new_uuid := UUID(); 
    SELECT word INTO PN FROM dictionary_word WHERE uuid = Pn_Uuid;
    SELECT word INTO PTR FROM dictionary_word WHERE uuid = Patro_Uuid;
    SET new_label = CONCAT(PN,' ',relation,' ',PTR);
    
    
    INSERT INTO person (`uuid`,`name_uuid`,`relation`,`relation_name_uuid`,`label`,`type`) VALUES (@new_uuid, PN_Uuid, relation, Patro_uuid, new_label, 'person');
    
    SET FOREIGN_KEY_CHECKS=0;
    SET SQL_SAFE_UPDATES=0;
    UPDATE item_properties SET object_uuid = @new_uuid WHERE id = ip_id;
    SET FOREIGN_KEY_CHECKS=1;
    SET SQL_SAFE_UPDATES=1;
    
   END