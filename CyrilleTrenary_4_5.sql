--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 4, CHAPTER 4-5 Assignment
--======================================================

--Handling Predefined Exceptions

DECLARE           
    rec_shopper bb_shopper%ROWTYPE;
    lv_shopper_num numeric;
    
BEGIN
    lv_shopper_num:=99;

SELECT *
  INTO rec_shopper
  FROM bb_shopper
  WHERE idShopper = lv_shopper_num;
  
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid shopper ID');

END;


/
SELECT * FROM bb_shopper;