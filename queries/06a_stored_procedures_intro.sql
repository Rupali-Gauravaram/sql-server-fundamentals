CREATE PROCEDURE helloName @name VARCHAR(50)
AS BEGIN
 PRINT CONCAT('Hello, ', @name)
END

EXECUTE helloName 'Ken'
EXECUTE helloName 'Ben'

---we want to now alter parameter & body of the stored procedure 
EXECUTE helloName 'Rupali'

--can only have one create procedure in a single query window