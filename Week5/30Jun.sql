-- adddate
-- syntax adddate(curdate() or now() or curtime(), INTERVAL value day. month, year, minute, hour etc)

SELECT adddate(now(), INTERVAL 10 minute);
SELECT adddate(curtime(), INTERVAL 1 hour);

-- datediff: difference is given between two dates in terms of days
SELECT datediff('1999-11-08', '1999-08-28');

-- date format
SELECT date_format(curdate(), '%Y');
-- %Y -> full year 4 digit
-- %y -> 2 digit year format 

-- date_sub
SELECT date_sub(curdate(), INTERVAL 20 month);

-- dayname: sunday to saturday
SELECT dayname(curdate());

-- dayofweek: starts from sunday
SELECT dayofweek(curdate());

-- dayofyear
SELECT dayofyear(curdate());

-- extract
SELECT extract(DAY FROM curdate());

-- last day
SELECT last_day(now());

-- localtimestamp
SELECT localtimestamp();

-- minute doesn't work for curdate
SELECT minute(curtime());

SELECT quarter(curtime());
-- SELECT now(), curdate(), hour(curtime());

USE superstore;

-- if 
SELECT *, if (sales > 500, "Great Sales", 'Bad Sales') AS 'Quality' FROM tbl_orders;

-- coalesce: used on columns, returning the first non-null value from a row of values of a selected column
SELECT coalesce(NULL, NULL, 9986884602, 'iamsridhar11@gmail.com') AS First_Point_Of_Contact;

-- current user
SELECT CURRENT_USER AS 'Current User'; 

-- ifnull: gives a specified value for the values of a column, for all the null values of that particular column
SELECT *, ifnull(`postal code`, 'N/A') AS 'Default Postal Code' FROM tbl_orders;

SELECT *, CASE 
	WHEN `Postal Code` IS NULL THEN 'N/A'
    ELSE `Postal Code`
		END AS 'Default Postal Code' FROM tbl_orders;
        
UPDATE tbl_orders
	SET `postal code` = 560043 WHERE `row id` = 1;

-- isnull: returns 1 or 0

-- rank
SELECT *, RANK() OVER (ORDER BY sales DESC) FROM tbl_orders;

-- dense_rank: same values will not skip the rank in case of similar values
-- rank: will skip the rank in case of multiple similar values

-- rank functions: 
	-- partition

SELECT *, RANK() OVER (PARTITION BY category ORDER BY sales ASC) AS 'RANK_' FROM tbl_orders;







USE logistics22Jun;

SHOW TABLES;

SELECT * FROM customer;
SELECT * FROM payment_details;
SELECT * FROM employee_Details;
SELECT DISTINCT c_type FROM customer;
SELECT * FROM status;


DESCRIBE status;

UPDATE status
	SET delivery_date = STR_TO_DATE(delivery_date, '%m/%d/%Y'), sent_date = str_to_date(sent_date, '%m/%d/%Y');


-- Shipment delivery duration, along with employee details, and ranking based on the delivery duration
SELECT t1.sh_id AS 'Shipment Id', ifnull(datediff(t1.delivery_date, t1.sent_Date), 'Not delivered') AS 'Days taken to deliver', 
	dense_rank() OVER (ORDER BY ifnull(datediff(t1.delivery_date, t1.sent_Date), 'Not delivered')) AS 'Rank', t3.*
	FROM status t1 
	INNER JOIN employee_manages_shipment t2
		ON t1.sh_id = t2.shipment_sh_id
        INNER JOIN employee_details t3
			ON t2.employee_e_id = t3.e_id;

UPDATE payment_details 
	SET payment_date = str_to_date(payment_date, "%Y-%m-%d");


SELECT * FROM membership;

-- Customers whose membership has expired
SELECT t1.c_name AS 'Customer Name' FROM customer t1
	INNER JOIN membership t2
		ON t1.m_id = t2.m_id
			WHERE datediff(curdate(), t2.end_date) > 0;

SELECT * FROM employee_details;

-- Count of every designation, in every branch
SELECT count(*), e_branch, e_designation FROM employee_details
	GROUP BY 2, 3
	ORDER BY 2;

-- Count of various payment modes
SELECT count(*), payment_mode FROM payment_details
	GROUP BY payment_mode
    ORDER BY 1;

-- days elapsed since the shipment was sent, for undelivered shipments
SELECT sent_date AS 'Sent Date', datediff(curdate(), sent_date) AS 'Days elapsed' FROM status
	WHERE current_status = 'not delivered'
    ORDER BY 2 DESC;

-- max, min, avg
SELECT 'Maximum amount' AS 'Category', round(max(amount), 2) AS Amount FROM payment_Details
	UNION
SELECT 'Minimum amount', round(min(amount), 2) AS Amount FROM payment_Details
	UNION
SELECT 'Average amount', round(avg(amount), 2) AS Amount FROM payment_Details;