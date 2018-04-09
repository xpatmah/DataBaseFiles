select * from employees where employees.employeeNumber IN (select distinct employees.reportsTo from employees);
