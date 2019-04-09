-----------------------
-- Default Constraint
-----------------------

-- It is used to insert default value into a column

Select * from tblperson
Select * from tblgender

-- ID	Name	  EmailID 	    GenderID
-- 1	Russell	  r@r.com 	    1
-- 2	Karan	  k@j.com 	    3
-- 3	Sara	  sara@s.com 	    2
-- 4	James	  j@j.com 	    NULL
-- 5	Rahul	  kl@rahul.com	1

-- Id	Gender
-- 1	Male
-- 2	Female
-- 3	Unknown

-- Lets insert a record in tblperson

Insert into tblperson (ID,Name,EmailID) values (6,'McCullum','mc@srh.com')
Select * from tblperson

-- Observe that since genderID details are not provided then it automatically took null, but what if we dont want null
-- instead we want such that if someone doesnt enter the data then it should take some default value
-- This can be achieved by enforcing Default constraint on that column

-- 1. Altering existing col to add default constraint

Alter table tblperson
add constraint DF_tblperson_GenderID
default(4) for GenderId

Insert into tblperson (ID,Name,EmailID) values (7,'Raja','raja@csp.com')
-- Error: The INSERT statement conflicted with the FOREIGN KEY constraint "Fk_tblperson_GenderId". 
-- The conflict occurred in database "Organisation", table "dbo.tblgender", column 'Id'.
--This occured due to FK conflict. 

----------------------------------
-- Dropping a Constraint
----------------------------------

Alter table tblperson
Drop constraint DF_tblperson_GenderID

Alter table tblperson
add constraint DF_tblperson_GenderID
default(3) for GenderId

Insert into tblperson (ID,Name,EmailID) values (7,'Raja','raja@csp.com')
Insert into tblperson (ID,Name,EmailID,GenderId) values (8,'Todd','t@t.com',Null)
Insert into tblperson (ID,Name,EmailID,GenderId) values (9,'Ben','Ben@yahoo.com',2)
-- Works Fine :)

Select * from tblperson
-- ID	Name	  EmailID	     GenderID
-- 1	Russell	  r@r.com	     1
-- 2	Karan	  k@j.com	     3
-- 3	Sara	  sara@s.com     2
-- 4	James	  j@j.com	     NULL
-- 5	Rahul	  kl@rahul.com	 1
-- 6	McCullum  mc@srh.com	 NULL
-- 7	Raja	  raja@csp.com	 3
-- 8	Todd	  t@t.com	     NULL
-- 9	Ben	      Ben@yahoo.com	 2


-- 2. Adding new column with default value to an existing table

Alter table tblperson
add Eye_Color nvarchar(10)
constraint DF_tblperson_Eye_Color default('Black')

Insert into tblperson (Id,Name,EmailID) values (10,'Joy','joy@f.com')
Insert into tblperson (Id,Name,EmailID,GenderID,Eye_color) values (11,'Andrew','a@f.com',1,'Blue')

Select * from tblperson
-- ID	Name	  EmailID	    GenderID	Eye_Color
-- 1	Russell	  r@r.com	    1	        NULL
-- 2	Karan	  k@j.com	    3	        NULL
-- 3	Sara	  sara@s.com    2	        NULL
-- 4	James	  j@j.com	    NULL	    NULL
-- 5	Rahul	  kl@rahul.com	1	        NULL
-- 6	McCullum  mc@srh.com	NULL	    NULL
-- 7	Raja	  raja@csp.com	3	        NULL
-- 8	Todd	  t@t.com	    NULL	    NULL
-- 9	Ben	      Ben@yahoo.com	2	        NULL
-- 10	Joy	      joy@f.com	    3	        Black
-- 11	Andrew	  a@f.com	    1	        Blue

-- Note: If we add default constraint after inserting few records then those records for the new column takes
-->  null if that column is nullable column
-->  default value if that column is non nullable column

Alter table tblperson
add Age int not null
constraint DF_tblperson_Age default (18)

Select * from tblperson
-- ID	Name	  EmailID	    GenderID	Eye_Color	Age
-- 1	Russell	  r@r.com	    1	        NULL		18
-- 2	Karan	  k@j.com	    3	        NULL		18
-- 3	Sara	  sara@s.com    2	        NULL		18
-- 4	James	  j@j.com	    NULL	    NULL		18
-- 5	Rahul	  kl@rahul.com	1	        NULL		18
-- 6	McCullum  mc@srh.com	NULL	    NULL		18
-- 7	Raja	  raja@csp.com	3	        NULL		18
-- 8	Todd	  t@t.com	    NULL	    NULL		18
-- 9	Ben	      Ben@yahoo.com	2	        NULL		18
-- 10	Joy	      joy@f.com	    3	        Black		18
-- 11	Andrew	  a@f.com	    1	        Blue		18