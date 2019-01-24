--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 3, CHAPTER 3-9 Assignment
--======================================================

--set serveroutput on
DECLARE

lv_proj       		dd_project.projname%type;
lv_proj_id         		dd_project.idproj%type:= 500;
lv_pledge_amt    		dd_pledge.pledgeamt%type;
lv_pledge_avg  	dd_pledge.pledgeamt%type;
lv_pledge_total      		dd_pledge.pledgeamt%type;


BEGIN

SELECT dd_project.idproj, projname, count(pledgeamt), sum(pledgeamt), avg(pledgeamt)
into lv_proj_id, lv_proj, lv_pledge_amt, lv_pledge_total, lv_pledge_avg
from dd_pledge, dd_project
where dd_pledge.idproj = dd_project.idproj
and dd_project.idproj=lv_proj_id  --&proj_id
group by dd_project.idproj, projname;

DBMS_OUTPUT.PUT_LINE(
'Project ID: ' || lv_proj_id 
||' Project Name: ' || lv_proj 
||' Total Pledges: ' || lv_pledge_amt
||' Total Pledged: ' || lv_pledge_total
||' Average Pledged: ' ||  lv_pledge_avg
);

end;
/
--Select * FROM DD_Project;