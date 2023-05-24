DROP PROCEDURE CnctTxt2Arch;
DELIMITER //
CREATE PROCEDURE `CnctTxt2Arch`(IN txt CHAR(36), arch CHAR(36))
BEGIN
	INSERT INTO link (`uuid`,`reference_uuid`,`obj_uuid`) VALUES 
	(UUID(),txt,arch);    
END //
DELIMITER ;