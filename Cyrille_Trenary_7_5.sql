--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 7, CHAPTER 7 7-5 Assignment
--======================================================

--Shop Query package
create or replace package shop_query_pkg is
  
 
  procedure retrieve_shopper
    (lv_id in bb_shopper.idshopper%type,
     lv_name out varchar,
     lv_city out bb_shopper.city%type,
     lv_state out bb_shopper.state%type,
     lv_phone out bb_shopper.phone%type);
  
   
  procedure retrieve_shopper
    (lv_last in bb_shopper.lastname%type,
     lv_name out varchar,
     lv_city out bb_shopper.city%type,
     lv_state out bb_shopper.state%type,
     lv_phone out bb_shopper.phone%type);

end;
/


create or replace package body shop_query_pkg is
  
 
  procedure retrieve_shopper
    (lv_id in bb_shopper.idshopper%type,
     lv_name out varchar,
     lv_city out bb_shopper.city%type,
     lv_state out bb_shopper.state%type,
     lv_phone out bb_shopper.phone%type)
    is
    
  begin 
    select firstname||' '||lastname, city,
           state, phone
      into lv_name, lv_city, lv_state, lv_phone
    from bb_shopper
    where idshopper = lv_id;
  
  end retrieve_shopper;
  
  
  procedure retrieve_shopper
    (lv_last in bb_shopper.lastname%type,
     lv_name out varchar,
     lv_city out bb_shopper.city%type,
     lv_state out bb_shopper.state%type,
     lv_phone out bb_shopper.phone%type)
    is

  begin 
    select firstname||' '||lastname, city,
           state, phone
      into lv_name, lv_city, lv_state, lv_phone
    from bb_shopper
    where lastname = lv_last;
  
  end retrieve_shopper;
  
end;
/

--Anon Block
declare
  lv_id number := 23;
  lv_last bb_shopper.lastname%type := 'Ratman';
  lv_name varchar2(25);
  lv_city  bb_shopper.city%type;
  lv_state bb_shopper.state%type;
  lv_phone bb_shopper.phone%type;
  
begin
--Initial test with ID
  shop_query_pkg.retrieve_shopper(
    lv_id, lv_name,
    lv_city,
    lv_state,
    lv_phone);
  
  dbms_output.put_line(
    lv_name
    ||' '
    ||lv_city
    ||' '
    ||lv_state
    ||' '
    ||lv_phone);

--Second test
  shop_query_pkg.retrieve_shopper(
    lv_last, 
    lv_name,
    lv_city, 
    lv_state, 
    lv_phone);
 
  dbms_output.put_line(
  lv_name
  ||' '
  ||lv_city
  ||' '
  ||lv_state
  ||' '
  ||lv_phone);

end;
/