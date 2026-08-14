
---SIMPLE QUERIES---
---1. List all the employee details.
SELECT * FROM EMPLOYEE

---2. List all the department details.
SELECT * FROM DEPARTMENT

---3. List all job details.
SELECT * FROM JOB

---4. List all the locations.
SELECT * FROM LOCATION

---5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE

---6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
SELECT EMPLOYEE_ID [ID of the Employee], LAST_NAME [Name of the Employee], DEPARTMENT_ID [Dep_id] FROM EMPLOYEE

---7. List out the annual salary of the employees with their names only.
SELECT LAST_NAME, FIRST_NAME, (SALARY*12) ANNUAL_SALARY FROM EMPLOYEE

---WHERE---
---1. List the details about "Smith".
SELECT * FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
INNER JOIN JOB j ON j.JOB_ID = e.JOB_ID
INNER JOIN LOCATION l ON l.Location_ID = d.Location_Id
WHERE e.LAST_NAME = 'Smith'

---2. List out the employees who are working in department 20.
SELECT * FROM EMPLOYEE
WHERE Department_Id = 20

---3. List out the employees who are earning salary between 2000 and 3000.
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000

---4. List out the employees who are working in department 10 or 20.
SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20

---5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID NOT IN (10,30)

---6. List out the employees whose name starts with 'L'.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'L%'

---7. List out the employees whose name starts with 'L' and ends with 'E'.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'L%e'

---8. List out the employees whose name length is 4 and start with 'J'.
SELECT * FROM EMPLOYEE
WHERE LEN(FIRST_NAME) = 4 AND FIRST_NAME LIKE 'J%'

---9. List out the employees who are working in department 30 and draw the salaries more than 2500.
SELECT * FROM EMPLOYEE 
WHERE DEPARTMENT_ID = 30 AND SALARY>2500

---10. List out the employees who are not receiving commission.
SELECT * FROM EMPLOYEE 
WHERE COMM IS NULL

---ORDER BY---
---1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE
ORDER BY EMPLOYEE_ID 

---2. List out the Employee ID and Name in descending order based on salary.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEE
ORDER BY SALARY DESC

---3. List out the employee details according to their Last Name in ascending-order.
SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME 

---4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT * FROM EMPLOYEE
ORDER BY LAST_NAME, DEPARTMENT_ID DESC

---GROUP BY and HAVING---
---1. List out the department wise maximum salary, minimum salary and average salary of the employees.
SELECT d.Name department, MAX(SALARY) max_salary, MIN(SALARY) min_salary, AVG(SALARY) avg_salary 
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
GROUP BY d.Name 

---2. List out the job wise maximum salary, minimum salary and average salary of the employees.
SELECT j.DESIGNATION designation, MAX(e.SALARY) max_salary, MIN(e.SALARY) min_salary, AVG(e.SALARY) avg_salary 
FROM EMPLOYEE e
INNER JOIN JOB j ON j.JOB_ID = e.JOB_ID
GROUP BY j.DESIGNATION

---3. List out the number of employees who joined each month in ascending order.
SELECT DATEPART(mm, HIRE_DATE) [hire_month], COUNT(EMPLOYEE_ID) [No. of hires]
FROM EMPLOYEE
GROUP BY DATEPART(mm, HIRE_DATE)
ORDER BY DATEPART(mm, HIRE_DATE)

---4. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT DATEPART(yyyy, HIRE_DATE) [hire_year], DATEPART(mm, HIRE_DATE) [hire_month], COUNT(EMPLOYEE_ID) [No. of hires]
FROM EMPLOYEE
GROUP BY DATEPART(yyyy, HIRE_DATE), DATEPART(mm, HIRE_DATE)
ORDER BY DATEPART(yyyy, HIRE_DATE), DATEPART(mm, HIRE_DATE)

---5. List out the Department ID having at least four employees.
SELECT DEPARTMENT_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (
                        SELECT DEPARTMENT_ID 
                        FROM EMPLOYEE
                        GROUP BY DEPARTMENT_ID
                        HAVING COUNT(DEPARTMENT_ID) = 4
                       )

---6. How many employees joined in February month.
SELECT * FROM EMPLOYEE
WHERE DATEPART(mm, HIRE_DATE) IN (
                                  SELECT DATEPART(mm, HIRE_DATE)
                                  FROM EMPLOYEE
                                  GROUP BY DATEPART(mm, HIRE_DATE)
                                  HAVING DATEPART(mm, HIRE_DATE) = 2
                                  )

---7. How many employees joined in May or June month.
SELECT * FROM EMPLOYEE
WHERE DATEPART(mm, HIRE_DATE) IN (
                                  SELECT DATEPART(mm, HIRE_DATE)
                                  FROM EMPLOYEE
                                  GROUP BY DATEPART(mm, HIRE_DATE)
                                  HAVING DATEPART(mm, HIRE_DATE) = 5 OR DATEPART(mm, HIRE_DATE) = 6
                                  )

---8. How many employees joined in 1985?
SELECT * FROM EMPLOYEE
WHERE DATEPART(yyyy, HIRE_DATE) IN (
                                    SELECT DATEPART(yyyy, HIRE_DATE)
                                    FROM EMPLOYEE
                                    GROUP BY DATEPART(yyyy, HIRE_DATE)
                                    HAVING DATEPART(yyyy, HIRE_DATE) = 1985
                                    )

---9. How many employees joined each month in 1985?
SELECT DATEPART(yyyy, HIRE_DATE) [hire_year], DATEPART(mm, HIRE_DATE) [hire_month], COUNT(EMPLOYEE_ID) [No. of hires]
FROM EMPLOYEE
WHERE DATEPART(yyyy, HIRE_DATE) = 1985
GROUP BY DATEPART(yyyy, HIRE_DATE), DATEPART(mm, HIRE_DATE)
ORDER BY DATEPART(yyyy, HIRE_DATE), DATEPART(mm, HIRE_DATE)

---10. How many employees were joined in April 1985?
SELECT DATEPART(yyyy, HIRE_DATE) [hire_year], DATEPART(mm, HIRE_DATE) [hire_month], COUNT(EMPLOYEE_ID) [No. of hires]
FROM EMPLOYEE
WHERE DATEPART(yyyy, HIRE_DATE) = 1985 AND DATEPART(mm, HIRE_DATE)=4
GROUP BY DATEPART(yyyy, HIRE_DATE), DATEPART(mm, HIRE_DATE)
ORDER BY DATEPART(yyyy, HIRE_DATE), DATEPART(mm, HIRE_DATE)

---11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT DEPARTMENT_ID, DATEPART(yyyy, HIRE_DATE) [hire_year], DATEPART(mm, HIRE_DATE) [hire_month]
FROM EMPLOYEE
WHERE DATEPART(yyyy, HIRE_DATE) = 1985 AND DATEPART(mm, HIRE_DATE)=4 AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
                                                                                            FROM EMPLOYEE
                                                                                            GROUP BY DEPARTMENT_ID
                                                                                            HAVING COUNT(DEPARTMENT_ID) >= 3)

---JOINS---
---1. List out employees with their department names.
SELECT e.FIRST_NAME, e.LAST_NAME, d.Name DEPARTMENT
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id

---2. Display employees with their designations.
SELECT e.FIRST_NAME, e.LAST_NAME, j.DESIGNATION 
FROM EMPLOYEE e
INNER JOIN JOB j ON e.JOB_ID = j.JOB_ID


---3. Display the employees with their department names and city.
SELECT e.FIRST_NAME, e.LAST_NAME, d.Name DEPARTMENT, l.City CITY
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
INNER JOIN LOCATION l ON l.Location_Id = d.Location_Id

---4. How many employees are working in different departments? Display with department names.
SELECT d.Name [Department], COUNT(EMPLOYEE_ID) [no_of_emp]
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
GROUP BY d.Name 

---5. How many employees are working in the sales department?
SELECT d.Name [Department], COUNT(EMPLOYEE_ID) [no_of_emp]
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
WHERE d.Name = 'Sales'
GROUP BY d.Name 

---6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.
SELECT d.Name DEPARTMENT, COUNT(e.DEPARTMENT_ID) [no_of_emp]
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
GROUP BY d.Name
HAVING COUNT(e.DEPARTMENT_ID) >= 3

---7. How many employees are working in 'Dallas'?
SELECT l.City, COUNT(l.City) [no_of_emp] FROM LOCATION l
INNER JOIN DEPARTMENT d ON d.Location_ID = l.Location_Id
INNER JOIN EMPLOYEE e ON e.DEPARTMENT_ID = d.department_Id
WHERE l.City = 'Dallas'
GROUP BY l.City


---8. Display all employees in sales or operation departments.
SELECT * FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID =e.department_Id
WHERE d.Name = 'Sales' OR d.Name = 'Operations'

---CONDITIONAL CLAUSES---
---1. Display the employee details with salary grades. Use conditional statement to create a grade column.
SELECT SALARY, 
CASE
    WHEN SALARY<800 THEN 'Grade D'
    WHEN SALARY<1500 THEN 'Grade C'
    WHEN SALARY<2500 THEN 'Grade B'
    ELSE 'Grade A'
END AS [Salary Status]
FROM EMPLOYEE

---2. List out the number of employees grade wise. Use conditional statement to create a grade column.
SELECT 
CASE 
    WHEN SALARY<800 THEN 'Grade D'
    WHEN SALARY<1500 THEN 'Grade C'
    WHEN SALARY<2500 THEN 'Grade B'
    ELSE 'Grade A'
END AS salary_grade, COUNT(EMPLOYEE_ID) [No_of_emp]
FROM EMPLOYEE
GROUP BY 
CASE 
    WHEN SALARY<800 THEN 'Grade D'
    WHEN SALARY<1500 THEN 'Grade C'
    WHEN SALARY<2500 THEN 'Grade B'
    ELSE 'Grade A'
END

---3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary
SELECT 
CASE 
    WHEN SALARY<800 THEN 'Grade D'
    WHEN SALARY<1500 THEN 'Grade C'
    WHEN SALARY<2500 THEN 'Grade B'
    ELSE 'Grade A'
END AS salary_grade,
COUNT(EMPLOYEE_ID) [No_of_emp]
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 5000
GROUP BY 
CASE 
    WHEN SALARY<800 THEN 'Grade D'
    WHEN SALARY<1500 THEN 'Grade C'
    WHEN SALARY<2500 THEN 'Grade B'
    ELSE 'Grade A'
END

---SUBQUERIES---
---1. Display the employees list who got the maximum salary.
SELECT * FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) 
                FROM EMPLOYEE)

---2. Display the employees who are working in the sales department.
SELECT * FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
WHERE d.Name = (SELECT Name FROM DEPARTMENT
                WHERE Name = 'Sales')

---3. Display the employees who are working as 'Clerk'.
SELECT * FROM EMPLOYEE e
INNER JOIN JOB j ON j.JOB_ID = e.JOB_ID
WHERE j.DESIGNATION = (SELECT DESIGNATION FROM JOB
                       WHERE DESIGNATION = 'CLERK')

---4. Display the list of employees who are living in 'Boston'.
SELECT * FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
INNER JOIN LOCATION l ON d.Location_Id = l.Location_Id
WHERE l.City = (SELECT l.City FROM LOCATION l
                WHERE City='Boston')

---5. Find out the number of employees working in the sales department.
SELECT COUNT(EMPLOYEE_ID) no_of_sales_emp FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.department_Id
WHERE d.Name = (SELECT d.Name FROM DEPARTMENT d
                WHERE d.Name = 'Sales')

---6. Update the salaries of employees who are working as clerks on the basis of 10%.
UPDATE e
SET e.SALARY = e.SALARY * 1.10   --->increased_salary = salary + salary*0.10 = salary * 1.10
FROM EMPLOYEE e
INNER JOIN JOB j ON e.JOB_ID = j.JOB_ID
WHERE j.DESIGNATION = (SELECT DESIGNATION FROM JOB
                       WHERE DESIGNATION = 'CLERK')

---7. Display the second highest salary drawing employee details.
SELECT * 
FROM 
 (SELECT *,
  DENSE_RANK() OVER (ORDER BY SALARY DESC) AS salary_rank
  FROM EMPLOYEE) AS ranked
WHERE salary_rank = 2
 
---8. List out the employees who earn more than every employee in department 30.
SELECT * FROM EMPLOYEE 
WHERE SALARY > (SELECT MAX(SALARY) max_salary_dept30 
                FROM EMPLOYEE
                WHERE DEPARTMENT_ID = 30)

---9. Find out which department has no employees.
SELECT Name,DEPARTMENT_ID 
FROM
 (SELECT d.Department_ID, d.Name, e.DEPARTMENT_ID emp_dept FROM DEPARTMENT d
  LEFT JOIN EMPLOYEE e 
  ON d.DEPARTMENT_ID = e.DEPARTMENT_ID) AS emp_dept_join
WHERE emp_dept IS NULL

---10. Find out the employees who earn greater than the average salary for their department.
SELECT * FROM EMPLOYEE e
INNER JOIN (SELECT DEPARTMENT_ID, AVG(SALARY) avg_dept_salary FROM EMPLOYEE
            GROUP BY DEPARTMENT_ID) AS dept
ON e.DEPARTMENT_ID = dept.DEPARTMENT_ID
WHERE e.SALARY > dept.avg_dept_salary


