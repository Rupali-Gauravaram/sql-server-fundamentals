# SQL Server Fundamentals

T-SQL I wrote while working through the SQL module of my Advanced Certification in Data Science & AI (IIT Roorkee, Intellipaat), along with the three assessed assignments for that module.

The datasets and questions came from the course. All the queries are mine, including the comments where I worked through errors.

Written and run against Microsoft SQL Server 2019 in SSMS.

## What's here

```
queries/       concept by concept, from creating a database to triggers
case-studies/  multi-table schemas with business questions to answer
assignments/   three assessed assignments
```

## queries/

A progression through the language. Each file creates its own schema and sample data, so you can open one and run it start to finish.

| File | Covers |
|---|---|
| `01_ddl_create_database_and_tables.sql` | CREATE DATABASE and CREATE TABLE, data types, INSERT variants |
| `02_operators_and_clauses.sql` | Comparison and logical operators, WHERE, BETWEEN, IN, LIKE, ORDER BY |
| `03_set_operators_unions.sql` | UNION, UNION ALL, INTERSECT, EXCEPT |
| `04_joins.sql` | INNER, LEFT, RIGHT and FULL joins on an authors, books and borrows schema |
| `05_built_in_functions.sql` | String, mathematical, date and aggregate functions |
| `06a_stored_procedures_intro.sql` | A minimal parameterised procedure |
| `06b_stored_procedures_data_quality.sql` | A data quality procedure that counts rows and NULLs and writes results to an audit table |
| `07_subqueries_and_error_handling.sql` | Subqueries, ROW_NUMBER with PARTITION BY, TRY and CATCH |
| `08_subqueries_exists.sql` | Correlated subqueries with EXISTS |
| `09_user_defined_functions.sql` | Scalar valued and table valued functions |
| `10_views_and_merge.sql` | CREATE VIEW and MERGE |
| `11_rollup_and_cube.sql` | ROLLUP and CUBE subtotals, COALESCE to label the aggregate rows |
| `12a_triggers.sql` | AFTER INSERT, UPDATE and DELETE triggers writing to an audit table |
| `12b_alter_trigger.sql` | Modifying an existing trigger |
| `13_rename_objects.sql` | sp_rename for tables and columns |

## case-studies/

Bigger schemas with business questions, closest to what an analyst actually does.

**`01_coffee_chain_sales.sql`**
A coffee chain's Product, Location and fact tables, 29 questions. State-wise profit and sales, average inventory per product, weekly sales hierarchies with ROLLUP, DENSE_RANK for sales ranking, a table valued function projecting a 5% sales increase, a stored procedure filtered by product type, and a transaction with ROLLBACK.

Question 24 asked for a UNION across two tables with different column counts. That cannot be done, so I noted why in the file rather than skipping it.

**`02_hr_employee_analysis.sql`**
An Employee, Department, Job and Location schema, grouped by technique: simple queries, WHERE, ORDER BY, GROUP BY and HAVING, joins, conditional clauses, subqueries.

The subquery section covers the ones that come up in interviews. Second highest salary using DENSE_RANK, departments with no employees using a LEFT JOIN and IS NULL, and employees earning above their own department's average.

**`03_banking_transactions.sql`**
A Customers, Transaction and Continent schema. Region-wise transaction counts by year, transaction ranges by type, finding duplicates with GROUP BY and HAVING, and stored procedures for filtered retrieval and inserts.

## assignments/

**`01_fashion_retail.sql`**
A fashion retailer's salesman, customer and orders tables. Adding primary and foreign keys to existing tables, pattern matching, set operators.

Two things had to be fixed before the schema would take the keys, and both are noted in the file. The primary key would not go on a column that still allowed NULLs, and the foreign key failed because two of the referenced IDs were missing from the parent table.

**`02_restaurant_ratings.sql`**
Restaurant listings data. A scalar function for string manipulation, a table valued function returning the highest rated restaurant, CASE WHEN rating bands, CEILING, FLOOR and ABS, date extraction, and ROLLUP subtotals by restaurant type.

**`03_restaurant_operations.sql`**
The same data, going further. A stored procedure with filtering, a transaction wrapped in TRY and CATCH to show ROLLBACK, a CTE with ROW_NUMBER ranking areas by average rating, a WHILE loop, a view over the top five restaurants, and an AFTER INSERT trigger that logs user, date, time and operation to an audit table.

## Running these

Open a file in SSMS and execute it top to bottom, or run sections on their own. Each file sets up what it needs.

The syntax is T-SQL. If you are coming from MySQL, the differences you will notice most are IDENTITY(1,1) instead of AUTO_INCREMENT, TOP n instead of LIMIT n, and square brackets instead of backticks.

## Why this is here

I am moving from architecture and climate research into data and machine learning. SQL is how I get at data before any modelling starts, and this is the record of learning it properly, including the parts past SELECT: stored procedures, transactions, triggers and user defined functions.

Other work: [bengaluru-urban-forestry](https://github.com/Rupali-Gauravaram/bengaluru-urban-forestry), [Bengaluru_LST_Prediction_API](https://github.com/Rupali-Gauravaram/Bengaluru_LST_Prediction_API), [bengaluru-ward-climate-clustering](https://github.com/Rupali-Gauravaram/bengaluru-ward-climate-clustering), [fruit-leaf-classification-cnn](https://github.com/Rupali-Gauravaram/fruit-leaf-classification-cnn)

Rupali Gauravaram
