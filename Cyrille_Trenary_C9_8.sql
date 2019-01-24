--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 9, CHAPTER 9 9-8 Assignment
--======================================================

CREATE OR REPLACE TRIGGER  BB_AUDIT_TRG
BEFORE
UPDATE ON BB_PRODUCT
FOR EACH ROW
BEGIN
INSERT INTO BB_PRODCHG_AUDIT(USER_ID, START_NEW,END_NEW, SALE_NEW)
--SET
VALUES(
    :NEW.IDPRODUCT,
   :NEW.SALESTART,
    :NEW.SALEEND,
    :NEW.SALEPRICE
   ) ;
END;
/
--SELECT *
--FROM  BB_PRODCHG_AUDIT;


--
--UPDATE bb_product
--SET salestart = '05-MAY-2012',
--saleend = '12-MAY-2012',
--saleprice = 9
--WHERE idProduct = 10;

