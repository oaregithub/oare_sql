CREATE PROCEDURE `insert_props_Seal_Impression`(IN refUuid CHAR(36))
BEGIN	
    SET @parentUuid := UUID();

INSERT INTO item_properties (`uuid`,`reference_uuid`,`variable_uuid`,`value_uuid`,`value`)
		VALUES (@parentUuid, refUuid, '859939fd-bdf6-fa7b-fa93-3f42207e1005', 'ec820e17-ecc7-492f-86a7-a01b379622e1', 'Seal Impression');
INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`,`value_uuid`,`value`)
VALUES (UUID(), refUuid, @parentUuid, '1', '53718c5c-c77f-4785-a9a6-3ed788a0e638', '30ef656b-8d48-4b32-a0d5-d1143422d076', 'Top of Seal at 0 degrees');
INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`)
VALUES (UUID(), refUuid, @parentUuid, '1', 'f32e6903-67c9-41d8-840a-d933b8b3e719');
INSERT INTO item_properties (`uuid`,`reference_uuid`,`parent_uuid`,`level`,`variable_uuid`)
VALUES (UUID(), refUuid, @parentUuid, '1', 'c643e195-6d0b-11ec-bcc3-0282f921eac9');
   END