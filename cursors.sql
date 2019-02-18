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
--cursor for loop
==============================================
declare 
cursor localCursor(numofRows number default 5) is (
select employee_id , department_name , ROW_NUMBER() OVER (PARTITION BY emp.department_id order by salary) rown from Employees emp join departments d on emp.department_id = d.department_id
where rownum < numofRows
);
--cursoronlocalCursor localCursor%rowtype;
l_depatment_id number;
begin
  for curs in localCursor(100) loop
  dbms_output.put_line(curs.employee_id ||'  '||curs.department_name  ||'  '|| curs.rown);
  end loop;
end;
==================================================
--Nested Cursor
=================================================
declare 
cursor localCursor(numofRows number default 5) is (
select employee_id , department_name,emp.department_id , ROW_NUMBER() OVER (PARTITION BY emp.department_id order by salary) rown from Employees emp join departments d on emp.department_id = d.department_id
where rownum < numofRows
);

cursor departmentNo (departmentid number) is(
  select department_name from departments where department_id = departmentid
);
--cursoronlocalCursor localCursor%rowtype;
l_depatment_id number;
begin
  for curs in localCursor(100) loop
     dbms_output.put_line(curs.employee_id ||'  '||'  '|| curs.rown);
     for cur in departmentNo(curs.department_id) loop
        dbms_output.put_line('  '||cur.department_name  );
     end loop;
  end loop;
end;
============================================================================
--ref cursors
============================================================================
declare 
Type refcursor is ref cursor return departments%rowtype; 
rc_dept_cur refcursor;
rowType_l_department_id  departments%rowtype;
begin

open rc_dept_cur for select * from departments;
loop
  fetch rc_dept_cur into rowType_l_department_id;
  exit when rc_dept_cur%notfound;
  dbms_output.put_line(rowType_l_department_id.department_name);
end loop;  
end;
=============================================================
-- user defined function
==============================================================
declare 
Type refcursor is ref cursor return departments%rowtype; 
rc_dept_cur refcursor;
rowType_l_department_id  departments%rowtype;
randomcursor sys_refcursor;
CUSTOM_EXCEPTION EXCEPTION;
pragma exception_init(CUSTOM_EXCEPTION , -1456);  
begin
open rc_dept_cur for select * from departments;
open randomcursor for select * from employees;
loop
  fetch rc_dept_cur into rowType_l_department_id;
  exit when rc_dept_cur%notfound;
  dbms_output.put_line(rowType_l_department_id.department_name);
end loop;  
exception
    when CUSTOM_EXCEPTION then
    null;
end;
=============================================================
--functions
==============================================================
create or replace procedure function_parameters(departmentid in number , p_status in out number , departmentname out varchar2)
as
cursor deparment_Iterator(department_ID number) is 
(
  select department_name from departments where department_id = department_ID
);
dept_itr deparment_Iterator%rowtype;
begin
open deparment_Iterator(departmentid);
fetch deparment_Iterator into dept_itr;
departmentname := dept_itr.department_name;
p_status := 0;
close deparment_Iterator;
end;
=============================================================
--<Next>
==============================================================
