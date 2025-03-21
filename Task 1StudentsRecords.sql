CREATE DATABASE StudentRecords;

--2. Rename StudentRecords to UniversityRecords
ALTER DATABASE StudentRecords MODIFY NAME = UniversityRecords;
USE master;

-- 3. Delete UniversityRecords database safely
DROP DATABASE IF EXISTS UniversityRecords;

--4. Common SQL Server Data Types:
-- INT: Integer data type (4 bytes).
-- BIGINT: Large integer data type (8 bytes).
-- SMALLINT: Small integer (2 bytes).
-- TINYINT: Very small integer (1 byte).
-- DECIMAL(p, s) / NUMERIC(p, s): Fixed precision and scale numeric values.
-- FLOAT: Approximate floating-point number.
-- CHAR(n): Fixed-length string.
-- VARCHAR(n): Variable-length string.
-- TEXT: Large variable-length string (deprecated, prefer VARCHAR(MAX)).
-- DATE: Stores date values only.
-- DATETIME: Stores date and time values.
-- TIME: Stores time values only.
-- BIT: Boolean-like storage (0 or 1).

create table Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Department VARCHAR(50),
    EnrollmentYear INT
);

-- 6. Add Email column
alter table Students
ADD Email VARCHAR(100);

-- 7. Rename Students to UniversityStudents
EXEC sp_rename 'Students', 'UniversityStudents';

-- 8. Delete UniversityStudents table
DROP TABLE UniversityStudents;

-- Recreate Students table for remaining operations
create table Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Department VARCHAR(50),
    EnrollmentYear INT,
    Email VARCHAR(100)
);

-- 9. Inserting records
insert into Students values
(1, 'John', 'Smith', '2002-05-15', 'Computer Science', 2020, 'john.smith@univ.edu'),
(2, 'GIgi', 'Hadid', '2003-08-22', 'Biology', 2021, 'sarah.j@univ.edu'),
(3, 'Zayn', 'Malik', '2001-12-10', 'Computer Science', 2019, 'mike.b@univ.edu'),
(4, 'Emily', 'Dhawn', '2004-03-18', 'Mathematics', 2022, 'emily.d@univ.edu'),
(5, 'Pat', 'Wils', '2000-09-30', 'Physics', 2018, 'david.w@univ.edu');

-- 10. Update email for specific student
update Students
set Email = 'john.smith2023@univ.edu'
where StudentID = 1;

-- 11. Delete graduated student 
delete from Students
where EnrollmentYear <= 2019;

-- 12. Select names and emails
select FirstName, LastName, Email
from Students;

-- 13. Retrieve students over 18 (as of March 20, 2025)
select * from Students
where DATEDIFF(YEAR, BirthDate, '2025-03-20') > 18;

-- 14. Fetch all records
SELECT * FROM Students;

-- 15. Retrieve Computer Science students
select * from Students
WHERE Department = 'Computer Science';

--16.
select * from Students
WHERE Department IN ('Computer Science', 'Mathematics');

select distinct Department
FROM Students;

select * from Students
WHERE Department = 'Computer Science' AND EnrollmentYear > 2020;

select * from Students
WHERE Department = 'Biology' OR EnrollmentYear = 2022;

select * from Students
WHERE EnrollmentYear BETWEEN 2020 AND 2022;

select * from Students
WHERE FirstName LIKE 'G%';

select 
    FirstName AS 'Given Name',
    LastName AS 'Family Name',
    Email AS 'Contact Email'
from Students;
















