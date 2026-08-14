SELECT * FROM Jomato

--- 1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
CREATE PROCEDURE get_resto_details
AS BEGIN
 SELECT RestaurantName, RestaurantType, CuisinesType FROM Jomato
 WHERE TableBooking != 0
END
GO

EXEC get_resto_details

--- 2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
BEGIN TRY

 SELECT * FROM Jomato 
 WHERE CuisinesType LIKE 'Cafe%';

 BEGIN TRANSACTION
  UPDATE Jomato 
  SET CuisinesType = 'Cafeteria'
  WHERE CuisinesType LIKE 'Cafe%'

  SELECT * FROM Jomato 
  WHERE CuisinesType LIKE 'Cafeteria';

  ROLLBACK TRANSACTION
  PRINT 'Transaction Rolled back!'
END TRY

BEGIN CATCH
 ROLLBACK TRANSACTION
 PRINT 'Transaction Rolled back!'
END CATCH

--- 3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.

WITH ranked_resto AS
 (
  SELECT Area, AVG(Rating) Avg_ratings, ROW_NUMBER() OVER (ORDER BY AVG(Rating) DESC) AS top_restaurants
  FROM Jomato
  GROUP BY Area
 )

SELECT *
FROM ranked_resto
WHERE top_restaurants<=5

--- 4. Use the while loop to display the 1 to 50.

DECLARE @n INT = 0

WHILE @n<50
BEGIN
     SET @n += 1
     PRINT @n
END

--- 5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
CREATE VIEW top5_restaurants 
AS
  SELECT TOP 5 RestaurantName,Rating
  FROM Jomato
  ORDER BY Rating DESC

SELECT * FROM top5_restaurants

--- 6. Create a trigger that give an message whenever a new record is inserted.

CREATE TABLE jomato_audit(OrderId INT, 
                          UserName VARCHAR(100),
                          AuditDate DATE, 
                          AuditTime TIME, 
                          Operation VARCHAR(20)
                          )
                  
CREATE TRIGGER after_trig_insert
ON jomato
AFTER INSERT
AS BEGIN
    INSERT INTO jomato_audit
        SELECT
            i.OrderId, SYSTEM_USER, 
            CAST(GETDATE() AS DATE), 
            CAST(GETDATE() AS TIME),
            'INSERTION'
        FROM INSERTED i
END

-- CHECK TRIGGER:
SELECT * FROM jomato_audit

INSERT INTO Jomato
VALUES(7777,'GhibliCafe', 'Cafe', 5, 45, 800, 27, 0, 'Cafe, Japanese', 'Indiranagar', 'Indiranagar', 30)

SELECT * FROM jomato_audit
