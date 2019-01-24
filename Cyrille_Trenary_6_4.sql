--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6-4 Assignment
--======================================================

create or replace function DAY_ORD_SF
(dcreated date)
return VARCHAR2
 
is
 
begin
 
    RETURN TO_CHAR(dcreated,'DAY');
end;
/
       
SELECT day_ord_sf(dtcreated), count(*) as "Number of Orders"
FROM BB_BASKET
GROUP BY DAY_ORD_SF(DTCREATED)
ORDER BY TO_CHAR(MIN(DTCREATED), 'DAY') DESC;
       
SELECT day_ord_sf(dtcreated), count(*) as "Number of Orders"
FROM BB_BASKET
GROUP BY DAY_ORD_SF(DTCREATED), TO_CHAR(DTCREATED,'DAY')
ORDER BY TO_CHAR(DTCREATED,'DAY') DESC;
       
SELECT TO_CHAR(TRUNC(dtcreated),'DAY'), count(*) as "Number of Orders"
FROM BB_BASKET
GROUP BY TRUNC(dtcreated)
ORDER BY TRUNC(dtcreated) DESC;