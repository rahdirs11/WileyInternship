USE computer_manufactures;

SELECT * FROM manufacturers;

SELECT * FROM products;

-- 1.	Select the names of all the products in the store.
SELECT name AS 'Product Names' FROM products;

--  2.	Select the names and the prices of all the products in the store.
SELECT name AS 'Product Name', price AS 'Price ($)' FROM products;

-- 3.	Select the name of the products with a price less than or equal to $200
SELECT name AS 'Product Name (Price <= $200)' FROM products 
	WHERE price <= 200;

-- 4.	Select all the products with a price between $60 and $120
SELECT name AS 'Product Name' FROM products 
	WHERE price BETWEEN 60 AND 120;

-- 5.	Select the name and price in cents (i.e., the price must be multiplied by 100)
SELECT name AS 'Product Name', price * 100 AS 'Price (cents)' FROM products;

-- 6.	Compute the average price of all the products
SELECT avg(price) AS 'Avg. Of all products' FROM products;

-- 7.	Compute the average price of all products with manufacturer code equal to 2
SELECT avg(price) FROM products WHERE
	manufacturer = 2;

-- 8.	Compute the number of products with a price larger than or equal to $180
SELECT count(*) FROM products WHERE 
	price >= 180;

-- 9.	Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name AS 'Product Name', price AS 'Price($)' FROM products
	WHERE price >= 180
	ORDER BY price DESC, name ASC;
    
-- 10.	Select all the data from the products, including all the data for each product's manufacturer.
SELECT t1.code AS 'Product Code', t1.name AS 'Product name', t1.price AS 'Price ($)', 
	t2.code AS 'Manufacturer Code', t2.name AS 'Manufacturer Name' FROM products t1
    INNER JOIN manufacturers t2
		ON t1.code = t2.code;
        
-- 11.	Select the product name, price, and manufacturer name of all the products.
SELECT t1.name AS 'Product name', t1.price AS 'Price ($)', t2.name AS 'Manufacturer Name'
	FROM products t1 
    INNER JOIN manufacturers t2
		ON t1.code = t2.code;

-- 12.	Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT manufacturer AS 'Manufacturer Code', avg(price) AS 'Avg. Price' FROM products
	GROUP BY manufacturer;

-- 13.	Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT t2.code AS 'Manufacturer', avg(price) AS 'Avg. Price' FROM products t1
	INNER JOIN manufacturers t2
		ON t1.code = t2.code
	GROUP BY manufacturer;

-- 14.	Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT t2.name AS 'Manufacturer' FROM products t1
	INNER JOIN manufacturers t2
		ON t1.code = t2.code
	GROUP BY manufacturer
    HAVING avg(t1.price) >= 150;
    
-- 15.	Select the name and price of the cheapest product.
SELECT name AS 'Product Name', price AS 'Price($)' FROM products
	WHERE price = (
		SELECT min(price) FROM products);
	
-- 16.	Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT t2.name AS 'Manufacturer', t1.name AS 'Product Name', t1.price AS 'Price($)' 
	FROM products t1
	INNER JOIN manufacturers t2
		ON t1.code = t2.code
	GROUP BY t1.manufacturer
    HAVING t1.price = avg(t1.price);

-- 17.	Add a new product: Loudspeakers, $70, manufacturer 2. 
INSERT INTO products VALUES 
	(11, 'Loudspeakers', 70, 2);

-- 18.	Update the name of product 8 to "Laser Printer".
UPDATE products
	SET name = 'Laser Printer'
		WHERE code = 8;

-- 19.	Apply a 10% discount to all products.
UPDATE products
	SET price = price * 0.9;

-- 20.	Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE products 
	SET price = price * 0.9
		WHERE price >= 120;