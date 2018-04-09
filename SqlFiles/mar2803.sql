select * from Employee where First_name like 'J%';
select * from Employee where First_name like '%o%';
select * from Employee where First_name like '%n';
select * from Employee where Employee.Salary between 500000 and 800000;
select year(Joining_date) from Employee;
select * from Employee where year(Joining_date) = '2013';