CREATE PROCEDURE `add_ma`(IN form_uuid CHAR(36))
BEGIN
	DECLARE parent_uuid, parent_uuid2 CHAR(36) DEFAULT NULL;
    SET FOREIGN_KEY_CHECKS = 0;
    IF ((SELECT `uuid` FROM item_properties WHERE reference_uuid = CONVERT(form_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = '859939fd-bdf6-fa7b-fa93-3f42207e1005') IS NOT NULL) THEN
        IF ((SELECT `uuid` FROM item_properties WHERE reference_uuid = CONVERT(form_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = '5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286' AND value_uuid = "67a5cc67-55f7-3ade-2aff-c676d7996b17") IS NOT NULL) THEN
            SELECT `uuid` INTO parent_uuid2 FROM item_properties WHERE reference_uuid = CONVERT(form_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = '5a27fd3a-7c58-7d0f-3acb-78a6ecd8b286' AND value_uuid = "67a5cc67-55f7-3ade-2aff-c676d7996b17";
			INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`value`) VALUES (UUID(),form_uuid,parent_uuid2,'2','04c0ca79-ead3-79a0-a8f9-6de075e4c549','c8851206-aba2-ca18-e219-91f8e45eb5ad','-ma');
       ELSE
			SELECT `uuid` INTO parent_uuid FROM item_properties WHERE reference_uuid = CONVERT(form_uuid USING latin1) COLLATE latin1_swedish_ci AND variable_uuid = '859939fd-bdf6-fa7b-fa93-3f42207e1005';
			INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`value`) VALUES (UUID(),form_uuid,parent_uuid,'1','04c0ca79-ead3-79a0-a8f9-6de075e4c549','c8851206-aba2-ca18-e219-91f8e45eb5ad','-ma');
        END IF;
        
    ELSE
		SET @uuid1 = UUID();
		SET FOREIGN_KEY_CHECKS = 0;
		INSERT INTO item_properties (`uuid`,`reference_uuid`,`level`,`variable_uuid`,`value_uuid`) VALUES (@uuid1,form_uuid,'0','859939fd-bdf6-fa7b-fa93-3f42207e1005','7ef55f42-4cfc-446f-6d47-f83b725b34d5');
		INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`value`) VALUES (UUID(),form_uuid,@uuid1,'1','04c0ca79-ead3-79a0-a8f9-6de075e4c549','c8851206-aba2-ca18-e219-91f8e45eb5ad','-ma');
		SET FOREIGN_KEY_CHECKS = 1;
    END IF;
    SET FOREIGN_KEY_CHECKS = 1;
   END