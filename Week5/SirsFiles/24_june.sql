use mthree_june


create table employees(id int primary key, name char(20), manager_id int);



insert into employees values(1,'A',2),(2,'B',3),(3,'C',1),(4,'D',1),(5,'E',1);

#Self Join
#When you join to the same table

select m.name as Employee_Name, e.name as Manager_Name  from employees e
inner join employees m
on e.id=m.manager_id

select a.name as managername, b.name as Name from t1 a, t1 b
where a.ID = b.managerID


use superstore2

select * from tbl_orders


select "Total Sales", sum(sales) as Sales from tbl_orders
union
select "Sales Lost",  sum(sales) from tbl_orders as o
inner join returns r
on o.`order id`=r.`order id`
union
select "Actual Sales",  sum(sales) from tbl_orders as o
left join returns r
on o.`order id`=r.`order id`
where r.`order id` is null


select * from tbl_orders
100 --- -100


update tbl_orders o
set sales=-sales
inner join returns r
on o.`order id`=r.`order id`



update tbl_orders o
inner join returns r 
on o.`order id`=r.`order id`
set sales=-sales




select * from tbl_orders


delete all the data from the tbl_orders which was returned
joins

delete o from tbl_orders o
inner join returns r
on o.`order id`=r.`order id` 


-- Update 
-- Delete 


select * from tbl_orders

use 

create view vw_orders1
as select * from tbl_orders


select * from vw_orders1
where sales >500
-- Alter a view
alter view vw_orders1
as
select * from tbl_orders
where sales>500

select * from vw_orders1








use students

select Name, count(course_id) as Courses from tbl_student s
left join tbl_mapping m
on s.stu_id= m.stu_id
group by name

select * from tbl_student s
left join tbl_mapping m
on s.stu_id= m.stu_id
where m.stu_id is null


select s.* from tbl_student s 
inner join tbl_mapping m where s.stu_id not in
(select stu_id from tbl_mapping) group by s.stu_id;



-- Views

use superstore2

create view vw_orders2
select * from orders

-- Rules to make the Views non updateable
-- 1. Add a distinct clause in the view
-- 2. If you  use some agg functions like sum, min , max etc
-- 3. If you use set operators in the view, the view becomes non updateable
-- 4. If you have used order by, then also the view becomes npon updateable
-- 5. Group by and having -- they also make views non updateable
-- 6. If you have used subqueries in the view, again it gets non updateable


Production Support
L1 -- They dont have edit permissions
L2 -- He passes the ticket to L2
L3 --- Sam will pass to L3


select 

create view vw_orders2
as select * from tbl_orders
where sales >500
with check option;

select * from vw_orders2

select * from tbl_orders
where sales <500

update vw_orders2
set sales =200
where sales<500

select * from vw_orders2


-- drop a view
drop view vw_orders2
#create a view : 
to show the custmers with the name starting with A


create view vw_customers as
select * from tbl_orders
where `customer name` like 'A%'


select * from vw_customers

Smith 300

insert into vw_customers2(`customer name`, sales)
values ('Smit', 300)


select * from tbl_orders
where `customer id` is null


create view vw_customers2 as
select * from tbl_orders
where `customer name` like 'A%'
with check option



select * from tbl_orders



create index  ix_order_id  on tbl_orders(`row id`)

-- You can create as many indexes as you want on th table

-- creating extra indexes are also bad for the performabce

-- Indexinh can be done on multople columns also---


create index ix_test on tbl_orders(category, region desc)

#Indexes
#Clustered and non clustered

#When you create a primary key in the table The clustered gets created
Asc/

#When you work in SQL Server over there you can specify that you want column X as clustered oindex
SQL will sort the data based on the column
One table can have only one clustered index

#non cluseterd Index:
EmpName as non clustered index


#Difference in Clustered and Non Clustered Index:


1. Clustered index are built on the primary key
2. Non clustered can be created on any column

1. Clustered index are large in size
2. Non cluseterd index index are smaller in size

1. Clustered indexes are facte
2. Non clustered are slow

1. A table can have only one clustered index
2. A table can have multiple nin clustered indexes


