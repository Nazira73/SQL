---------------------------------
-- Identity Column
---------------------------------

-- If a column is marked as identity column, then the values for this column are automatically generated whenever we insert a new record
-- Identity column should be specified while creating the table

---------------------
-- Query
---------------------

Create table tblEmployee
(
ID int primary key identity (1,1),   -- (Seed,Increment)
Name nvarchar(30) not null,
Gender nvarchar(10),
Salary int not null,
City nvarchar(30) not null
)

-- Observe that since ID is an identity column we need not to explicitly provide values for it

Insert into tblemployee (Name,Gender,Salary,City) values ('Todd','Male',4000,'London')
Insert into tblemployee (Name,Gender,Salary,City) values ('Ben','Male',3400,'NewYork')
Insert into tblemployee (Name,Gender,Salary,City) values ('Sara','Female',9600,'Qatar')
Insert into tblemployee (Name,Gender,Salary,City) values ('Pam','Female',2800,'London')
Insert into tblemployee (Name,Gender,Salary,City) values ('Sam','Male',5400,'NewYork')
Insert into tblemployee (Name,Gender,Salary,City) values ('Tom','Male',8300,'London')
Insert into tblemployee (Name,Gender,Salary,City) values ('Harry','Male',3200,'Qatar')
Insert into tblemployee (Name,Gender,Salary,City) values ('Sweety','Female',8000,'London')
Select * from tblemployee
-- ID	Name		Gender	Salary	City
-- 1	Todd		Male	4000	London
-- 2	Ben			Male	3400	NewYork
-- 3	Sara		Female	9600	Qatar
-- 4	Pam			Female	2800	London
-- 5	Sam			Male	5400	NewYork
-- 6	Tom			Male	8300	London
-- 7	Harry		Male	3200	Qatar
-- 8	Sweety		Female	8000	London

-- Consider that Harry has left this organisation. We will delete his records

delete from tblEmployee where ID = 7
Select * from tblemployee
-- ID	Name		Gender	Salary	City
-- 1	Todd		Male	4000	London
-- 2	Ben			Male	3400	NewYork
-- 3	Sara		Female	9600	Qatar
-- 4	Pam			Female	2800	London
-- 5	Sam			Male	5400	NewYork
-- 6	Tom			Male	8300	London
-- 8	Sweety		Female	8000	London

-------------------------------------------------------------------
-- Supply explicit value to identity column using Identity_INSERT
-------------------------------------------------------------------

-- Now John has joined this organisation, is it possible to give him ID = 7

Insert into tblemployee (ID,Name,Gender,Salary,City) values (7,'John','Male',3200,'Qatar')
-- Error:- Cannot insert explicit value for identity column in table 'tblEmployee' when IDENTITY_INSERT is set to OFF.

-- It says that: to do so we need to turn off the identity insert

Set IDENTITY_INSERT tblEmployee ON
Insert into tblemployee (ID,Name,Gender,Salary,City) values (7,'John','Male',3200,'Qatar')
-- Command completed Successfully :)

Select * from tblEmployee
-- ID	Name		Gender	Salary	City
-- 1	Todd		Male	4000	London
-- 2	Ben			Male	3400	NewYork
-- 3	Sara		Female	9600	Qatar
-- 4	Pam			Female	2800	London
-- 5	Sam			Male	5400	NewYork
-- 6	Tom			Male	8300	London
-- 7	John		Male	3200	Qatar
-- 8	Sweety		Female	8000	London

-- Job done!! Now turn on the identity insert, otherwise it wont take the next id automatically. Lets try

Insert into tblemployee (Name,Gender,Salary,City) values ('Marry','Female',7000,'NewYork')
-- Error:- Explicit value must be specified for identity column in table 'tblEmployee' either when IDENTITY_INSERT 
-- is set to ON or when a replication user is inserting into a NOT FOR REPLICATION identity column.

SET IDENTITY_INSERT tblemployee OFF
Insert into tblemployee (Name,Gender,Salary,City) values ('Marry','Female',7000,'NewYork')

Select * from tblemployee
-- ID	Name		Gender	Salary	City
-- 1	Todd		Male	4000	London
-- 2	Ben			Male	3400	NewYork
-- 3	Sara		Female	9600	Qatar
-- 4	Pam			Female	2800	London
-- 5	Sam			Male	5400	NewYork
-- 6	Tom			Male	8300	London
-- 7	John		Male	3200	Qatar
-- 8	Sweety		Female	8000	London
-- 9	Marry		Female	7000	NewYork

-----------------------------------------------
-- Reset identity value using DBCC Checkident
-----------------------------------------------

-- Consider a scenerio that all the employees are shifted to a different organisation, and new employees have entered the organisation

delete from tblemployee
Select * from tblemployee
-- ID	Name	Gender	Salary	City
-- No records. Now lets enter new employees record

Insert into tblemployee (Name,Gender,Salary,City) values ('Jenny','Female',2000,'NewYork')
Select * from tblemployee
-- ID	Name	Gender	Salary	City
-- 10	Jenny	Female	2000	NewYork
-- This is unexpected. Jenny gets an Id of 10. We dont want this. We need to reseed the identity column. This can be done using 
-- DBCC Check_ident

delete from tblemployee
DBCC CheckIdent(tblemployee,Reseed,0)
Insert into tblemployee (Name,Gender,Salary,City) values ('Jenny','Female',2000,'NewYork')

Select * from tblemployee
-- ID	Name	Gender	Salary	City
-- 1	Jenny	Female	2000	NewYork

---------------
-- Designer
---------------

-- Database --> Tables --> Specific table (RC) --> Design --> Click on column to be made as identity --> column properties --> 
-- Identity Specification --> (Is Identity) = Yes, Sppecify seed and increment if required --> Save
