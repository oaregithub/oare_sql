CREATE PROCEDURE `new_bib_w_pdf`(IN zotItemKey CHAR(8), IN link VARCHAR(250), sourceUuid CHAR(36))
BEGIN

	SET @uuidBib := UUID(); 
    SET @uuidRes := UUID();
    SET @uuidLink := UUID();

	INSERT INTO bibliography (`uuid`,`zot_item_key`,`short_cit`) VALUES
		(@uuidBib, zotItemkey, link);

	INSERT INTO resource (`uuid`,`source_uuid`,`type`,`container`,`link`) VALUES
		(@uuidRes, sourceUuid, 'pdf', 'oare-pubs-bucket', link); 

	INSERT INTO link (`uuid`,`reference_uuid`,`obj_uuid`) VALUES
		(@uuidLink, @uuidBib, @uuidRes);

	END