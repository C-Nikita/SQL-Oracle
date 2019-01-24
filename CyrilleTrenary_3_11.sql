--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 3, CHAPTER 3-11 Assignment
--======================================================

--SET SERVEROUTPUT ON

DECLARE
  PLEDGES    			DD_PLEDGE%ROWTYPE;
  START_MONTH_DATE       	DD_PLEDGE.PLEDGEDATE%TYPE := '01-OCT-12';
  END_MONTH_DATE 		DD_PLEDGE.PLEDGEDATE%TYPE := '31-OCT-12';
  
 
BEGIN
  FOR PLEDGES IN 
    (SELECT IDPLEDGE, IDDONOR, PLEDGEAMT, CASE
      WHEN PAYMONTHS = 0 THEN 'Lump Sum.'
      ELSE 'Monthly - ' || PAYMONTHS
      END AS MONTHLY_PAYMENT
      FROM DD_PLEDGE
      WHERE PLEDGEDATE >= START_MONTH_DATE AND PLEDGEDATE <= END_MONTH_DATE
      ORDER BY PAYMONTHS)
      LOOP
      DBMS_OUTPUT.PUT_LINE('ID: ' || PLEDGES.IDPLEDGE || ', Donor ID: '
        || PLEDGES.IDDONOR || ', Pledge: ' ||to_char(PLEDGES.PLEDGEAMT,
        '$9999.99') || ', Payments: ' || PLEDGES. MONTHLY_PAYMENT);
      END LOOP;
      END;

/

