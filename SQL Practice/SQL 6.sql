--Q1
create view summary as 
	select distinct(P.ProductName), S.CompanyName, C.CategoryName, P.UnitPrice, (select count(OrderID) from [Order Details] OD where OD.ProductID=P.ProductID) as [NofOrders],(select sum(Quantity) from [Order Details] OD where OD.ProductID=P.ProductID) as Quantity from Products P
	inner join Suppliers S on S.SupplierID=P.SupplierID
	inner join Categories C on C.CategoryID=P.CategoryID
	inner join [Order Details] OD on OD.ProductID=P.ProductID
	
--Q2
create view cust_summary as
	select distinct(E.FirstName +' '+ E.LastName) as Name, (select (M.FirstName +' '+ M.LastName) as Manager from Employees M where E.ReportsTo=M.EmployeeID) as ManagerName, DATEDIFF(YEAR, E.BirthDate, GETDATE()) as Age, DATEDIFF(YEAR, E.HireDate, GETDATE()) as [YearsinComp], (select count(O.OrderID) from Orders O where O.EmployeeID=E.EmployeeID) as [NoOrders] from Employees E
	inner join Orders O on O.EmployeeID=E.EmployeeID
	left outer join Employees M ON E.ReportsTo = M.EmployeeID

--Q3
create procedure OfferDiscount @ProductID int, @Discount float
as 
begin
update Products
set UnitPrice = UnitPrice - UnitPrice*@Discount
where ProductID=@ProductID
end
--b
begin
update [Order Details]
set UnitPrice = (select UnitPrice from [Order Details] inner join Orders O on O.OrderID=[Order Details].OrderID where O.ShippedDate is null)
end

--Q4
create procedure DeleteEmployee @EmployeeID int
as
begin
declare @topmanager int
set @topmanager = (select M.EmployeeID from Employees M where M.ReportsTo is null)
--if @EmployeeID=@topmanager
--break
--else if @EmployeeID in (select EmployeeID from Orders)
--break
if @EmployeeID!=@topmanager AND @EmployeeID not in (select EmployeeID from Orders)
delete from EmployeeTerritories
where EmployeeID=@EmployeeID
if @EmployeeID in (select ReportsTo from Employees)
declare @manager int 
set @manager = (select ReportsTo from Employees where EmployeeID=@EmployeeID)
update Employees
set ReportsTo = @manager
where @EmployeeID=ReportsTo
end

--Q5
create procedure CopyOrder @OrderID int, @CustomerID varchar(30)
as
begin
insert into Orders (OrderID, CustomerID, OrderDate) values (@OrderID, @CustomerID, (select
OrderDate from Orders where OrderID = @OrderID and CustomerID = @CustomerID))
end
