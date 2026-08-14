# SQL Server Fundamentals — T-SQL Work

Hands-on T-SQL written while working through the SQL module of my **Advanced Certification in Data Science & AI (IIT Roorkee · Intellipaat)**, plus the three assessed assignments for that module.

**Provenance, stated plainly:** the datasets and problem statements come from the course. Every query in this repository is my own — including the comments where I worked through errors and design decisions.

Written and run against **Microsoft SQL Server 2019** using SSMS.

---

## What's here

```
queries/       concept-by-concept T-SQL, DDL through to triggers
case-studies/  multi-table schemas with business questions to answer
assignments/   three assessed assignments from the module
```

### `queries/` — concept-by-concept T-SQL

A progression from creating a database through to triggers, each file self-contained with its own schema and sample data so it can be run start to finish.

| File | Covers |
|---|---|
| `01_ddl_create_database_and_tables.sql` | `CREATE DATABASE` / `CREATE TABLE`, data types, `INSERT` variants, partial-column inserts |
| `02_operators_and_clauses.sql` | Comparison and logical operators, `WHERE`, `BETWEEN`, `IN`, `LIKE`, `ORDER BY` |
| `03_set_operators_unions.sql` | `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT` on a realtors schema |
| `04_joins.sql` | `INNER` / `LEFT` / `RIGHT` / `FULL` joins across an authors–books–borrows schema |
| `05_built_in_functions.sql` | String, mathematical, date and aggregate functions |
| `06a_stored_procedures_intro.sql` | Minimal parameterised procedure |
| `06b_stored_procedures_data_quality.sql` | A data-quality audit procedure: row counts, NULL counts per column, results written to an audit table with timestamps |
| `07_subqueries_and_error_handling.sql` | Subqueries, `ROW_NUMBER() OVER (PARTITION BY …)`, `TRY`/`CATCH` |
| `08_subqueries_exists.sql` | Correlated subqueries with `EXISTS` on a supermarket orders schema |
| `09_user_defined_functions.sql` | Scalar-valued and table-valued functions |
| `10_views_and_merge.sql` | `CREATE VIEW`, `MERGE` for upsert logic |
| `11_rollup_and_cube.sql` | `GROUP BY ROLLUP` / `CUBE` subtotals, `COALESCE` to label aggregate rows |
| `12a_triggers.sql` | `AFTER INSERT/UPDATE/DELETE` triggers writing to an audit table |
| `12b_alter_trigger.sql` | Modifying an existing trigger |
| `13_rename_objects.sql` | `sp_rename` for tables and columns |

### `case-studies/` — applied business analysis

Multi-table schemas with business questions to answer, closest to the work an analyst actually does.

**`01_coffee_chain_sales.sql`** — a coffee chain's Product / Location / fact star schema, 29 questions. State-wise profit and sales, average inventory per product, weekly sales hierarchies with `ROLLUP`, `DENSE_RANK` for sales ranking, a table-valued function projecting a 5% sales increase, a parameterised stored procedure by product type, and a transaction demonstrating `ROLLBACK`.

Question 24 asked for `UNION` across two tables with different column counts. It cannot be done, and the reason is documented in place rather than the question being skipped.

**`02_hr_employee_analysis.sql`** — an Employee / Department / Job / Location schema, organised by technique: simple queries, `WHERE`, `ORDER BY`, `GROUP BY`/`HAVING`, joins, conditional clauses, subqueries.

The subquery section covers the questions that come up in interviews: the second-highest salary using `DENSE_RANK`, departments with no employees via a `LEFT JOIN` and `IS NULL`, and employees earning above their own department's average.

**`03_banking_transactions.sql`** — a Customers / Transaction / Continent schema. Region-wise transaction counts by year, transaction ranges by type, duplicate detection with `GROUP BY … HAVING`, and stored procedures for filtered retrieval and inserts.

### `assignments/` — assessed work

Three graded assignments, each a set of business questions answered in T-SQL.

**`01_fashion_retail.sql`** — a fashion retailer's salesman / customer / orders schema. Adding primary and foreign key constraints to existing tables, pattern matching, set operators.

Two constraint problems had to be solved before the schema would accept the keys, and both are documented inline: a primary key could not be added while the column allowed NULLs, and a foreign key failed because two referenced IDs were missing from the parent table.

**`02_restaurant_ratings.sql`** — restaurant listings data. A scalar UDF for string manipulation, a table-valued UDF returning the highest-rated restaurant, `CASE WHEN` rating bands, `CEILING`/`FLOOR`/`ABS`, date extraction, and `ROLLUP` subtotals across restaurant types.

**`03_restaurant_operations.sql`** — the same restaurant data, more advanced. A stored procedure with filtering, a transaction wrapped in `TRY`/`CATCH` demonstrating `ROLLBACK`, a CTE with `ROW_NUMBER()` ranking areas by average rating, a `WHILE` loop, a view over the top five restaurants, and an `AFTER INSERT` trigger that writes user, date, time and operation to an audit table.

---

## Running these

Each file creates the objects it needs. In SSMS, open a file and execute it top to bottom, or run sections individually.

The syntax is T-SQL and assumes SQL Server. The main differences from MySQL are `IDENTITY(1,1)` rather than `AUTO_INCREMENT`, `TOP n` rather than `LIMIT n`, and square brackets rather than backticks for quoted identifiers.

---

## Why this repository exists

I am moving from architecture and climate research into data and machine learning. SQL is the part of that toolkit I use to get at data before any modelling starts, and this is the working record of learning it properly — including stored procedures, transactions, triggers and user-defined functions rather than only `SELECT`.

Other work: [bengaluru-urban-forestry](https://github.com/Rupali-Gauravaram/bengaluru-urban-forestry) · [Bengaluru_LST_Prediction_API](https://github.com/Rupali-Gauravaram/Bengaluru_LST_Prediction_API) · [bengaluru-ward-climate-clustering](https://github.com/Rupali-Gauravaram/bengaluru-ward-climate-clustering) · [fruit-leaf-classification-cnn](https://github.com/Rupali-Gauravaram/fruit-leaf-classification-cnn)

— Rupali Gauravaram
