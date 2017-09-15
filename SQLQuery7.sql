USE [EmployeeAssgn]
GO

UPDATE [dbo].[EmpTable]
   SET [Salary] = Salary+Salary*0.12
 WHERE  Grade='A' 
GO


