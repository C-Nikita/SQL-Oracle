--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6-11 Assignment
--======================================================



CREATE OR REPLACE FUNCTION DD_PLSTAT_SF(x IN number)  
RETURN varchar2
IS
z varchar2(15);
BEGIN
IF x = 10 THEN
z:= 'Open';
ELSIF x = 20 THEN
z:= 'Complete';
ELSIF x = 30 THEN
z:= 'Overdue';
ELSIF x = 40 THEN
z:= 'Closed';
ELSIF x= 50 THEN
z:= 'Hold';
END IF;  
RETURN z;
END;
/

SELECT idPledge AS "ID Pledge", Pledgedate AS "Pledge Date", DD_PLSTAT_SF(idStatus) AS "Status"
FROM DD_Pledge;

SELECT idPledge AS "ID Pledge" , Pledgedate AS "Pledge Date", DD_PLSTAT_SF(idStatus) AS "Status"
FROM DD_Pledge
WHERE idPledge = 100;