--1. Find all the tracks that have a length of 5,000,000 milliseconds or more
select Count(TrackId)
from Track
where Milliseconds >= 5000000
--How many tracks are returned? [Answer: 2]

--2. Find all the invoices whose total is between $5 and $15 dollars.
select count(DISTINCT i.InvoiceId)
from Invoice as i
where i.Total between 5 and 15
--How many total records there are - enter that number below. -- [Answer: 168]

--3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
select FirstName, LastName, Company, State
from Customer
where State in ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')
--What company does Jack Smith work for? -- [Answer: Microsoft Corp.]

--4. Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
select InvoiceId, InvoiceDate, CustomerId, Total
from Invoice
where CustomerId in (56, 58) AND (Total >= 1.00 and Total <= 5.00)
--What was the invoice date for invoice ID 315? -- [Answer: 10-27-2012]

--5. Find all the tracks whose name starts with 'All'. select t.Name, COUNT(t.Name)
from Track t
where t.Name like 'All%'
--How many total records there are for this query - enter that number below. [Answer: 15]

--6. Find all the customer emails that start with "J" and are from gmail.com.
select c.Email
from Customer c
where c.Email like 'J%gmail.com'
--Enter the one email address returned. [Answer: jubarnett@gmail.com]

--7. Find all the invoices from Brasilia, Edmonton, and Vancouver and sort in descending order by invoice ID.
select i.InvoiceId, i.Total
from Invoice i
where i.BillingCity in ('Brasilia', 'Edmonton', 'Vancouver')
order by i.InvoiceId DESC
--What is the total invoice amount of the first record returned? [Answer: 13.86]

--8. Show the number of orders placed by each customer and sort the result by the number of orders in descending order.
select i.CustomerId , COUNT(i.InvoiceId)
from Invoice i
group by i.CustomerId
order by COUNT(i.InvoiceId) DESC
--What is the number of items bought for the 8th person on this list? [Answer: 7]

--9. Find the albums with 12 or more tracks.
select t.TrackId, t.AlbumId
from Track t
group by t.AlbumId
having COUNT(DISTINCT t.TrackId) >= 12;
--How many total records there are. Enter that number below. [ Answer: 158]