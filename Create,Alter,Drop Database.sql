-------------------------
-- Creating a database
-------------------------

-- Query
Create database Sample1

-- Designer
-- Object Explorer --> Databases(RC) --> NewDatabase --> Give Database name --> ok

-- When we create a database following 2 files gets generated
-- 1)   .MDF (Master data file -- contains all actual data)
-- 2)   .LDF (Log data file -- used to recover the database)
-- To view them: Specific database (RC) --> Properties --> Files --> Copy path of database --> Open Run window --> paste the path
-- --> we can see the ldf and mdf files generated

--------------------
-- Rename Database
--------------------

-- Query
-- 1. Using Altertable command
Alter database Sample1 modify name = Sample3

-- 2. using stored procedures 
Execute sp_renamedb Sample2,Sample4

-- Designer
-- Specific Database(RC) --> Rename

--------------------
-- Drop a Database
--------------------

-- Query
Drop Database Sample3

-- Designer
-- Specific_Database(RC) --> Delete

-- Dropping a database deletes MDF and LDF files
-- You cannot drop a database if its currently in use
-- So if other other users are connected then we should put the database in Single user mode and the drop the database

-- 1. 
Use Sample4
Go

Drop Database Sample4
-- Error: Cannot drop database "Sample4" because it is currently in use.

-- 2. Open new session and make use of Sample4 database their --> Now try to drop the Sample4 database,it wont do so since its
-- in use. If we still wish to drop the database then we can first set the database into single user mode

Alter Database Sample4 set single_user with rollback immediate
-- Rollback immediate option will rollback al incomplete transactions and closes the connection to the database
-- Now we can easily drop it
Drop Database Sample4
-- This happily allows us to do so

