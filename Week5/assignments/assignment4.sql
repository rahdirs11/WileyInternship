USE CUSTOMERDB;
SELECT * FROM tbl_customer;
SELECT * FROM tbl_house;
SELECT * FROM tbl_order_item;
SELECT * FROM tbl_work_order;
SELECT * FROM tbl_complaint_order;

-- Q1: In order to post welcome letters and user guides to customers, dispatch team need 
--    customer name, address and contact details. Write SQL query to get desired info.

SELECT concat_ws(", ", C.LNAME_CUS, C.FNAME_CUS) AS CUSTOMER_NAME, C.PHONE_CUS, C.EMAIL_CUS, H.* 
	FROM TBL_CUSTOMER C 
    INNER JOIN TBL_HOUSE H 
		ON C.CUST_ID_CUS = H.CUST_ID_HSE
	ORDER BY C.CUST_ID_CUS;


#2-Get the details of customers who HAVE CONNECTIONS in more than one location.
SELECT C.*, COUNT(HOUSE_ID_HSE) AS COUNT FROM TBL_CUSTOMER C 
	INNER JOIN TBL_HOUSE H 
		ON C.CUST_ID_CUS = H.CUST_ID_HSE
	GROUP BY H.CUST_ID_HSE
		HAVING COUNT(HOUSE_ID_HSE) > 1
	ORDER BY 7;

#3-Which are the customers that have not given their house details.
SELECT C.CUST_ID_CUS, C.FNAME_CUS, C.LNAME_CUS FROM TBL_CUSTOMER C 
	LEFT JOIN TBL_HOUSE H 
		ON C.CUST_ID_CUS = H.CUST_ID_HSE
	WHERE H.CUST_ID_HSE IS NULL;

#4-Get the install dates corresponding to all customers in different locations.
SELECT C.*, HOUSE_ID_WO , COMPL_DTE_WO AS 'INSTALLATION DATE' FROM tbl_work_order WO 
	INNER JOIN tbl_customer C 
		ON WO.CUST_ID_WO = C.CUST_ID_CUS
	WHERE WO.TYPE_WO = 'INSTALL'
	GROUP BY CUST_ID_WO, HOUSE_ID_WO
	ORDER BY CUST_ID_WO;

-- Q5: Get the location details along with count of services installed in the location.
SELECT H.*, COUNT(*) AS 'NUMBER OF SERVICES INSTALLED' FROM tbl_work_order W 
	INNER JOIN TBL_HOUSE H ON W.HOUSE_ID_WO = H.HOUSE_ID_HSE
	WHERE W.TYPE_WO = 'INSTALL'
	GROUP BY H.HOUSE_ID_HSE;

-- Q6: Get the customer name and contact details of the customers along with other info

SELECT H.*, C.*, COUNT(*) AS 'NUMBER OF SERVICES INSTALLED' FROM tbl_work_order W 
	INNER JOIN TBL_HOUSE H 
		ON W.HOUSE_ID_WO = H.HOUSE_ID_HSE
	INNER JOIN TBL_CUSTOMER C 
		ON C.CUST_ID_CUS = W.CUST_ID_WO
	WHERE W.TYPE_WO='INSTALL'
	GROUP BY H.HOUSE_ID_HSE;

-- Q7: Location details where install orders are in open state.
SELECT H.*, W.STATUS_WO FROM tbl_work_order W 
	INNER JOIN TBL_HOUSE H 
		ON W.HOUSE_ID_WO = H.HOUSE_ID_HSE
	WHERE W.STATUS_WO='OPEN';

-- Q8- Are their any customers who have made a complaint more than once? Get the cust details as well.
-- YES
SELECT C.* FROM tbl_customer C 
	INNER JOIN tbl_complaint_order CO 
		ON C.CUST_ID_CUS = CO.CUST_ID_CO
	GROUP BY CO.CUST_ID_CO
		HAVING COUNT(CO.ORD_ID_CO) > 1;