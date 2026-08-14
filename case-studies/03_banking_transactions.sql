CREATE DATABASE casestudy3

USE casestudy3

SELECT * FROM Customers

SELECT * FROM [Transaction]

SELECT * FROM Continent


---1. Display the count of customers in each region who have done the transaction in the year 2020.
SELECT COUNT(*) [no_of_customers_2020] FROM Customers cus
INNER JOIN [Transaction] t ON t.customer_id = cus.customer_id
INNER JOIN Continent con ON cus.region_id = con.region_id
WHERE YEAR(CONVERT(DATE, txn_date, 105)) = 2020

---2. Display the maximum and minimum transaction amount of each transaction type.
SELECT txn_type, MAX(txn_amount) max_txn_amt, MIN(txn_amount) min_txn_amt 
FROM [Transaction]
GROUP BY txn_type

---3. Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
SELECT cus.customer_id, con.region_name, t.txn_amount, t.txn_type
FROM Customers cus
INNER JOIN [Transaction] t ON t.customer_id = cus.customer_id
INNER JOIN Continent con ON cus.region_id = con.region_id
WHERE t.txn_type = 'deposit' AND t.txn_amount>2000

---4. Find duplicate records in the Customer table.
SELECT customer_id, COUNT(customer_id) count_of_recs FROM Customers
GROUP BY customer_id
HAVING COUNT(customer_id)>1

---5. Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
SELECT c.customer_id, c.region_id, con.region_name, t.txn_type, t.txn_amount
FROM Customers c
INNER JOIN [Transaction] t ON c.customer_id = t.customer_id
INNER JOIN Continent con ON c.region_id = con.region_id
WHERE txn_type = 'deposit' AND txn_amount = (SELECT MIN(txn_amount)
                                             FROM [TRANSACTION]
                                             WHERE txn_type = 'deposit')

---6. Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jan 2020.
CREATE PROCEDURE sp_GetCustDetails 
AS 
BEGIN
SELECT * FROM [Transaction]
WHERE CONVERT(DATE, txn_DATE, 105) > '2020-01-31'; 
END
GO

EXEC sp_GetCustDetails 

---7. Create a stored procedure to insert a record in the Continent table.
CREATE PROCEDURE sp_InsertIntoContinent
@reg_id INT,
@reg_name VARCHAR(50)
AS 
BEGIN
    INSERT INTO Continent(region_id, region_name)
    VALUES(@reg_id,@reg_name);
END
GO

EXEC sp_InsertIntoContinent 6, 'South East Asia'

---8. Create a stored procedure to display the details of transactions that happened on a specific day.
CREATE PROCEDURE sp_GetDatewiseDetails 
@transact_date DATE
AS
BEGIN
     SELECT * FROM [Transaction]
     WHERE CONVERT(DATE, txn_date, 105) = @transact_date
     ORDER BY CONVERT(DATE, txn_date, 105);
END
GO

EXEC sp_GetDatewiseDetails '2020-01-10'

---9. Create a user defined function to add 10% of the transaction amount in a table
CREATE FUNCTION increase_amount()
RETURNS TABLE
AS 
RETURN
(
SELECT txn_amount, txn_amount*1.10 AS increased_amount
FROM [Transaction] 
)

SELECT * FROM increase_amount()