use mthree_june;

show tables;

describe uk_customers;

select count(*) from uk_customers where 
	balance >= 60000;
    
select * from uk_customers where balance > 100000 and region = 'England' and gender = 'Male';

-- select * from uk_customers where region in ('England', 'Wales');
-- select region, count(*) from uk_customers group by region;
select count(*) 
	from uk_customers 
    where balance is not null;
    
 
 select count(distinct region) 
 from uk_customersz;