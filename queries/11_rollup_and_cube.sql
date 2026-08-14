---ROLLUP and CUBE

SELECT * FROM employeeDetails

SELECT department, gender, SUM(salary) total_salary
FROM employeeDetails
GROUP BY department, gender
ORDER BY department DESC, gender DESC


SELECT department, gender, SUM(salary) total_salary
FROM employeeDetails
GROUP BY ROLLUP (department, gender)
ORDER BY department DESC, gender DESC

---COALESCE: accepts n-parameters in incremental values and return non-null values first

SELECT COALESCE(NULL, '2nd value') -->returns 2nd value

SELECT COALESCE('1st value', '2nd value') -->returns 1st value

---
SELECT COALESCE(department, 'ALL DEPARTMENTS') department,
       COALESCE(gender, 'ALL GENDERS') gender,
       SUM(salary) total_salary
FROM employeeDetails
GROUP BY ROLLUP (department, gender)
ORDER BY department DESC, gender DESC

---CUBE: gives male all department and female all department as two extra records

SELECT COALESCE(department, 'ALL DEPARTMENTS') department,
       COALESCE(gender, 'ALL GENDERS') gender,
       SUM(salary) total_salary
FROM employeeDetails
GROUP BY CUBE (department, gender)
ORDER BY department DESC, gender DESC

