-- comparison
SELECT strcmp('Sridhar', 'Shreedhar') AS Result;

-- substring
SELECT substr('I am the best', 3);
SELECT substr('I am the best', 1, (SELECT CHAR_LENGTH("Sridhar ") AS Length));

SELECT substr("I am the best", -4, 4);

-- substring_index - returns the string before the specified delimiter
SELECT substring_index("This is a good day!", " ", 5);

-- concatenation
SELECT concat('Sridhar', '.', 'N', ' ', 'S') AS My_Name;

-- concat_ws
SELECT concat_ws(' ', "N", 'S', 'Sridhar');

USE superstore;
SELECT count(*) FROM names;-- LIMIT 5;
-- SELECT concat_ws("_", (SELECT name FROM names));

-- ======================================================================================
-- NUMERIC FUNCTIONS

-- abs
SELECT abs(-10.5);

-- round
SELECT round(12.9);

SELECT round(sum(sales), 2) AS Sum, round(min(sales), 2) AS Minimum_Sales, round(max(sales), 2) AS Maximum_sales
	FROM tbl_orders;

-- ceil, floor
SELECT ceil(12.1), floor(11.9);


-- rand - random number between 0 to 1
SELECT rand();

-- truncate and round, we can specify the decimal places 

-- Date functions

SELECT curdate();
SELECT substr(monthname(now()), 1, 3);

SELECT hour(curtime());
