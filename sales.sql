use SuperMart_DB;

-- CREATE TABLE 
CREATE TABLE SALES
( 
	order_id varchar(255),
	order_date date,
	ship_date date,
	product_id varchar(255),
	customer_id varchar(255),
	sales double precision,
	quantity integer,
	profit double precision

)

CREATE TABLE PRODUCTS
(
	product_id varchar(255),
	product_name varchar(255),
	category varchar(255),
	sub_category varchar(255)
)

--INSERT DATA IN BOTH THE TABLES
insert into SALES VALUES('US-2015-108966', '2015-10-11','2015-10-18','FUR-TA-10000577','SO-20335',957.5775,5,-383.031)
insert into SALES VALUES('US-2015-326789', '2015-11-08','2015-11-09','OFF-ST-10000760','SO-20335',22.368,2,2.5164)
insert into SALES VALUES('US-2015-118983', '2015-11-22','2015-11-26','OFF-AP-10002311','HP-14815',68.81,5,-123.858)
insert into SALES VALUES('US-2015-118983', '2015-11-22','2015-11-26','OFF-BI-10000756','SG-21345',125.789,4,234.23)
insert into SALES VALUES('US-2015-150630', '2015-09-17','2015-09-21','FUR-BO-10004834','TB-21520',3083.43,7,-1665.0522)

insert into PRODUCTS values('FUR-TA-10000577','Chromcraft Bull-Nose Wood Oval Conference Tables & Bases','Furniture', 'Tables')
insert into PRODUCTS values('OFF-ST-10000760','Sterilite Officeware Hinged File Box','Office Supplies', 'Storage')
insert into PRODUCTS values('OFF-AP-10002311','Holmes Odor Grabber','Office Supplies', 'Appliances')
insert into PRODUCTS values('OFF-BI-10000756','GBC Wire Binding Combs','Office Supplies', 'Binders')
insert into PRODUCTS values('FUR-BO-10004834','Bush Mission Pointe Library','Furniture', 'Bookcases')
insert into PRODUCTS values('FUR-CH-10009876','chroma','Furniture','chairs')


-- retrieve all data from SALES and PRODUCT table.
select * from PRODUCTS
select * from SALES 


-- retrieve sales greater than 100 in biggest to smallest order.
select sales from SALES
where sales>100
order by sales desc;

-- retrieve data from sales where ship-date between 2015-09-21 and 2015-11-26
select * from SALES
where ship_date between '2015-09-21' and '2015-11-26';


--retrieve sales between 100 and 500
select * from SALES
where sales between 100 and 500;

--retrieve orderid,productid, sales from SALES ordered in descending order basis 'order_date'
select order_id, product_id, sales from SALES
order by order_date desc

-- retrieve all orders where profit is greater than 0 ordered in descending order basis 'profit' value
select * from SALES
where profit>0
order by profit desc

--aggregations
--retrieve total sales
select sum(sales) as total_sales from SALES;

-- count customers
select COUNT(customer_id) as 'customer count' from SALES

-- avg,min and max
select avg(sales * 0.10) as 'avg value' from sales

select min(sales)as 'minimum sales', max(sales) as 'maximum sales' from SALES
where order_date between '2015-09-21' and '2015-11-26'

-- joins
select * from SALES a
inner join PRODUCTS b
on a.product_id = b.product_id

-- we can see that chroma product did not make any sales.
select a.product_name,a.category,a.sub_category,b.order_date,b.quantity,b.sales
from PRODUCTS a
left join SALES b
on a.product_id=b.product_id


select a.order_date,a.quantity,a.sales , b.product_name, b.category, b.sub_category
from SALES a
right join PRODUCTS b
on a.product_id=b.product_id

select a.order_date,a.quantity,a.sales , b.product_name, b.category, b.sub_category
from SALES a
full join PRODUCTS b
on a.product_id=b.product_id
order by order_date desc

--Data Transformations with built-in functions
select MONTH(order_date) as year, sum(sales)
from SALES
group by MONTH(order_date)
order by MONTH(order_date)

select product_id from SALES
Intersect
select product_id  from PRODUCTS

select product_id from SALES
union
select product_id from PRODUCTS