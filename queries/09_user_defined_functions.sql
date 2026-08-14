---- USER DEFINED FUNCTIONS:
--1. SCALAR VALUED FUNC: returns string, number or date
--2. TABLE VALUED FUNC: returns a table

---decimal(s,d)
---decimal(3,2)-->x.xx
---decimal(5,2)-->xxx.xx

--1. SCALAR VALUED FUNC
CREATE FUNCTION calc_discount_amt(@amount DECIMAL(10,2), @discount DECIMAL(5,2))
RETURNS DECIMAL(10,2)
AS BEGIN
 RETURN @amount * (@discount/100)  --returns scalar value
END

---

SELECT 2+3

SELECT CONCAT('ABC',' ','xyz')

SELECT dbo.calc_discount_amt(1000,15)

SELECT *, dbo.calc_discount_amt(order_amount, 10) discounted_amount 
FROM CustomerOrders

---NOTE: we cant use DDLs(CREATE,ALTER,DROP,TRUNCATE) or DMLs(INSERT,DELETE,UPDATE) using functions, but can be done using stored procedures

--2. TABLE VALUED FUNC
--NOTE: we don't need BEGIN and END for Table valued funcs
CREATE FUNCTION citywise_data(@city_name VARCHAR(100))
RETURNS TABLE
AS
 RETURN SELECT * FROM CustomerOrders  ---returns the selected data in table
 WHERE city = @city_name

SELECT * FROM citywise_data('Arlington')

SELECT * FROM citywise_data('GuildFord')

