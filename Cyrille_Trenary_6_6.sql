--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6-6 Assignment
--======================================================


CREATE OR REPLACE FUNCTION status_desc_sf(p_stage IN NUMBER)RETURN VARCHAR2
    
    IS
    lv_stage_txt VARCHAR2(30);
    BEGIN
    
    IF p_stage = 1 THEN
    lv_stage_txt := 'Order Submitted';
    ELSIF p_stage = 2 THEN
    lv_stage_txt := 'Accepted, sent to shipping';
    ELSIF p_stage = 3 THEN
    lv_stage_txt := 'Backordered';
    ELSIF p_stage = 4 THEN
    lv_stage_txt := 'Cancelled';
    ELSIF p_stage = 5 THEN
    lv_stage_txt := 'Shipped';
    END IF;

RETURN lv_stage_txt;
END;
/
SELECT
status_desc_sf(4) as "Status"
FROM BB_BASKETSTATUS;

