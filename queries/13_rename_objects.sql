---RENAME TABLE
--stored procedure sp_rename

EXECUTE sp_rename 'books', 'books_info'

---RENAME COLUMN
--syntax: 'tablename.colname', 'new colname', 'COLUMN'

EXECUTE sp_rename 'authors.name', 'author_name', 'COLUMN'

---RENAME OR DROP DATABASE
--need to come out of said database and move to master

USE master

ALTER DATABASE college MODIFY NAME = COLLEGE

---DROP DATABASE

--syntax: DROP DATABASE database_name