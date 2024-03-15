--Q1
select ContactName from Customers C
left outer join Orders O on C.CustomerID=O.CustomerID
where OrderID is null

--Q2
select OrderID from [Order Details] OD
inner join Products P on P.ProductID=OD.ProductID
where P.CategoryID in (select P.CategoryID from Products P inner join Categories C on P.CategoryID=C.CategoryID 
where CategoryName  not in ('Meat/Poultry', 'Dairy Products'))

--Q3
select TOP 1 EmployeeID, YEAR(OrderDate) from Orders
where YEAR(OrderDate)=1997

--Q4
select EmployeeID from Employees 
where ReportsTo = (select EmployeeID from Employees where ReportsTo is null)

--Q5
select distinct(ET.EmployeeID) from EmployeeTerritories ET
inner join Territories T on ET.TerritoryID=T.TerritoryID
inner join Region R on R.RegionID=T.RegionID
where R.RegionDescription='Western'

--Q6
select distinct(EmployeeID) from
EmployeeTerritories where TerritoryID in (select TerritoryID from Territories
where RegionID not in (select RegionID from Region where
RegionDescription = 'Western'))

--Q7
select * from Orders where EmployeeID in (select distinct(EmployeeID) from
EmployeeTerritories where TerritoryID in (select TerritoryID from Territories
where RegionID not in (select RegionID from Region where
RegionDescription = 'Western')))


--Q8
select C.ContactName from Customers C where C.Country='USA' union
select S.ContactName from Suppliers S where S.Country='USA'

--Q9
select TOP 1 P.ProductName from Products P
order by P.UnitPrice ASC

--Q10
select EmployeeID,
CASE
WHEN (year(GETDATE()) - YEAR(HireDate)) > 5 then '3'
WHEN (year(GETDATE()) - YEAR(HireDate)) BETWEEN 3 AND 5 THEN '2'
else '1'
end as SeniorityLevel
from Employees;

--Q11
select ProductName,
case
when (UnitPrice)>80 then 'Costly'
when (UnitPrice) between 30 and 80 then 'Economical'
else 'Cheap'
end as Type
from Products;




