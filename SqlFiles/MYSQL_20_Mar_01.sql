select EmployeeDetails.FullName from EmployeeDetails JOIN EmployeeSalary on EmployeeDetails.EmpId=EmployeeSalary.EmpId where EmployeeSalary.Salary >=5000 AND EmployeeSalary.Salary <=10000;