---create a stored proc to calculate tax for given params

ALTER PROCEDURE calculateTax @amount DECIMAL(10,2), @taxRate DECIMAL(5,2) = 10.5
AS BEGIN
 DECLARE @taxAmount DECIMAL(10,2) ---declare a variable called taxAmount dtypy decimal
 SET @taxAmount = @amount * (@taxRate/100) --assigning a value to the variable
 PRINT CONCAT('Tax on ', @amount, ' is ', @taxAmount, ' for Tax Rate: ',  @taxRate) ---referring to the variables we used in calc.
 SELECT CONCAT('Tax on ', @amount, ' is ', @taxAmount, ' for Tax Rate: ',  @taxRate) AS OUTPUT
 ---print is used to print in message tab, select always displays in a table format
END

---
EXECUTE calculateTax 1000, 15

--assume we need to eval data quality of any table we want to using stored proc:
---step1: must find total no.of rows in table
---step2: must find no.of null vals in cols
---step3: all these eval metrics to be stored in a new audit table

CREATE TABLE dataQualityAUDIT(tableName VARCHAR(50), checkType VARCHAR(50), resultValue VARCHAR(50), time_stamp DATETIME DEFAULT GETDATE())
GO

CREATE PROCEDURE runDataQualityChecks @tableName VARCHAR(50) = 'customerOrder'
AS BEGIN 
 PRINT 'Data Quality Assessment is beginning'
 DECLARE @totalRows INT
 DECLARE @nullCountOrderID INT
 DECLARE @nullCountOrderDate INT

 IF @tableName = 'customerOrders'
 BEGIN
  SET @totalRows = (SELECT COUNT(*) FROM customerOrders)
  SET @nullCountOrderID = (SELECT COUNT(*) FROM CustomerOrders WHERE order_id IS NULL)
  SET @nullCountOrderDate = (SELECT COUNT(*) FROM CustomerOrders WHERE order_date IS NULL)

  INSERT INTO dataQualityAUDIT(tableName, checkType, resultValue)
  VALUES(@tableName, 'TOTAL ROWS', @totalRows),
        (@tableName, 'NULLS IN ORDER_ID', @nullCountOrderID),
        (@tableName, 'NULLS IN ORDER_DATE', @nullCountOrderDate)
 END

 PRINT 'Data Quality Assessment is complete'

END
GO

EXECUTE runDataQualityChecks 'customerOrders'

SELECT*FROM dataQualityAUDIT