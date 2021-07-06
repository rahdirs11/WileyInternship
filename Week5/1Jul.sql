USE superstore;

SELECT * FROM tbl_orders;

SELECT category AS 'Category', concat(round(100 * (sum(sales) / (SELECT sum(sales) FROM tbl_orders)), 2), '%') AS 'Percentage' FROM tbl_orders 
	GROUP BY category;

