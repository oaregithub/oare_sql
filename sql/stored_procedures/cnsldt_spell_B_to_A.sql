CREATE PROCEDURE `cnsldt_spell_B_to_A`(uuidA CHAR(36), uuidB CHAR(36))
BEGIN
SET SQL_SAFE_UPDATES=0;
SET FOREIGN_KEY_CHECKS = 0;
UPDATE text_discourse SET spelling_uuid = uuidA 
WHERE spelling_uuid = uuidB;
DELETE FROM dictionary_spelling WHERE uuid = uuidB;
SET SQL_SAFE_UPDATES=1;
SET FOREIGN_KEY_CHECKS = 1;
END