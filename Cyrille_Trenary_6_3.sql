--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 6, CHAPTER 6-3 Assignment
--======================================================

CREATE OR REPLACE FUNCTION NUM_PURCH_SF(
        i_shopper IN NUMBER)
RETURN NUMBER
AS
lv_total_orders NUMBER(3);
BEGIN
   SELECT SUM(ORDERPLACED)
     INTO lv_total_orders
     FROM BB_BASKET
     WHERE IDSHOPPER = i_shopper
     AND ORDERPLACED = 1;
     
if lv_total_orders is null then 
     raise_application_error(-20200, 'No data found for given ShopperID, ShopperID: ' || i_shopper);
    end if;  
RETURN lv_total_orders;
END;
/


SELECT NUM_PURCH_SF(IDSHOPPER) AS "Number of Orders"
  FROM BB_SHOPPER
  WHERE IDSHOPPER = 23;

