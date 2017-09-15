
Create trigger trgAfterInsert on [dbo].Employee_test
For Insert
As
	declare @Emp_id int;
	declare @Emp_name varchar(50);
	declare @Emp_sal decimal(18,0);
	declare @audit_action varchar(50);

	select @Emp_id=i.Emp_id from inserted i;
	select @Emp_name=i.Emp_name from inserted i;
	select @Emp_sal=i.Emp_sal from inserted i;
	set @audit_action ='Inserted Record-- After Insert trigger';

	insert into Employee_test_audit
				(Emp_id,Emp_name,Emp_sal,Audit_action,Audit_timestamp)
	values(@Emp_id,@Emp_name,@Emp_sal,@audit_action,getdate());

	print 'After insert trigger fired'

Go

insert into Employee_test values(3,'Ankush',45500);

alter trigger trgInsteadOfDelete on [dbo].Employee_test
For Delete
As
	declare @Emp_id int;
	declare @Emp_name varchar(50);
	declare @Emp_sal decimal(18,0);
	
	select @Emp_id=i.Emp_id from deleted i;
	select @Emp_name=i.Emp_name from deleted i;
	select @Emp_sal=i.Emp_sal from deleted i;

	Begin
		if(@Emp_sal>2000)
		begin
			RAISERROR('CANNOT delete where salary>2000',16,1);
			Rollback;
		end
		else
		begin
			delete from Employee_test where Emp_id=@Emp_id;
			commit;
			insert into Employee_test_audit
				(Emp_id,Emp_name,Emp_sal,Audit_action,Audit_timestamp)
			values(@Emp_id,@Emp_name,@Emp_sal,'Deleted -- Instead of delete trigger',getdate());

			print 'Record deleted -- Instead of delete trigger'
		end
	end
Go

delete from Employee_test where Emp_sal>2000;

alter table Employee_test disable trigger trgInsteadOfDelete

create trigger trgAfterUpdate on [dbo].Employee_test
for update
as
	declare @Emp_id int
	declare @Emp_name varchar(50)
	declare @Emp_sal decimal(18,0)
	declare @audit_action varchar(100);

	select @Emp_id=i.Emp_ID from inserted i;	
	select @Emp_name=i.Emp_Name from inserted i;	
	select @Emp_sal=i.Emp_Sal from inserted i;	

	if UPDATE(Emp_name)
		set @audit_action ='Updated record-- After Upadet trigger'
	if update(Emp_sal)
		set @audit_action ='Updated record-- After Upadet trigger'
	
	insert into Employee_Test_Audit(Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp) 
	values(@Emp_id,@Emp_name,@Emp_sal,@audit_action,getdate());

	PRINT 'AFTER UPDATE Trigger fired.'
GO
		
	UPDATE [dbo].[Employee_test]
   SET [Emp_name] = 'ankiy'
      
 WHERE Emp_id=2
GO





create procedure EmployeeCountSalary1 
@salary decimal(18,0)
as
begin
declare @totalemployees int
select @totalemployees=COUNT(Emp_id) from Employee_test_audit where Emp_sal=@salary
print @totalemployees
end
go

exec EmployeeCountSalary1 500

create function getcount(@salary decimal(18,0))
returns int
begin
declare @employees int
select @employees = COUNT(emp_id) from Employee_test where Emp_sal=@salary
return @employees
end

select total=dbo.getcount(500)

create function getmodifiednames1(@id int)
returns @Employee_test1 table(
		Emp_id int,
		Emp_name varchar(50),
		Emp_sal decimal(18,0),
		Emp_exp int
)
as 
Begin
	insert into @Employee_test1(Emp_id,Emp_name,Emp_sal)
	select g.Emp_id,g.Emp_name,g.Emp_sal
	From Employee_test g
	where g.Emp_id> @id;

	update @Employee_test1
	set Emp_exp=5
	where Emp_name='ankiy'

	return;
end;

select * from getmodifiednames1(1)
	 