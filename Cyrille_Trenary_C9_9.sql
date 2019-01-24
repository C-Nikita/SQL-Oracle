--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 9, CHAPTER 9 9-9 Assignment
--======================================================


 CREATE TABLE dd_paytrack(
    idtrack         NUMBER,
    pt_user         VARCHAR2(30),
    pt_date         DATE,
    pt_action       VARCHAR2(30),
    pt_payid        NUMBER(6,0),
    CONSTRAINT pk_dd_paytrack PRIMARY KEY (idtrack)
    );

    CREATE SEQUENCE dd_ptrack_seq;

    CREATE OR REPLACE TRIGGER pledge_pay_trigger
      AFTER 
        INSERT OR 
        UPDATE OR 
        DELETE 
      ON dd_payment
      FOR EACH ROW  
    DECLARE
      log_action  dd_paytrack.pt_action%TYPE; 
      id_pay      dd_paytrack.pt_payid%TYPE;    
    BEGIN
    id_pay := :NEW.idpay;
    IF INSERTING THEN
    log_action := 'Insert';
    ELSIF UPDATING THEN
    log_action := 'Update';
    ELSIF DELETING THEN
    id_pay := :OLD.idpay;
    log_action := 'Delete';
    --ELSE
    --DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
    END IF;

    INSERT INTO dd_paytrack (idtrack, pt_user, pt_date, pt_action, pt_payid)
      VALUES(dd_ptrack_seq.NEXTVAL, USER, TO_CHAR(SYSDATE, 'DD-MON-YY'), log_action,      
    id_pay);

    END pledge_pay_trigger;
    /

--   INSERT INTO dd_payment(idpay, idpledge, payamt, paydate, paymethod)
  --  VALUES (1470, 105, 250, SYSDATE, 'CC');
--    commit;  

--    UPDATE dd_payment
--    SET payamt = 25
--    WHERE idpay = 1470;
--    commit;

--    UPDATE dd_payment 
--    SET payamt = 2000
--    WHERE idpay = 1470;
--    COMMIT;

--    DELETE 
--    FROM dd_payment
--    WHERE idpay = 1470;
--    COMMIT;



--    select * from dd_paytrack; 