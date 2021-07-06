
Select
distinct 
from
joins
where
group by 
having
order by 
limit




-- DML commands
-- Data Manipulation Language
-- insert --- Adding new records in the table
-- delete --- deleteing the rows from the table
-- update ---- modify any of the existing records 

-- DDL or DML
-- Truncate ---- deleting all the wors from the table


use mthree_june


select * from uk_customers
where 
all the column

delete  from uk_customers
-- You cannot retrieve 
Data will be deleted not the table


delete from uk_customers
where `customer id`=300000004

-- we should always check the data that we are going to delete
select * from uk_customers
where `customer id`=300000004


-- delete the data of customers whose name is starting with A

select * from uk_customers


update Tbname
set coulumnName=value
where 
select * from uk_customers


update uk_customers
set region='England'
where `customer id`= 400000002


-- Write a query to update the region England with 'England and others'


UPDATE UK_CUSTOMERS
SET REGION = 'ENGLAND AND OTHERS' 
where region='england'

update


select * from uk_customers

delete 


update u

--TCL command

start transaction;
 delete from uk_customers
 
 
 
 commit/ rollback
 
 select * from uk_customers
 
 -- update Wales ---- Waled Region 
 
 start transaction;
 update uk_customers
 set region='Wales Region'
 where region='Wales'
 
 rollback
 
 
 -- The TCl commands can only be used with DML commnads
 
 -- Truncate---  
 
 --
 
update uk_customers
set Age=35, region='Scotland'
where `customer id`=300000006
 
 select * from uk_customers
 where  `customer id`=300000006
 
 
 -- Truncate 
 
 -- This is a command that delete the complete from the table
 
 
 select * from students
 
 truncate table students
 
 -- Truncate is a permanent command
 select * from students
 
 
 
-- Delete vs Truncate
With delete you can use where clause
Not with Truncate

TCL commands can be usdd on the delete but not on the truncate

Truncate is faster than Delete
Trucate commad resest the auto_increment column whereas the delete cannot
-- Identity columns

SQL server identity(1,5)

create table test2
(ID int not null auto_increment, Faculty_name char(20),
 primary key (id)) 
 
 alter table test2
 auto_increment=10
 
insert into test1(faculty_name)
 values('Ram'),('Shyam')
 
 
 
 delete from test1
 where id=1
 
 select * from test1
 
 insert into test1
 values(null, 'Sam')
 
 
 
 select * from test1
 
 
 delete from test1
 
 
 
 insert into test1
 values(null, 'Sam')
 
 
 truncate table tet1
 
 DDL -- Data Definition Language
 -- It resets of the 
 -- DML
 
 Truncate comes under DDL
 
 -- Select command
 select * ,balance*0.1 from uk_customers
 
 -- case this used to create conditional columns
 
 select *, case 
			when balance>100000 then "Gold"
            else "Silver"
            end as Customer_Category
from uk_customers
 
 
 -- >100000 Gold
 50000-100000 Silver
 <50000 Bronze
 
 1,50,0000 Gold
 75000
 
 select *, case
			when balance >50000 and balance<100000 then "Silver"
            when balance >100000 then "Gold"
            else "bronze"
            end
 from uk_customers      
 limit 10

SQL concepts


MySQL
 
 
 select case
			when balance >50000 and balance<100000 then "Silver"
            when balance >100000 then "Gold"
            else "bronze"
            end as category , count(*)
from uk_customers
group by case
			when balance >50000 and balance<100000 then "Silver"
            when balance >100000 then "Gold"
            else "bronze"
            end
 
 select * from uk_customers
 
 
 DDL --
 
 Create 
 alter
 drop
 truncate
 
 
 create database dbname
 create table tbNAme ( col1, col2)
 
 Alter table
 Add a column
 modify a colum
 change a coluln
 drop
 
 drop
drop database
drop table 

drop table students1



-- DML Commands
 Insert 
 update
 delete
 truncate(A part of DML)
 
 
 -- Select clause 
 where 
 order by 
 limit
 group by
 having
 case 
 
 Asc/desc
 
 custom sorting of the data
 
 
England
Northern Island
 Scotland
 Wales

 
 Wales
 Northern Island
 England
 Scotland
 
 
 select * from uk_customers
 order by (case when region='Wales' then a
			when region='Northern Ireland' then b
            when region=' England and others' then c
            else d end) desc
 
 Question : How do we do the custom sorting of the data
 
 
 
 use superstore2
 select * from tbl_orders
 
 -- 
 
 select region, sum(sales) from tbl_orders
 group by region
 union all 
 select "Total" , sum(sales) from tbl_orders
 
 
 Sales by region and category
 Sales by category
 Total sales 
 order by 
 
 -- -----------------------------------------------------------------------------------------------------------------
 select region, category, sum(sales) as  Total from tbl_orders
 group by region, category

union all

select "Sales by Category", category, sum(sales) from tbl_orders
group by  category

 union all
 select "total", null, sum(sales) from tbl_orders
order by Total desc
 
 --------------------------------------------------------------------------------------------------------------------
 
 
 -- Write a query to fetch the details of orders that were returned
 
 
 select * from tbl_orders t1
 inner join returns t2
 on t1.`order id`=t2.`order id`
 
 
 
 select * from tbl_orders t1
 right join returns t2
 on t1.`order id`=t2.`order id`


select * from tbl_orders t1
 left join returns t2
 on t1.`order id`=t2.`order id`  
 where t2.`order id`  is null
 
 select * from returns
 
 
 -- Write a query to fetch the details of the orders that were not returned
 Fetch the names of the customers who returned any order
 Write a query to fetch the total orders processed under each manager
 Write a query to fetch the orders returned under each manager
 
 
 select * from tbl_orders t1
 left join returns t2
 on t1.`order id`=t2.`order id`
 
 
 select person, count(r.`order id`) from people p
 inner join tbl_orders o
 on p.region= o.region
 inner join returns r on r.`order id`=o.`order id` 
 group by person