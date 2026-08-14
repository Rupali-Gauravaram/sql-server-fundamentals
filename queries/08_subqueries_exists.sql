use supermart

SELECT * FROM orders
SELECT * FROM order_items
SELECT * FROM products

--- SUB QUERIES 
SELECT * FROM products

--WHAT IS THE MOST EXPENSIVE PRODUCT?

SELECT MAX(list_price) FROM products -->11999.99

SELECT * FROM products WHERE list_price = 11999.99

--this is a longer way of doing this, we can use subqueries to do this better:

SELECT * FROM products WHERE list_price = (SELECT MAX(list_price) FROM products) 
--the subquery select statement runs first, takes this result and displays it as the main select data

--WHAT IS THE MOST EXP PORDUCT AT CATEGORY LEVEL
SELECT category_id, MAX(list_price)
FROM products
GROUP BY category_id

SELECT * FROM products
WHERE list_price IN (select MAX(list_price)
FROM products
GROUP BY category_id)
ORDER BY category_id, list_price DESC

--but here the most expensive product cost flows into all categories which we don't want, so we use:
--1. CORELATED SUBQUERIES WITH IN: when checking for some equality or relation bwteen two values/parameters

SELECT * FROM products p1  ---has 321 records
 WHERE list_price IN (SELECT MAX(list_price) ---subquery runs 321 times
                      FROM products p2
					  WHERE p1.category_id = p2.category_id
					  GROUP BY category_id)
 ORDER BY category_id

--INTUITION: understanding how the corelated subquery works
--Corelated subquery, subquery runs 321 times since main query has 321 recs
--so for example the very first subquery will look like this:
SELECT * FROM products p1  ---has 321 records
 WHERE list_price IN (SELECT MAX(list_price) ---subquery runs 321 times, category wise
                      FROM products p2
					  WHERE p2.category_id = 6 
					  --once subquery finds record where category_id=6 and price=max_price i.e. 5299.99, it sets it as highest price record for category 6 n then moves to next record in main query
					  GROUP BY category_id)
 ORDER BY category_id

--2. CORELATED SUBQUERIES WITH EXIST: is tyhe subquery returning atleast one row-->true, otherwise-->false

SELECT * FROM orders 
WHERE EXISTS (SELECT 2+3)  --this is checking if theres atleast one record, so returns all recs from the table

SELECT * FROM orders 
WHERE EXISTS (SELECT 2+3 WHERE 2>3) --returns no records because the subquery is not true

-- TO FIND ALL CUSTOMER INFO WHOS GOT MORE THAN 2 ORDERS

SELECT customer_id, COUNT(order_id) FROM orders 
GROUP BY customer_id
HAVING COUNT(order_id)>2 --this returns order_id and no of orders, not other info

--So to find ALL customer data where orders>2, we use EXISTS
SELECT * FROM customers cust
WHERE EXISTS(
              SELECT customer_id, COUNT(order_id)
			  FROM orders ord
			  WHERE ord.customer_id = cust.customer_id
			  GROUP BY customer_id
			  HAVING COUNT(order_id)>2
			 )


--Intuition:
SELECT customer_id, COUNT(order_id)
FROM orders ord
WHERE ord.customer_id = 23
GROUP BY customer_id
HAVING COUNT(order_id)>2

--doesn't return anything since HAVING condition is not satisfied

---CTE: Common Table Expressions

SELECT customer_id, COUNT(*) FROM
 (SELECT * FROM orders WHERE customer_id IN(
                                           SELECT customer_id
					                       FROM customers
					                       WHERE city = 'San Jose'
				                       	  )
 ) src GROUP BY customer_id
 --this is a nested subquery
--with CTEs the problem is solved separately and in a more understandable manner

WITH myCTE AS(
              SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'San Jose')
			  )
SELECT customer_id, COUNT(*) FROM myCTE GROUP BY customer_id


