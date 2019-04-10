----------------------------------
-- Unique key constraint
----------------------------------

-- A unique key constraint does not allow any duplicate values in the column.
-- This is same as primary key, but a table can have only one primary key and can have multiple unique key coloumn.
-- (This is helpful in scenerios like unique Id along with unique passport no, emailID,Phone no,Pan no,Aadhar no)

---------------------------------------------------------------
-- Difference between primary key and unique key constraint
---------------------------------------------------------------

-- 1. A table can have only one primary key but more than one unique key
-- 2. Primary key does not allow nulls, where as unique key allows one null

-----------
-- Query
-----------

Create table tbldir
(
ID int identity(1,1) primary key,
Name nvarchar(20) not null,
Contact_no nvarchar(30) not null,
Pan_no int not null
)

Alter table tbldir
add constraint UQ_tblperson
unique (Pan_no)

Insert into tbldir (Name,Contact_no,Pan_no) values ('Tom','123456','123')

Select * from tbldir
-- ID	Name	Contact_no	Pan_no
-- 1	Tom		123456		123

Insert into tbldir (Name,Contact_no,Pan_no) values ('Dick','123456','123')
-- Error:- Violation of UNIQUE KEY constraint 'UQ_tblperson'. Cannot insert duplicate key in object 'dbo.tbldir'. 
-- The duplicate key value is (123).

Insert into tbldir (Name,Contact_no,Pan_no) values ('Dick','123456','456')
--Happily accepted:)

Select * from tbldir
-- ID	Name	Contact_no	Pan_no
-- 1	Tom		123456		123
-- 3	Dick	123456		456

-----------------------------------
--- Designer
-----------------------------------

-- DB --> Tables --> Specific table (RC) --> Design --> RC on any col --> Indexes/Keys --> Specify name,Select col --> Select specific col
-- --> Is unique = Yes,Type = Unique_key --> Save