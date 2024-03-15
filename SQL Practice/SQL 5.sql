--Q1
set identity_insert Products ON 
Insert into Products (ProductID , ProductName, CategoryID, UnitPrice) values (2050, 'Mountain Dew', 1, 10)
select * from Products where ProductName = 'Mountain Dew'

--Q2
set identity_insert Products ON 
Insert into Products (ProductID , ProductName, CategoryID, UnitPrice) values (2051, 'Tea', (select CategoryID from Categories where CategoryName='Beverages'), 10)
select * from Products where ProductName = 'Tea'

--Q3
Update Products
set UnitPrice = UnitPrice + 0.25*UnitPrice
where CategoryID = (select CategoryID from Categories where CategoryName='Beverages')
select * from Products

--Q4
Insert into Categories (CategoryName) values ('Drinks')
select * from Categories

--Q5
set identity_insert Products OFF
Insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
select ProductName, SupplierID, (select CategoryID from Categories where CategoryName='Drinks'), QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from Products
where CategoryID=(select CategoryID from Categories where CategoryName='Beverages')
select * from Products

--Q6
Update Products
set CategoryID=(select CategoryID from Categories where CategoryName='Drinks')
where CategoryID = (select CategoryID from Categories where CategoryName='Beverages')
select * from Products

--Q7
--a
delete EmployeeTerritories
where EmployeeID=(select EmployeeID from Employees where FirstName='Nancy' and LastName='Davolio')
--b
insert into EmployeeTerritories (EmployeeID,TerritoryID) 
select (select EmployeeID from Employees where FirstName='Nancy' and LastName='Davolio'), TerritoryID from EmployeeTerritories where EmployeeID=(select EmployeeID from Employees where FirstName='Robert' and LastName='King')


--Q8
Delete Products 
where CategoryID =(select CategoryID from Categories where CategoryName='Seafood') and UnitsInStock<5

--Q9
Delete [Order Details]
where OrderID=(select OrderID from Customers where CustomerID='ALFKI')
Delete Orders
where CustomerID=('ALFKI')

--Q10
Delete [Order Details]
where OrderID in (select OrderID from Orders where MONTH(ShippedDate)=8 and YEAR(ShippedDate)=1997)
Delete Orders
where ShippedDate in (select ShippedDate from Orders where MONTH(ShippedDate)=8 and YEAR(ShippedDate)=1996)

