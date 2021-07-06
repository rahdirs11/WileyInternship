use logistics22Jun;

-- SHOW INDEX FROM logistics22Jun.customer WHERE Key_name = 'PRIMARY';

-- DESCRIBE status;


-- CREATE DATABASE logistics22Jun;
-- USE logistics;

-- CREATE TABLE employee_details (
-- 	e_id int primary key, 
--     e_name varchar(30), 
--     e_branch varchar(15), 
--     e_designation varchar(40), 
--     e_addr varchar(100),
--     e_cont_no varchar(10));

-- CREATE TABLE membership (
-- 	m_id INT PRIMARY KEY, 
--     start_date TEXT, 
--     end_date TEXT);

-- CREATE TABLE customer (
-- 	c_id INT PRIMARY KEY,
--     c_name VARCHAR(30), 
--     c_email_id VARCHAR(50), 
--     c_cont_no VARCHAR(10), 
--     c_addr VARCHAR(100), 
--     c_type VARCHAR(30), 
--     m_id INT,
--     FOREIGN KEY (m_id) REFERENCES membership(m_id));

-- CREATE TABLE shipment(
-- 	sh_id INT PRIMARY KEY, 
--     sd_content VARCHAR(40), 
--     sd_domain VARCHAR(15), 
--     ser_type VARCHAR(15), 
--     sH_weight VARCHAR(10), 
--     sh_charges VARCHAR(10), 
--     sr_addr VARCHAR(100), 
--     ds_addr VARCHAR(100), 
--     c_id INT(4),
--     FOREIGN KEY(c_id) REFERENCES customer(c_id));
--     
-- CREATE TABLE payment_details (
-- 	payment_id VARCHAR(40) PRIMARY KEY, 
--     amount INT, 
--     payment_status VARCHAR(10),
--     payment_date TEXT, 
--     payment_mode VARCHAR(25), 
--     sh_id INT(6),
--     c_id INT,
--     FOREIGN KEY(sh_id) REFERENCES shipment_details(sH_id),
--     FOREIGN KEY(c_id) REFERENCES customer(c_id));

-- CREATE TABLE status (
-- 	current_status VARCHAR(15), 
--     sent_date text, 
--     delivery_date text, 
--     sh_id INT PRIMARY KEY);

-- CREATE TABLE employee_manages_shipment
-- (
-- Employee_E_ID INT (5),	#Employee ID (Foreign Key)
-- Shipment_SH_ID	VARCHAR (6),	#Shipment ID (Foreign Key)
-- Status_SH_ID VARCHAR (6),	#Shipment_ID from status table (Foreign Key)
-- FOREIGN KEY (Employee_E_ID) REFERENCES employee(emp_ID),
-- FOREIGN KEY (Shipment_SH_ID) REFERENCES shipment(sd_id),
-- FOREIGN KEY (Status_SH_ID) REFERENCES statuses(sh_id)
-- );

-- ==================================================

-- The commands that follow this line are to be used if the datasets were imported!

-- ==================================================

ALTER TABLE customer ADD CONSTRAINT 
PRIMARY KEY (c_id);

ALTER TABLE customer ADD CONSTRAINT 
FOREIGN KEY (m_id) REFERENCES membership(m_id);

-- ==================================================

ALTER TABLE payment_details MODIFY payment_id 
VARCHAR(40);

ALTER TABLE payment_details ADD CONSTRAINT 
PRIMARY KEY (payment_id);

-- ==================================================

ALTER TABLE shipment_details ADD CONSTRAINT 
PRIMARY KEY (sh_id);

ALTER TABLE shipment_details ADD CONSTRAINT
FOREIGN KEY (c_id) REFERENCES customer(C_ID);

-- ==================================================

ALTER TABLE status ADD CONSTRAINT 
PRIMARY KEY (sh_id);

-- ===================================================

ALTER TABLE employee_manages_shipment ADD CONSTRAINT 
FOREIGN KEY (employee_e_id) 
REFERENCES employee_details(e_id);

ALTER TABLE employee_manages_shipment ADD CONSTRAINT 
FOREIGN KEY (shipment_sh_id) 
REFERENCES shipment_details(sh_id);

ALTER TABLE employee_manages_shipment ADD CONSTRAINT 
FOREIGN KEY (status_sh_id) 
REFERENCES status(sh_id);


