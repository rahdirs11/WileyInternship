USE Assignment2;

SELECT * FROM tbl_course;

SELECT * FROM tbl_mapping;

SELECT * FROM tbl_student;

-- 1) Display student details and the courses they are enrolled to.
SELECT t1.stu_id, t1.name, date(t1.dob), t1.phone_cus, t1.email_cus, t3.course_id, t3.name FROM tbl_student t1
	INNER JOIN tbl_mapping t2
		ON t1.stu_id = t2.stu_id
	INNER JOIN tbl_course t3
		ON t2.course_id = t3.course_id;

-- 2) Display details of all students and the count of courses they are enrolled to.
SELECT t1.stu_id AS 'Student ID', t1.name AS 'Student NAme', date(t1.dob) AS 'Date of Birth', 
	t1.phone_cus AS 'Phone Number', t1.email_cus AS 'E-mail', count(*) AS 'Number of Courses' FROM tbl_student t1 
    INNER JOIN tbl_mapping t2
		ON t1.stu_id = t2.stu_id
			GROUP BY t2.stu_id;

-- 3) Display details of students which are not yet enrolled to any course.
SELECT t1.stu_id AS 'Student ID', t1.name AS 'Student NAme', date(t1.dob) AS 'Date of Birth', 
	t1.phone_cus AS 'Phone Number', t1.email_cus AS 'E-mail' FROM tbl_student t1 
    LEFT JOIN tbl_mapping t2
		ON t1.stu_id = t2.stu_id
			WHERE t2.stu_id IS NULL;

-- 4) List all courses and the count of students enrolled to each course.
SELECT t1.course_id AS 'Course ID', t1.name AS 'Course Name', count(*) AS 'Student Count' FROM tbl_course t1
	INNER JOIN tbl_mapping t2
		ON t1.course_id = t2.course_id
	GROUP BY t2.course_id
	ORDER BY t1.course_id;
			