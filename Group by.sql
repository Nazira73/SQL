---------------------------------------------------------------
-- Group By
---------------------------------------------------------------

-- It should be used with numerical categorical col context
-- It is used to group a selected set of rows into a set of summary rows by the values of one or more columns or expressions
-- It is always used in conjunction with one or more aggregate functions

-- Aggregate functions:- Sum(), min(), max(), avg(), count() etc

Select sum(salary) from tblemployee ---------- 46700
Select min(salary) from tblemployee ---------- 2000
Select max(salary) from tblemployee ---------- 9600
Select avg(salary) from tblemployee ---------- 5188

-- Check more on this
-- Select sum(salary) from (Select top 5 * from tblemployee) as T 
-- (No column name)
-- 21800

Select City,sum(Salary) as TotalSalary
from tblemployee
group by City
-- City	TotalSalary
-- London	23100
-- NewYork	10800
-- Qatar	12800

--- Grouping by multiple columns

Select City,Gender, Sum(Salary) as TotalSalary
from tblEmployee
Group by City,Gender
order by City
-- City		Gender	TotalSalary
-- London	Female	10800
-- London	Male	12300
-- NewYork	Female	2000
-- NewYork	Male	8800
-- Qatar	Female	9600
-- Qatar	Male	3200

--- Using multiple aggregate functions

Select City,Gender,Sum(Salary) as TotalSalary, Count(ID) as TotalEmployees
from tblemployee
Group by Gender,City
-- City		Gender	TotalSalary	TotalEmployees
-- London	Female	10800		2
-- London	Male	12300		2
-- NewYork	Female	2000		1
-- NewYork	Male	8800		2
-- Qatar	Female	9600		1
-- Qatar	Male	3200		1
