USE customer_casestudy;

SELECT * FROM customer1;
SELECT * FROM transactions1;
SELECT * FROM prod_cat_info1;

-- 1
SELECT 'customer1' AS 'Table name', count(*) AS 'Row count' FROM customer1
	UNION
SELECT 'transactions1', count(*) FROM transactions1
	UNION
SELECT 'prod_cat_info1', count(*) FROM prod_cat_info1;

-- 2
SELECT count(*) AS 'Returned Transactions' FROM transactions1
	WHERE qty < 0;

-- 3
ALTER TABLE transactions1
	MODIFY tran_date date;

ALTER TABLE customer1
	MODIFY dob date;
    
-- 4
SELECT 'Days' AS 'Duration', datediff(max(tran_date), min(tran_date)) AS 'Count' FROM transactions1
	UNION
SELECT 'Months', round(datediff(max(tran_date), min(tran_date)) / 30, 2) FROM transactions1
	UNION
SELECT 'Years', round(datediff(max(tran_date), min(tran_date)) / 365, 2) FROM transactions1;

-- 5
SELECT prod_cat FROM prod_cat_info1
	WHERE prod_subcat = 'DIY';
    

-- =================================

-- 1
SELECT store_type, count(*) FROM transactions1
	GROUP BY store_type
		ORDER BY 2 DESC
			LIMIT 1;

-- 2
SELECT Gender AS 'Gender', count(*) AS 'Count' FROM customer1
	WHERE gender = 'M'
	UNION
SELECT Gender AS 'Gender', count(*) AS 'Count' FROM customer1
	WHERE gender = 'F';

-- 3
SELECT city_code, count(*) FROM customer1
	GROUP BY city_code
		ORDER BY 2 DESC
			LIMIT 1;

-- 4
SELECT prod_cat, count(*) FROM prod_cat_info1
	WHERE prod_cat = 'Books'
	GROUP BY prod_cat;
    
-- 5
SELECT max(qty) FROM transactions1;

-- 6
SELECT sum(total_amt) FROM transactions1 t1
	INNER JOIN prod_cat_info1 t2
		ON t1.prod_cat_code = t2.prod_cat_code
		WHERE t2.prod_cat IN ('Electronics', 'Books');

-- 7
SELECT cust_id, count(*) FROM transactions1
	WHERE cust_id NOT IN (
		SELECT cust_id FROM transactions1
			WHERE qty < 0
    )
	GROUP BY cust_id
		HAVING count(*) > 10;

SELECT cust_id, count(*) FROM transactions1
	WHERE qty > 0
	GROUP BY cust_id
		HAVING count(*) > 10;
	
-- 8
SELECT sum(t1.total_amt) FROM transactions1 t1
	INNER JOIN prod_cat_info1 t2
		ON t1.prod_cat_code = t2.prod_cat_code AND t1.prod_subcat_code = t2.prod_sub_cat_code
		WHERE t2.prod_cat IN ('Electronics', 'Clothing') 
			AND t1.store_type = 'Flagship store';

-- 9
SELECT t2.prod_subcat AS 'Sub-categories(Electronics)', sum(total_amt) AS 'Amount' FROM transactions1 t1
	INNER JOIN prod_cat_info1 t2
		ON t1.prod_cat_code = t2.prod_cat_code AND t1.prod_subcat_code = t2.prod_sub_cat_code
        WHERE t2.prod_cat = 'Electronics'
			-- AND t1.qty > 0
			AND cust_id IN (
				SELECT customer_id FROM customer1
					WHERE gender = 'M'
            )
			GROUP BY t1.prod_cat_code, t1.prod_subcat_code
		UNION
SELECT '', ''
        UNION
SELECT 'Total', sum(total_amt) FROM transactions1
	WHERE prod_cat_code IN (
		SELECT prod_cat_code FROM prod_cat_info1
			WHERE prod_cat = 'Electronics'
    ) 
		AND 
			-- qty > 0
-- 				AND
					cust_id IN (
						SELECT customer_id FROM customer1
							WHERE gender = 'm'
					);
            
-- 10
SELECT prod_subcat "PRODUCT SUBCATEGORY",
	SUM(T2.total_amt)*100/(SELECT SUM(total_amt) FROM Transactions1) "% REVENUE",
		SUM(if(t2.qty < 0, t2.qty, 0))*(-100) / (SELECT SUM(if(t2.qty < 0, t2.qty * -1, t2.qty))) "% RETURNS"
		FROM
			Transactions1  T2
	INNER JOIN prod_cat_info1 T3 
		ON T2.prod_cat_code = T3.prod_cat_code 
			AND T2.prod_subcat_code = T3.prod_sub_cat_code
		GROUP BY prod_subcat
			ORDER BY 2 DESC
				LIMIT 5;

-- 11
-- SELECT max(tran_date), date_sub(max(tran_date), INTERVAL 1 YEAR) FROM transactions1;
SELECT t1.cust_id, sum(t1.total_amt) FROM transactions1 t1
	INNER JOIN customer1 t2
		ON t1.cust_id = t2.customer_id
        -- age between 25 and 35
        WHERE (datediff(curdate(), t2.dob) / 365) BETWEEN 25 AND 35
			AND t1.tran_date BETWEEN (SELECT max(tran_date) FROM transactions1) AND 
				date_sub((SELECT max(tran_date) FROM transactions1), INTERVAL 30 DAY)
			GROUP BY t1.cust_id;

-- 12
-- returns is negative
-- product category: join on both cat and subcat

SELECT t2.prod_cat, sum(if(t1.qty < 0, (-1) * t1.qty, 0)) FROM transactions1 t1
	INNER JOIN prod_cat_info1 t2
		ON t1.prod_cat_code = t2.prod_cat_code 
			AND T1.prod_subcat_code = T2.prod_sub_cat_code
		WHERE -- (t1.tran_date BETWEEN (SELECT max(tran_date) FROM transactions1) AND 
-- 			date_sub((SELECT max(tran_date) FROM transactions1), INTERVAL 3 MONTH))
			datediff(t1.tran_date, (SELECT max(tran_date) FROM transactions1)) / 30 <= 3
			GROUP BY t2.prod_cat
				ORDER BY sum(if(t1.qty < 0, (-1) * t1.qty, 0)) DESC
					LIMIT 1;

-- 13
SELECT store_type, sum(total_amt), sum(qty) FROM transactions1
	GROUP BY 1 
		ORDER BY 2 DESC, 3 DESC
			LIMIT 1;

-- 14
SELECT t2.prod_cat_code, t2.prod_cat FROM transactions1 t1
	INNER JOIN prod_cat_info1 t2
		ON t1.prod_cat_code = t2.prod_cat_code 
			AND T1.prod_subcat_code = T2.prod_sub_cat_code
		GROUP BY prod_cat
			HAVING avg(t1.total_amt) > (
				SELECT avg(total_amt) FROM transactions1
            );

SELECT count(DISTINCT(prod_cat)) FROM prod_cat_info1;

-- 15
SELECT t2.prod_cat_code 'Category code', t2.prod_cat 'Category Name', avg(t1.total_amt) AS 'Avg. Revenue', 
	sum(t1.total_amt) AS 'Total Revenue' FROM transactions1 t1
	INNER JOIN prod_cat_info1 t2
		ON t1.prod_cat_code = t2.prod_cat_code 
			AND T1.prod_subcat_code = T2.prod_sub_cat_code
		GROUP BY t1.prod_cat_code
			ORDER BY sum(t1.qty) DESC
            LIMIT 0, 5;
	


