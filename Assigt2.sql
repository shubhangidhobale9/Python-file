/*Q1) Create   Database Name as Order_Stores_Data */

create database Order_Table
 
create database Stores_Data
use Order_Table

/*Q2) Create two Table names as Orders_Table and Stores_Table */

create table Order_Table(
Order_item varchar(50),
OrderDate Date,
Region Varchar(50),
Rep varchar(50),
Units int,
UnitCost int,
Total_price int,
Order_id int)

select * from Order_Table

create table Store_Table(
Store_id int,
Store_Names varchar(50),
Store_Type char(35),
Assortment int,
Compitition_Distance int,
Month int,
year int,
Promointerval char(35))

 select * from Store_Table

/*Q3) Make Order_Id  Column as Primary Key.*/


alter table Order_Table 
 add Constraint Order_id primary key clustered(Order_id) 

/* Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.*/

insert into Store_Table values ( 11,'Computer','a',35,3456,10,2000,'nov')

/*Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table*/ 

  alter table Order_Table
  add constraint fk_id foreign key(Store_id)
  references Store_Table(store_id)

 
/*Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet*/
select * from Order_Table
update Order_Table
 set Order_item = 'compass'
 where Order_id = 3

 /*Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.*/
  select * from Store_Table

 exec sp_rename 'Store_Table.Assortment','Store_Nos','column'; 

 /*Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.*/

 exec sp_rename'Order_Table.Order_item','Item_name','column'
exec sp_rename'Order_Table.Rep','Customers_name','column'


 /* Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.*/
 select * from Order_Table

 select Total_price  from Order_Table
 order by Total_price asc,UnitCost desc


/*Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.*/


 exec sp_rename'Order_Table.Customers_name','Cus_name','column'
  select * from Order_Table
  select * from Store_Table
 
 select count(Cus_name),Region  
 from Order_Table
 group by Region
 having count(Cus_name)>0

/* Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table */

select sum(Total_price)as [Total_price],
       sum(UnitCost)as [UnitCost]
from Order_Table


/*Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.*/

create view vw_Order_Stores_Table
as
select OrderDate,UnitCost,Store_Type,year FROM Order_Table
JOIN 
Store_Table as Store_Table
ON Order_Table.Order_id = Store_Table.Store_id

/*Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9*/

select Item_name,Region from Order_Table
where Order_id in (4,5,6,9)

/*Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160*/

select year from Store_Table
where Compitition_Distance  in (29910,310,3160)


/*Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400*/


select * from Order_Table

select Item_name,count(Total_price)  from Order_Table
 group by Item_name
 having count(Total_price) > 200 or count(Total_price) < 400 

/* Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.*/

select * from Store_Table
select * from Order_Table

exec sp_rename'Store_Table.Compitition_Distance','CD','Column';
select max(CD)as CD from Store_Table

/*Q18) What is the Total Count of Stores_Type and CD columns*/

select Count(store_Type) from Store_Table
union all
select Count(CD) from Store_Table


/*Q19) Apply the Cross Join in  Orders_Table and Stores_Table.*/

select * from Order_Table
cross join
 Store_Table

 /*DROP both the databases*/

 Drop Table Order_Table




