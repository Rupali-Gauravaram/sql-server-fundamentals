USE Jomato

SELECT * FROM Jomato

--- 1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

CREATE FUNCTION stuff_chicken(@string NVARCHAR(100))
RETURNS NVARCHAR(200)
As
BEGIN
     IF @string = 'Quick Bites'
     RETURN 'Quick Chicken Bites';
     RETURN @string;
END

SELECT * FROM Jomato

SELECT dbo.stuff_chicken('Quick Bites') AS stuffed_chicken

--- 2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

--- SELECT RestaurantName, RestaurantType, No_of_Rating FROM Jomato 
--- WHERE No_of_Rating = (SELECT MAX(No_of_Rating) FROM Jomato)

CREATE FUNCTION top_rated_restaurant()
RETURNS TABLE
AS RETURN
         (
          SELECT RestaurantName, RestaurantType, No_of_Rating FROM Jomato 
          WHERE No_of_Rating = (SELECT MAX(No_of_Rating) FROM Jomato)
         )
GO

SELECT * FROM top_rated_restaurant()

--- 3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating

SELECT RestaurantName, RestaurantType, Rating,
CASE 
    WHEN Rating>4 THEN 'Excellent'
    WHEN Rating BETWEEN 3.5 AND 4 THEN 'Good'
    WHEN Rating BETWEEN 3 AND 3.5 THEN 'Average'
    WHEN Rating<3 THEN 'Bad'
    ELSE 'N/A'
END AS [Rating Status]
FROM Jomato

--- 4. Find the Ceil, floor and absolute values of the rating column and display the current date and separately display year, month_name, day

SELECT Rating, CEILING(Rating) ceiling_rating, FLOOR(Rating) floor_rating, ABS(Rating) absolute_rating FROM Jomato

SELECT GETDATE() [current date], DATEPART(dd, GETDATE()) [day], DATENAME(mm, GETDATE()) [month_name], DATEPART(yyyy, GETDATE()) [year]

--- 5. Display the restaurant type and total average cost using rollup.

SELECT RestaurantType, SUM(AverageCost) total_avg_cost FROM Jomato
GROUP BY ROLLUP (RestaurantType)



