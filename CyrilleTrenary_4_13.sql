
create or replace PROCEDURE check_duplicates (idInitally IN number , idChangedTo In number )
AS
donorID number(4) := -1;
BEGIN
select IDDONOR into donorID from DD_DONOR where IDDONOR = idInitally;
IF (donorID = -1) THEN  
RAISE NO_DATA_FOUND;
END IF;   
  
  
select IDDONOR into donorID from DD_DONOR where IDDONOR = idChangedTo;
  
IF (donorID != -1) THEN  
RAISE DUP_VAL_ON_INDEX;
ELSE
update DD_DONOR set IDDONOR = idChangedTo where IDDONOR = idInitally;
END IF;   
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line ('This ID is already assigned.');
WHEN NO_DATA_FOUND THEN
dbms_output.put_line ('No id Found.');
END;