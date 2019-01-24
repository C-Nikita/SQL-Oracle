--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 3, CHAPTER 3-13 Assignment
--======================================================

--SET SERVEROUTPUT ON

DECLARE
  lv_NAME 		DD_PROJECT.PROJNAME%TYPE;
  lv_START 			DD_PROJECT.PROJSTARTDATE%TYPE;
  lv_INIT_GOAL 		DD_PROJECT.PROJFUNDGOAL%TYPE;
  lv_ID 			DD_PROJECT.IDPROJ%TYPE := '502';
  lv_NEW_GOAL 	DD_PROJECT.PROJFUNDGOAL%TYPE := '250000';
    
BEGIN
  SELECT PROJNAME, PROJSTARTDATE, PROJFUNDGOAL
  INTO lv_NAME, lv_START, lv_INIT_GOAL
  FROM DD_PROJECT
  WHERE IDPROJ = lv_ID;
  
  UPDATE DD_PROJECT
  SET PROJFUNDGOAL = lv_NEW_GOAL;
  
  DBMS_OUTPUT.PUT_LINE('Project: ' || lv_NAME ||', Start Date: ' ||
  lv_START || ', Initial Goal: ' || lv_INIT_GOAL || ', Current Goal: ' ||
  lv_NEW_GOAL);
  
  END;
/

--SELECT * FROM DD_PROJECT;