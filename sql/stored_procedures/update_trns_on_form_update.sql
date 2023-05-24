DROP PROCEDURE update_trns_on_form_update;
DELIMITER //
CREATE PROCEDURE `update_trns_on_form_update`(IN form VARCHAR(50), df_uuid CHAR(36))
BEGIN
    UPDATE text_discourse SET transcription = form WHERE spelling_uuid IN (SELECT uuid FROM dictionary_spelling WHERE reference_uuid = df_uuid);
   END //
   DELIMITER ;