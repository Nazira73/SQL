--------------------------------------------
-- Joins
--------------------------------------------
-- Joins in SQL server are used to retrieve data from 2 or more related tables. In general tables are related to each other using 
-- foriegn key constraint

-- Types of joins in SQL Server
-- 1. Inner Join (Intersection)
-- 2. Outer Join
      -- a. Left Join
	  -- b. Right Join
	  -- c. Full Join
-- 3. Cross Join (Dot Product)

Select * from tblemployee
-- ID	Name	Gender	Salary	DepartmentId
-- 1	Jenny	Female	2000	1
-- 2	Todd	Male	4000	3
-- 3	Ben		Male	3400	1
-- 4	Sara	Female	9600	2
-- 5	Pam		Female	2800	2
-- 6	Sam		Male	5400	1
-- 7	Tom		Male	8300	3
-- 8	Harry	Male	3200	1
-- 9	Sweety	Female	8000	NULL
-- 10	Russell	Male	8600	NULL

Select * from tbldept
-- Id	DeptName		 Location	DeptHead
-- 1	IT				 London		Rick
-- 2	Payroll			 Delhi		Ron
-- 3	HR				 NewYork	Christie
-- 4	Other Department Sydney		Cindrella

Alter table tblemployee
add constraint FK_tblemployee_DepartmentId
foreign key (DepartmentId) references tbldept(ID)

---------------------------
-- Inner Join
---------------------------

Select Name,Gender,Salary,DeptName
from tblemployee
Inner Join tbldept
on tblemployee.DepartmentId = tbldept.ID
-- Name		Gender	Salary	DeptName
-- Jenny	Female	2000	IT
-- Todd		Male	4000	HR
-- Ben		Male	3400	IT
-- Sara		Female	9600	Payroll
-- Pam		Female	2800	Payroll
-- Sam		Male	5400	IT
-- Tom		Male	8300	HR
-- Harry	Male	3200	IT

-------------------------------------------
-- Outer Join
-------------------------------------------

-- Left join

Select Name,Gender,Salary,DeptName,Location
from tblemployee
left join tbldept
on tblemployee.DepartmentId = tbldept.ID
-- Name		Gender	Salary	DeptName	Location
-- Jenny	Female	2000	IT			London
-- Todd		Male	4000	HR			NewYork
-- Ben		Male	3400	IT			London
-- Sara		Female	9600	Payroll		Delhi
-- Pam		Female	2800	Payroll		Delhi
-- Sam		Male	5400	IT			London
-- Tom		Male	8300	HR			NewYork
-- Harry	Male	3200	IT			London
-- Sweety	Female	8000	NULL		NULL
-- Russell	Male	8600	NULL		NULL

-- Right Join

Select Name,Gender,Salary,DeptName,Location
from tblemployee
right join tbldept
on tblemployee.DepartmentId = tbldept.ID
-- Name		Gender	Salary	DeptName			Location
-- Jenny	Female	2000	IT					London
-- Todd		Male	4000	HR					NewYork
-- Ben		Male	3400	IT					London
-- Sara		Female	9600	Payroll				Delhi
-- Pam		Female	2800	Payroll				Delhi
-- Sam		Male	5400	IT					London
-- Tom		Male	8300	HR					NewYork
-- Harry	Male	3200	IT					London
-- Sweety	Female	8000	NULL				NULL
-- Russell	Male	8600	NULL				NULL
-- NULL		NULL	NULL	Other Department	Sydney
-- Name		Gender	Salary	DeptName			Location
-- Jenny	Female	2000	IT					London
-- Ben		Male	3400	IT					London
-- Sam		Male	5400	IT					London
-- Harry	Male	3200	IT					London
-- Sara		Female	9600	Payroll				Delhi
-- Pam		Female	2800	Payroll				Delhi
-- Todd		Male	4000	HR					NewYork
-- Tom		Male	8300	HR					NewYork
-- NULL		NULL	NULL	Other Department	Sydney

Select Name,Gender,Salary,DeptName,Location
from tblemployee
full join tbldept
on tblemployee.DepartmentId = tbldept.ID
---------------------------------------
-- Cross Join
---------------------------------------

-- Note:- Cross Join does not have ON clause

Select Name,Gender,Salary,DeptName,Location
from tblemployee
cross join tbldept
-- Name		Gender		Salary		DeptName			Location
-- Jenny	Female		2000		IT					London
-- Todd		Male		4000		IT					London
-- Ben		Male		3400		IT					London
-- Sara		Female		9600		IT					London
-- Pam		Female		2800		IT					London
-- Sam		Male		5400		IT					London
-- Tom		Male		8300		IT					London
-- Harry	Male		3200		IT					London
-- Sweety	Female		8000		IT					London
-- Russell	Male		8600		IT					London
-- Jenny	Female		2000		Payroll				Delhi
-- Todd		Male		4000		Payroll				Delhi
-- Ben		Male		3400		Payroll				Delhi
-- Sara		Female		9600		Payroll				Delhi
-- Pam		Female		2800		Payroll				Delhi
-- Sam		Male		5400		Payroll				Delhi
-- Tom		Male		8300		Payroll				Delhi
-- Harry	Male		3200		Payroll				Delhi
-- Sweety	Female		8000		Payroll				Delhi
-- Russell	Male		8600		Payroll				Delhi
-- Jenny	Female		2000		HR					NewYork
-- Todd		Male		4000		HR					NewYork
-- Ben		Male		3400		HR					NewYork
-- Sara		Female		9600		HR					NewYork
-- Pam		Female		2800		HR					NewYork
-- Sam		Male		5400		HR					NewYork
-- Tom		Male		8300		HR					NewYork
-- Harry	Male		3200		HR					NewYork
-- Sweety	Female		8000		HR					NewYork
-- Russell	Male		8600		HR					NewYork
-- Jenny	Female		2000		Other Department	Sydney
-- Todd		Male		4000		Other Department	Sydney
-- Ben		Male		3400		Other Department	Sydney
-- Sara		Female		9600		Other Department	Sydney
-- Pam		Female		2800		Other Department	Sydney
-- Sam		Male		5400		Other Department	Sydney
-- Tom		Male		8300		Other Department	Sydney
-- Harry	Male		3200		Other Department	Sydney
-- Sweety	Female		8000		Other Department	Sydney
-- Russell	Male		8600		Other Department	Sydney
