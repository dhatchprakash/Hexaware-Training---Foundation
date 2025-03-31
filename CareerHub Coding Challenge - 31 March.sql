-- 1. Create Database if it does not exist
if not exists (select * from sys.databases where name = 'CareerHub')
    create database CareerHub;

use CareerHub;

-- 2. Drop Tables if they exist (to avoid conflicts)
if object_id('Applications', 'U') is not null drop table Applications;
if object_id('Applicants', 'U') is not null drop table Applicants;
if object_id('Jobs', 'U') is not null drop table Jobs;
if object_id('Companies', 'U') is not null drop table Companies;

-- 3. Create Companies Table
create table Companies (
    CompanyID int identity(1,1) primary key,
    CompanyName varchar(255) not null unique,
    Location varchar(255) not null
);

-- 4. Create Jobs Table
create table Jobs (
    JobID int identity(1,1) primary key,
    CompanyID int not null,
    JobTitle varchar(255) not null,
    JobDescription text not null,
    JobLocation varchar(255) not null,
    Salary decimal(10,2) check (Salary >= 0),
    JobType varchar(50) not null,
    PostedDate datetime default getdate(),
    constraint FK_Jobs_Company foreign key (CompanyID) references Companies(CompanyID) on delete cascade
);

-- 5. Create Applicants Table
create table Applicants (
    ApplicantID int identity(1,1) primary key,
    FirstName varchar(100) not null,
    LastName varchar(100) not null,
    Email varchar(255) not null unique,
    Phone varchar(20) not null,
    Resume text not null
);

-- 6. Create Applications Table
create table Applications (
    ApplicationID int identity(1,1) primary key,
    JobID int not null,
    ApplicantID int not null,
    ApplicationDate datetime default getdate(),
    CoverLetter text not null,
    constraint FK_Applications_Job foreign key (JobID) references Jobs(JobID) on delete cascade,
    constraint FK_Applications_Applicant foreign key (ApplicantID) references Applicants(ApplicantID) on delete cascade
);


insert into Companies (CompanyName, Location) values
('Google', 'New York'),
('Amazon', 'Seattle'),
('Microsoft', 'London');

select * from Companies;

insert into Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) values
(1, 'Software Engineer', 'Develop cloud applications.', 'New York', 90000, 'Full-time', '2025-03-01'),
(1, 'Data Scientist', 'Analyze large datasets.', 'New York', 85000, 'Full-time', '2025-03-05'),
(2, 'Project Manager', 'Manage international projects.', 'Seattle', 120000, 'Full-time', '2025-03-10'),
(3, 'System Administrator', 'Maintain IT infrastructure.', 'London', 80000, 'Contract', '2025-03-15');

select * from Jobs;

insert into Applicants (FirstName, LastName, Email, Phone, Resume) values
('Amit', 'Sharma', 'amit@xyz.com', '9876543210', 'Resume1'),
('Priya', 'Iyer', 'priya@xyz.com', '9988776655', 'Resume2'),
('Raj', 'Patel', 'raj@xyz.com', '9123456789', 'Resume3');

select * from Applicants;

insert into Applications (JobID, ApplicantID, ApplicationDate, CoverLetter) values
(1, 1, '2025-03-10', 'I am interested in this role.'),
(2, 2, '2025-03-12', 'Looking forward to contributing.'),
(3, 3, '2025-03-15', 'Excited about this opportunity.');


select * from Applications;

-- 5. Count applications for each job (including jobs with no applications)
select j.JobTitle, count(a.ApplicationID) as ApplicationCount 
from Jobs j
left join Applications a on j.JobID = a.JobID
group by j.JobTitle;

-- 6. Retrieve jobs within a salary range
declare @MinSalary decimal = 50000; --Desired minimum salary
declare @MaxSalary decimal = 100000; --Desired maximum salary

select j.JobTitle, c.CompanyName, j.JobLocation, j.Salary
from Jobs j
join Companies c on j.CompanyID = c.CompanyID
where j.Salary between @MinSalary and @MaxSalary;


-- 7. Retrieve job application history for a specific applicant
declare @ApplicantID int = 2; 

select j.JobTitle, c.CompanyName, a.ApplicationDate
from Applications a
join Jobs j on a.JobID = j.JobID
join Companies c on j.CompanyID = c.CompanyID
where a.ApplicantID = @ApplicantID;


-- 8. Calculate the average salary (excluding zero salaries)
select avg(Salary) as AverageSalary
from Jobs
where Salary > 0;


-- 9. Identify the company that posted the most job listings
select c.CompanyName, count(j.JobID) as JobCount
from Companies c
join Jobs j on c.CompanyID = j.CompanyID
group by c.CompanyName
having count(j.JobID) = (
    select max(JobCount)
    from (select count(JobID) as JobCount from Jobs group by CompanyID) as JobCounts
);


-- 10. Find applicants who applied for jobs in 'CityX' and have at least 3 years of experience
alter table Applicants 
add Experience int;

update Applicants 
set Experience = case 
    when ApplicantID = 1 then 5 -- Amit Sharma
    when ApplicantID = 2 then 3 -- Priya Iyer
    when ApplicantID = 3 then 4 -- Raj Patel
    else 0 
end;
update Companies  
set Location = 'CityX'  
where Location = 'Seattle';  

select distinct a.FirstName, a.LastName
from Applications app
join Jobs j on app.JobID = j.JobID
join Companies c on j.CompanyID = c.CompanyID
join Applicants a on app.ApplicantID = a.ApplicantID
where c.Location = 'CityX' and a.Experience >= 3;


-- 11. Retrieve distinct job titles with salaries between $60,000 and $80,000
select distinct JobTitle
from Jobs
where Salary between 60000 and 80000;

-- 12. Find jobs that have not received any applications
select j.JobTitle
from Jobs j
left join Applications a on j.JobID = a.JobID
where a.ApplicationID is null;


-- 13. Retrieve job applicants with companies and positions they applied for
select a.FirstName, a.LastName, c.CompanyName, j.JobTitle
from Applications app
join Jobs j on app.JobID = j.JobID
join Companies c on j.CompanyID = c.CompanyID
join Applicants a on app.ApplicantID = a.ApplicantID;

-- 14. Retrieve companies with the count of jobs they have posted (including those with no jobs)
select c.CompanyName, count(j.JobID) as JobCount
from Companies c
left join Jobs j on c.CompanyID = j.CompanyID
group by c.CompanyName;


-- 15. List all applicants with companies and positions they applied for, including those who have not applied
select a.FirstName, a.LastName, c.CompanyName, j.JobTitle
from Applicants a
left join Applications app on a.ApplicantID = app.ApplicantID
left join Jobs j on app.JobID = j.JobID
left join Companies c on j.CompanyID = c.CompanyID;


-- 16. Find companies that posted jobs with a salary higher than the average salary
select distinct c.CompanyName
from Companies c
join Jobs j on c.CompanyID = j.CompanyID
where j.Salary > (select avg(Salary) from Jobs);

-- 17. Display applicants with a concatenated city and state string
alter table Applicants  
add City varchar(50), State varchar(50);

update Applicants  
set City = 'New York', State = 'NY'  
where FirstName = 'Amit' and LastName = 'Sharma';  

update Applicants  
set City = 'CityX', State = 'CX'  
where FirstName = 'Priya' and LastName = 'Iyer';  

update Applicants  
set City = 'London', State = 'UK'  
where FirstName = 'Raj' and LastName = 'Patel';  

select FirstName, LastName, concat(City, ', ', State) as Location
from Applicants;

-- 18. Retrieve jobs with 'Developer' or 'Engineer' in the title
select * from Jobs
where JobTitle like '%Developer%' or JobTitle like '%Engineer%';


-- 19. Retrieve applicants and jobs they applied for, including those who haven't applied and jobs without applicants
select a.FirstName, a.LastName, j.JobTitle
from Applicants a
full join Applications app on a.ApplicantID = app.ApplicantID
full join Jobs j on app.JobID = j.JobID;


-- 20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience
select a.FirstName, a.LastName, c.CompanyName
from Applicants a
cross join Companies c
where c.Location = 'New York' and a.Experience > 2;
