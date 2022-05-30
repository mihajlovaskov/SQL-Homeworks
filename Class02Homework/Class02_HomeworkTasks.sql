--USE [SEDCACADEMYDB]

--Find all Students  with FirstName = Antonio
SELECT * FROM STUDENT
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM STUDENT
WHERE DateOfBirth > '1999-01-01'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM STUDENT
WHERE LastName like 'J%' and (EnrolledDate between '1998-01-01' and '1998-02-01') --none of the students fulfills the required conditions??

--List all Students ordered  by FirstName
SELECT * FROM STUDENT
ORDER BY FirstName ASC

--List all Teacher  Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName FROM TEACHER ​
UNION --UNION eliminates duplicates, whereas UNION ALL does not!!!
SELECT LastName FROM STUDENT 

--Create  Foreign key constraints  from diagram or with script
ALTER TABLE GRADE WITH NOCHECK
ADD CONSTRAINT FK_GRADE_StudentID
Foreign key (StudentID)
REFERENCES STUDENT (Id)

ALTER TABLE GRADE WITH NOCHECK
ADD CONSTRAINT FK_GRADE_CourseID
Foreign key (CourseID)
REFERENCES COURSE (Id)

ALTER TABLE GRADE WITH NOCHECK
ADD CONSTRAINT FK_GRADE_TeacherID
Foreign key (TeacherID)
REFERENCES TEACHER (Id)

ALTER TABLE GRADEDETAILS WITH NOCHECK
ADD CONSTRAINT FK_GRADEDETAILS_GradeID
Foreign key (GradeID)
REFERENCES GRADE (Id)

ALTER TABLE GRADEDETAILS WITH NOCHECK
ADD CONSTRAINT FK_GRADEDETAILS_AchievementTypeID
Foreign key (AchievementTypeID)
REFERENCES ACHIEVEMENTTYPE (Id)

--List all possible combinations  of Courses  names and AchievementType names that can be passed  by student

SELECT COURSE.Name, ACHIEVEMENTTYPE.Name from COURSE 
  CROSS JOIN ACHIEVEMENTTYPE

--List all Teachers  without exam Grade

 SELECT * FROM TEACHER
  LEFT JOIN GRADE
  ON TEACHER.Id = GRADE.TeacherId  
  WHERE GRADE.TeacherId is null
  
  --same solution but with employment of RIGHT JOIN
SELECT * FROM GRADE
  RIGHT JOIN TEACHER
  ON GRADE.TeacherId = TEACHER.Id  
  WHERE GRADE.TeacherId is null

