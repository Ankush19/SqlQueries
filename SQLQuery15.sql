SELECT EmpName,Salary FROM EmpTable WHERE Salary = (Select MAX(Salary)
from EmpTable 
where Salary < (Select MAX(Salary)
from EmpTable))