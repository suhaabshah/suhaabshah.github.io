--Q1
select distinct(CustomerID) from Orders O
where O.OrderID in (select OrderID from [Order Details] OD where OD.ProductID in (select ProductID from Products where UnitPrice>(SELECT AVG(UnitPrice) FROM Products)))


--Q2
select C.ContactName from Customers C where C.CustomerID in 
(select O.CustomerID from Orders O where O.OrderID in 
(select OD.OrderID from [Order Details] OD where OD.ProductID in 
(select P.ProductID from Products P where P.CategoryID in  (select CategoryID from Products where ProductName='Chai'))))

--Q3
select TOP 1 C.ContactName, (select count(O.CustomerID) from Orders O) as NoOfOrders from Customers C 
order by NoOfOrders DESC


--Q4
select distinct(C.ContactName) from Customers C where C.CustomerID in 
(select O.CustomerID from Orders O where O.OrderID in 
(select OD.OrderID from [Order Details] OD where OD.UnitPrice in 
(select TOP 1 OD.UnitPrice from [Order Details] OD order by OD.UnitPrice DESC)))

--Q5
select avg(Nofproducts) as AverageProductsPerOrder from 
(select count(ProductID) as Nofproducts, OrderID from [Order Details] group by OrderID) as averagee

--Q6
select distinct(C.CategoryName) from Categories C where C.CategoryID in 
(select P.CategoryID from Products P group by CategoryID having avg(UnitPrice)>(select avg(UnitPrice) from Products))

--Q7
select TOP 1 ProductName,UnitPrice from Products where UnitPrice in (select TOP 2 UnitPrice as UP from Products order by UP desc)
order by UnitPrice ASC

--Q8
select avg(total) as AverageOrderAmount from 
(select C.CustomerID, (select sum(OD.Quantity*OD.UnitPrice) from [Order Details] OD where OD.OrderID in
(select O.OrderID from Orders O where O.CustomerID=C.CustomerID))as total from Customers C where C.Country='France') as Customers
