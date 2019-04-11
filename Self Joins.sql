---------------------------------------------------
-- Self Join
---------------------------------------------------

-- Self join is used when we want to join a table with itself

Select * from tblemp
-- Employee Id	 Name	Manager Id
-- 1			 Mike		3
-- 2			 Rob		1
-- 3			 Todd		NULL
-- 4			 Ben		1
-- 5			 Sam		1

-- We want a table containing Employee name and his managers name, Both the information are in the same table so we need to join a table
-- with itself which can be done using self join

Select E.Name as Employee, M.Name as Manager
from tblemp E
left join tblemp M
on E.[Manager Id] = M.[Employee ID]
-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Todd		NULL
-- Ben		Mike
-- Sam		Mike

Select E.Name as Employee, M.Name as Manager
from tblemp E
right join tblemp M
on E.[Manager Id] = M.[Employee ID]
-- Employee	Manager
-- Rob		Mike
-- Ben		Mike
-- Sam		Mike
-- NULL		Rob
-- Mike		Todd
-- NULL		Ben
-- NULL		Sam

Select E.Name as Employee, M.Name as Manager
from tblemp E
inner join tblemp M
on E.[Manager Id] = M.[Employee ID]

-- Employee	Manager
-- Mike	Todd
-- Rob	Mike
-- Ben	Mike
-- Sam	Mike

-- This can also be done using

Select E.Name as Employee, M.Name as Manager
from tblemp E,tblemp M
where E.[Manager Id] = M.[Employee ID]
-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Ben		Mike
-- Sam		Mike

