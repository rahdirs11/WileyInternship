Create database Employee_Management;

use Employee_Management;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

select * from Departments;
select * from Employees;





DESCRIBE employees;

-- 1
SELECT LastName AS 'Last Name' FROM employees;

-- 2
SELECT DISTINCT LastName AS 'Last Name (no duplicates)' FROM employees;

-- 3
SELECT * FROM employees WHERE
	LastName = 'Smith';

-- 4
SELECT * FROM employees WHERE
	LastName IN ('Smith', 'Doe');

-- 5
SELECT * FROM employees WHERE
	department=14;
    
-- 6
SELECT * FROM employees WHERE
	department IN (37, 77);

-- 7
SELECT * FROM employees WHERE
	LastName Like 'S%';

DESCRIBE departments;
DESCRIBE employees;
SELECT * FROM departments;
SELECT * FROM employees;

-- 8
SELECT name AS 'Department', sum(budget) AS 'Total Budget' 
	FROM departments GROUP BY name;

-- 9
SELECT department AS 'Dept. Code', count(*) AS 'Count' FROM
	employees GROUP BY department;

-- 10
SELECT e.ssn, e.name, e.lastname, e.department, d.name, d.budget FROM employees e
	INNER JOIN departments d ON
		e.department = d.code;

-- 11
SELECT e.name, e.lastname, d.name, d.budget FROM employees e
	INNER JOIN departments d ON
		e.department = d.code;

-- 12
SELECT e.name, e.lastname, d.name, d.budget FROM employees e
	INNER JOIN departments d ON
		e.department = d.code WHERE d.budget > 60000;

-- 13
SELECT * FROM departments WHERE 
	budget > (
		SELECT avg(budget) FROM departments
    );

-- 14
SELECT name as 'Dept. name' FROM
	employees GROUP BY department HAVING count(*) > 2;
	
-- 15
SELECT name, lastName FROM employees WHERE
	department IN (
		SELECT code FROM departments WHERE 
        budget = 
			(SELECT max(budget) FROM departments WHERE 
				budget NOT IN (
					SELECT max(budget) FROM departments
				)));


-- 16
INSERT INTO departments VALUES 
	(11, 'Quality Assurance', 40000);

-- 17
INSERT INTO employees VALUES
	(847219811, 'Mary', 'Moore', 11);

-- 18
UPDATE departments 
	SET budget = budget * 0.9;

-- 19
UPDATE employees
	SET department = 14
    WHERE department = 77;

-- 20
DELETE FROM employees 
	WHERE department = 14;

-- 21
DELETE FROM employees
	WHERE department IN (
		SELECT code FROM departments WHERE
			budget >= 60000
    );

-- 22 
DELETE FROM employees;