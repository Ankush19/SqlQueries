/****** Script for SelectTopNRows command from SSMS  **/

Select EmpName,MAX(Salary)
from [EmployeeAssgn].[dbo].[EmpTable]
where Salary < (Select MAX(Salary)
from [EmployeeAssgn].[dbo].[EmpTable]);