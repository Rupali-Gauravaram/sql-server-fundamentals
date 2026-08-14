USE abc_company

CREATE TABLE employeeDetails (
id INT PRIMARY KEY, 
name VARCHAR(90) NOT NULL, 
gender VARCHAR(10) NOT NULL, 
salary int NOT NULL, 
department VARCHAR(50) NOT NULL
)

INSERT INTO employeeDetails VALUES
(1, 'David', 'Male', 5000, 'Sales'),
(2, 'Jim', 'Female', 6000, 'Finance'),
(3, 'Kate', 'Female', 7500, 'IT'),
(4, 'Will', 'Male', 6500, 'HR'),
(5, 'Shane', 'Female', 5500, 'Marketing'),
(6, 'Shed', 'Male', 8000, 'Sales'),
(7, 'Vik', 'Male', 7200, 'Finance'),
(8, 'Vince', 'Female', 6600, 'IT'),
(9, 'Jane', 'Female', 5400, 'HR'),
(10, 'Laura', 'Female', 6300, 'Marketing'),
(11, 'Mac', 'Male', 5700, 'Sales'),
(12, 'Pat', 'Male', 7000, 'Finance'),
(13, 'Julie', 'Female', 7100, 'IT'),
(14, 'Elice', 'Female', 6800, 'HR'),
(15, 'Wayne', 'Male', 5000, 'Marketing')

SELECT * FROM employeeDetails

--- OPERATORS & CLAUSES
-- AND, OR, NOT

SELECT * FROM employeeDetails WHERE department = 'Finance'

SELECT * FROM employeeDetails WHERE salary > 6000

-- AND

SELECT * FROM employeeDetails WHERE department = 'Finance' AND salary > 6000

SELECT * FROM employeeDetails WHERE gender = 'Female' AND department = 'Sales'

-- OR

SELECT * FROM employeeDetails WHERE department = 'IT' OR department = 'HR'

SELECT * FROM employeeDetails WHERE department = 'IT' OR department = 'Admin'

SELECT * FROM employeeDetails WHERE department = 'Finance' OR gender = 'Female'

SELECT * FROM employeeDetails WHERE department = 'Sales' OR gender = 'Female'

-- NOT

SELECT * FROM employeeDetails WHERE name = 'Jim'

SELECT * FROM employeeDetails WHERE NOT name = 'Jim'

-- NOT can also be written as:

SELECT * FROM employeeDetails WHERE name != 'Jim'

SELECT * FROM employeeDetails WHERE name <> 'Jane'

-- BETWEEN

SELECT * FROM employeeDetails WHERE salary BETWEEN 6000 AND 7000

SELECT * FROM employeeDetails WHERE NOT salary BETWEEN 6000 AND 7000

-- It can also be written as:

SELECT * FROM employeeDetails WHERE salary NOT BETWEEN 6000 AND 7000

-- IN

SELECT * FROM employeeDetails WHERE name IN ('Kate','Shed','Mac')

SELECT * FROM employeeDetails WHERE id IN (1,2,4,5)

-- LIKE
---> % : used as wild card for zero, one or multiple charecters
---> _ : used as wild card for only one character

SELECT * FROM employeeDetails WHERE name LIKE 'S%'   --> starting letter(s)

SELECT * FROM employeeDetails WHERE name LIKE '%ne'  --> ending letters(s)

SELECT * FROM employeeDetails WHERE name LIKE '%an%' --> in-between letter(s)

---- GROUP BY -----

--- step1: segregation (grouping)
--- step2: agregation (mathematical operation)

--- aggregations: count, sum, min, max, avg

SELECT * FROM employeeDetails

SELECT department, COUNT(id) FROM employeeDetails GROUP BY department

SELECT department, SUM(salary) FROM employeeDetails GROUP BY department

-- here the result COUNT and SUM shows up with no column name
-- using AS, creates a column name for the aggregated result column of data

SELECT 
department, 
SUM(salary) AS total_salary,
AVG(salary) AS avg_salary,
MIN(salary) AS [min salary],
MAX(salary) AS max_salary,
COUNT(id) AS total_employees
FROM employeeDetails GROUP BY department

SELECT department, gender, COUNT(id) AS total_emps
FROM employeeDetails GROUP BY gender, department

--- REMEMBER: count only counts non null values

-- ALTER

ALTER TABLE employeeDetails ADD pincode INT

SELECT * FROM employeeDetails

UPDATE employeeDetails SET pincode = 100001 WHERE department = 'HR'

SELECT * FROM employeeDetails

UPDATE employeeDetails SET pincode = 100003 WHERE department = 'Sales'

UPDATE employeeDetails SET pincode = 100002 WHERE department='IT'

UPDATE employeeDetails SET pincode = 100004 WHERE department = 'Marketing'

UPDATE employeeDetails SET pincode = 100005 WHERE department = 'Finance'

SELECT COUNT(*) FROM employeeDetails 

SELECT SUM(salary) FROM employeeDetails WHERE gender = 'Female'

SELECT SUM(salary) FROM employeeDetails WHERE gender = 'Male'

SELECT department, COUNT(id) AS no_of_emp, SUM(salary) AS total_salary FROM employeeDetails GROUP BY department