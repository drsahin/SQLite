/*Single-Row Subqueries:*/
/*1.Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds. */

	SELECT TrackId, Name, Milliseconds, max(Milliseconds) AS Max_Duration
	FROM tracks;
	
/*2.Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds. */
 
	SELECT TrackId, Name, Milliseconds, min(Milliseconds) AS Mim_Duration
	FROM tracks;
	
/*3.Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks.
 Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. 
 General average is the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries) */
 
	SELECT TrackId, Name, Bytes, (SELECT round(avg(Bytes), 2) FROM tracks) as General_Average
	FROM tracks
	WHERE Bytes > (
	SELECT round(avg(Bytes), 2)
	FROM tracks)
	ORDER BY Bytes DESC;
	
/*Multiple - Row Subqueries:*/
/*1.Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. 
    Your query should include CustomerID, First Name and Last Name of the customers. */ 
	
	SELECT CustomerId, FirstName, LastName
	FROM customers
	WHERE SupportRepId IN (
	SELECT EmployeeId 
	FROM employees
	WHERE EmployeeId = 3 or EmployeeId = 4 );
	
	
/*2.Rewrite the subquery above using the JOIN. */ 

	SELECT c.CustomerId, c.FirstName, c.LastName
	FROM customers c
	JOIN employees e
	ON c.SupportRepId = e.EmployeeId
	WHERE (SupportRepId = 3 or SupportRepId = 4);
	
	
/*DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements*/
/*1.Create a table inside the chinook database. This table tracks the employees’ courses inside the organization.
 Your table should have the followings features:   
               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
                    CoursePrice */ 
					
	CREATE TABLE courses (
	CourseId INTEGER,
	CourseName TEXT NOT NULL,
	EmployeeId INTEGER,
	CoursePrice INTEGER,
	PRIMARY KEY (CourseId),
	FOREIGN KEY (EmployeeId) REFERENCES employees (EmployeeId)
	);
	
/*2. Insert at least 5 rows into the courses table. 
   Your EmployeeId should contain the values of the EmployeeId column on the employees table. 
   You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice) */ 
   
	INSERT INTO courses VALUES (101, "Network", 1, 1000);
	INSERT INTO courses VALUES (102, "Linux", 2, 2500);
	INSERT INTO courses VALUES (103, "SQLite", 3, 1750);
	INSERT INTO courses VALUES (104, "HTML", 4, 1000);
	INSERT INTO courses VALUES (105, "CSS", 5, 1500);
	
/*3.Delete the last row of your courses table */ 
	DELETE FROM courses
	WHERE EmployeeId = 5;
	
/*4.Add a new column to your courses table named StartDate. The new column cannot be null. */ 
	ALTER TABLE courses
	ADD StartDate date DEFAULT "2021-12-29";
	
/*5.Delete the CoursePrice column. */ 
	ALTER TABLE courses
	DROP COLUMN CoursePrice;
	
/*6.Delete the courses table. */ 
	DROP TABLE courses;