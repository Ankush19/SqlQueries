USE [EmployeeAssgn]
GO

SELECT top 1 [Area],SUM(OrderQty*UnitPrice) As TotalSales   
  FROM [dbo].[AreaTable]
  group by [Area]
  order by TotalSales Desc
   
   
GO


