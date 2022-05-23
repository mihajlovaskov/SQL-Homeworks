USE [SEDCACADEMYDB]

CREATE TABLE [Students](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[FirstName][nvarchar](20) NOT NULL,
	[LastName][nvarchar](20)NULL,
	[DateOfBirth][date] NOT NULL,
	[EnrolledDate] [date] NOT NULL,
	[Gender] [nchar](1) NULL,
	[NationalIDNumber] [nvarchar] (20) NOT NULL,
	[StudentCardNumber] [nvarchar] (10) NOT NULL,
	CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED([Id] ASC)
)
INSERT INTO [Students]([FirstName], [LastName], [DateOfBirth], [EnrolledDate], [Gender], [NationalIDNumber], [StudentCardNumber])
VALUES ('Petko', 'Stojanovski', '1995-05-07', '2020-01-01', 'm', '12345MBI', '6789CIA')

SELECT * FROM [Students]

CREATE TABLE [Teachers](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[FirstName][nvarchar](20) NOT NULL,
	[LastName][nvarchar](20)NULL,
	[DateOfBirth][date] NOT NULL,
	[AcademicRank] [nvarchar] (15) NOT NULL,
	[HireDate] [date] NOT NULL,
	CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED([Id] ASC)
)

INSERT INTO [Teachers]([FirstName], [LastName], [DateOfBirth], [AcademicRank], [HireDate])
VALUES ('Stojna', 'Zivkovska', '1975-04-08', 'PhD', '2000-05-04')
SELECT * FROM [Teachers]

CREATE TABLE [Grades](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[StudentID][int] NOT NULL,
	[CourseID][int] NOT NULL,
	[TeacherID][int] NOT NULL,
	[Grade] [nchar] (1) NULL,
	[Comment] [nvarchar] (MAX) NULL,
	[CreatedDate] [date] NULL,
	CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED([Id] ASC)
)

INSERT INTO [Grades]([StudentID], [CourseID], [TeacherID], [Grade], [Comment], [CreatedDate])
VALUES (8, 11, 17, 'B', 'Bla, Bla', null)
SELECT * FROM [Grades]

CREATE TABLE [Course](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[Name][nvarchar](20) NOT NULL,
	[Credit][tinyint] NOT NULL,
	[AcademicYear][nvarchar] (9) NOT NULL,
	[Semester] [tinyint] NOT NULL,
	CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED([Id] ASC)
)
INSERT INTO [Course]([Name], [Credit], [AcademicYear], [Semester])
VALUES ('SQL', 180, '2021/2022', 2)
SELECT * FROM [Course]

CREATE TABLE [GradeDetails](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[AchievementTypeID] [int] NOT NULL,
	[AchievementPoints][tinyint] NOT NULL,
	[AchievementsMaxPoints][tinyint] NOT NULL,
	[AchievementDate][date] NULL
	CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED([Id] ASC)
)
INSERT INTO [GradeDetails]([GradeID], [AchievementTypeID], [AchievementPoints], [AchievementsMaxPoints], [AchievementDate])
VALUES (14, 2, 87, 100, '2022-05-04')
SELECT * FROM [GradeDetails]

CREATE TABLE [AchievementType](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar] (MAX) NULL,
	[ParticipationRate] [decimal] (3,1) NOT NULL,
	CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED([Id] ASC)
)
INSERT INTO [AchievementType]([Name], [Description], [ParticipationRate])
VALUES ('Master', 'Distinction', 88.5)
SELECT * FROM [AchievementType]
