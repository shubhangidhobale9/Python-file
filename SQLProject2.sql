create database Customers_Orders_Products 
use Customers_Orders_Products 

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
)
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')

  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
)
INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
  (1, 1, 'Product A', '2023-07-01', 5),
VALUES
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1)

  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2))

  INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)

 ----- Task 1 :-
----1.	Write a query to retrieve all records from the Customers table..
select * from Customers

----2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
select Name,Email from Customers
where Name like 'j%'

----3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
select OrderID, ProductName, Quantity from Orders

---4.	Write a query to calculate the total quantity of products ordered.
select  count(Quantity) as total_quantity from Orders

----5.	Write a query to retrieve the names of customers who have placed an order.
select Name from Customers
where 
(select * from Orders)

----6.	Write a query to retrieve the products with a price greater than $10.00.
select price from Products
where price > 10.00

---7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
select C.Name,O.OrderDate from Customers C
inner join
Orders O
on 
C.CustomerID=O.CustomerID
where O.OrderDate >'2023-07-05'

----8.	Write a query to calculate the average price of all products.
select Avg(price) as AVG_price from Products

----9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.
select C.Name,count(O.Quantity) as Total_Qty from Customers as c
inner join
Orders as O
on
C.CustomerID=O.CustomerID
group by C.Name

----10.	Write a query to retrieve the products that have not been ordered.
select  ProductName from products
where  ProductName not in
(select  ProductName from Orders)


----Task 2 :-

----1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
select top 5 C.Name ,O.Quantity from Customers as C
inner join
Orders as O
on
C.CustomerId =O.CustomerId
Order by O.Quantity desc

----2.	Write a query to calculate the average price of products for each product category.
select ProductName, avg(price)as avg_Qty from Products
group by ProductName

---3.	Write a query to retrieve the customers who have not placed any orders.
select C.Name from Customers as C
where not exists
(select 1 from Orders as O
where
C.CustomerID=O.CustomerID)


----4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
select C.Name, OrderID, ProductName, Quantity from Orders as O
inner join
Customers as C
on 
C.CustomerID =O.CustomerID
where Name like 'M%'

----5.	Write a query to calculate the total revenue generated from all orders.
create view vw_revenue
as
select O.OrderId,O.ProductName,O.Quantity from Orders as O
inner join
Products as P
on
O.ProductName = P.ProductName

select *,(Quantity * Price)as sales from vw_revenue
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

-----6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.
create view vw_06
as
select C.CustomerId,C.Name,O.ProductName ,P.Price from Customers as C
inner join
Orders as O
on
C.CustomerID = O.CustomerID
inner join
Products as P
on 
O.ProductName=P.ProductName

select Name,Quantity,Price,(Quantity * Price) as Revenue_from_order from vw_06

---7.	Write a query to retrieve the customers who have placed at least one order for each product category.
select C.CustomerId,C.Name
from Customers C
where not exists (
select P.ProductID
From Products P
where not exists (
select 1
from Orders O
where O.CustomerID=C.CustomerID
and O.ProductName = P.ProductName
) );

select * from Orders
select * from Customers

----8.	Write a query to retrieve the customers who have placed orders on consecutive days.
select C.Name,O.OrderDate from Customers as C
join
Orders as O
on
C.CustomerID=O.CustomerID
where O.OrderDate


-----9.	Write a query to retrieve the top 3 products with the highest average quantity ordered.
select top 3 P.productId, O.ProductName avg( Quantity) from Orders as O
join
Products as P
on 
P.ProductName=O.ProductName
group by P.ProductID,O.ProductName
Order by desc

----10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
select ProductId ,Avg(Quantity) from Orders as O


select * from Customers
select * from Orders
select * from Products

----Task 3:-

----1.	Write a query to retrieve the customers who have placed orders for all products.
select C.Name,O.OrderID,O.ProductName from Customers as C
inner join
Orders as O
on
C.CustomerID = O.CustomerID
group by C.Name,O.OrderID,O.ProductName


----2.	Write a query to retrieve the products that have been ordered by all customers.
select P.ProductId,P.ProductName,O.OrderId from Products as P
inner join
Orders as O
on
O.ProductName=P.ProductName
group by P.ProductId,P.ProductName,O.OrderId


----3.	Write a query to calculate the total revenue generated from orders placed in each month.
select Year(OrderDate) as year,month(OrderDate)
as month, count(Quantity) as count_of_Quantity
from Orders 
group by year(OrderDate),month(OrderDate)

-----4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.
select P.ProductName,

-----5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
select top 5 C.Name,O.Quantity from Customers as C(
select C.CustomerID,O.Quantity,max(x.Quantity) maxamt
from(
select O.OrderID,sum(O.Quantity * P.Price) Quantity
from 


-----6.	Write a query to calculate the running total of order quantities for each customer.
select C.Name,C.CustomerId,count(O.Quantity) as Total_Order_Qty from Customers as C
inner join
Orders as O
on
C.CustomerId = O.CustomerID
group  by C.Name,C.CustomerId,O.Quantity

-----7.	Write a query to retrieve the top 3 most recent orders for each customer.
select top 3 C.Name, C.CustomerId,O.OrderDate from Customers as C
inner join
Orders as O
on 
C.CustomerId=C.CustomerId
group by C.Name, C.CustomerId,O.OrderDate

---8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.
select C.Name,O.OrderDate,sum(C.CustomerId) [net total revenue]
from customers as  C 
inner join
Orders as O 
on
C.CustomerId=O.CustomerId
where OrderDate >= 


----9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.



----10.	Write a query to calculate the average revenue per order for each customer.
select C.Name ,O.CustomerId,avg(Quantity) as avg_Quantity from Customers as C
inner join
Orders as O
on
C.CustomerId=O.CustomerId
group by C.Name ,O.CustomerId,Quantity

---11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.
select C.CustomerId,C.Name, O.OrderDate from Customers As C
inner join 
Orders as O
on
C.CustomerID=O.CustomerID
group by  C.CustomerId,C.Name, O.OrderDate


----12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
select C.CustomerID,C.name,O.OrderDate,O.ProductName COUNT(O.OrderID)
from Customers as C
cross join date
left outer join Orders as O
on C.CustomerId=O.CustomerId
and month(date.date) = month(Orders .date)
where date.date between startdate and enddate
group by  C.CustomerID,C.name,O.OrderDate,O.ProductName
 
13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.

