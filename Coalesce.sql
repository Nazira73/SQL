--------------------------------------
--- Coalesce()
----------------------------------------

-- Returns the first non-null values

Select Coalesce(null,6,1,3) ------------------- 6
Select Coalesce(10,null) --------------------- 10
Select Coalesce(null,null,1,null,3) ---------- 1