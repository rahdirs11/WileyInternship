USE mthree_june;

CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL
);


DROP TABLE students;
DROP TABLE students_audit;



CREATE TABLE students_audit (
	id INT PRIMARY KEY AUTO_INCREMENT,
    audit VARCHAR(255) NOT NULL
);

DELIMITER //
CREATE TRIGGER tr_afterInsertStudents
	AFTER INSERT ON students
		FOR EACH ROW
			BEGIN
				INSERT INTO students_audit
					VALUES (null, concat("A new student named ", (SELECT name FROM students ORDER BY id DESC LIMIT 1) ," was inserted @", now()));
END //
DELIMITER ;

INSERT INTO students
	VALUES (null, 'Sridhar', 21);

DROP TRIGGER tr_afterInsertStudents;

INSERT INTO students 
	VALUES (null, 'Sridhar', 21);

SELECT * FROM students;
SELECT * FROM students_audit;

DELIMITER //
CREATE TRIGGER tr_beforeInsertStudentsAgeCheck
	BEFORE INSERT ON students
		FOR EACH ROW
			BEGIN
				IF new.age < 0 THEN
					SET new.age = 0;
				END IF;
			END //
DELIMITER ;

INSERT INTO students VALUES
	(NULL, 'Deepak', -21);

UPDATE students
	SET age = 21
		WHERE ID = 2;
        
USE superstore;

DELETE FROM tbl_orders
	WHERE `row id` IS NULL;

SELECT *, row_number() OVER (PARTITION BY category ORDER BY sales ASC) FROM tbl_orders;