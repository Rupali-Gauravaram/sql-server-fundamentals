create database booksCatalog

use booksCatalog

create table [authors] 
([authorId] varchar(100) primary key,
[name] varchar(100), 
[surname] varchar(100))

create table [books] 
([bookId] varchar(100) primary key, 
[name] varchar(100), 
[pagecount] int, 
[point] int, 
[authorId] varchar(100) foreign key references authors(authorId))

create table [borrows] 
([borrowId] varchar(100) primary key,
[studentId] int,
[bookId] varchar(100) foreign key references books(bookId), 
[takenDate] datetime,
[broughtDate] datetime)


INSERT [authors] ([authorId], [name], [surname]) VALUES('A1','William Dea','Howells')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A2','Frederic','Brow')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A3','Jack','Londo')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A7','Titus','Lucretius')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A9','Isaac','Asimov')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A10','Charles','Dickens')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A11','Ralph Waldo','Emerso')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A12','Dorothy','Canfield')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A13','Givoanni','Boccaccio')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A14','George','Orwell')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A15','Publius','Ovid')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A16','Robert Louis','Stevenso')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A17','Virginia','Woolf')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A18','George','Eliot')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A19','Amelia B.','Edwards')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A20','Fyodor','Dostoevsky')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A21','Emily','Dickinso')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A22','Edna','Ferber')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A23','Joseph Sherida','LeFanu')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A24','Joh','DosPassos')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A25','Ruth','Stuart')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A26','Vladimir','Nabokov')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A27','Johanna','Spyri')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A28','Ernest','Dowso')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A29','Mary Hallock','Foote')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A30','Zane','Grey')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A31','H. P.','Lovecraft')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A32','Samuel','Pepys')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A33','Kate Dickinso','Sweetser')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A34','William','Lampto')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A35','Mother','Goose')
INSERT [authors] ([authorId], [name], [surname]) VALUES('A36','Eleanor Hallowell','Abbott')


INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B1', 'A Daughter of the Snows', 199, 84, 'A3')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B2', 'The Near East: 10,000 Years of History', 298, 52, 'A9')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B3', 'The Cocoon: A Rest-Cure Comedy', 90, 26, 'A25')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B4', 'The Freakshow Murders', 321, 41, 'A2')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B5', 'Pharaohs, Fellahs and Explorers', 367, 56, 'A19')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B6', 'Hard Times', 293, 25, 'A10')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B7', 'A Modern Instance', 222, 73, 'A1')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B8', 'The Real Mother Goose', 88, 99, 'A35')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B9', 'A Thousand Miles Up the Nile', 110, 90, 'A19')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B10', 'Children of Blood and Bone', 137, 83, 'A7')
INSERT [books] ([bookId], [name], [pagecount], [point], [authorId]) VALUES ('B12', 'The Monk', 137, 83, 'A200')





INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR1', 360, 'B7', CAST('2015-08-09 13:26:00.000' AS DateTime), CAST('2015-08-20 06:59:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR2', 308, 'B4', CAST('2015-08-10 19:44:00.000' AS DateTime), CAST('2015-08-15 10:46:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR3', 288, 'B6', CAST('2015-08-10 22:05:00.000' AS DateTime), CAST('2015-08-19 17:28:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR4', 57, 'B1', CAST('2015-08-11 02:32:00.000' AS DateTime), CAST('2015-08-17 15:12:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR5', 504, 'B2', CAST('2015-08-12 12:05:00.000' AS DateTime), CAST('2015-08-21 07:16:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR6', 38, 'B9', CAST('2015-08-12 12:25:00.000' AS DateTime), CAST('2015-08-18 04:33:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR7', 425, 'B10', CAST('2015-08-13 13:51:00.000' AS DateTime), CAST('2015-08-20 09:27:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR8', 363, 'B8', CAST('2015-08-13 15:58:00.000' AS DateTime), CAST('2015-08-19 23:10:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR9', 348, 'B5', CAST('2015-08-18 09:27:00.000' AS DateTime), CAST('2015-08-28 12:48:00.000' AS DateTime))
INSERT [borrows] ([borrowId], [studentId], [bookId], [takenDate], [broughtDate]) VALUES ('BR10', 88, 'B3', CAST('2015-08-19 22:11:00.000' AS DateTime), CAST('2015-09-08 06:28:00.000' AS DateTime))


SELECT * FROM books
SELECT * FROM authors
SELECT * FROM borrows

--- JOINS ---

--- INNER JOIN
--- LEFT JOIN
--- RIGHT JOIN
--- FULL JOIN

--- INNER JOIN
SELECT * FROM books 
JOIN authors 
ON books.authorId = authors.authorId

SELECT b.name book_name, pagecount pages, a.authorId a_id, a.name author_firstname, surname author_lastname FROM books b
JOIN authors a
ON b.authorId = a.authorId

--- LEFT JOIN: will show all records of left table + all matching recs from right table, unmatched recs show NULL
INSERT INTO books values('B11', 'House of Hades', 500, 67, 'A100')

ALTER TABLE books DROP CONSTRAINT FK__books__authorId__38996AB5

SELECT * FROM books b
LEFT JOIN authors a 
ON b.authorId = a.authorId

--- RIGHT JOIN: will show all records of right table + all matching recs from left table, unmatched recs show NULL
SELECT * FROM books b
RIGHT JOIN authors a 
ON b.authorId = a.authorId

--- FULL JOIN: will show all records of both tables and NULL where records are missing
SELECT * FROM books b
FULL JOIN authors a 
ON b.authorId = a.authorId


--- JOIN MORE THAN 2 TABLES ---
SELECT * FROM books b
JOIN authors a 
ON b.authorId = a.authorId
JOIN borrows br
ON b.bookId = br.bookId

--- MORE COMPLEX JOIN ON MORE THAN 2 TABLES
SELECT * FROM books b
JOIN authors a 
ON b.authorId = a.authorId
JOIN borrows br
ON b.bookId = br.bookId
WHERE pagecount >100

--- HOW TO COMBINE RECORDS WHERE AUTHOR HAS WRITTEN MORE THAN 1 BOOK
---- STRING_AGG

SELECT a.name, count(bookId) [no of books], STRING_AGG(b.name, ' | ') [0name of books]
FROM books b 
JOIN authors a
ON a.authorId = b.authorId 
GROUP BY a.name