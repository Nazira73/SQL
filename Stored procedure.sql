---------------------------------------
-- Stored Procedures
---------------------------------------

-- If you have a situation where you write the same piece of query again and again then you can 
-- save that query as stored procedure and call it just by its name

---------------------------------------------
-- Creating a store procedure
--------------------------------------------
-- Syntax:

--       Create procedure/proc procedure_name
--       as 
--       Begin
--		       Procedure_Body
--       End

Select * from tblemployee
-- ID	Name	Gender	Salary	DepartmentId
-- 1	Jenny	Female	2000	1
-- 2	Todd	Male	4000	3
-- 3	Ben		Male	3400	1
-- 4	Sara	Female	9600	2
-- 5	Pam		Female	2800	2
-- 6	Sam		Male	5400	1
-- 7	Tom		Male	8300	3
-- 8	Harry	Male	3200	1
-- 9	Sweety	Female	8000	NULL
-- 10	Russell	Male	8600	NULL

Create PROC spGetEmployees
as
Begin
	Select Gender,count(Id) as Employee_Count
	from tblemployee
	group by Gender
end

-----------------------------------------------------
-- Calling a stored procedure
-----------------------------------------------------
-- 1. NameOfProcedure
-- 2. Execute NameOfProcedure (preferred almost)
-- 3. Exec NameOfProcedure (preferred almost)
-- 4. DB --> Programmability --> stored procedures --> specific sp(Rc) --> Execute SP


spGetEmployees
-- Gender	Employee_Count
-- Female	4
-- Male	    6

Execute spGetEmployees
-- Gender	Employee_Count
-- Female	4
-- Male		6

Exec spGetEmployees
-- Gender	Employee_Count
-- Female	4
-- Male		6

----------------------------------------------------------------------------
-- Creating stored procedure with input parameters
----------------------------------------------------------------------------

Create procedure spGetEmpByGenderandDept
@Gender nvarchar(20),
@DeptId int
as
Begin
	Select * from tblemployee where Gender = @gender and DepartmentId = @deptId
end

spGetEmpByGenderandDept 'Male',1
-- ID	Name	Gender	Salary	DepartmentId
-- 3	Ben		Male	3400	1
-- 6	Sam		Male	5400	1
-- 8	Harry	Male	3200	1

spGetEmpByGenderandDept 'Female',1
-- ID	Name	Gender	Salary	DepartmentId
-- 1	Jenny	Female	2000	1

--Note:- The order of passing parameter should be the same as the order in which they were declared. If we want to change the 
--order of passing parameter then we should explicitly mention its name
-- eg.

spGetEmpByGenderandDept @DeptId = 2,@gender = 'Female'
-- ID	Name	Gender	Salary	DepartmentId
-- 4	Sara	Female	9600	2
-- 5	Pam		Female	2800	2

-------------------------------------------------------------------
-- To create stored procedure with output parameter
-------------------------------------------------------------------

Create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int Output
as
begin
	Select @EmployeeCount = count(ID)
	from tblemployee
	where Gender = @Gender
end

------------------------------------------------------------------------
-- To execute sp with output parameter
------------------------------------------------------------------------

-- First declare a variable to hold the output whose data type should match with return data type

Declare @TotalCount int
Exec spGetEmployeeCountByGender 'Male',@TotalCount Out
Print @TotalCount
-- 6

-----------------------------------------------------------------------
-- To view the text of sp
-----------------------------------------------------------------------

-- Designer
-- DB --> programmability --> stored procedure --> specific sp(RC) --> Script stored procedure as --> create to --> New Query Editor window

-- Query (Use system sp ie:- sp_helptext)
sp_helptext spGetEmployeeCountByGender

-- Create proc spGetEmployeeCountByGender  
-- @Gender nvarchar(20),  
-- @EmployeeCount int Output  
-- as  
-- begin  
--  Select @EmployeeCount = count(ID)  
--  from tblemployee  
--  where Gender = @Gender  
-- end
------------------------------------------------------------------------
-- To alter the stored procedure
------------------------------------------------------------------------

-- In the same defination of sp, alter the things required and replace th create keyword with alter
-- eg:-

Alter procedure spGetEmpByGenderandDept
@Gender nvarchar(20),
@DeptId int
as
Begin
	Select * from tblemployee where Gender = @gender and DepartmentId = @deptId
	order by salary
end

spGetEmpByGenderandDept 'Male',1

-- Output pre-change

-- ID	Name	Gender	Salary	DepartmentId
-- 3	Ben		Male	3400	1
-- 6	Sam		Male	5400	1
-- 8	Harry	Male	3200	1


-- Output post-change

-- ID	Name	Gender	Salary	DepartmentId
-- 8	Harry	Male	3200	1
-- 3	Ben		Male	3400	1
-- 6	Sam		Male	5400	1

----------------------------------------------------------
-- Drop a sp
----------------------------------------------------------

-- drop proc procedureName

drop proc spGetEmployees

-------------------------------------------------------------------
-- Encrypting the text of Sp
-------------------------------------------------------------------

-- put 'with Encryption' before 'as' in alter proc
-- Encryption prevents from viewing the text of sp

Alter procedure spGetEmpByGenderandDept
@Gender nvarchar(20),
@DeptId int
with Encryption
as
Begin
	Select * from tblemployee where Gender = @gender and DepartmentId = @deptId
	order by salary
end

Execute sp_helptext spGetEmpByGenderandDept
-- Message:- The text for object 'spGetEmpByGenderandDept' is encrypted.

--------------------------------------------------------------------------
-- Some useful system sp
--------------------------------------------------------------------------

-- 1. sp_help procname (Alt-F1):-
--                  View the information about sp like parameter names, their datatypes etc. It can be used with 
--                  any database object like tables,views,sp's,triggers

-- 2. sp_helptext procname (F5):-
--					View the text of sp

-- 3. sp_depends procname:- 
--                  It helps to check if a sp is referencing a table that we are about to drop. It can also be used with other database objects
