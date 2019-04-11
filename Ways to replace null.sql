-----------------------------------------------
--- Different ways to replace Nulls
-----------------------------------------------

-- 1. isnull()
-- 2. case statement
-- 3. coalesc()

-- Given table
Select * from tblemp
-- Employee Id	Name	Manager Id
-- 1			Mike	3
-- 2			Rob		1
-- 3			Todd	NULL
-- 4			Ben		1
-- 5			Sam		1

-- result after self join
Select E.Name as Employee,M.Name as Manager
from tblemp E
left join tblemp M
on E.[Manager Id] = M.[Employee Id]
-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Todd		NULL
-- Ben		Mike
-- Sam		Mike

-- But the desired result is
-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Todd		No manager
-- Ben		Mike
-- Sam		Mike

-- In this case we can replace the nulls in 3 ways

---------------------------------------------------------
-- 1. isnull()
---------------------------------------------------------

Select E.Name as Employee,isnull(M.Name,'No Manager') as Manager
from tblemp E
left join tblemp M
on E.[Manager Id] = M.[Employee Id]
-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Todd		No Manager
-- Ben		Mike
-- Sam		Mike

--------------------------------------------------------------
-- 2. case statement
--------------------------------------------------------------

Select E.Name as Employee,
	case
		when M.Name is null then 'No Manager' else M.Name
	end
	as Manager
from tblemp E
left join tblemp M
on E.[Manager Id] = M.[Employee Id]

-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Todd		No Manager
-- Ben		Mike
-- Sam		Mike

--Syntax for case

-- CASE
-- 	WHEN expression Then ' ' else ' '
-- END

----------------------------------------------------------
-- 3. Coalesce()
----------------------------------------------------------

Select E.Name as Employee,coalesce(M.Name,'No Manager') as Manager
from tblemp E
left join tblemp M
on E.[Manager Id] = M.[Employee Id]
-- Employee	Manager
-- Mike		Todd
-- Rob		Mike
-- Todd		No Manager
-- Ben		Mike
-- Sam		Mike

