select * from Employee;
select upper(First_name) Employee_Name, lower(Last_name) from Employee;
select distinct Employee.Department from Employee;
select substr(Employee.First_name , 1 , 3) from Employee;  
select locate('o' , Employee.First_name) from Employee;
select * from Employee order by First_name asc;