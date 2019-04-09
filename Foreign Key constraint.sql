---------------------
-- Foreign Key
---------------------

-- A Foreign Key in 1 table points to primary key in another table. This prevents invalid data from being entered into FK column, 
-- it has to be one of the values contained in the table it points to

Select * from tblperson
Select * from tblgender

-- ID	Name	EmailID 	GenderID
-- 1	Russell	r@r.com 	1
-- 2	Karan	k@j.com 	3
-- 3	Sara	sara@s.com 	2
-- 4	James	j@j.com 	NULL

-- Id	Gender
-- 1	Male
-- 2	Female
-- 3	Unknown

Insert into tblperson (Id,Name,EmailID,GenderID) values (5,'Rahul','kl@rahul.com',99)

Select * from tblperson
-- ID	Name	EmailID 	    GenderID
-- 1	Russell	r@r.com 	    1
-- 2	Karan	k@j.com 	    3
-- 3	Sara	sara@s.com 	    2
-- 4	James	j@j.com 	    NULL
-- 5	Rahul	kl@rahul.com	99

-- GenderID = 99 is incorrect data,but it happily accepts
-- we should restrict users from entering such entries. This can be done by enforcing FK on GenderID column

-- Query

Alter table tblperson
add constraint Fk_tblperson_GenderId
Foreign Key (GenderId)
references tblgender (ID)
-- Error: The ALTER TABLE statement conflicted with the FOREIGN KEY constraint "Fk_tblperson_GenderId". 
-- The conflict occurred in database "Organisation", table "dbo.tblgender", column 'Id'.

-- Lets delete the record with invalid data first and then enforce FK
Delete from tblperson where GenderID = 99
Alter table tblperson
add constraint Fk_tblperson_GenderId
Foreign Key (GenderId)
references tblgender (ID)

Select * from tblperson
-- ID	Name	EmailID 	GenderID
-- 1	Russell	r@r.com 	1
-- 2	Karan	k@j.com 	3
-- 3	Sara	sara@s.com	2
-- 4	James	j@j.com 	NULL

Select * from tblgender
-- Id	Gender
-- 1	Male
-- 2	Female
-- 3	Unknown

-- Now lets try to enter some invalid data

Insert into tblperson (Id,Name,EmailID,GenderID) values (5,'Rahul','kl@rahul.com',99)
-- Error: The INSERT statement conflicted with the FOREIGN KEY constraint "Fk_tblperson_GenderId". 
-- The conflict occurred in database "Organisation", table "dbo.tblgender", column 'Id'.

-- Lets enter some valid data

Insert into tblperson (Id,Name,EmailID,GenderID) values (5,'Rahul','kl@rahul.com',1)
Insert into tblperson (Id,Name,EmailID,GenderID) values (6,'McCullum','mc@srh.com',3)
Insert into tblperson (Id,Name,EmailID) values (7,'Rohit','r@mi.com')
-- Happily accepted

Select * from tblperson
-- ID	Name	    EmailID	       GenderID
-- 1	Russell	    r@r.com 	    1
-- 2	Karan	    k@j.com 	    3
-- 3	Sara	    sara@s.com	    2
-- 4	James	    j@j.com 	    NULL
-- 5	Rahul	    kl@rahul.com	1
-- 6	McCullum	mc@srh.com	    3
-- 7	Rohit	    r@mi.com	    NULL

-- Designer

-- Specific Database --> tables --> Specific Table(RC) --> Design --> Specific Column (RC) --> Relationships --> Add -->
-- Tables and Column speification --> Give relationship name,primary key table,primary key column,foreign key table, foreign key column --> ok