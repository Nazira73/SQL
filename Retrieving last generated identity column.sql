----------------------------------------------------------
-- Retrieving last generated identity value
----------------------------------------------------------
-- 1. Scope_identity() -- Same Session Same Scope
-- 2. @@Identity -- Same session any scope
-- 3. Ident_current(Tablename) -- Specific table across any session any scope

------------------------------------
-- Scope_identity() & @@IDENTITY
------------------------------------

Create table test1
(
ID int identity(1,1),
value nvarchar(20)
)

Create table test2
(
ID int identity(1,1),
value nvarchar(20)
)

Insert into test1 values ('x')
Select SCOPE_IDENTITY()           --- 1
Select @@Identity                 --- 1

Insert into test1 values ('xx')
Select SCOPE_IDENTITY()           --- 2
Select @@Identity                 --- 2

-- Both are giving the same value in this case, lets understand difference between

Create trigger trInsert on test1 for Insert
as
Begin
	Insert into test2 values ('YY')
End

Insert into test1 values ('XX')
Select * from test1
Select * from test2
-- ID	value
-- 1	x
-- 2	xx
-- 3	XX

-- ID	value
-- 1	YY

Select scope_identity()         --- 3
Select @@IDENTITY               --- 1

-------------------------
-- Ident_Current()
-------------------------

-- Open a new connection and in new query window
--Insert into Test2 values('Y')
-- Come in previous session
-- Select scope_identity()         --- 3
-- Select @@IDENTITY               --- 1
-- Select ident_current('test2')   --- 2



