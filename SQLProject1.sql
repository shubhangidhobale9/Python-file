create database EMPLOYEEDETAIL 
USE EMPLOYEEDETAIL

create table EMPOLYEEDETAIL(
employeeid int,
firstname varchar(25),
lastname varchar(25),
salary int,
joiningdate Date,
Department varchar(20),
Gender varchar(25))

insert into  EMPOLYEEDETAIL values (1,'vikas','Ahlawat',600000,'2013-12-02','IT','male'),
(2,'nikita','jain',530000,'2013-3-14','HR','female'),
(3,'Ashish','kumar',1000000,'2013-02-14','IT','male'),
(4,'Nikhil','Sharma',480000,'2013-02-15','HR','male'),
(5,'Anish','kadian',500000,'2013-02-16','paroli','male')


---1) Write a query to get all employee detail from "EmployeeDetail" table
select * from EMPOLYEEDETAIL

---2) Write a query to get only "FirstName" column from "EmployeeDetail" table
select firstname from EMPOLYEEDETAIL
group by firstname 
order by firstname


----3) Write a query to get FirstName in upper case as "First Name".
select UPPER(firstname)
from EMPOLYEEDETAIL

----5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
select firstname+''+ lastname as Name
from EMPOLYEEDETAIL

---6) Select employee detail whose name is "Vikas
select * from EMPOLYEEDETAIL
where firstname='vikas'

---7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
select * from EMPOLYEEDETAIL
where firstname like 'A%'

---9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
select * from EMPOLYEEDETAIL
where firstname like '%a'

---10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
select * from EMPOLYEEDETAIL
where firstname like '(a-p)%'

---11)	 Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
select * from EMPOLYEEDETAIL
where firstname like '(^a-p)%'

---12)	 Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
select * from EMPOLYEEDETAIL
where Gender like '__le'

---13)	 Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
select * from EMPOLYEEDETAIL
where firstname like 'A____'

---14)	 Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
select * from EMPOLYEEDETAIL
where firstname like '%(%)%'

---15)	 Get all unique "Department" from EmployeeDetail table
select Distinct(Department) from EMPOLYEEDETAIL

---16)	 Get the highest "Salary" from EmployeeDetail table.
select max(salary) from EMPOLYEEDETAIL

---17)	 Get the lowest "Salary" from EmployeeDetail table
select min(salary) from EMPOLYEEDETAIL

---18)	 Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
select CONVERT(varchar(20),joiningDate,106) from EMPOLYEEDETAIL


--19)	Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
select CONVERT(varchar(20),joiningDate) from EMPOLYEEDETAIL

---21)	Get only Year part of "JoiningDate"
select DATEPART(YEAR,joiningdate) from EMPOLYEEDETAIL


---22)	Get only Month part of "JoiningDate”
select DATEPART(MONTH,joiningdate) from EMPOLYEEDETAIL

----23)	Get system date\
select Getdate()

---24)	Get UTC date.
select getutcdate()

----a)	Get the first name, current date, joiningdate and diff between current date and joining date in months.
select firstname,GETDATE()[current date],joiningdate,
datediff(mm,joiningdate,getdate()) as[total months]   from EMPOLYEEDETAIL

---25)	Get the first name, current date, joiningdate and diff between current date and joining date in days.
select firstname,getdate()[current date],joiningdate ,
DATEDIFF(dd,joiningdate,getdate()) as[total days]  from  EMPOLYEEDETAIL

---26)	 Get all employee details from EmployeeDetail table whose joining year is 2013
select * from EMPOLYEEDETAIL
where DATEPART(yyyy,joiningdate)= '2013'

---27)	Get all employee details from EmployeeDetail table whose joining month is Jan(1)
select * from EMPOLYEEDETAIL
where DATEPART(mm,joiningdate)='1'

---29)	Get how many employee exist in "EmployeeDetail" table
select count(*) from EMPOLYEEDETAIL


---31. Select only one/top 1 record from "EmployeeDetail" table
select top 1 * from EMPOLYEEDETAIL

---32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select * from EMPOLYEEDETAIL
where firstname in ('vikas','Ashish','nikhil')

---33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
select * from EMPOLYEEDETAIL
where firstname not in ('vikas','Ashish','nikhil')

---34. Select first name from "EmployeeDetail" table after removing white spaces from right side
select RTRIM(firstname) from EMPOLYEEDETAIL

--35. Select first name from "EmployeeDetail" table after removing white spaces from left side
select LTRIM(firstname) from EMPOLYEEDETAIL

---36. Display first name and Gender as M/F.(if male then M, if Female then F)
select firstname,case when Gender='male'then'm'
when Gender='female'then 'f'
end as Gender
from EMPOLYEEDETAIL

----37. Select first name from "EmployeeDetail" table prifixed with "Hello
select 'hello' + firstname from  EMPOLYEEDETAIL


---38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000
select * from EMPOLYEEDETAIL
where salary>600000


--=-39. Get employee details from "EmployeeDetail" table whose Salary less than 700000
select * from EMPOLYEEDETAIL
where salary<700000

---40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
select * from EMPOLYEEDETAIL
where salary between 500000 and 600000




