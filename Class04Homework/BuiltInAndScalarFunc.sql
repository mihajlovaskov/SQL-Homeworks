--USE [SEDCACADEMYDB]

--Declare scalar variable for storing FirstName values
	--•Assign value ‘Antonio’ to the FirstName variable
	--•Find all Students having FirstName same as the variable

Declare @FirstName nvarchar(100)
SET @FirstName = 'Antonio'
SELECT * FROM Student
WHERE FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
	--•Fill the table variable with all Female students

DECLARE @StudentList TABLE (Id int, FirstName nvarchar(100), DateOfBirth date)
INSERT INTO @StudentList
SELECT Id, FirstName, DateOfBirth FROM Student
Where Gender = 'F'
SELECT * FROM @StudentList

--Declare temp table that will contain LastName and EnrolledDate columns
	--•Fill the temp table with all Male students having First Name starting with ‘A’
	--•Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #StudentList (LastName nvarchar(100), EnrolledDate date)
INSERT INTO #StudentList
SELECT LastName, EnrolledDate FROM Student
WHERE Gender = 'M' and FirstName Like 'A%'

SELECT * FROM #StudentList
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and
	--•the first 3 characters of their FirstName and LastName are the same

SELECT FirstName, LastName from Teacher
WHERE LEN(FirstName) < 5 and LEFT(FirstName,3) = LEFT(LastName,3) 
--The same result can be obtained if we first declare table variable or temp table, 
--then fill-in them (using insert into) with data (First and Last Name) from Teacher table and 
--finally employ Select and Where in order to filter for Teachers where First Name length is < 5 char 
--and in the same time, Teachers' First and Last names' first 3 characters are exactly the same.

