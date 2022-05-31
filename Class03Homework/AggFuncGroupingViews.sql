--USE [SEDCACADEMYDB]

--Calculate the count of all grades per Teacher in the system

Select TeacherID, Teacher.FirstName, Teacher.LastName, COUNT(Grade) AS TotalNoOfGrades
From Grade
Join Teacher on TeacherID = Teacher.Id
Group by TeacherID,Teacher.FirstName, Teacher.LastName

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

Select TeacherID, Teacher.FirstName, Teacher.LastName, COUNT (Grade) as TotalNoOfGrades 
from Grade
Join Teacher on TeacherID = Teacher.Id
Where StudentID<100
Group by TeacherID,Teacher.FirstName, Teacher.LastName

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
Select StudentID, Student.FirstName, Student.LastName, MAX(Grade) as MaximumGrade, AVG(Grade) as AverageGrade  
From Grade
Join Student on StudentID = Student.Id
Group by StudentId, Student.FirstName, Student.LastName
Order by FirstName ASC

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

Select TeacherID, Teacher.FirstName, Teacher.LastName, COUNT (Grade) as TotalNoOfGrades 
from Grade
Join Teacher on TeacherID = Teacher.Id
Group by TeacherID,Teacher.FirstName, Teacher.LastName
Having COUNT(Grade) > 200

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

Select StudentID, Student.FirstName, Student.LastName, Count(Grade) as TotalNoOfGrades, MAX(Grade) as MaximumGrade, AVG(Grade) as AverageGrade  
From Grade
Join Student on StudentID = Student.Id
Group by StudentId, Student.FirstName, Student.LastName
Having MAX(Grade) = AVG(Grade)
Order by FirstName ASC

--List Student First Name and Last Name next to the other details from previous query

-- THE TASK IS ACCOMPLISHED IN PREVIOUS QUERY 

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

GO;
CREATE VIEW vw_StudentGrades as 
(
Select StudentId, COUNT(Grade) as TotalNoOfGrades
From [Grade]
Group by StudentId
); 
GO;
Select * from vw_StudentGrades 

--Change the view to show Student First and Last Names instead of StudentID

GO;
ALTER VIEW vw_StudentGrades AS
(
Select Student.FirstName, Student.LastName, COUNT(Grade) as TotalNoOfGrades 
From Grade
Join Student on StudentId = Student.Id
GROUP BY Student.FirstName, Student.LastName 
);
GO;
Select * from vw_StudentGrades

--List all rows from view ordered by biggest Grade Coun

GO;
Select * from vw_StudentGrades
Order by TotalNoOfGrades DESC
GO;