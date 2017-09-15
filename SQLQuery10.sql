create index myindex1 on EmpTable(Salary asc)

select EmpTable.name, si.* from sys.indexes si
inner join sys.tables EmpTable on si.object_id=EmpTable.object_id