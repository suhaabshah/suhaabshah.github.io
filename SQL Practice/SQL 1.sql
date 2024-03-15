/* 1 */
/*Select * from Customers*/

/* 2 */
select OrderID, OrderDate, ShipCity, ShipCountry from Orders

/* 3 */
select OrderID, OrderDate, CustomerID
from Orders
where ShipCountry = 'Brazil'

-- 4
select OrderID, OrderDate, CustomerID
from Orders
where ShipCountry = 'France' or ShipCountry = 'Sweden'

--5
select OrderId, OrderDate, Freight, ShipCountry
from Orders
where (ShipCountry = 'France' or ShipCountry = 'Sweden') and Freight>45

--6
select TitleOFCourtesy + ' ' + FirstName + ' '  + LastName as FullName, Title 
from Employees

--7
select OrderID, OrderDate, ShipName, ShipAddress, ShipCity, ShipCountry 
from Orders
where ShipAddress like '%box%'

--8
select OrderID, CustomerID
from Orders
where CustomerID like 'A%' and CustomerID like '%I'

--9
select FirstName + ' '  + LastName as FullName, HireDate
from Employees
where DATEPART(year, getDate())-DATEPART(year, HireDate) > 10

--10
select OrderID, DATEDIFF(day, OrderDate, ShippedDate) as processing 
from orders

--11
select*
from Customers
where Fax is null

--12
select *
from Products
where QuantityPerUnit like '%box%'
