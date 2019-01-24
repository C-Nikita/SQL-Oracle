
--====================================================== 
--Cyrille Trenary
--CIS338: SQL / Oracle
--UNIT 3, CHAPTER 3-10 Assignment
--======================================================

CREATE SEQUENCE dd_project_seq
  MINVALUE 1
  START WITH 530
  INCREMENT BY 1
  NOCACHE;
  
Declare
TYPE type_project IS RECORD(
project_name      	dd_project.projname%type := 'HK Animal Shelter Extension',
project_start     		dd_project.projstartdate%type := '01-JAN-13',
project_end       		dd_project.projenddate%type := '31-MAY-13',
project_funding   	dd_project.projfundgoal%type := '65000');

new_project     type_project;

Begin

INSERT INTO 	dd_project (idproj, projname, projstartdate, projenddate, projfundgoal)
VALUES 	(dd_project_seq.NEXTVAL, new_project.project_name, new_project.project_start, new_project.project_end, new_project.project_funding);
commit; 
end;
/

SELECT * FROM DD_PROJECT;
    