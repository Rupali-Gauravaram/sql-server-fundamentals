---TRIGGERS: 

CREATE TABLE books_audit(
                         audit_id INT PRIMARY KEY IDENTITY,
                         book_id VARCHAR(100),
                         operation_time DATETIME,
                         operation VARCHAR(20)
                         )


CREATE TRIGGER trg_book_audit ON books
AFTER INSERT, DELETE
AS BEGIN
        INSERT INTO books_audit(book_id, operation_time, operation)
              SELECT bookid, GETDATE(), 'INSERT' FROM inserted
              UNION
              SELECT bookid, GETDATE(), 'DELETE' FROM deleted
END
---


SELECT * FROM books


---

INSERT INTO books VALUES('B12', 'DARK MATTER', 400, 67, 'A101')

SELECT * FROM books_audit

---DROP TABLE borrows

DELETE FROM books WHERE bookid = 'B9'

SELECT * FROM books_audit

---
UPDATE books SET name = 'New Book' WHERE bookid = 'B1'

UPDATE books SET name = 'Another New Book' WHERE bookid = 'B2'

---DROP TRIGGER

DROP TRIGGER trg_book_audit

