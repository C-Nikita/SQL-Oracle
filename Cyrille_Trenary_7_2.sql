create or replace procedure MOVIE_RETURN_SP
(
memberID in number,
movieID in number
)
IS
quantity number;
begin
select count(*) into quantity from MM_MOVIE where movie_ID = movieID;
quantity := quantity+1;
update MM_MOVIE set MM_RENTAL.CHECKIN_DATE = sysdate, MOVIE_QTY=quantity where movie_ID = movieID;
commit;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);

end;
/


create or replace procedure MOVIE_RENT_SP
(
memberID in number,
movieID in number,
paymentmethod in number
)
IS
quantity number;
begin
insert into MM_RENTAL (MEMBER_ID, MOVIE_ID, PAYMENT_METHOD )values(memberID,movieID,paymentmethod);
select count(*) into quantity from MM_MOVIE where movie_ID = movieID;
quantity := quantity-1;
update MM_MOVIE set MOVIE_QTY =quantity where movie_ID = movieID;
commit;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);

end;