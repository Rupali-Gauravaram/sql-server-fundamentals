--VIEWS: view is like smaller version of the main table. 
--Sub-Table of Main Table.

use supermart

CREATE VIEW expensive_products
AS 
SELECT * FROM products p_main
 WHERE list_price IN (SELECT MAX(list_price) 
                      FROM products p_subq
					  WHERE p_main.category_id = p_subq.category_id
					  GROUP BY category_id)

SELECT * FROM expensive_products

--MERGE: 
CREATE DATABASE store

USE store

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10 , 2 )
);
INSERT INTO category(category_id, category_name, amount)
VALUES(1,'Children Bicycles',15000),
    (2,'Comfort Bicycles',25000),
    (3,'Cruisers Bicycles',13000),
    (4,'Cyclocross Bicycles',10000);
CREATE TABLE category_staging (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10 , 2 )
);
INSERT INTO category_staging(category_id, category_name, amount)
VALUES(1,'Children Bicycles',15000),
    (3,'Cruisers Bicycles',13000),
    (4,'Cyclocross Bicycles',20000),
    (5,'Electric Bikes',10000),
    (6,'Mountain Bikes',10000);

select * from category  -- originally made categories table

select * from category_staging -- business team wants to make changes in the categories

---we will need to merge the two tables: target with source

MERGE category trg 
USING category_staging src
ON src.category_id = trg.category_id
WHEN MATCHED  --if source=target, be ready to consure UPDATES in any columns in target table
     THEN UPDATE SET trg.category_name = src.category_name,
                     trg.amount = src.amount
WHEN NOT MATCHED BY TARGET --if somethings exists in source and not in target, then INSERT into target table
     THEN INSERT(category_id,category_name,amount) 
     VALUES (src.category_id,src.category_name, src.amount)
WHEN NOT MATCHED BY SOURCE --if something exists in target and not in source, FLAG it(DONT DELETE), set amount as -1 
     THEN UPDATE SET trg.amount = -1; --NOTE: semi-colon is a must for this

SELECT * FROM category --target table, source table is left untouched