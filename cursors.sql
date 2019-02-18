declare 
cursor localCursor is select employee_id from Employees where EMPLOYEE_ID=213; -- only for one arguments will run only once
l_depatment_id number;
begin
open localCursor;
fetch localCursor into l_depatment_id;
dbms_output.put_line(l_depatment_id);
end;
