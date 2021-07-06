-- oldest customer age: 64
SELECT max(age) FROM uk_customers;

-- oldest customer region: Scotland
SELECT DISTINCT region FROM uk_customers WHERE age=(
	SELECT max(age) FROM uk_customers);

-- frequency of job classifications of all the oldest customers
SELECT `Job classification`, count(*) FROM uk_customers WHERE age=(
	SELECT max(age) FROM uk_customers)
    GROUP BY `Job classification`;
    
-- frequency of customers in various regions
SELECT region AS 'Location', count(*) AS 'Total Customers' FROM uk_customers 
	GROUP BY region ORDER BY count(*) DESC;

-- number of white collar jobs in each location
SELECT region AS 'Location', count(*) AS 'No. of Blue Collar jobs' FROM uk_customers 
	WHERE `job classification`='white collar' 
    GROUP BY region ORDER BY count(*) DESC;
    
-- number of blue collar jobs in each location
SELECT region AS 'Location', count(*) AS 'No. of Blue Collar Jobs' FROM uk_customers 
	WHERE `job classification`='blue collar' 
    GROUP BY region ORDER BY count(*) DESC;


-- average balance of customers in various regions
SELECT region AS 'Location', avg(balance) AS 'Avg. Balance' FROM uk_customers 
	GROUP BY region ORDER BY avg(balance) DESC;

-- total balance of customers in various regions
SELECT region AS 'Location', sum(balance) AS 'Total Balance' FROM uk_customers 
	GROUP BY region ORDER BY sum(balance) ASC;
    
-- detailis of the customer(s) with highest balance;
SELECT * FROM uk_customers WHERE balance=(
	SELECT max(balance) FROM uk_customers);

-- details of the customer(s) with lowest balance;
SELECT * FROM uk_customers WHERE balance=(
	SELECT min(balance) FROM uk_customers);

-- frequency of customers with balance above the avergae balance
SELECT avg(balance) AS "Avg. Balance", count(*) AS 'Total Customers' FROM uk_customers WHERE balance > (
	SELECT avg(balance) FROM uk_customers);



-- youngest customer
SELECT age, count(age) as 'Frequency' FROM uk_customers WHERE age=(
	SELECT min(age) FROM uk_customers);
    

SELECT age, count(*) FROM uk_customers GROUP BY age ORDER BY age;

select * from uk_customers where age=15;

select age, avg(balance) as avg_balance from uk_customers group by age;

