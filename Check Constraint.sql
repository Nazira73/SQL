--------------------
-- Check Constraint
--------------------

-- It is used to limit the range of values that can be entered for a column

Alter table tblperson
add Age int not null
constraint CK_tblperson_Age default (18)

Select * from tblperson
-- ID	Name	  EmailID	    GenderID	Age
-- 1	Russell	  r@r.com	    1			18
-- 2	Karan	  k@j.com	    3			18
-- 3	Sara	  sara@s.com    2			18
-- 4	James	  j@j.com	    NULL		18
-- 5	Rahul	  kl@rahul.com	NULL		18
-- 6	McCullum  mc@srh.com	NULL		18
-- 7	Raja	  raja@csp.com	3			18
-- 8	Todd	  t@t.com	    NULL		18
-- 9	Ben	      Ben@yahoo.com	2			18
-- 10	Joy	      joy@f.com	    3			18
-- 11	Andrew	  a@f.com	    1			18

-- Age column is taking default value of 18, let us update the age column

Select * from tblperson
-- ID	Name		EmailID			GenderID	Age
-- 1	Russell		r@r.com			1			38
-- 2	Karan		k@j.com			3			25
-- 3	Sara		sara@s.com		2			23
-- 4	James		j@j.com			NULL		43
-- 5	Rahul		kl@rahul.com	NULL		28
-- 6	McCullum	mc@srh.com		NULL		45
-- 7	Raja		raja@csp.com	3			999
-- 8	Todd		t@t.com			NULL		26
-- 9	Ben			Ben@yahoo.com	2			31
-- 10	Joy			joy@f.com		3			34
-- 11	Andrew		a@f.com			1			40

-- Observe the age of ID = 7, isnt it impractical. To avoid such entries we can enforce check constraint on this column

-- Query

Alter table tblperson
add constraint CK_tblperson_Age
check (Age <= 100 AND Age > 0) 
-- Error:- The ALTER TABLE statement conflicted with the CHECK constraint "CK_tblperson_Age". The conflict occurred in database
-- "Organisation", table "dbo.tblperson", column 'Age'.
-- This occured due to invalid entry, lets modify it

Update tblperson
Set Age = 18 where ID = 7

Select * from tblperson
-- ID	Name		EmailID			GenderID	Age
-- 1	Russell		r@r.com			1			38
-- 2	Karan		k@j.com			3			25
-- 3	Sara		sara@s.com		2			23
-- 4	James		j@j.com			NULL		43
-- 5	Rahul		kl@rahul.com	NULL		28
-- 6	McCullum	mc@srh.com		NULL		45
-- 7	Raja		raja@csp.com	3			18
-- 8	Todd		t@t.com			NULL		26
-- 9	Ben			Ben@yahoo.com	2			31
-- 10	Joy			joy@f.com		3			34
-- 11	Andrew		a@f.com			1			40

Alter table tblperson
add constraint CK_tblperson_Age
check (Age <= 100 AND Age > 0) 

Update tblperson
Set Age = 999 where ID = 7
-- Error: The UPDATE statement conflicted with the CHECK constraint "CK_tblperson_Age". 
-- The conflict occurred in database "Organisation", table "dbo.tblperson", column 'Age'.

Update tblperson
Set Age = 84 where ID = 7
-- Happily accepts

Select * from tblperson
-- ID	Name		EmailID			GenderID	Age
-- 1	Russell		r@r.com			1			38
-- 2	Karan		k@j.com			3			25
-- 3	Sara		sara@s.com		2			23
-- 4	James		j@j.com			NULL		43
-- 5	Rahul		kl@rahul.com	NULL		28
-- 6	McCullum	mc@srh.com		NULL		45
-- 7	Raja		raja@csp.com	3			84
-- 8	Todd		t@t.com			NULL		26
-- 9	Ben			Ben@yahoo.com	2			31
-- 10	Joy			joy@f.com		3			34
-- 11	Andrew		a@f.com			1			40

-- Designer
-- Database --> Tables --> Specific table --> Constraints(RC) --> New Constraint -->Insert Exp and name of constraint --> OK --> Save