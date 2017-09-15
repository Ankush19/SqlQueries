/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [EmpId]
      ,[EmpName]
      ,[Salary]
      ,[Exp]
      ,[Grade]
  FROM [EmployeeAssgn].[dbo].[EmpTable]
  Use EmployeeAssgn 

SELECT        dbo.EmpTable.EmpId, dbo.EmpTable.EmpName, dbo.AreaTable.SalesId , dbo.AreaTable.Area, dbo.EmpTable.Grade
FROM            dbo.AreaTable CROSS JOIN
                         dbo.EmpTable
WHERE        (dbo.EmpTable.Grade = 'A')

SELECT EmpId, EmpName, Grade
FROM EmpTable
WHERE (Grade = 'A')