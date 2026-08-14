--- SUB QUERIES
use realtors

SELECT *, 
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_date DESC) rn
FROM CustomerOrders
WHERE rn=1 
---Invalid column name 'rn', this wont be executed

---using sub query:
SELECT * 
FROM(SELECT *, 
		ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_date DESC) rn
		FROM CustomerOrders) src
WHERE rn=1 
---here using WHERE rn=1 will get executed since the FROM is executed first, rn col is ready and there WHERE is able to perform rn=1

SELECT * 
FROM(SELECT*,
	NTILE(2) OVER(PARTITION BY city ORDER BY order_amount) tiles
	FROM CustomerOrders) src
WHERE tiles=1

--- TRANSACTION CONTROL: works like undo or ctrl+z
---begin transaction(select, update, delete, drop,insert etc) --->>> Commit Transaction / Rollback Transaction

SELECT*FROM CustomerOrders
DELETE FROM CustomerOrders WHERE order_id = '1009'
---this will permanently delete this row

---if i want to undo it/rollback to retain original data

BEGIN TRANSACTION --->starts transaction
DELETE FROM CustomerOrders WHERE order_id = '1009'
ROLLBACK TRANSACTION --->this rollbacks/undo transaction

SELECT*FROM CustomerOrders

BEGIN TRANSACTION
DELETE FROM CustomerOrders WHERE order_id = 1003
COMMIT TRANSACTION --->commit transaction

---all DDLs cant be rolledback

---EXCEPTION HANDLING

--1.compile time errors: occurs when there is error in syntax or 
SELECT* FRO CustomerOrders
SELECT* FROM cust
--these wont get executed: Invalid object name 'cust'.

--2.RUNTIME ERROR: occurs when the function cant return 
SELECT 100/2
SELECT 100/0
--throws runtime error: Divide by zero error encountered.

--so we use Exception handling to anticipate errors
--TRY/CATCH: if something goes wrong in TRY, CATCH the error

BEGIN TRY
 SELECT 100/0
 print 'All good in TRY'
END TRY
BEGIN CATCH
 PRINT 'something went wrong in TRY'
END CATCH


---example

BEGIN TRY
 UPDATE CustomerOrders SET order_amount=200 WHERE order_id=1004
 UPDATE CustomerOrders SET order_amount=400/0 WHERE order_id=1005
 UPDATE CustomerOrders SET order_amount=400/4 WHERE order_id=1006
 COMMIT TRANSACTION
 PRINT 'ALL GOOD'
END TRY
BEGIN CATCH
 ROLLBACK TRANSACTION
 PRINT 'ERROR'
END CATCH

BEGIN TRY
    begin transaction
    update CustomerOrders set order_amount = 200 where order_id = 1004
    update CustomerOrders set order_amount = 400/0 where order_id = 1005
    update CustomerOrders set order_amount = 400/4 where order_id = 1006
    commit transaction
    print 'ALL GOOD. COMMIT EXECUTED'
end try
begin catch
    rollback transaction
    print 'SOMETHING WRONG. ROLLBACK EXECUTED'
    print concat('errorMessage: ', error_message())
    print concat('errorLine: ' , error_line())
end catch


---STORED PROCEDURES:
--simple stored procedure
use impulsemart
CREATE PROCEDURE helloWorld
AS BEGIN
 print 'HELLO WORLD!!!'
END

EXECUTE helloWorld




