-----------------------------------
-- Cascading Referential integrity
-----------------------------------

-- It allows to define the actions Microsoft SQL Server should take when a user attempts to delete or update a key to which an 
-- existing foreign key points

Select * from tblperson
Select * from tblgender

-- ID	Name	 EmailID	    GenderID	
-- 1	Russell	 r@r.com	    1	        
-- 2	Karan	 k@j.com	    3	        
-- 3	Sara	 sara@s.com	    2			
-- 4	James	 j@j.com	   	NULL		
-- 5	Rahul	 kl@rahul.com  	NULL		
-- 6	McCullum mc@srh.com	    NULL		
-- 7	Raja	 raja@csp.com   3			
-- 8	Todd	 t@t.com	    NULL		
-- 9	Ben	     Ben@yahoo.com  2			
-- 10	Joy	     joy@f.com	    3			
-- 11	Andrew	 a@f.com	    1			

-- Id	Gender
-- 1	Male
-- 2	Female
-- 3	Unknown

-- If someone tries to delete a record from tblgender table where ID = 1, then record with ID = 1,5,11 in tblperson will become orphan
-- record due to foreign key relation between them
-- Microsoft SQL server by default doesnt allow to delete or update such records. In such cases Cascading referential integrity constraint
-- can be used to define the actions that MS SQL server should take.
-- There are 4 options:
-- 1. No action (Default):- 
--    Throws an error, delete and update statments are rolled back

-- 2. Set Default:-
--    If someone attempts to delete or update a row to which foreign key points, then all such rows are set to default value

-- 3. Set Null:-
--    If someone attempts to delete or update a row to which foreign key points, then all such rows are set to NULL value

-- 4. Cascade:-
--    If someone attempts to delete or update a row to which foreign key points, then all such rows are also deleted or updated

---------------
-- Designer
---------------

-- Note:- Cascading referential integrity settings can be done only at the time of table defination

Delete from tblgender where Id = 1
-- Error: The DELETE statement conflicted with the REFERENCE constraint "Fk_tblperson_GenderId". The conflict occurred in database 
-- "Organisation", table "dbo.tblperson", column 'GenderID'.

-- Lets make Delete rules or Update rules as Default
Delete from tblgender where Id = 2

Select * from tblperson
Select * from tblgender

-- ID	Name	 EmailID	   GenderID
-- 1	Russell	 r@r.com	   1
-- 2	Karan	 k@j.com	   3
-- 3	Sara	 sara@s.com	   3
-- 4	James	 j@j.com	   NULL
-- 5	Rahul	 kl@rahul.com  1
-- 6	McCullum mc@srh.com	   NULL
-- 7	Raja	 raja@csp.com  3
-- 8	Todd	 t@t.com	   NULL
-- 9	Ben	     Ben@yahoo.com 3
-- 10	Joy	     joy@f.com	   3
-- 11	Andrew	 a@f.com	   1

-- Id	Gender
-- 1	Male
-- 3	Unknown

-- Lets make Delete rules or Update rules as Set null
Delete from tblgender where Id = 3

Select * from tblperson
Select * from tblgender

-- ID	Name	  EmailID		GenderID
-- 1	Russell	  r@r.com		1
-- 2	Karan	  k@j.com		NULL
-- 3	Sara	  sara@s.com	NULL
-- 4	James	  j@j.com		NULL
-- 5	Rahul	  kl@rahul.com	1
-- 6	McCullum  mc@srh.com	NULL
-- 7	Raja	  raja@csp.com	NULL
-- 8	Todd	  t@t.com		NULL
-- 9	Ben       Ben@yahoo.com	NULL
-- 10	Joy	      joy@f.com		NULL
-- 11	Andrew	  a@f.com		1

--Id	Gender
-- 1	Male

-- Lets make Delete rules or Update rules as Cascade
Delete from tblgender where Id = 1

Select * from tblperson
Select * from tblgender

-- ID	Name	  EmailID	    GenderID
-- 2	Karan	  k@j.com	    NULL
-- 3	Sara	  sara@s.com    NULL
-- 4	James	  j@j.com	    NULL
-- 6	McCullum  mc@srh.com    NULL
-- 7	Raja	  raja@csp.com	NULL
-- 8	Todd	  t@t.com	    NULL
-- 9	Ben	      Ben@yahoo.com	NULL
-- 10	Joy	      joy@f.com	    NULL

-- Id	Gender

-------------------------
-- Query
-------------------------

-- For setting up cascading referential integrity on a specific column using query we need to delete the old table and create a new
-- with CIR defination as well

-- eg:

Create table tablename
(
Column1 datatype primary key,
Column2 datatype not null,
....
....
GenderID int CONSTRAINT FK_tblPerson_GenderID FOREIGN KEY REFERENCES tblgender(Id)
ON Delete No action/cascade/Set null/Default
ON Update No action/cascade/Set null/Default
)