create database EmployeeDetails
use EmployeeDetails

create table EmployeeDetails(
Empid int,
FullName Varchar(50),
Managerid int,
DateOfJoining Date,
City Varchar(50))

select * from EmployeeDetails

create table EmployeeSalary(
Empid int,
Project varchar(50),
Salary int,
Variable int)
select * from EmployeeDetails
select * from EmployeeSalary

/*Q1)SQL Query to fetch records that are present in one table but not in another table.*/

select * from EmployeeDetails 
MINUS
select * from EmployeeSalary

/*Q2)SQL query to fetch all the employees who are not working on any project.*/
select Empid from EmployeeSalary
where Project IS NULL


/*Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.*/
select * from EmployeeDetails
Where DateOfJoining=2020/01/30

/*Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.*/
select * from EmployeeDetails E
Where Exists
(select * from EmployeeSalary S
Where E.Empid= S.Empid);

/*Q5)Write an SQL query to fetch a project-wise count of employees.*/
 select Project,COUNT(Empid) EmpProjectCount
 from EmployeeSalary
 Group by Project

 select * from EmployeeDetails
select * from EmployeeSalary

/*6)Fetch employee names and salaries even if the salary value is not present for the employee.*/
select E.FullName,S.Salary
From EmployeeDetails E
Left Join
EmployeeSalary S
on E.Empid = S.Empid

/*Q7)Write an SQL query to fetch all the Employees who are also managers.*/
select DISTINCT E.FullName
From EmployeeDetails E
Inner Join EmployeeDetails M
on E.Empid = M.Managerid

/*Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.*/
select FullName,Managerid,DateOfJoining,City,COUNT(*)
From EmployeeDetails
Group by FullName,Managerid,DateOfJoining,City
Having COUNT(*)>1

/*Q9)Write an SQL query to fetch only odd rows from the table*/
select * from EmployeeDetails
where MOD (Empid, 2) <>0

/*Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.*/


select * from EmployeeDetails
select * from EmployeeSalary

SELECT  MAX(Salary) from EmployeeSalary
WHERE Salary <>
(SELECT MAX(Salary) from EmployeeSalary)
(SELECT MAX(Salary)as salary from EmployeeSalary)

/*Assignment nos-2*/
/*
Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’*/
select Empid,FullName
from EmployeeDetails
where Managerid=986

/*Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.*/
select DISTINCT(Project)
FROM EmployeeSalary

/*Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.*/

select COUNT(*)
from EmployeeSalary
where Project=p1

/*Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.*/

select Max(Salary)
Min(Salary)
Avg(Salary)
from EmpolyeeSalary


/*Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.*/

select Empid from EmployeeSalary
Where Salary Between 9000 and 15000



select * from EmployeeDetails
select * from EmployeeSalary


/*Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321*/
select FullName,City
from EmployeeDetails
where Managerid=321

/*Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.*/
select Empid,City,Managerid
from EmployeeDetails
Where City='Califormia' and Managerid=321

/*Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.*/

select Empid
from EmployeeSalary
where Project<>p1

/*Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.*/
select Empid,
salary+Variable as TotalSalary
From EmployeeSalary

/*Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.*/
select FullName
From EmployeeDetails
Where FullName like '__hn%'

/*Assignment nos-3*/
/*Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.*/
select Empid from EmployeeDetails
UNION
select Empid from EmployeeSalary

/*Ques.2 Write an SQL query to fetch common records between two tables.*/
select * from EmployeeDetails
INTERSECT
select * from EmployeeSalary

Ques./*. Write an SQL query to fetch records that are present in one table but not in another table.*/

select * from EmployeeDetails
MINUS
select * from EmployeeSalary

/*Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.*/
select Empid From
EmployeeDetails
Where Empid in 
(select Empid from EmployeeSalary)

/*Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.*/

select Empid From
EmployeeDetails
Where Empid not in
(select Empid from EmployeeSalary)


select * from EmployeeDetails
select * from EmployeeSalary

/*Ques.6. Write an SQL query to fetch the employee’s full names and replace the space*/
select REPLACE(FullName,'','_') as Fullname
from EmployeeDetails

/*Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.*/
Select INSTR(FullName,'Snow')
from EmployeeDetails

/*Ques.8. Write an SQL query to display both the EmpId and ManagerId together.*/
select CONCAT(Empid,Managerid) as Newid
from EmployeeDetails

/*Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.*/
select SUBSTRING(FullName,1,CHARINDEX(' ',FullName))as First_Name
from EmployeeDetails

/*Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.*/
select UPPER(FullName),LOWER(City)
From EmployeeDetails

/*Assignment nos-4*/

/*Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.*/
select count(*)
From EmployeeDetails
where FullName='n'

/*Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.*/
UPDATE EmployeeDetails
SET FullName = LTRIM(RTRIM(FullName))

/*Ques.3. Fetch all the employees who are not working on any project.*/
select Empid
From EmployeeSalary
where Project is NULL

/*Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.*/
select FullName
from EmployeeDetails
where Empid in
(select Empid from EmployeeSalary
where Salary between 5000 and  10000)

/*Ques.5. Write an SQL query to find the current date-time.*/
select GETDATE()


/*Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.*/
select * from EmployeeDetails 
where YEAR(DateOfJoining)='2020'\


/*Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.*/
select * from EmployeeDetails E
where Exists
(select * from EmployeeSalary S
where E.Empid = S.Empid)

/*Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.*/
select Project,COUNT(Empid) Empprojectcount
from EmployeeSalary
group by Project
Order by Empprojectcount Desc


select * from EmployeeDetails
select * from EmployeeSalary

/*Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.*/

select E.FullName,S.Salary
From EmployeeDetails E
Left join
EmployeeSalary S
on E.Empid=S.Empid

/*Ques.10. Write an SQL query to join 3 tables.*/
select Column1,Column2
from TableA
Join TableB on TableA.Column3=TableB.Column3
join TableC on TableA.Column4=TableC.Column4


