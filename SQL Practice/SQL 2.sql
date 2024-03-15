--Q1
select count (OrderID) from Orders where YEAR(OrderDate) = 1998  

--Q2
select sum (UnitsInStock) from Products 

--Q3
select sum (UnitPrice*UnitsInStock) from Products

--Q4
select Orders.OrderID, Orders.OrderDate, Products.ProductName from Orders,Products, [Order Details]
where [Order Details].OrderID = Orders.OrderID and [Order Details].ProductID = Products.ProductID

--Q5
select O.OrderID, O.OrderDate, P.ProductName, C.CategoryName from Categories C 
Inner Join Products P on P.CategoryID = C.CategoryID
Inner Join [Order Details] on [Order Details].ProductID = P.ProductID
Inner Join Orders O on [Order Details].OrderID = O.OrderID
where C.CategoryName = 'Beverages'

--Q6
select S.CompanyName, count(P.ProductName) as [No.ofProducts] from Suppliers S
Inner Join Products P on P.SupplierID = S.SupplierID
group by S.CompanyName
order by [No.ofProducts] DESC

--Q7
select S.CompanyName, C.CategoryName, count(*) as [No.ofProducts] , avg(P.UnitPrice) as AveragePrice, sum(P.UnitsinStock) as [Total Units in Stock] from Suppliers S
Inner Join Products P on S.SupplierID = P.SupplierID
Inner Join Categories C on C.CategoryID = P.CategoryID
group by S.CompanyName, C.CategoryName

--Q8
select R.RegionDescription as [Region Description], sum(E.EmployeeID) as [No.ofEmployees] from Employees E
Inner Join EmployeeTerritories on EmployeeTerritories.EmployeeID = E.EmployeeID
Inner Join Territories T on T.TerritoryID = EmployeeTerritories.TerritoryID
Inner Join Region R on R.RegionID = T.RegionID
group by R.RegionDescription
order by [No.ofEmployees] ASC

--Q9
select OrderID, sum((UnitPrice*Quantity)-Discount) as [Total Amount] from [Order Details] 
group by OrderID
order by [Total Amount]

--Q10
select count (*) as [No. Of Products], C.CategoryName
from Suppliers S
Inner join Products P on S.SupplierID = P.SupplierID
Inner join Categories C on P.CategoryID = C.CategoryID
group by C.CategoryName

--Q11
select C.ContactName, S.CompanyName, count(O.OrderID) as [No.ofOrders] from Customers C
Inner join Orders O on O.CustomerID=C.CustomerID
Inner join [Order Details] on O.OrderID = [Order Details].OrderID
Inner Join Products P on [Order Details].ProductID = P.ProductID
Inner join Suppliers S on P.SupplierID = S.SupplierID
group by C.ContactName, S.CompanyName


--Q12
select concat (E.FirstName, ' ', E.LastName) as EmployeeName, YEAR(O.OrderDate) as OrderYear, count (O.OrderID) as [No.ofOrders] 
from Employees E
Inner join Orders O on E.EmployeeID = O.EmployeeID
group by concat (E.FirstName, ' ', E.LastName) , YEAR(O.OrderDate)
order by EmployeeName, OrderYear

--Q13 
select concat (E.FirstName,' ', E.LastName) as EmployeeName, concat (M.FirstName,' ', M.LastName) as ManagerName, count (O.OrderID) as [No.of  orders]
from Employees E
Left Join Employees M on E.ReportsTo = M.EmployeeID
Inner join Orders O on E.EmployeeID = O.EmployeeID
group by concat (M.FirstName,' ', M.LastName), concat (E.FirstName,' ', E.LastName)
order by [No.of  orders]


--Q14
select C.ContactName from Customers C 
Left Outer Join Orders O on O.CustomerID=C.CustomerID
where O.OrderID is null

--Q15
select concat (E.FirstName, ' ', E.LastName) as [E.FullName], Customers.contactName From Employees E
join Customers on 1=1
