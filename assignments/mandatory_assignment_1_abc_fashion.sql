USE ABC_Fashion

SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders

--- 1. Insert a new record in your Orders table

INSERT INTO Orders
VALUES(5005,1812,105,'2020-05-23',1200)

--- 2.1 Add Primary key constraint for SalesmanId column in Salesman table. Add default constraint for City column in Salesman table
-- cannot create PRIMARY KEY when SalesmanID allows NULL vals, 
-- hence altering SalesmanId to INT NOT NULL first

ALTER TABLE Salesman
ALTER COLUMN SalesmanId INT NOT NULL;

ALTER TABLE Salesman
ADD 
CONSTRAINT PK_salesman PRIMARY KEY (SalesmanId),
CONSTRAINT df_city DEFAULT ('city') FOR City;

--- 2.2 Add Foreign key constraint for SalesmanId column in Customer table. Add not null constraint in Customer_name column for the Customer table.
-- unable to create a Foreign Key for Customer Table as records 107,110 are not present in parent (Salesman) table, 
-- hence adding those records to Salesman Table to avoid further errors

INSERT INTO Salesman(SalesmanId, Name)
VALUES(107, 'Remona'),
(110,'Julia')

ALTER TABLE Customer
ADD CONSTRAINT FK_salesman FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId)

ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;

--- 3. Fetch the data where the Customer s name is ending with  N  also get the purchase amount value greater than 500.

SELECT * FROM Customer
WHERE CustomerName LIKE '%n' AND PurchaseAmount>500

--- 4. Using SET operators, retrieve the first result with unique SalesmanId values from two tables, and the other result containing SalesmanId with duplicates from two tables.

-- Using UNION to only include distinct IDs
SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Orders

-- Using UNION ALL to include duplicate records too
SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Orders

--- 5. Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500.

SELECT o.Orderdate, s.Name, c.CustomerName, s.Commission, s.City
FROM Salesman s
INNER JOIN Customer c ON c.SalesmanId = s.SalesmanId
INNER JOIN Orders o ON o.SalesmanId = s.SalesmanId
WHERE c.PurchaseAmount BETWEEN 500 AND 1500;

--- 6. Using right join fetch all the results from Salesman and Orders table.

SELECT * FROM Salesman s
RIGHT JOIN Orders o
ON o.SalesmanId = s.SalesmanId

