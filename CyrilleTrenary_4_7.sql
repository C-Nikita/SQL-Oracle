--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 4, CHAPTER 4-7 Assignment
--======================================================
--Handling Exceptions with User-Defined Errors
DECLARE
lv_old_num numeric := 30;
lv_new_num numeric:= 4;
ex_no_id EXCEPTION;
BEGIN
UPDATE bb_basketitem
   SET idBasket = lv_new_num
   WHERE idBasket = lv_old_num;
IF SQL%NOTFOUND THEN
    RAISE ex_no_id;
END IF;

EXCEPTION 
    WHEN ex_no_id THEN
        DBMS_OUTPUT.PUT_LINE('Invalid original basket ID');
END;