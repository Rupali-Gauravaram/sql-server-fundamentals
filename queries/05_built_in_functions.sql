---- FUNCTIONS ----

--- 1. SYSTEM DEFINED FUNCTIONS: sum(), min(), max(), avg() etc, these are already defined by the system
    -- STRING FUNC used to manipulate alpha numeric cols
    -- MATH FUNC abs value, power of number, square of number
    -- DATE FUNC 
    -- WINDOW FUNC

--- 2. USER DEFINED FUNCTIONS: we can create our own functions, save it in the server and call it whenever we want
    -- SCALAR VALUED FUNC
    -- TABLE VALUED FUNC

---1. STRING FUNCS ---
--1.1 LEN (length of string(s))

USE realtors

SELECT * FROM customers

SELECT first_name, LEN(first_name) [first name length] FROM customers

SELECT *, LEN(first_name) [first name length] FROM customers

SELECT * FROM customers WHERE LEN(first_name)>7

--1.2 CONCAT (concatination of strings)

SELECT *, CONCAT(first_name,' ', last_name) [full name] FROM customers

SELECT *, CONCAT( last_name,', ',first_name) [full US name] FROM customers

--1.3 CONCAT_ WS (concatination of multiple strings WITH SEPARATOR)
SELECT *, CONCAT_WS('+',first_name,email,zip_code,customer_id,last_name) [coupon code] FROM customers

--1.4 REPLACE (replaces a string with another string)
SELECT *, REPLACE(email, 'yahoo', 'gmail') new_column FROM customers

-- TO REPLACE THE ACTUAL EMAIL USE UPDATE
UPDATE customers SET email = REPLACE(email,'yahoo','gmail') WHERE customer_id IN (1,2,8)

--1.5 REVERSE (reverses string in a column), doesn't affect NULL as it is not a string

SELECT *, REVERSE(city) FROM customers

SELECT *, REVERSE(phone) FROM customers

--1.6 UPPER & LOWER (change string cases)

SELECT *, lower(first_name) [first name], UPPER(last_name) [last name] FROM customers

--- USING FUNCTION INSIDE FUNCTION
SELECT *, CONCAT(UPPER(last_name),', ',LOWER(first_name)) [US format name] FROM customers

--1.7 TRIM, LTRIM, RTRIM (trims white spaces from ends of a string)
create table students(id int, name char(20), department char(20))
insert into students values
(1, ' TOM ', 'ECE'),
(2, ' JACK', 'CSE'),
(3, 'RICK ', 'MECH'),
(4, 'MAT', 'IT')

SELECT *, TRIM(name) trimmed_name FROM students

--1.8 SUBSTRING (grabs a specific portion of string needed)
--- syntax: substring(col_name, starting_coord, no_of_chars from_start)

SELECT *, CONCAT(UPPER(SUBSTRING(city, 1, 3)),zip_code) city_code FROM customers

--1.9 ASCII (American Standard Code for Information Interchange)

SELECT ASCII('A') --> 65

SELECT ASCII('%') --> 37

SELECT ASCII('4') --> 52

--- ASCII can only shows a single ascii character value at a time
select *, ASCII(first_name) FROM customers --> will return D = 68 from Debra since first ascii only

--1.10 CHAR (CHAR is the opp. of ASCII, this is char function, not the same as dtype char)
SELECT CHAR(68) --> 'D'

SELECT CHAR(ASCII('X'))


---2. MATH FUNCS ---
--2.1 LOG10 (converts a value in terms of log10)

use abc_company

SELECT * FROM employeeDetails

SELECT LOG10(1000) -->3

SELECT *,LOG10(salary) log_of_salary FROM employeeDetails

--2.2 SQUARE (returns square of a number)

SELECT *, SQUARE(id) id_squared FROM employeeDetails

--2.3 POWER (returns exponential value of a number)
SELECT POWER(100, 4)

SELECT *, POWER(id, 7) id_exponential FROM employeeDetails

SELECT *, POWER(name, 3) name_exp FROM employeeDetails --> Error converting data type varchar to float.

--2.4 ROUND, FLOOR, CEILING 

SELECT ROUND(45625349.11111,3) --> 45625349.11100

SELECT *, ROUND(LOG10(salary), 5) FROM employeeDetails

SELECT FLOOR(45.7) --> rounding to lower nearest integer 

SELECT CEILING(45.2) --> rounding to upper nearest integer

---3. DATE FUNC ---
---yyyy-MM-dd
---yyyy-MM-dd hh:MM:ss.mmm

---3.1 getdate (returns current date)
SELECT GETDATE()

USE booksCatalog
SELECT * FROM borrows

SELECT *, DAY(takenDate) b_day, MONTH(takenDate) b_month, YEAR(takenDate) b_year FROM borrows

---3.2.1 dateadd (used to extend date days, months or years etc)
--syntax: DATEADD(date_param, magnitude_of_add, getdate())
SELECT DATEADD(dd, 5, getdate())

SELECT *, DATEADD(dd, 3, broughtDate) extended_brought_date FROM borrows

---example:extend current date by 2 days, 4 months, 1 year
SELECT GETDATE() currentDate, 
DATEADD(YY, 1, (DATEADD(MM, 4,(DATEADD(dd, 2,getdate())))))

---3.2.2 Subtract days from a date using DATEADD
SELECT DATEADD(dd, -3,GETDATE())

---3.3 DATEDIFF: to find diff between 2 dates in terms of days
---syntax: DATEDIFF( unit of datediff(days/months/years), first date, second date)
SELECT *, DATEDIFF(dd, takenDate, broughtDate) AS [Difference in days]
FROM borrows

---3.4 FORMAT: to format date in a specific format
---default date: yyyy-MM-dd
---syntax: SELECT FORMAT(date_to_format, 'needed_format')

SELECT GETDATE() curr_date, 'Indian DateFormat' AS frmt, FORMAT(GETDATE(), 'dd/MM/yyyy') AS PART
UNION
SELECT GETDATE() curr_date, 'USA DateFormat' AS frmt, FORMAT(GETDATE(), 'MM.dd.yyyy') AS PART
UNION
SELECT GETDATE() curr_date, 'Custom DateFormat' AS frmt, FORMAT(GETDATE(), 'dd_MM_yyyy') AS PART
UNION
SELECT GETDATE() curr_date, 'Custom DateFormat1' AS frmt, FORMAT(GETDATE(), 'dd-MM-yyyy') AS PART

---3.5 DATEPART 
---NOTE: week starts on sunday

select 'dd' frmt, getdate() sys_date, datepart(dd, getdate()) 
UNION
select 'quarter' frmt, getdate() sys_date, datepart(quarter, GETDATE())
union
select 'hour' frmt, getdate() sys_date,datepart(hour, getdate())
UnIoN
select 'minute' frmt, getdate() sys_date, datepart(minute, getdate()) minute
uNION
select 'dy - dayOfTheYear' frmt, getdate() sys_date, datepart(dy, getdate())
Union
select 'dw - dayOfTheWeek' frmt, getdate() sys_date, datepart(dw, getdate())

---3.6 DATENAME

SELECT 'WEEKDAY' frmt, GETDATE() sys_date, DATENAME(WEEKDAY, GETDATE())
UNION
SELECT 'MONTH' frmt, GETDATE() sys_date, DATENAME(MONTH, GETDATE())

---4. WINDOW 

--- DATA GRANULARITY, LOWEST LEVEL/ORDER OF DATA A TABLE CAN GIVE i.e ONE SINGLE RECORD IN TABLE
use realtors
CREATE TABLE [CustomerOrders]
(
	order_id INT,
	order_date DATE,
	customer_first_name VARCHAR(250),
	customer_last_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount MONEY
)

INSERT INTO [CustomerOrders]
SELECT '1001','04/01/2017','David ','Smith','GuildFord',10000
UNION ALL	  
SELECT '1002','04/02/2017','David','Jones','Arlington',20000
UNION ALL	  
SELECT '1003','04/03/2017','John ','Smith','Shalford',5000
UNION ALL	  
SELECT '1004','04/04/2017','Michael ','Smith','GuildFord',15000
UNION ALL	  
SELECT '1005','04/05/2017','David','Williams','Shalford',7000
UNION ALL	  
SELECT '1006','04/06/2017','Paum','Smith','GuildFord',25000
UNION ALL	 
SELECT '1007','04/10/2017','Andrew','Smith','Arlington',15000
UNION ALL	  
SELECT '1008','04/11/2017','David','Brown','Arlington',2000
UNION ALL	  
SELECT '1009','04/20/2017','Robert','Smith','Shalford',1000
UNION ALL	  
SELECT '1010','04/25/2017','Peter','Smith','GuildFord',500

INSERT INTO [CustomerOrders]
SELECT '1001','06/01/2017','David','Smith','GuildFord',10000
UNION ALL	  
SELECT '1002','03/02/2017','David','Jones','Arlington',20000

INSERT INTO [CustomerOrders]
SELECT '1001',null,'David ','Smith','GuildFord',10000

SELECT * FROM CustomerOrders
---here granularity is of each order

SELECT SUM(order_amount)
FROM CustomerOrders
GROUP BY city
---here the moment we use GROUP BY, granularity is citywise but will only display the group by data, 

---We use WINDOW FUNC, it works like GROUP BY but retains granularity of original data
---So with group by, you cant see the order_date, customer details etc since its all grouped
---with Window func you see individual record details and the grouped sum data we needed in the total column

SELECT *, SUM(order_amount)
OVER(PARTITION BY city ORDER BY city) total
FROM CustomerOrders

---4.1 CUMULATIVE SUM FUNC : it is the rolling sum

SELECT *, SUM(order_amount) OVER(PARTITION BY city ORDER BY order_amount, order_date) rolling_sum
FROM CustomerOrders

---4.2 RANK
SELECT *, RANK() 
OVER(PARTITION BY city ORDER BY order_amount DESC) col_rank
FROM CustomerOrders

---4.3 DENSE_RANK
SELECT *, RANK() 
OVER(PARTITION BY city ORDER BY order_amount DESC) just_rnk,
DENSE_RANK() OVER(PARTITION BY city ORDER BY order_amount DESC) dense_rnk
FROM CustomerOrders

SELECT *,
DENSE_RANK() OVER(ORDER BY order_amount DESC) dense_rnk
FROM CustomerOrders
---partition by is not mandatory but order by is necessary for ranking

---4.4 ROW_NUMBER

SELECT *, 
ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_id) row_num
FROM CustomerOrders

SELECT*, 
ROW_NUMBER() OVER(ORDER BY order_id) row_num
FROM CustomerOrders

---row_number() with WINDOW FUNC is used to find number of duplicates in terms of selected col

SELECT*, 
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_amount) row_num
FROM CustomerOrders

SELECT*, 
ROW_NUMBER() OVER(PARTITION BY order_id, order_date ORDER BY order_amount) row_num
FROM CustomerOrders

---find duplicates in orders, so we'll pick latest orders and order dates in desc

SELECT*, 
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_date DESC) row_num
FROM CustomerOrders

SELECT*, 
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_date DESC) row_num
FROM CustomerOrders 
WHERE city='Arlington'

---nTile(n): like quartile 

SELECT *,
NTILE(2) OVER(PARTITION BY city ORDER BY order_amount) tiles
FROM CustomerOrders

SELECT *,
NTILE(4) OVER(PARTITION BY city ORDER BY order_amount) tiles
FROM CustomerOrders



SELECT *,
NTILE(4) OVER(ORDER BY order_amount) tiles
FROM CustomerOrders

---tile split intuition:
--no of rows in a tile = no.of rows in particular window/no.of tiles
---for tile 1, no of recs is 13 = 13/4= 3.25 so rounded(ceiling) to next integer is 4, 4 recs ---> tile 1
---for tile 2, no of recs = 9/3 = 3
---for tile 3, no of recs = 6/2 = 3
---for tile 4, no of recs = 3/1 = 3

---example:
--- ntile(5) over(order by order_amount) tiles from CustomerOrders
--- 13/5 = 2.6 --> 3 --> tile1
--- 10/4 = 2.5 --> 3 --> tile2
--- 7/3 =  2.33 --> 3 --> tile3 
--- 4/2 = 2 --> 2 --> tile4
--- 2/1 = 2 --> 2 --> title5





