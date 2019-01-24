--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6-9 Assignment
--======================================================

CREATE OR REPLACE FUNCTION DD_MTHPAY_SF (IN_PLEDGE_AMT IN NUMBER, IN_MONTH_PAYMENT IN NUMBER) RETURN NUMBER 

IS 
v_amt NUMBER; 
BEGIN v_amt := (IN_PLEDGE_AMT / IN_MONTH_PAYMENT); 
return v_amt; 
END;
/
begin 
dbms_output.put_line(DD_MTHPAY_SF(240, 12)); 
end;
/
SELECT D.FIRSTNAME as "First Name", D.LASTNAME as "Last Name", DD_MTHPAY_SF(P.PAYMONTHS, PY.PAYAMT) as "Payment" 
from dd_donor d, dd_pledge p, dd_payment py 
where P.IDDONOR = D.IDDONOR and P.IDPLEDGE = PY.IDPLEDGE and (P.PAYMONTHS=12 OR P.PAYMONTHS=24);

--Selecting Unique entries
SELECT UNIQUE D.FIRSTNAME as "First Name", D.LASTNAME as "Last Name", DD_MTHPAY_SF(P.PAYMONTHS, PY.PAYAMT) as "Payment" 
from dd_donor d, dd_pledge p, dd_payment py 
where P.IDDONOR = D.IDDONOR and P.IDPLEDGE = PY.IDPLEDGE and (P.PAYMONTHS=12 OR P.PAYMONTHS=24);