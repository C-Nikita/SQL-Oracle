--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 1, CHAPTER 2-1 Assignment
--======================================================


DECLARE
    lv_test_date DATE  := '10-DEC-2012';
    lv_test_num NUMBER(3) := 10;
    lv_test_txt VARCHAR2(10);
BEGIN
    lv_test_txt := 'Trenary';
    DBMS_OUTPUT.PUT_LINE(lv_test_date);
    DBMS_OUTPUT.PUT_LINE(lv_test_num);
    DBMS_OUTPUT.PUT_LINE(lv_test_txt);
END;