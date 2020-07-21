/*1. Pull a list of customer ids with the customer’s full name, and address,
along with combining their city and country together.
Be sure to make a space in between these two and make it UPPER CASE.*/
select c.CustomerId
, c.FirstName || ' ' || c.LastName as Full_Name
, c.Address
, UPPER(c.City || ' ' || c.Country)
from Customers c
--What is the result for CustomerID 16? [Answer: MOUNTAIN VIEW USA]

/*2. Create a new employee user id by combining the first 4 letter of the employee’s first name with the first 2 letters of the employee’s last name.
Make the new field lower case and pull each individual step to show your work.*/
select c.FirstName
, substr(c.FirstName, 1, 4) as FirstNameShort
, c.LastName
, substr(c.LastName, 1, 2) as LastNameShort
, LOWER(substr(c.FirstName, 1, 4) || substr(c.LastName,1,2)) as NewID
from Customers c
--What is the final result for Robert King? [Answer: RobeKi]

/*3. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.*/
select e.LastName,e.FirstName,e.BirthDate,DATE('now') - e.BirthDate as Age,DATE('now') - e.HireDate as Tenure
from Employees e
where Tenure >= 15
order by e.LastName asc
--What is the lastname of the last person on the list returned? [Answer: Peacock]

--4. Profiling the Customers table, answer the following question.
select *
from Customers c
where c.Company is null

/*Are there any columns with null values? Indicate any below. Select all that apply.
 Company
 SAddress
 FirstName
 Phone
 Fax
 Postal Code
*/

--5. Find the cities with the most customers and rank in descending order.
select c.City, count(c.CustomerId)
from Customers c
group by c.City
order by count(c.CustomerId) DESC

/*Which of the following cities indicate having 2 customers?
 Budapest
 Dublin
 London
 Mountain View
 São Paulo
 Frankfurt
*/

--6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
select c.FirstName || c.LastName || i.InvoiceId as NewInvoiceId
from Customers c
left join Invoices i
on c.CustomerId = i.CustomerId
where NewInvoiceId like 'AstridGruber%'
order by c.FirstName, c.LastName, i.InvoiceId

/*Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.
 AstridGruber273
 AstridGruber296
 AstridGruber354
 AstridGruber370
 AstridGruber408
 AstridGruber456
 */