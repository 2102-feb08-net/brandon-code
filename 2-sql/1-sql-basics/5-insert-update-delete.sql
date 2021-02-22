-- SQL commands are divided in a few categories/sublanguages.
-- Data Manipulation Language (DML)
--   SELECT, INSERT, UPDATE, DELETE, TRUNCATE
--  these commands all operate on rows of tables.

-- Data Definition Language
--   CREATE, ALTER, DROP
--  these commands operate on other objects, like entire tables, or functions, views, etc.

-- Data Control Language (DCL) manages permissions/users/auth
--     GRANT, REVOKE

-- rest of DML besides SELECT is for adding/changing/removing rows

-- INSERT

SELECT * FROM Genre;

INSERT INTO Genre VALUES (100, 'Miscellaneous');

INSERT INTO Genre (GenreId) VALUES (101);

INSERT INTO Genre (GenreId, Name) VALUES (102, 'Misc 2');

SELECT * FROM Genre WHERE GenreId >= 100;

INSERT INTO Genre (GenreId, Name) VALUES
	(103, 'Misc 3'),
	(104, 'Misc 4');

INSERT INTO Genre (GenreId, Name)
	SELECT GenreId + 10, Name + '!'
	FROM Genre
	WHERE GenreId = 104;

-- INSERT can also do things like read CSV files etc

-- UPDATE

-- without a WHERE, would modify every row
UPDATE Genre
SET Name = 'Misc 1'  -- , otherthing = value
WHERE GenreId = 101;

-- without a WHERE, would delete every row (one by one)
DELETE FROM Genre
WHERE GenreId >= 100;

-- this command deletes all rows all at once
--TRUNCATE TABLE Genre;

-- exercises

-- 1. insert two new records into the employee table.
INSERT INTO Employee (EmployeeId, LastName, FirstName) VALUES
	(9, 'Doe', 'John'),
	(10, 'Flintstone', 'Fred');

SELECT * FROM Employee

-- 2. insert two new records into the tracks table.
INSERT INTO Track (TrackId, Name, MediaTypeId, Milliseconds, UnitPrice) VALUES
	(3504, 'Test Track 1', 1, 100, 0.99),
	(3505, 'Test Track 2', 1, 200, 0.99);

SELECT * FROM Track

-- 3. update customer Aaron Mitchell's name to Robert Walter
UPDATE Customer
SET FirstName = 'Robert', LastName = 'Walter'
WHERE FirstName + ' ' + LastName = 'Aaron Mitchell'

SELECT * FROM Customer WHERE FirstName + ' ' + LastName = 'Robert Walter'

-- 4. delete one of the employees you inserted.
DELETE FROM Employee
WHERE EmployeeId = 10

-- 5. delete customer Robert Walter.
