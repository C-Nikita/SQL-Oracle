--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 4, CHAPTER 4-8 Assignment
--======================================================
declare cursor cur_emp is
select * from employee;
inc_salary number(7,2);
total_cost_inc_ number(13,2):=0;
begin
for emp in cur_emp loop
inc_salary:=0;
if(emp.mgr is null) then
inc_salary:=0;
else
inc_salary:=least(2000,round(emp.sal*6/100,2));
end if;
total_cost_inc_:=total_cost_inc_+inc_salary;
dbms_output.put_line('Proposed new annual salary for:'||emp.empno||':'||emp.ename);
dbms_output.put_line(nvl(emp.sal,0)+nvl(inc_salary,0));
update employee set sal=nvl(sal,0)+nvl(inc_salary,0)
where empno=emp.empno;
dbms_output.put_line('Employee:'||emp.empno);
dbms_output.put_line('Name:'||emp.ename);
dbms_output.put_line('Current annual Salary:'||emp.sal*12);
dbms_output.put_line('Proposed Raise:'||inc_salary);
dbms_output.put_line('Proposed Annual raise:'||inc_salary*12);
dbms_output.put_line('Proposed New Annual Salary:'||(nvl(emp.sal,0)+nvl(inc_salary,0))*12);
end loop;
dbms_output.put_line('New Annual Expense for Proposed Raises:'||total_cost_inc_*12);
commit;
end;