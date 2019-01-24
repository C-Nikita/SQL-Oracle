--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 7, CHAPTER 7 C2 Assignment
--======================================================



CREATE OR REPLACE PACKAGE mm_rentals_pkg
   IS
    PROCEDURE movie_rent_sp
    (p_movie_id IN mm_movie.movie_id%TYPE,
    p_member_id IN mm_rental.member_id%TYPE,
    p_payment_id IN mm_pay_type.payment_methods_id%TYPE);
    
    PROCEDURE movie_return_sp
    (p_rental_id mm_rental.rental_id%TYPE);
   
   FUNCTION movie_stock_sf
   (p_movie_id IN mm_movie.movie_id%TYPE)
   RETURN VARCHAR2;
   END;
   /


CREATE OR REPLACE PACKAGE BODY MM_RENTALS_PKG
    IS
    PROCEDURE movie_rent_sp
    (p_movie_id IN mm_movie.movie_id%TYPE,
    p_member_id IN mm_rental.member_id%TYPE,
    p_payment_id IN mm_pay_type.payment_methods_id%TYPE)
         IS
    v_count NUMBER;
    v_movie NUMBER;
   v_member NUMBER;
   v_payment NUMBER;
        BEGIN
   SELECT MAX(rental_id) INTO v_count
   FROM mm_rental;
   
   SELECT COUNT(movie_id) INTO v_movie
   FROM mm_movie
   WHERE movie_id = p_movie_id;
   
   SELECT COUNT(member_id) INTO v_member
   FROM mm_member
   WHERE member_id = p_member_id;
   
   SELECT COUNT(payment_methods_id) INTO v_payment
   FROM mm_pay_type
   WHERE payment_methods_id = p_payment_id;
   If v_movie = 0 THEN
   DBMS_OUTPUT.PUT_LINE('Movie ID is invalid');
   ELSE
   IF v_member = 0 THEN
   DBMS_OUTPUT.PUT_LINE('Member ID is invalid');
   ELSE
   IF v_payment = 0 THEN
   DBMS_OUTPUT.PUT_LINE('Payment ID is invalid');
   ELSE
   INSERT INTO mm_rental
   VALUES(v_count + 1, p_member_id,    p_movie_id, SYSDATE, NULL, p_payment_id);
   
   UPDATE mm_movie
                          SET movie_qty = movie_qty - 1
                          WHERE movie_id = p_movie_id;
   END IF;
   END IF;
   END IF;
   END movie_rent_sp;
   
   PROCEDURE MOVIE_RETURN_SP
   (p_rental_id mm_rental.rental_id%TYPE)
   IS
   v_movie_id mm_movie.movie_id%TYPE;
        v_rental_id mm_rental.rental_id%TYPE;
   BEGIN
        SELECT rental_id INTO v_rental_id
        FROM mm_rental
        WHERE rental_id = p_rental_id;
   
        UPDATE mm_rental
        SET checkin_date = SYSDATE
        WHERE rental_id = p_rental_id;
   
       UPDATE mm_movie
        SET movie_qty = movie_qty + 1
        WHERE movie_id=v_movie_id;
   EXCEPTION
   WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('Rental ID is invalid');
   WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('Unexpected Error');
   DBMS_OUTPUT.PUT_LINE('Error Code = ' || SQLCODE);
   DBMS_OUTPUT.PUT_LINE('Error Message = ' || SQLERRM);
   
   END MOVIE_RETURN_SP;
   
   
   FUNCTION movie_stock_sf
   (p_movie_id IN mm_movie.movie_id%TYPE)
   RETURN VARCHAR2
   IS
   v_title mm_movie.movie_title%TYPE;
   v_qty mm_movie.movie_qty%TYPE;
   lv_stock_info VARCHAR2 (50);
   BEGIN
   SELECT movie_title, movie_qty INTO v_title, v_qty
   FROM mm_movie
   WHERE p_movie_id = movie_id;
   IF v_qty = 0 THEN
   lv_stock_info := v_title || ' is currently not available';
   ELSE
   lv_stock_info := v_title || ' is available: ' || v_qty || ' on the shelf';
   END IF;
   RETURN lv_stock_info;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Invalid Rental ID');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Unexpected Error');
      DBMS_OUTPUT.PUT_LINE('Error Code = ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('Error Message = ' || SQLERRM);
  END movie_stock_sf;
  END MM_RENTALS_PKG;
  /


--BEGIN
--DBMS_OUTPUT.PUT_LINE (MM_RENTALS_PKG.MOVIE_STOCK_SF(12));
--END;
--/

--BEGIN
--MM_RENTALS_PKG.MOVIE_RENT_SP(1,10,4);
--END;
--/
