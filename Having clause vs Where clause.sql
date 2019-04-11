----------------------------------------------------------
-- having clause
----------------------------------------------------------

Select * from tblemployee
-- ID	Name	Gender	Salary	City		EmailID
-- 1	Jenny	Female	2000	NewYork		jen@gmail.com
-- 2	Todd	Male	4000	London		todd@yahoo.com
-- 3	Ben		Male	3400	NewYork		Ben@rediffmail.com
-- 4	Sara	Female	9600	Qatar		Sara@gmail.com
-- 5	Pam		Female	2800	London		Pam@gmail.com
-- 6	Sam		Male	5400	NewYork		Sam@yahoo.com
-- 7	Tom		Male	8300	London		Tom.com
-- 8	Harry	Male	3200	Qatar		Harry@yahoo.com
-- 9	Sweety	Female	8000	London		Sweety@gmail.com

-- where clause is used to filter rows before aggregation function, where as having clause is used to filter groups after aggregation
-- The following 2 queries produce same result

Select City,Sum(Salary) as TotalSalary
from tblemployee
where City = 'London'
group by City
-- City	TotalSalary
-- London	23100

Select City,Sum(Salary) as TotalSalary
from tblemployee
group by City
Having City = 'London'
-- City	TotalSalary
-- London	23100


Select Gender,City,sum(salary) as TotalSalary,count(Id) as TotalEmployees
from tblemployee
where Gender = 'Male'
group by Gender,city
-- Gender	City		TotalSalary	TotalEmployees
-- Male		London		12300		2
-- Male		NewYork		8800		2
-- Male		Qatar		3200		1

Select Gender,City,sum(salary) as TotalSalary,count(Id) as TotalEmployees
from tblemployee
group by Gender,city
having Gender = 'Male'
-- Gender	City		TotalSalary	TotalEmployees
-- Male		London		12300		2
-- Male		NewYork		8800		2
-- Male		Qatar		3200		1

-------------------------------------------------------
-- Difference between where and having clause
--------------------------------------------------------

-- 1. 'where' filters rows before aggregation, where as having clause filters groups after aggregation
-- 2. 'Where' clause can be used with Select,Insert and update statement, where as having clause can only be used with select statement
-- 3. Aggregate functions can be used in having clause but cannot be used in where clause unless there is subquery contained in having clause

Select Gender,City,sum(salary) as TotalSalary,count(Id) as TotalEmployees
from tblemployee
group by Gender,city
having sum(salary) >5000
-- Gender	City	TotalSalary	TotalEmployees
-- Female	London	10800	2
-- Male		London	12300	2
-- Male		NewYork	8800	2
-- Female	Qatar	9600	1

Select Gender,City,sum(salary) as TotalSalary,count(Id) as TotalEmployees
from tblemployee
where sum(salary)>5000
group by Gender,city
--Error:-An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the 
--column being aggregated is an outer reference.
