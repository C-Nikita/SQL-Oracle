--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5-5 Assignment
--======================================================

CREATE OR REPLACE PROCEDURE status_ship_sp
  (i_id      in bb_basketstatus.idbasket%type,
   i_date    in bb_basketstatus.dtstage%type,
   i_shipper in bb_basketstatus.shipper%type,
   i_track   in bb_basketstatus.shippingnum%type)
  is

-- creating a new row with our old friend nextval
BEGIN
  INSERT INTO bb_basketstatus
    (idstatus, idbasket, idstage, dtstage, shipper, shippingnum)
    VALUES (bb_status_seq.nextval, i_id, 3, i_date, i_shipper, i_track);
  COMMIT;
END;
/



-- execution
EXECUTE status_ship_sp(3, '20-FEB-07', 'UPS', 'zw2384yxk4957');


--testing
SELECT idstatus, idbasket,idstage,
  dtstage, shipper, shippingnum
FROM bb_basketstatus;
