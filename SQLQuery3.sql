USE [EmployeeAssgn]
GO

INSERT INTO [dbo].[EmpTable]
           ([EmpId]
           ,[EmpName]
           ,[Salary]
           ,[Exp],[Grade])
     VALUES
           (3,'anky',20328,7,'A')
GO


ALTER Table [EmpTable] add [Grade] varchar(50);