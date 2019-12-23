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