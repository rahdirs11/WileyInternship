USE mthree_june;

SHOW tables;

SELECT * FROM uk_customers LIMIT 50;

DELETE FROM uk_customers WHERE
	name like 'A%';

SELECT * FROM uk_customers WHERE 
	name like 'A%';

UPDATE uk_customers SET name='Sridhar', surname='N S'
	WHERE `Customer ID`=1;
	
SELECT * FROM uk_customers WHERE `customer id`=1;

UPDATE uk_customers SET 
	region='Others' WHERE region='England';

-- delete vs truncate
-- with delete we can use where clause



CREATE TABLE test (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    name VARCHAR(50));


ALTER TABLE test AUTO_INCREMENT=15;

INSERT INTO test (name) VALUES ('Sridhar'), ('Silpa');

SELECT * FROM test;

SELECT balance AS 'Balance', balance * 0.1 AS 'Dedcuted' 
	FROM uk_customers;
    
SELECT *, CASE
	WHEN balance > 100000 THEN "Gold"
	ELSE "Silver"
    END AS 'Category'
    FROM uk_customers;

-- DDL -> modifying the schema of table
--			-> alter, create. drop, truncate, drop

-- DML -> insert, update, delete, truncate




















DELETE FROM uk_customers WHERE `customer id`=1;


