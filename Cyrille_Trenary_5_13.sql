--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5-12 Assignment
--======================================================

CREATE OR REPLACE PROCEDURE DDCKPAY_SP
(pledgor_id Number,
payment_amount Number) 

is

BEGIN
v_pledgor_id number;
v_payment_amount number;

select Payamt into v_payment_amount from DD_Payment where idPledge =pledgor_id;
if(payment_amount!=v_payment_amount) then
RAISE_APPLICATION_ERROR(20050,'Incorrect payment amount - planned payment = ',v_payment_amount, 'should be raised');
else
dbms_output.put_line('This is a valid payment amount');

end if;
exception
when NO_DATA_FOUND then
dbms_output.put_line('No payment information.');
end;

