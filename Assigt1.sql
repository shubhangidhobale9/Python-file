
/*1) Create two Databases Name :- Brands , and  Products*/
create database brands

 create database products

 use brands

/* 2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.*/

  create table brands(
  item_id int,
  item_description varchar(50),
  vender_nos int,
  vender_name varchar(50),
  bottle_size int,
  bottle_price int
  )
   select * from brands

  /*3)  After Creating both the tables Add records in that tables (records are available above)*/


   insert into brands values (1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,$9.77 ),
(2,'Daristi Xtabentun',391,'Anchor Distilling (preiss Imports)',750,$14.12 ),
(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,$6.50 ),
(4,'Oak Cross Whisky',305,'Mhw Ltd',750,$25.33) ,
(5,	'Uv Red(cherry) Vodka',	380,'Phillips Beverage Company',200,$1.97), 
(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc',750,$6.37), 
(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,$5.06), 
(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,$23.61)

  delete from brands
  where item_id=2

Create table products(
product_id int,
country varchar(50),
product varchar(50),
units_sold int,
 manufacturingprice int,
saleprice decimal,
grosssales int,
sales int,
cogs int,
profit int,
date date,
monthnumber int,
monthyear varchar(50),
year int,
)

select * from products

/*4) Delete those product having the Units Sold 1618.5 , 888 and 2470.*/


delete from products
where units_sold= 2470
 
/*5) DROP the table and Create it again.*/

 select * from products
drop table products


Create table products(
product_id int,
country varchar(50),
product varchar(50),
units_sold int,
 manufacturingprice int,
saleprice decimal,
grosssales int,
sales int,
cogs int,
profit int,
date date,
monthnumber int,
monthyear varchar(50),
year int,
)

--------------------------------------------------------------------------------------------
/*1) Find the Total Sale Price  and  Gross Sales */
 
 select * from products
select sum(SalePrice)
from products

select sum(grosssales)
from products

/*2) In which year we have got the highest sales*/
  
 select year, max(sales)
from products
group by year

/*3) Which Product having the sales of $ 37,050.00*/

select product from products
where sales=3705000
group by product

/*4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00*/
 
 select * from products

 select country from products
 where profit between 460500 and 2266200
 group by country

/* 5) Which Product Id having the sales of $ 24 , 700.00*/

 select product_id from products
 where cogs=2470000
 group by product_id
 ----------------------------------------------------------------------------------

 /*1) Find the item_description having the bottle size of 750*/

    select * from brands
 select  item_description from brands
 where   bottle_size=750

/*2) Find the vendor Name having the vendor_nos 305 , 380 , 391*/

select vender_name from brands
where  vender_nos=305 


/*3) What is total Bottle_price */

select sum(bottle_price) from brands

/*4) Make Primary Key to Item_id*/

alter table brands
add primary key (item_id)

/*5) Which item id having the bottle_price of $ 5.06*/

select item_id from brands
where bottle_price= 5.00

-------------------------------------------------------------------------

/*1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table */
select * from products
select * from brands
inner join
products
on 
brands.item_id = products.product_id

select * from brands
full outer join
products
on 
brands.item_id = products.product_id


select * from brands
left join
products
on
brands.item_id=products.product_id

/*2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table*/
select * from products

select* from brands
right outer join
products
on 
brands.item_id = products.product_id

select* from brands
cross join
products

/*3) Find the item_description and Product having the gross sales of 13,320.00*/

select brands.item_description,products.product
from brands,products
where grosssales=1332000

/*4) Split the Item_description Column into Columns Item_desc1 and Item_desc2*/


select * from brands
select SUBSTRING(item_description ,1,CHARINDEX(' ',item_description)-1) as item_desc1,
 SUBSTRING(item_description ,CHARINDEX(' ',item_description)+1,LEN(item_description)) as item_desc2
 from brands










