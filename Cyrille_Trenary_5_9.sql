--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 5, CHAPTER 5-9 Assignment
--======================================================

CREATE OR REPLACE PROCEDURE member_ck_sp(p_user IN VARCHAR2,
                                             p_pass IN VARCHAR2) IS
       lv_check_txt    VARCHAR2(10) := 'INVALID';
       lv_fullname_txt VARCHAR2(25);
       CURSOR MEMBER_CUR IS
          SELECT firstname, lastname, cookie, username, password
            FROM bb_shopper
           WHERE username = p_user
             AND password = p_pass;
   BEGIN
      FOR REC_CUR IN MEMBER_CUR LOOP
         IF p_user = rec_cur.username AND p_pass = rec_cur.password THEN
            lv_fullname_txt := rec_cur.firstname || ' ' || rec_cur.lastname;
            dbms_output.put_line('Welcome: ' || lv_fullname_txt
                                 || ' Cookie: ' || rec_cur.cookie);
                                 EXIT;
         ELSE dbms_output.put_line(lv_check_txt);
         END IF;
      END LOOP;
   END member_ck_sp;
   /
begin 
member_ck_sp('rat55', 'kile'); 
end;
   
   --EXECUTE member_ck_sp('rat55','kile');