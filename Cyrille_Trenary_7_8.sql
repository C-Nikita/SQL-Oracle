--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 7, CHAPTER 7 7-8 Assignment
--======================================================

--Login Package
CREATE OR REPLACE PACKAGE login_pkg IS
 
 pv_login_time timestamp; 
 
 pv_id_num NUMBER(3);
 FUNCTION login_ck_pf 
  (p_user IN VARCHAR2,
   p_pass IN VARCHAR2)
   RETURN CHAR;
   
END;
/  

CREATE OR REPLACE PACKAGE BODY login_pkg IS

  FUNCTION login_ck_pf 
  (p_user IN VARCHAR2,
   p_pass IN VARCHAR2)
   RETURN CHAR
  IS
   lv_ck_txt CHAR(1) := 'N';
   lv_id_num NUMBER(5);
   
  BEGIN
   SELECT idShopper
    INTO lv_id_num
    FROM bb_shopper
    WHERE username = p_user
     AND password = p_pass;
     
      lv_ck_txt := 'Y';
      pv_id_num := lv_id_num;
   RETURN lv_ck_txt;
   
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
   RETURN lv_ck_txt;
   
  END login_ck_pf;
  
 
  begin
    select systimestamp
      into pv_login_time
    from dual;
   
END;
/


declare
  
  lv_user bb_shopper.username%type := 'Crackj';
  lv_passwd bb_shopper.password%type := 'flyby';
  lv_login char := 'N';
  
begin

  lv_login := login_pkg.login_ck_pf(lv_user, lv_passwd);
  

  dbms_output.put_line(lv_login||'   '||login_pkg.pv_login_time);

end;
/