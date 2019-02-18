==================
declare 
cursor localCursor is select employee_id from Employees where EMPLOYEE_ID=213; -- only for one arguments will run only once
l_depatment_id number;
begin
open localCursor;
fetch localCursor into l_depatment_id;
dbms_output.put_line(l_depatment_id);
end;
=========================

declare 
cursor localCursor is select employee_id from Employees where EMPLOYEE_ID=213; -- only for one arguments
cursoronlocalCursor localCursor%rowtype;
l_depatment_id number;
begin
open localCursor;
fetch localCursor into cursoronlocalCursor;
dbms_output.put_line(cursoronlocalCursor.employee_id);
end;
=============================
--MULTI TWO SELECT
=========================
declare 
cursor localCursor is select employee_id from Employees;
cursoronlocalCursor localCursor%rowtype;
l_depatment_id number;
begin
open localCursor;
loop
  fetch localCursor into cursoronlocalCursor;
  Exit WHEN localCursor%NOTFOUND;
  dbms_output.put_line(cursoronlocalCursor.employee_id);
end loop;
close localCursor;
end;
=================================
--Cursor Simplified form
=================================
declare 
cursor localCursor is (
select employee_id , department_name , ROW_NUMBER() OVER (PARTITION BY emp.department_id order by salary) rown from Employees emp join departments d on emp.department_id = d.department_id
);
cursoronlocalCursor localCursor%rowtype;
l_depatment_id number;
begin
open localCursor;
loop
  fetch localCursor into cursoronlocalCursor;
  Exit WHEN localCursor%NOTFOUND;
  dbms_output.put_line(cursoronlocalCursor.employee_id ||'  '||cursoronlocalCursor.department_name  ||'  '|| cursoronlocalCursor.rown);
end loop;
close localCursor;
end;
======================================================
