-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    `SELECT ProductName,Categoryname FROM Product as p
        JOIN Category as c ON p.CategoryId = c.Id`
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    `SELECT Id, CompanyName FROM [Order]
        JOIN Shipper ON Shipper.Id = [Order].ShipVia WHERE OrderDate < '2012-08-09';`
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    `SELECT Productname, Quantity  FROM [OrderDetail] as od
        JOIN Product as p ON p.Id = od.ProductId where od.OrderId = 10251 order by ProductName;`
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    `SELECT Id, CompanyName, LastName FROM [Order] as o
        JOIN Customer as c ON o.CustomerId = c.Id, Employee as e ON e.Id = o.EmployeeId;`

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.
    `SELECT Categoryname, Count(CategoryID) as Count FROM Product as p
        JOIN Category as c ON p.CategoryId = c.Id
        Group By CategoryID;`
-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
    `SELECT Distinct OrderID, Count(ProductID) as ItemCount FROM OrderDetail as od
        Group by OrderId;`
