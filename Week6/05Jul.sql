-- stored procedure

USE mthree_june;

DELIMITER //
CREATE PROCEDURE sp_employees()
	BEGIN
		SELECT * FROM employee2;
	END 
//

DELIMITER ;

DROP PROCEDURE sp_employees;

CALL sp_employees();


USE superstore;

DELIMITER //
	CREATE PROCEDURE sp_orders()
    BEGIN
		SELECT t1.* FROM tbl_orders t1
			INNER JOIN returns t2
				ON t1.`order id` = t2.`order id`
                WHERE t2.returned = 'yes';
    END
//

DELIMITER ;

CALL sp_orders();

DELIMITER //
	CREATE PROCEDURE sp_orders2(IN category varchar(20))
	BEGIN
		SELECT * FROM tbl_orders t1
			WHERE t1.category = category;
	END
//
DELIMITER ;

SELECT * FROM tbl_orders;
SELECT DISTINCT category FROM tbl_orders;

CALL sp_orders2('technology');

DELIMITER // 
	CREATE PROCEDURE sp_sales_more_than(IN val INT)
		BEGIN
			SELECT * FROM tbl_orders
				WHERE sales > val;
        END
//

DELIMITER ;

CALL sp_sales_more_than(100);

-- ================================

use mthree_june;
CREATE TABLE exams (
id int(11) NOT NULL auto_increment,
name varchar(15),
exam int,
score int,
PRIMARY KEY (id)
);

insert into exams (name,exam,score) values ('Harry',1,70), ('Harry',2,77), ('Harry',3,71), ('Harry',4,70);

insert into exams (name,exam,score) values ('Rose',1,89), ('Rose',2,87), ('Rose',3,88), ('Rose',4,89);

SELECT * FROM exams;

SELECT name, sum(if(exam = 1, score, null)) AS 'Exam 1',
	sum(if(exam = 2, score, null)) AS 'Exam 2', 
    sum(if(exam = 3, score, null)) AS 'Exam 3',
    sum(if(exam = 4, score, null)) AS 'Exam 4'
		FROM exams
			GROUP BY name;


USE superstore;

SELECT DISTINCT category FROM tbl_orders;

-- pivot
DELIMITER //
	CREATE PROCEDURE sp_sales_by_region_and_category()
		BEGIN
			SELECT region, round(sum(if(category='furniture_new', sales, null)), 2) AS Furnitures, round(sum(if(category='office supplies', sales, null)), 2) AS Office,
				round(sum(if(category='technology', sales, null)), 2) AS Technology FROM tbl_orders
					GROUP BY region;
        END
//
DELIMITER ;

CALL sp_sales_by_region_and_category();

SELECT region, round(sum(if(category='furniture_new', sales, null)), 2) AS Furnitures, round(sum(if(category='office supplies', sales, null)), 2) AS Office,
	round(sum(if(category='technology', sales, null)), 2) AS Technology FROM tbl_orders
		GROUP BY region;

-- SELECT category, sum(sales) FROM tbl_orders
-- 	GROUP BY region;
--     
-- -- 'Furniture_New', '355817.8109999999'
-- -- 'Office Supplies', '503351.985500002'
-- -- 'Office Supplies', '469893.3220000002'
-- -- 'Furniture_New', '589049.3839999993'
