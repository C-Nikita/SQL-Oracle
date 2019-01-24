--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5-3 Assignment
--======================================================
 SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE tax_cost_sp
  (i_state  in bb_tax.state%type,
   i_subtot in number,
   i_tax    out number) -- i_tax will return to the o_tax parameter
  is

BEGIN
  SELECT (taxrate * i_subtot) 
    INTO i_tax
  FROM bb_tax
  WHERE state = i_state; -- if a no data found is thrown here
                         -- we know to set the tax rate to 0
EXCEPTION
  WHEN NO_DATA_FOUND THEN  -- this handler accomplishes that
    i_tax := 0;
end;
/

-- this code test that the value returned was correct
DECLARE
o_tax NUMBER;
BEGIN
tax_cost_sp('VA', 100, o_tax );
DBMS_OUTPUT.PUT_LINE( o_tax);
END;


