CREATE DATABASE abc_company

USE abc_company

CREATE TABLE employee(
e_id INT,
e_name VARCHAR(30),
e_dob DATE,
e_doj DATE,
e_salary INT,
e_dept VARCHAR(30)
)

SELECT e_id, e_name, e_doj FROM employee

INSERT INTO employee(e_id, e_name, e_dob, e_doj, e_salary, e_dept)
VALUES(001, 'Krishna', '1998-07-12', '2025-02-01', 3300000, 'Analytics')

INSERT INTO employee
VALUES(002, 'Rupali','1999-08-22', '2025-01-11', 3100000, 'Machine Learning')

INSERT INTO employee(e_id, e_name, e_dept)
VALUES(003, 'Durga', 'Operations')

INSERT INTO employee
VALUES(004, 'Indra','1995-05-05', '2019-06-01', 4500000, 'Analytics'),
(005, 'Varahi','1990-10-12', '2015-02-01', 5000000, 'Machine Learning'),
(006, 'Varuna', '1992-01-30', '2020-04-15', 3000000, 'Operations'),
(006, 'Ganesh', '1986-06-22', '2005-01-10', 6000000, 'Machine Learning')

SELECT * FROM employee

CREATE TABLE department(
dept_id INT PRIMARY KEY,
dept_name CHAR(20),
dept_loc CHAR(20)
)

INSERT INTO department
VALUES
(001, 'Analytics', 'Bengaluru'),
(002, 'Machine Learning', 'Stuttgart'),
(003, 'Operations', 'Chennai')

SELECT * FROM employee

CREATE TABLE emp(
id INT PRIMARY KEY,
name CHAR(20) DEFAULT 'NameNotAvailable',
age_at_join TINYINT CHECK(age_at_join>17),
dep_id INT FOREIGN KEY REFERENCES department(dept_id),
salary DECIMAL(9,2) DEFAULT 0, 
id_proof CHAR(40) UNIQUE
)

SELECT * FROM emp

INSERT INTO emp
VALUES(001, 'Krishna', 27, 1, 3300000, 'BLR555')

INSERT INTO emp
VALUES(001, 'Rupali', 27, 1, 3300000, 'BLR555')  -- Violation of PRIMARY KEY constraint 'PK__emp__3213E83FA150DC81'. Cannot insert duplicate key in object 'dbo.emp'. The duplicate key value is (1).

INSERT INTO emp
VALUES(002, 'Rupali', 26, 2, 3100000, 'STU156')

INSERT INTO emp(id, age_at_join, dep_id, salary, id_proof)
VALUES(003, 26, 2, 3100000, 'BLR519')

SELECT * FROM emp

SELECT * FROM department

INSERT INTO emp
VALUES(008, 'Kali', 29, 4, 4000000, 'PAR111') -- The INSERT statement conflicted with the FOREIGN KEY constraint "FK__emp__dep_id__4AB81AF0". The conflict occurred in database "abc_company", table "dbo.department", column 'dept_id'.The statement has been terminated.

INSERT INTO department
VALUES(4, 'Products', 'Paris')

INSERT INTO emp
VALUES(008, 'Kali', 29, 4, 4000000, 'PAR111')

INSERT INTO emp(id, name, age_at_join, dep_id, id_proof)
VALUES(004, 'Indira', 30, 1, 'BLR206')

INSERT INTO emp(id, name, age_at_join, dep_id, id_proof)
VALUES(005, 'Varahi', 35, 2, null) -- can only input one NULL value as UNIQUE KEY constraint, second null will throw error

SELECT * FROM emp