CREATE OR REPLACE PROCEDURE movie_rent_sp
(p_rental_id mm_rental.rental_id%TYPE)
IS
v_count INTEGER;
v_checkin_date mm_rental.checkin_date%TYPE;
v_qty_available mm_movie.movie_qty%TYPE;
ex_unknown_rental_id EXCEPTION;
ex_no_movie_id EXCEPTION;

v_movie_id mm_movie.movie_id%TYPE;

BEGIN
  UPDATE mm_rental
  SET    checkin_date = sysdate
  WHERE  rental_id = p_rental_id
  RETURNING movie_id INTO v_movie_id;

  IF SQL%ROWCOUNT = 0 THEN
    RAISE ex_unknown_rental_id;
  END IF;
  IF v_movie_id = 0 THEN
    RAISE ex_no_movie_id;
  END IF;

END;