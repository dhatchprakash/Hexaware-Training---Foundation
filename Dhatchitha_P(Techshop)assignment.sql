-- Create Database
CREATE DATABASE TechShop;
USE TechShop;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);
-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL
);
-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT NOT NULL,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Customers Data
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Arun', 'Kumar', 'arun.k@email.com', '9178451236', 'Gandhi St, Chennai'),
('Priya', 'Rajan', 'priya.r@email.com', '8296745103', 'Anna Nagar, Madurai'),
('Vignesh', 'Selvam', 'vignesh.s@email.com', '9845123769', 'MG Road, Coimbatore'),
('Lakshmi', 'Murugan', 'lakshmi.m@email.com', '7365982140', 'Kamaraj St, Trichy'),
('Suresh', 'Nadar', 'suresh.n@email.com', '8974512360', 'Temple Rd, Salem'),
('Divya', 'Pillai', 'divya.p@email.com', '9283746510', 'Bazaar St, Erode'),
('Karthik', 'Gopal', 'karthik.g@email.com', '7812459630', 'Station Rd, Vellore'),
('Anjali', 'Vasan', 'anjali.v@email.com', '8496321570', 'Raja St, Tirunelveli'),
('Mohan', 'Ravi', 'mohan.r@email.com', '9654123870', 'Perumal St, Thanjavur'),
('Rekha', 'Sankar', 'rekha.s@email.com', '7321984560', 'Beach Rd, Tuticorin');
select * from Customers;

SET IDENTITY_INSERT Products ON;
--Product Data
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(101, 'X Smartphone', 'Latest 5G smartphone', 12000.99),
(102, 'Laptop Pro', 'High-performance laptop', 129999.00),
(103, 'Wireless Earbuds', 'Noise-cancelling earbuds', 300.00),
(104, 'Smart Watch', 'Fitness tracking smartwatch', 1999.00),
(105, '4K TV', '55-inch LED television', 8000.00),
(106, 'Gaming Console', 'Next-gen gaming system', 5000.00),
(107, 'Bluetooth Speaker', 'Portable audio device', 150.00),
(108, 'Tablet', '10-inch multimedia tablet', 7500.00),
(109, 'Digital Camera', '20MP mirrorless camera', 10000.00),
(110, 'Smart Home Hub', 'Home automation controller', 2400.99);
SET IDENTITY_INSERT Products OFF;
select* from Products;


-- Order Data
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-03-01', 12300.99),    -- X Smartphone + Wireless Earbuds
(2, '2025-03-02', 129999.00),   -- Laptop Pro
(3, '2025-03-03', 1999.00),     -- Smart Watch
(4, '2025-03-04', 8150.00),     -- 4K TV + Bluetooth Speaker
(5, '2025-03-05', 12000.99),    -- X Smartphone
(6, '2025-03-06', 7500.00),     -- Tablet
(7, '2025-03-07', 300.00),      -- Wireless Earbuds
(8, '2025-03-08', 8000.00),     -- 4K TV
(9, '2025-03-09', 5000.00),     -- Gaming Console
(10, '2025-03-10', 2400.99);    -- Smart Home Hub
select * from Orders;

-- OrderDetails 
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 101, 1), (1, 103, 1), -- X Smartphone + Wireless Earbuds
(2, 102, 1),              -- Laptop Pro
(3, 104, 1),              -- Smart Watch
(4, 105, 1), (4, 107, 1), -- 4K TV + Bluetooth Speaker
(5, 101, 1),              -- X Smartphone
(6, 108, 1),              -- Tablet
(7, 103, 1),              -- Wireless Earbuds
(8, 105, 1),              -- 4K TV
(9, 106, 1),              -- Gaming Console
(10, 110, 1);             -- Smart Home Hub
select * from OrderDetails;

-- Inventory
INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(101, 50, '2025-03-15'),
(102, 25, '2025-03-15'),
(103, 100, '2025-03-15'),
(104, 75, '2025-03-15'),
(105, 30, '2025-03-15'),
(106, 40, '2025-03-15'),
(107, 80, '2025-03-15'),
(108, 60, '2025-03-15'),
(109, 20, '2025-03-15'),
(110, 90, '2025-03-15');
select * from Inventory;


/*queries*/
-- 1. retrieve the names and emails of all customers
select FirstName, LastName, Email from Customers;

--2. list all orders with their order dates and corresponding customer names.
select Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName from Orders join Customers on Orders.CustomerID = Customers.CustomerID;

--3. Insert a new customer record
insert into Customers (FirstName, LastName, Email, Address) values ('Ramesh', 'Sundar', 'ramesh.s@email.com', '15 Main Rd, Madurai');

--4. Update prices of all products by increasing them by 10%:
update Products set Price = Price * 1.10;

--5. Delete a specific order and its order details (parameterized)
declare @OrderID int = 1; delete from OrderDetails where OrderID = @OrderID; delete from Orders where OrderID = @OrderID;

--6. Insert a new order
insert into Orders (CustomerID, OrderDate, TotalAmount) values (1, '2025-03-20', 50.00);

--7. Update contact information for a specific customer (parameterized)
declare @CustomerID int = 1, @NewEmail varchar(100) = 'new.email@email.com', @NewAddress varchar(200) = '20 New St, Chennai'; update Customers set Email = @NewEmail, Address = @NewAddress where CustomerID = @CustomerID;

--8. Recalculate and update total cost of each order
update Orders
set TotalAmount = coalesce((select sum(Products.Price * OrderDetails.Quantity) from OrderDetails join Products on OrderDetails.ProductID = Products.ProductID where OrderDetails.OrderID = Orders.OrderID), 0.00);

--9. Delete all orders and order details for a specific customer (parameterized)
delete from OrderDetails where OrderID in (select OrderID from Orders where CustomerID = 1);
delete from Orders where CustomerID = 1;

--10. insert a new electronic gadget product into the "products" table
set identity_insert Products on; 
insert into Products (ProductID, ProductName, Description, Price) values (111, 'Smart Speaker', 'Voice-activated audio device', 3500.00); 
set identity_insert Products off;

--11. update the status of a specific order in the "orders" table
ALTER TABLE Orders 
ADD Status VARCHAR(50);
update Orders SET Status = 'Shipped' where OrderID = 105;

--12. Calculate and update the number of orders per customer
alter table Customers add NumberOfOrders int default 0;
update Customers set NumberOfOrders = (select count(*) from Orders where Orders.CustomerID = Customers.CustomerID);





