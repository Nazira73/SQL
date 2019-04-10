---------------------------------
-- All about select
---------------------------------

-------------------------------------
-- TO select specific col & all rows
-------------------------------------

-- Select col1,col2,...,coln from tablename

-- If you are too lazy to typecol names then you can extract it from designer
-- DB -->Tables --> dbo.tblEmployee (RC) --> Script table as --> Select to --> New Query editor window
-- This gives:- 

 --SELECT [ID]
 --      ,[Name]
 --      ,[Gender]
 --      ,[Salary]
 --      ,[City]
 --  FROM [Organisation].[dbo].[tblEmployee]  --- 3 part naming (database,schema,table).Even if we are under other database, it reads 
                                               -- contents perfectly

SELECT [ID],[Name],[City]
   FROM [Organisation].[dbo].[tblEmployee]

-- ID	Name	City
-- 1	Jenny	NewYork

-------------------------------------------------------------------
-- TO Select all cols and all rows
-------------------------------------------------------------------

-- Select * from tablename

-------------------------------------------------------------------
-- Select distinct rows
-------------------------------------------------------------------

Insert into tblemployee (Name,Gender,Salary,City) values ('Todd','Male',4000,'London')
Insert into tblemployee (Name,Gender,Salary,City) values ('Ben','Male',3400,'NewYork')
Insert into tblemployee (Name,Gender,Salary,City) values ('Sara','Female',9600,'Qatar')
Insert into tblemployee (Name,Gender,Salary,City) values ('Pam','Female',2800,'London')
Insert into tblemployee (Name,Gender,Salary,City) values ('Sam','Male',5400,'NewYork')
Insert into tblemployee (Name,Gender,Salary,City) values ('Tom','Male',8300,'London')
Insert into tblemployee (Name,Gender,Salary,City) values ('Harry','Male',3200,'Qatar')
Insert into tblemployee (Name,Gender,Salary,City) values ('Sweety','Female',8000,'London')
Select * from tblemployee
-- ID	Name	Gender	Salary	City
-- 1	Jenny	Female	2000	NewYork
-- 2	Todd	Male	4000	London
-- 3	Ben		Male	3400	NewYork
-- 4	Sara	Female	9600	Qatar
-- 5	Pam		Female	2800	London
-- 6	Sam		Male	5400	NewYork
-- 7	Tom		Male	8300	London
-- 8	Harry	Male	3200	Qatar
-- 9	Sweety	Female	8000	London

Select distinct City from tblemployee
-- City
-- London
-- NewYork
-- Qatar

Select distinct gender,City from tblemployee
-- gender	City
-- Female	London
-- Female	NewYork
-- Female	Qatar
-- Male		London
-- Male		NewYork
-- Male		Qatar

----------------------------------------------
-- Filtering with where clause
----------------------------------------------

-- operators

-- = 
-- !=, <>
-- >
-- >=
-- <
-- <=
-- IN             - Specify a list of values
-- BETWEEN        - Specify a range
-- LIKE           - Specify a pattern
-- NOT  
-- AND
-- OR

-- wild card

-- %               - Zero or more characters
-- _               - Exactly one character
-- []              - Any character within brackets
-- [^]             - Not of all charcaters within the bracket


Select * from tblemployee where City = 'London'
-- ID	Name	Gender	Salary	City
-- 2	Todd	Male	4000	London
-- 5	Pam		Female	2800	London
-- 7	Tom		Male	8300	London
-- 9	Sweety	Female	8000	London

Select * from tblemployee where Gender != 'Male' 
-- ID	Name	Gender	Salary	City
-- 1	Jenny	Female	2000	NewYork
-- 4	Sara	Female	9600	Qatar
-- 5	Pam		Female	2800	London
-- 9	Sweety	Female	8000	London

Select Name,Salary,City from tblemployee where City IN ('London','Qatar')
-- Name		Salary	City
-- Todd		4000	London
-- Sara		9600	Qatar
-- Pam		2800	London
-- Tom		8300	London
-- Harry	3200	Qatar
-- Sweety	8000	London

Select * from tblemployee where Salary Between 2000 And 4000
-- ID	Name	Gender	Salary	City
-- 1	Jenny	Female	2000	NewYork
-- 2	Todd	Male	4000	London
-- 3	Ben		Male	3400	NewYork
-- 5	Pam		Female	2800	London
-- 8	Harry	Male	3200	Qatar

Select * from tblemployee where Name Like 'S%'
-- ID	Name	Gender	Salary	City
-- 4	Sara	Female	9600	Qatar
-- 6	Sam		Male	5400	NewYork
-- 9	Sweety	Female	8000	London

-- Lets learn few more things
Alter table tblemployee
add EmailID nvarchar(20)

Select * from tblemployee
-- ID	Name	Gender	Salary	City		EmailID
-- 1	Jenny	Female	2000	NewYork		NULL
-- 2	Todd	Male	4000	London		NULL
-- 3	Ben		Male	3400	NewYork		NULL
-- 4	Sara	Female	9600	Qatar		NULL
-- 5	Pam		Female	2800	London		NULL
-- 6	Sam		Male	5400	NewYork		NULL
-- 7	Tom		Male	8300	London		NULL
-- 8	Harry	Male	3200	Qatar		NULL
-- 9	Sweety	Female	8000	London		NULL

-- Lets enter EmailIDs using designer

Select * from tblemployee
-- ID	Name		Gender	Salary	City	EmailID
-- 1	Jenny		Female	2000	NewYork	jen@gmail.com
-- 2	Todd		Male	4000	London	todd@yahoo.com
-- 3	Ben			Male	3400	NewYork	Ben@rediffmail.com
-- 4	Sara		Female	9600	Qatar	Sara@gmail.com
-- 5	Pam			Female	2800	London	Pam@gmail.com
-- 6	Sam			Male	5400	NewYork	Sam@yahoo.com
-- 7	Tom			Male	8300	London	Tom.com
-- 8	Harry		Male	3200	Qatar	Harry@yahoo.com
-- 9	Sweety		Female	8000	London	Sweety@gmail.com

Select * from tblemployee where EmailId not like '%@%'
-- Gives all invalid emailIds

-- ID	Name	Gender	Salary	City	EmailID
-- 7	Tom		Male	8300	London	Tom.com

Select * from tblemployee where EmailId like '%@gmail.com'
-- Gives the list of all gmail users

-- ID	Name	Gender	Salary	City	EmailID
-- 1	Jenny	Female	2000	NewYork	jen@gmail.com
-- 4	Sara	Female	9600	Qatar	Sara@gmail.com
-- 5	Pam		Female	2800	London	Pam@gmail.com
-- 9	Sweety	Female	8000	London	Sweety@gmail.com

Select * from tblemployee where Name like '___'
-- Gives list of all 3 letter names
-- ID	Name	Gender	Salary	City		EmailID
-- 3	Ben		Male	3400	NewYork		Ben@rediffmail.com
-- 5	Pam		Female	2800	London		Pam@gmail.com
-- 6	Sam		Male	5400	NewYork		Sam@yahoo.com
-- 7	Tom		Male	8300	London		Tom.com

Select * from tblemployee where [Name] LIKE '[A-P]%'
-- ID	Name	Gender	Salary	City		EmailID
-- 1	Jenny	Female	2000	NewYork		jen@gmail.com
-- 3	Ben		Male	3400	NewYork		Ben@rediffmail.com
-- 5	Pam		Female	2800	London		Pam@gmail.com
-- 8	Harry	Male	3200	Qatar		Harry@yahoo.com

Select * from tblemployee where [Name] LIKE '[BS]%'
-- ID	Name	Gender	Salary	City	EmailID
-- 3	Ben		Male	3400	NewYork	Ben@rediffmail.com
-- 4	Sara	Female	9600	Qatar	Sara@gmail.com
-- 6	Sam		Male	5400	NewYork	Sam@yahoo.com
-- 9	Sweety	Female	8000	London	Sweety@gmail.com

Select * from tblemployee where [Name] LIKE '[^BS]%'
-- 1	Jenny	Female	2000	NewYork	jen@gmail.com
-- 2	Todd	Male	4000	London	todd@yahoo.com
-- 5	Pam		Female	2800	London	Pam@gmail.com
-- 7	Tom		Male	8300	London	Tom.com
-- 8	Harry	Male	3200	Qatar	Harry@yahoo.com

-------------------------------------------------------------------------------
-- Joining multiple conditions using AND-OR
-------------------------------------------------------------------------------

Select * from tblemployee where (City = 'London' AND Salary >3000) OR (City = 'NewYork' AND SALARY > 4000)
-- ID	Name	Gender	Salary	City	EmailID
-- 2	Todd	Male	4000	London	todd@yahoo.com
-- 6	Sam		Male	5400	NewYork	Sam@yahoo.com
-- 7	Tom		Male	8300	London	Tom.com
-- 9	Sweety	Female	8000	London	Sweety@gmail.com


Select * from tblemployee where (Gender = 'Male') AND ((City = 'London' AND Salary >3000) OR (City = 'NewYork' AND SALARY >4000))
-- ID	Name	Gender	Salary	City	EmailID
-- 2	Todd	Male	4000	London	todd@yahoo.com
-- 6	Sam		Male	5400	NewYork	Sam@yahoo.com
-- 7	Tom		Male	8300	London	Tom.com

--------------------------------------------------------------------
-- Order by
--------------------------------------------------------------------

Select * from tblemployee 
order by Salary
-- ID	Name	Gender	Salary	City	EmailID
-- 1	Jenny	Female	2000	NewYork	jen@gmail.com
-- 5	Pam		Female	2800	London	Pam@gmail.com
-- 8	Harry	Male	3200	Qatar	Harry@yahoo.com
-- 3	Ben		Male	3400	NewYork	Ben@rediffmail.com
-- 2	Todd	Male	4000	London	todd@yahoo.com
-- 6	Sam		Male	5400	NewYork	Sam@yahoo.com
-- 9	Sweety	Female	8000	London	Sweety@gmail.com
-- 7	Tom		Male	8300	London	Tom.com
-- 4	Sara	Female	9600	Qatar	Sara@gmail.com

Select * from tblemployee 
order by Salary DESC
-- ID	Name	Gender	Salary	City	EmailID
-- 4	Sara	Female	9600	Qatar	Sara@gmail.com
-- 7	Tom		Male	8300	London	Tom.com
-- 9	Sweety	Female	8000	London	Sweety@gmail.com
-- 6	Sam		Male	5400	NewYork	Sam@yahoo.com
-- 2	Todd	Male	4000	London	todd@yahoo.com
-- 3	Ben		Male	3400	NewYork	Ben@rediffmail.com
-- 8	Harry	Male	3200	Qatar	Harry@yahoo.com
-- 5	Pam		Female	2800	London	Pam@gmail.com
-- 1	Jenny	Female	2000	NewYork	jen@gmail.com

Select * from tblemployee 
order by City DESC
-- ID	Name	Gender	Salary	City	EmailID
-- 4	Sara	Female	9600	Qatar	Sara@gmail.com
-- 8	Harry	Male	3200	Qatar	Harry@yahoo.com
-- 6	Sam		Male	5400	NewYork	Sam@yahoo.com
-- 1	Jenny	Female	2000	NewYork	jen@gmail.com
-- 3	Ben		Male	3400	NewYork	Ben@rediffmail.com
-- 2	Todd	Male	4000	London	todd@yahoo.com
-- 5	Pam		Female	2800	London	Pam@gmail.com
-- 7	Tom		Male	8300	London	Tom.com
-- 9	Sweety	Female	8000	London	Sweety@gmail.com

------------------------------------------------------------------
-- Top n / Top n percentage
------------------------------------------------------------------

Select top 3 * from tblemployee

-- ID	Name	Gender	Salary	City		EmailID
-- 1	Jenny	Female	2000	NewYork		jen@gmail.com
-- 2	Todd	Male	4000	London		todd@yahoo.com
-- 3	Ben		Male	3400	NewYork		Ben@rediffmail.com

Select top 25 percent * from tblemployee
-- ID	Name	Gender	Salary	City		EmailID
-- 1	Jenny	Female	2000	NewYork		jen@gmail.com
-- 2	Todd	Male	4000	London		todd@yahoo.com
-- 3	Ben		Male	3400	NewYork		Ben@rediffmail.com

Select top 1 * from tblemployee
order by Salary DESC
-- This query will give the details of highest paid employed in the organisation


