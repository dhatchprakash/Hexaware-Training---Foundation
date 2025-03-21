create database Employees;
use Employees;

create table employees (
    employeeid int primary key,
    firstname nvarchar(50),
    lastname nvarchar(50),
    dateofbirth date,
    hiredate date,
    salary decimal(10,2),
    department nvarchar(50)
);

insert into employees (employeeid, firstname, lastname, dateofbirth, hiredate, salary, department) 
values 
(1, 'sam', 'lee', '1990-05-10', '2015-09-20', 75000, 'it'),
(2, 'mia', 'kim', '1993-12-15', '2018-06-12', 60000, 'hr'),
(3, 'tom', 'ray', '1985-08-25', '2010-04-05', 110000, 'finance'),
(4, 'eva', 'fox', '1998-03-30', '2022-01-10', 45000, 'marketing'),
(5, 'ben', 'jay', '1992-07-18', '2016-11-25', 85000, 'sales');


select 
    employeeid,lastname + ', ' + firstname as fullname
from employees;

select 
    employeeid,lastname + ', ' + firstname as fullname,
    datediff(year, dateofbirth, getdate()) as age
from employees;

select 
    employeeid, lastname + ', ' + firstname as fullname,
    datediff(year, hiredate, getdate()) as yearsofservice
from employees;



select 
    employeeid,lastname + ', ' + firstname as fullname,salary,
    case 
        when salary < 50000 then 'low'
        when salary between 50000 and 100000 then 'medium'
        else 'high'
    end as salarycategory
from employees;


select 
    employeeid,lastname + ', ' + firstname as fullname,hiredate,
    datename(month, hiredate) as joiningmonth
from employees;
