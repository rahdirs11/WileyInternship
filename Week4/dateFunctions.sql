USE mthree_june;

DESCRIBE uk_customers;

SELECT * FROM uk_customers WHERE
	balance > 60000 and 
    name LIKE 's%' OR 'A%';

-- date
-- now() picks up the system date and time;    
SELECT now();

SELECT date(now()); -- selects only date
SELECT time(now()); -- selects only time

SELECT curdate(); -- exclusively returns the current date

-- %Y full year
-- %y 2-digit year
SELECT DATE_FORMAT(now(), '%d - %m - %Y') AS 'Date';


-- Union: combine results from multiple tables,
-- matching the datatypes
-- it removes duplicates


-- union all doesnt remove duplicates
CREATE TABLE emp1 (
	id int, e_name varchar(10));

CREATE TABLE emp2 (
	id int, name varchar(10));

INSERT INTO emp1 VALUES 
	(1, 'Sridhar'), (2, 'Ajay'), (3, 'Dave');

INSERT INTO emp2 VALUES 
	(1, 'Neha'), (2, 'Sailusha'), (3, 'Anu');
    
SELECT * FROM emp1 
	UNION
	SELECT * FROM emp2;


-- Joins

SELECT * FROM emp1 
INNER JOIN emp2
on emp1.id=emp2.id;


INSERT INTO emp1 VALUES 
	(4, 'Kevin');

SELECT * FROM emp1 
LEFT JOIN emp2 ON
emp1.id=emp2.id;