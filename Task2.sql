USE master;

CREATE DATABASE EmployeeRecords;

-- 2. Rename EmployeeRecords to HR_Database
ALTER DATABASE EmployeeRecords MODIFY NAME = HR_Database;

--3.Drop HR_Database safely, ensuring no active connections
ALTER DATABASE HR_Database SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS HR_Database;

-- 4) Five commonly used SQL Server data types and use cases
-- INT: Whole numbers for IDs (e.g., CustomerID, EmployeeID)
-- VARCHAR(n): Variable-length strings for names, emails (e.g., FullName, Email)
-- DATE: Dates without time for events (e.g., DateJoined, BirthDate)
-- NVARCHAR(n): Unicode strings for multi-language support (e.g., Address, Comments)
-- DECIMAL(p,s): Precise numbers for financial data (e.g., Salary with 2 decimal places)

-- 5) Create Customers table in master (drop foreign keys and table if they exist)
DECLARE @sql NVARCHAR(MAX) = '';
SELECT @sql += 'ALTER TABLE ' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) + ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + '; '
FROM sys.foreign_keys fk
WHERE fk.referenced_object_id = OBJECT_ID('Customers');
EXEC sp_executesql @sql;
GO

IF OBJECT_ID('Customers', 'U') IS NOT NULL
    DROP TABLE Customers;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateJoined DATE,
    Address VARCHAR(200)
);


INSERT INTO Customers VALUES
(1, 'John Doe', 'john.doe@gmail.com', '123-456-7890', '2018-05-15', '123 Main St, New York'),
(2, 'Sarah Smith', 'sarah.smith@yahoo.com', NULL, '2021-08-22', '456 Oak Ave, Chicago'),
(3, 'James Brown', 'james.brown@hotmail.com', '987-654-3210', '2019-12-10', '789 Pine Rd, Boston'),
(4, 'Emily Davis', 'emily.davis@gmail.com', '555-123-4567', '2022-03-18', '321 Elm St, New York'),
(5, 'David Wilson', 'david.wilson@outlook.com', NULL, '2020-09-30', '654 Cedar Ln, Seattle');

-- 10) Update email for CustomerID = 3
UPDATE Customers
SET Email = 'james.brown2023@hotmail.com'
WHERE CustomerID = 3;

-- 11) Delete customer with CustomerID = 5
DELETE FROM Customers
WHERE CustomerID = 5;

-- 12) Insert multiple records in a single query
INSERT INTO Customers (CustomerID, FullName, Email, Phone, DateJoined, Address)
VALUES
(6, 'Lisa Johnson', 'lisa.j@gmail.com', '444-555-6666', '2023-01-15', '987 Birch St, Chicago'),
(7, 'Mark Taylor', 'mark.t@yahoo.com', NULL, '2017-11-01', '147 Spruce Dr, Boston');


-- Add Age and City columns
ALTER TABLE Customers
ADD Age INT,
    City VARCHAR(50);

-- Update records with Age and City
UPDATE Customers SET Age = 30, City = 'New York' WHERE CustomerID = 1;
UPDATE Customers SET Age = 28, City = 'Chicago' WHERE CustomerID = 2;
UPDATE Customers SET Age = 35, City = 'Boston' WHERE CustomerID = 3;
UPDATE Customers SET Age = 22, City = 'New York' WHERE CustomerID = 4;
UPDATE Customers SET Age = 27, City = 'Chicago' WHERE CustomerID = 6;
UPDATE Customers SET Age = 40, City = 'Boston' WHERE CustomerID = 7;
select * from Customers;
-- 13) Retrieve FullName and Email
SELECT FullName, Email
FROM Customers;

-- 14) Customers who joined after 2020-01-01
SELECT * FROM Customers
WHERE DateJoined > '2020-01-01';

-- 15) Names starting with 'J'
SELECT * FROM Customers
WHERE FullName LIKE 'J%';

-- 16) Phone is NULL
SELECT * FROM Customers
WHERE Phone IS NULL;

-- 17) Filter using IN (CustomerID 1, 3, 7)
SELECT * FROM Customers
WHERE CustomerID IN (1, 3, 7);


-- 18) Distinct email domains
SELECT DISTINCT SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS EmailDomain
FROM Customers;

-- 19) AND and OR together
SELECT * FROM Customers
WHERE (Address LIKE '%New York%' OR DateJoined < '2019-06-01') AND Email IS NOT NULL;


-- 20) DateJoined BETWEEN 2018-01-01 and 2023-12-31
SELECT * FROM Customers
WHERE DateJoined BETWEEN '2018-01-01' AND '2023-12-31';

-- 21) Aliases
SELECT 
    FullName AS 'Customer Name',
    Email AS 'Contact Email',
    c.DateJoined AS 'Join Date'
FROM Customers c;

-- 22) Demonstrate a query that filters using multiple conditions
SELECT * FROM Customers
WHERE Age > 25 AND City = 'Chicago';

-- 23) Analyze filtering queries (simulated)
SELECT *
FROM Customers
WHERE DateJoined > '2020-01-01';
-- Optimization: CREATE INDEX idx_datejoined ON Customers(DateJoined);


