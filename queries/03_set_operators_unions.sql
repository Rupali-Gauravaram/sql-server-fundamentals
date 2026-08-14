create database Realtors

use Realtors

CREATE TABLE customers (
	customer_id INT PRIMARY KEY, --- Identity
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);


CREATE TABLE staffs (
	staff_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
	store_id INT NOT NULL,
	manager_id INT
);

INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(1,'Debra','Burks',NULL,'debra.burks@yahoo.com','9273 Thorne Ave. ','Orchard Park','NY',14127);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(2,'Kasha','Todd',NULL,'kasha.todd@yahoo.com','910 Vine Street ','Campbell','CA',95008);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(3,'Tameka','Fisher',NULL,'tameka.fisher@aol.com','769C Honey Creek St. ','Redondo Beach','CA',90278);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(4,'Daryl','Spence',NULL,'daryl.spence@aol.com','988 Pearl Lane ','Uniondale','NY',11553);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(5,'Charolette','Rice','(916) 381-6003','charolette.rice@msn.com','107 River Dr. ','Sacramento','CA',95820);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(6,'Lyndsey','Bean',NULL,'lyndsey.bean@hotmail.com','769 West Road ','Fairport','NY',14450);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(7,'Latasha','Hays','(716) 986-3359','latasha.hays@hotmail.com','7014 Manor Station Rd. ','Buffalo','NY',14215);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(8,'Jacquline','Duncan',NULL,'jacquline.duncan@yahoo.com','15 Brown St. ','Jackson Heights','NY',11372);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(9,'Genoveva','Baldwin',NULL,'genoveva.baldwin@msn.com','8550 Spruce Drive ','Port Washington','NY',11050);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(10,'Pamelia','Newman',NULL,'pamelia.newman@gmail.com','476  Ave. ','Monroe','NY',10950);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(11,'Virgie','Wiggins',NULL,'Virgie.Wiggins@gmail.com','76 Chestnut Ave. ','CE','NY',13650);
INSERT INTO customers(customer_id ,first_name, last_name, phone, email, street, city, state, zip_code) VALUES(12,'Venita','Daniel',NULL,'Venita.Daniel@gmail.com','66 Broadway Ave. ','Broadway','NY',18750);


INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(1,'Fabiola','Jackson','fabiola.jackson@bikes.shop','(831) 555-5554',1,1,NULL);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(2,'Mireya','Copeland','mireya.copeland@bikes.shop','(831) 555-5555',1,1,1);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(3,'Genna','Serrano','genna.serrano@bikes.shop','(831) 555-5556',1,1,2);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(4,'Virgie','Wiggins','virgie.wiggins@bikes.shop','(831) 555-5557',1,1,2);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(5,'Jannette','David','jannette.david@bikes.shop','(516) 379-4444',1,2,1);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(6,'Marcelene','Boyer','marcelene.boyer@bikes.shop','(516) 379-4445',1,2,5);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(7,'Venita','Daniel','venita.daniel@bikes.shop','(516) 379-4446',1,2,5);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(8,'Kali','Vargas','kali.vargas@bikes.shop','(972) 530-5555',1,3,1);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(9,'Layla','Terrell','layla.terrell@bikes.shop','(972) 530-5556',1,3,7);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(10,'Bernardine','Houston','bernardine.houston@bikes.shop','(972) 530-5557',1,3,7);


SELECT * FROM customers
SELECT * FROM staffs

---1st table cols: id INT, full_name VARCHAR(20), attended INT
---2nd table cols: id TINYINT, full_name CHAR, attended INT

--- UNIONS ---

---- UNION: combines results set of 2 or more queries, avoiding duplicates
SELECT first_name, last_name FROM customers
UNION
SELECT first_name, last_name FROM staffs

---here the UNION expects similar datatypes(not necessarily smae) of columns and same number of columns
SELECT customer_id, first_name, last_name, phone FROM customers
UNION
SELECT staff_id, first_name, last_name, email FROM staffs

---- UNION ALL: combines results set of 2 or more queries, includes duplicates
SELECT first_name, last_name FROM customers
UNION ALL
SELECT first_name, last_name FROM staffs

---- INTERSECT: returns only common records from 2 or more queries
SELECT first_name, last_name FROM customers
INTERSECT
SELECT first_name, last_name FROM staffs

---- EXCEPT: result set will contain all records from A except those recorde present in B
SELECT first_name, last_name FROM customers
EXCEPT
SELECT first_name, last_name FROM staffs

--- TEMPORARY TABLES: are tables which are available for as long as the session is active. As soon as the session is terminated, the table gets deleted.
--- temporary tables can be found under SYSTEM DATABASES-->TEMPDB-->TEMPORARY TABLES
CREATE TABLE #student (id INT, name CHAR(20), age TINYINT)

INSERT INTO #student VALUES(1, 'Rupali', 25)

SELECT * FROM #student

SELECT age, count(idFROM
) #student group BY age