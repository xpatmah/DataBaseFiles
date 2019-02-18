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
