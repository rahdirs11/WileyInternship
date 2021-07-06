USE mthree_june;

CREATE TABLE employee2 (
	id INT PRIMARY KEY,
    name VARCHAR(15),
    manager_id INT);
    
INSERT INTO employee2 VALUES
	(1, 'A', 2),
	(2, 'B', 3),
    (3, 'C', 1),
    (4, 'D', 1),
    (5, 'E', 1);

SELECT * FROM employee2;


SELECT e2.name AS `Employee Name`, e1.name AS `Manager Name` FROM
	employee2 e1 INNER JOIN employee2 e2
    ON e1.id = e2.manager_id;



USE superstore;


SELECT 'Total Sales', sum(sales) AS 'Sales' FROM tbl_orders
UNION
SELECT 'Actual Sales', sum(t1.sales)  FROM tbl_orders t1
	INNER JOIN returns t2
    ON t1.`Order id` = t2.`Order id`
UNION
SELECT 'Sales Lost', sum(t1.sales) FROM tbl_orders t1
	LEFT JOIN returns t2
    ON t1.`Order id` = t2.`Order id`
    WHERE t2.`Order Id` IS NULL;


-- making sales negative

UPDATE tbl_orders t1
	INNER JOIN returns t2
    ON t1.`Order Id` = t2.`Order ID`
    SET sales = - sales;

-- delete all the data from tbl_orders which was returned

DELETE tbl_orders FROM tbl_orders
	LEFT JOIN returns r
    ON t1.`Order id` = t2.`Order id`
    WHERE t2.`Order id` IS NULL;


CREATE TABLE names (
	ID INT PRIMARY KEY,
    name VARCHAR(10));

CREATE TABLE age (
	ID INT,
    age INT,
    FOREIGN KEY (ID) REFERENCES names(ID));

INSERT INTO names VALUES 
	(1, 'a'), 
    (2, 'b'), 
    (3, 'c');

INSERT INTO age VALUES 
	(1, 21), 
    (2, 25), 
    (3, 27);

INSERT INTO age VALUES (5, 25);
DELETE FROM age WHERE 
	id=2;

SELECT n.ID AS 'ID', n.name AS 'Name', a.age AS 'Age' FROM names n
	LEFT JOIN age a
		ON n.id = a.id
UNION
SELECT n.ID AS 'ID', n.name AS 'Name', a.age AS 'Age' FROM names n
	RIGHT JOIN age a
		ON n.id = a.id;
	
    
USE superstore;

SHOW TABLES;

CREATE VIEW orders AS
	SELECT * FROM tbl_orders
		WHERE sales > 500;


SELECT * FROM orders;

UPDATE orders 
	SET sales = 200
		WHERE sales < 500;

RENAME TABLE orders TO vw_orders2;

CREATE VIEW customersA AS
	SELECT * FROM tbl_orders 
		WHERE `customer name` LIKE 'A%'
			WITH CHECK OPTION; -- to maintain the where clause integrity

SELECT * FROM customersA WHERE `customer name` LIKE 'S%';

-- smith, 300
INSERT INTO customersA (`Customer name`, Sales)
	VALUES  ('Smith', 300);

-- INDEX

CREATE INDEX ix_order_id ON
	tbl_orders(`row id`)

