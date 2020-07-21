--1. Retrieve all the records from the Employees table.

select * from Employees

--2. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

select FirstName, LastName, Birthdate, Address, City, State
from Employees

--3. Retrieve all the columns from the Tracks table, but only return 20 rows.

select *
from Tracks
limit 20