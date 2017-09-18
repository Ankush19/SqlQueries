sp_configure 'clr enabled',1;
Go
reconfigure
Go 

sp_dbcmptlevel

sp_dbcmptlevel 'Emp1',100

Alter Database Emp1  set trustworthy on  

create function [dbo].AppendHello(@Input nvarchar(max)) 
returns nvarchar(max)
External NAME SqlCompilationDemo.[SqlCompilationDemo.HelloUtil].AppendHello;

select [dbo].AppendHello('Ankush')