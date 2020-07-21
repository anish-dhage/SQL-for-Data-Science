--1. Using a subquery, find the names of all the tracks for the album "Californication".
select t.Name
from Tracks t
where t.AlbumId = ( select a.AlbumId
from Albums a
where a.Title = 'Californication')
--What is the title of the 8th track? [Answer: Porcelain]

--2. Find the total number of invoices for each customer along with the customers full name, city and email.
select c.CustomerId, c.FirstName, c.LastName, c.City, c.Email, COUNT(i.InvoiceId)
from Customers c join Invoices i
on c.CustomerId = i.CustomerId
Group by c.CustomerId
--what is the email address of the 5th person, František Wichterlová? [Answer: frantisekw@jetbrains.com]

--3. Retrieve the track name, album, artist, and trackID for all the albums.
select t.Name, a.Title, ar.Name, t.TrackId
from Artists ar
inner join Albums a
on ar.ArtistId = a.ArtistId
inner join Tracks t
on a.AlbumId = t.AlbumId
--What is the song title of trackID 12 from the "For Those About to Rock" album? [Answer: Breaking The Rules]

--4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
select mgr.LastName Manager, e.LastName Employee
from Employees e
left join Employees mgr
on e.ReportsTo = mgr.EmployeeId
--Who are the reports for the manager named Mitchell (select all that apply)? [Answer: Callahan, King]

--5. Find the name and ID of the artists who do not have albums.
select a.Title, ar.Name, ar.ArtistId
from Artists ar
left join Albums a
on ar.ArtistId = a.ArtistId
where a.Title is NULL
--Two of the records returned have the same last name. [Answer: Gilberto]

--6. Use a UNION to create a list of all the employee's & customer's first names and last names ordered by the last name in descending order.
select e.FirstName, e.LastName
from Employees e
UNION
select c.FirstName, c.LastName
from Customers c
order by c.LastName DESC
--Determine what is the last name of the 6th record? Enter it below. [Answer: Taylor]

--7. See if there are any customers who have a different city listed in their billing city versus their customer city.
select c.CustomerId, c.FirstName, c.LastName, c.City
from Customers c
join Invoices i
on c.CustomerId = i.CustomerId
where c.City <> i.BillingCity

 --No customers have a different city listed in their billing city versus customer city.
 --3 customers have a different city listed in their billing city versus customer city.
 --8 customers have a different city listed in their billing city versus customer city.
 --17 customers have a different city listed in their billing city versus customer city.