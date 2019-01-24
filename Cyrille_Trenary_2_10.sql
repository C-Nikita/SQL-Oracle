--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 2, CHAPTER 2-10 Assignment
--======================================================

SET SERVEROUTPUT ON
DECLARE
  lv_num_of_payments_num NUMBER(2);        
  lv_payment_num NUMBER(2);           
  lv_init_date DATE;                 
  lv_date_due DATE;                    
  lv_monthly_payment_amt_num NUMBER(8,2);  
  lv_donation_balance_num NUMBER(8,2);     
  lv_pledge_num NUMBER(8,2);            
  
BEGIN 
  SELECT PLEDGEAMT, PLEDGEDATE, PAYMONTHS INTO lv_pledge_num, lv_init_date, lv_num_of_payments_num
  FROM DD_PLEDGE
    WHERE IDPLEDGE = 104;
  
  lv_monthly_payment_amt_num := lv_pledge_num / lv_num_of_payments_num;  
  lv_date_due :=lv_init_date;
  lv_donation_balance_num := (lv_pledge_num -lv_monthly_payment_amt_num);
  lv_payment_num := 0;  
  
Loop
  lv_payment_num := lv_payment_num +1;  
  lv_date_due := add_months(lv_date_due,1);    
  
DBMS_OUTPUT.PUT_LINE('Payment number: ' || lv_payment_num || ' Due Date: '
|| lv_date_due || ' Payment Amount: ' || lv_monthly_payment_amt_num || ' Balance: ' 
|| to_char(lv_donation_balance_num,'$9999.99'));
lv_donation_balance_num := lv_donation_balance_num - lv_monthly_payment_amt_num;
  
  EXIT WHEN lv_donation_balance_num < 0;
END LOOP;
END;
