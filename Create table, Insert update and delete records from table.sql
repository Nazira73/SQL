Create database Organisation
Use Organisation
Go

--------------------
-- Creating tables
--------------------

-- Query
Create table tblperson
(
	ID int not null,
	Name nvarchar(20) not null,
	EmailID nvarchar(20) not null,
	GenderID int 
)

Select * from tblperson

-- Designer
-- Specific Database--> tables (RC) --> Table --> Specify each colmn name, datatype, null or not null

--------------------
-- Inserting records
---------------------

-- Query
Insert into tblperson (ID,Name,EmailID,GenderID) values (1,'Russell','r@r.com',1)
Insert into tblperson (ID,Name,EmailID,GenderID) values (2,'Dhoni','ms@dhini.com',1)
Insert into tblperson (ID,Name,EmailID,GenderID) values (3,'Sara','sara@s.com',2)
Insert into tblperson (ID,Name,EmailID,GenderID) values (4,'Karan','k@j.com',3)

Select * from tblperson

-- Designer
-- Specific Table (RC) --> Edit Top 200 rows --> Make all the data entry

-------------------------
-- Updating records
-------------------------

Update tblperson 
Set EmailId = 'ms@dhoni.com' where Name = 'Dhoni'
Select * from tblperson

-------------------------
-- Deleting Records
-------------------------

Delete from tblperson where ID = 2
Select * from tblperson



