--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6-2 Assignment
--======================================================

CREATE OR REPLACE FUNCTION TOT_PURCH_SF(
   id IN NUMBER
)
RETURN NUMBER IS
        totalpurch NUMBER;
BEGIN
        SELECT SUM(total) INTO totalpurch
        FROM BB_BASKET WHERE idshopper=id;
        RETURN totalpurch;
END;
/
 
 
VARIABLE TotalSpending NUMBER
SELECT UNIQUE IDSHOPPER AS "Shopper ID", TOT_PURCH_SF(IDSHOPPER)AS "Total Purchases"
FROM BB_BASKET;
--EXECUTE :TotalSpending := TOT_PURCH_SF (IDSHOPPER);
--PRINT IDSHOPPER TotalSpending;
--SELECT *
--FROM BB_BASKET;
