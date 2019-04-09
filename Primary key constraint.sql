----------------
-- Primary Key
----------------

-- Primary Key helps to uniquely identify each record

Select * from tblperson

-- ID	Name	EmailID	 GenderID
-- 1	Russell	r@r.com	    1
-- 3	Sara	sara@s.com	2
-- 4	Karan	k@j.com	    3

Insert into tblperson (ID,Name,EmailID) values (4,'James','j@j.com')
Select * from tblperson

-- ID	Name	EmailID	 GenderID
-- 1	Russell	r@r.com	    1
-- 4	James	j@j.com	   NULL
-- 3	Sara	sara@s.com	2
-- 4	Karan	k@j.com	    3

-- the above query shows that we can insert repeated Id's, but this is an odd behaviour.
-- TO avoid this we can enforce primary key on Id column

-- 1. Adding primary key constraint while creating a new table

Create table tblgender

(
	Id int not null Primary key,
	Gender nvarchar(20)
)

--Now lets try to insert few records and try to reuse ID

Insert into tblgender (ID,Gender) values (1,'Male')
Insert into tblgender (ID,Gender) values (1,'Female')
-- Error: Violation of PRIMARY KEY constraint 'PK__tblgende__3214EC07CD5B40DF'.
-- Cannot insert duplicate key in object 'dbo.tblgender'. The duplicate key value is (1).

Insert into tblgender (ID,Gender) values (2,'Female')
Insert into tblgender (ID,Gender) values (3,'Unknown')
-- This works fine

Select * from tblgender
-- Id	Gender
-- 1 	Male
-- 2 	Female
-- 3 	Unknown

-- 2. Adding Primary key constraint to existing table

Select * from tblperson 

-- ID	Name	EmailID	 GenderID
-- 1	Russell	r@r.com	    1
-- 4	James	j@j.com	   NULL
-- 3	Sara	sara@s.com	2
-- 4	Karan	k@j.com	    3

-- This table already contains duplicate records

Alter table tblperson 
add constraint PK_tblperson_ID 
primary key (ID)
-- Error: The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.tblperson' and the index name 
-- 'PK_tblperson_ID'. The duplicate key value is (4). 

-- Lets first delete this duplicate record and try again

Delete from tblperson where Name = 'Karan'
Select * from tblperson
-- ID	Name	EmailID 	GenderID
-- 1	Russell	r@r.com 	    1
-- 3	Sara	sara@s.com  	2
-- 4	James	j@j.com 	   NULL

Alter table tblperson 
add constraint PK_tblperson_ID 
primary key (ID)
-- It works now, lets try to insert any duplicate records now

Insert into tblperson (Id,Name,EmailId,GenderId) values (4,'Karan','k@j.com',3)
-- It doesnt allow us to do so

Insert into tblperson (Id,Name,EmailId,GenderId) values (2,'Karan','k@j.com',3)
-- But this works

Select * from tblperson
-- ID	Name	EmailID 	GenderID
-- 1	Russell	r@r.com 	1
-- 2	Karan	k@j.com 	3
-- 3	Sara	sara@s.com	2
-- 4	James	j@j.com 	NULL

-- Note:
   -- A table can have only 1 primary key
   -- Primary key must be unique and cannot contain nulls