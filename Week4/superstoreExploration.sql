USE superstore;

SHOW tables;

DESCRIBE people;
DESCRIBE returns;
DESCRIBE tbl_orders;

SELECT * FROM people; -- LIMIT 3;

SELECT count(*) FROM returns;

SELECT count(*) FROM tbl_orders;


SELECT region, sum(sales)
	FROM tbl_orders
		GROUP BY region
	UNION ALL
SELECT 'Total', sum(sales) FROM 
	tbl_orders;

SELECT * FROM tbl_orders;

SELECT `sub-category`, count(*) FROM tbl_orders
	GROUP BY `sub-category`;
SELECT count(`Postal Code`) FROM tbl_orders;


SELECT region, category, sum(sales) FROM 
	tbl_orders GROUP BY region, category
    UNION ALL
SELECT 'Total', '', sum(sales) FROM tbl_orders;

SELECT * FROM tbl_orders
	INNER JOIN returns 
    ON tbl_orders.`Order Id`=returns.`Order Id`;

    
SELECT * FROM tbl_orders WHERE `order id` not in (
SELECT tbl_orders.`order id` FROM tbl_orders
	INNER JOIN returns 
    ON tbl_orders.`Order Id`=returns.`Order Id`);
    

SELECT DISTINCT (`Customer Name`), `Customer ID` FROM tbl_orders 
	INNER JOIN returns
    ON tbl_orders.`order id` = returns.`order id`;


SELECT p.person, count(*) FROM people p 
	INNER JOIN tbl_orders t
    ON p.region = t.region
    INNER JOIN returns r
    ON t.`order id` = r.`order id`
    GROUP BY p.person;
    
SELECT p.person, count(*) FROM people p
	INNER JOIN tbl_orders t
    ON p.region = t.region
    LEFT JOIN returns r
    ON t.`order id` = r.`order id` 
    GROUP BY p.person;