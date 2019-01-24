--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 9, CHAPTER 9 9-2 Assignment
--======================================================



CREATE OR REPLACE TRIGGER BB_REQFILL_TRG 
   AFTER UPDATE OF DTRECD ON bb_product_request
   FOR EACH ROW
DECLARE
  v_stock bb_product_request.qty%TYPE;--Set stock to type of quantity
  v_id bb_product_request.idproduct%TYPE;--Set ID to type of Product ID
 BEGIN
   IF :OLD.DTRECD IS NOT NULL AND :NEW.DTRECD IS NULL THEN
    UPDATE BB_PRODUCT
    SET stock = stock - reorder
     WHERE idProduct = :NEW.idProduct;
        ELSIF :NEW.DTRECD IS NOT NULL THEN
        UPDATE BB_PRODUCT
        SET stock = reorder + stock
        WHERE idProduct = :NEW.idProduct;
        END IF;
    END;