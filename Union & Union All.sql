--------------------------------------------
-- Union and Union all
--------------------------------------------

-- Used to combine the result set of 2 or more select queries

Select * from tblIndiaCustomers
Select * from tblUKCustomers
-- Id	Name	Email
-- 1	Raj		r@r.com
-- 2	Sam		s@s.com

-- Id	Name	Email
-- 1	Raj		r@r.com
-- 2	Sam		s@s.com

Select * from tblIndiaCustomers
Union
Select * from tblUKCustomers
-- Id	Name	Email
-- 1	Ben		b@b.com
-- 1	Raj		r@r.com
-- 2	Sam		s@s.com
-- Stacks both the tables but Reflects the repeated records only once

Select * from tblIndiaCustomers
Union all
Select * from tblUKCustomers
-- Id	Name	Email
-- 1	Raj		r@r.com
-- 2	Sam		s@s.com
-- 1	Ben		b@b.com
-- 2	Sam		s@s.com
-- Stacks both the table

--Note: Union takes more time as compared to union all as it performs distinct sort to remove duplicates
-- To observe this we can turn on the estimated query execution plan (CTRL + L)

--Note: For union and union all the column list order must be same



