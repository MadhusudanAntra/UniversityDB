USE [master]
GO
/****** Object:  Database [University]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\University.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\University_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY FULL 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'University', N'ON'
GO
ALTER DATABASE [University] SET QUERY_STORE = OFF
GO
USE [University]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/16/2022 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](60) NULL,
	[Credits] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 2/16/2022 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/16/2022 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Budget] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[InstructorID] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 2/16/2022 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_dbo.Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeAssignment]    Script Date: 2/16/2022 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeAssignment](
	[InstructorID] [int] NOT NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.OfficeAssignment] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2/16/2022 2:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[HireDate] [datetime] NULL,
	[EnrollmentDate] [datetime] NULL,
	[Discriminator] [varchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1045, N'Calculus', 4, 3)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1050, N'Chemistry', 3, 4)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2021, N'Composition', 3, 2)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2042, N'Literature', 4, 2)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (3141, N'Trigonometry', 4, 3)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4022, N'Microeconomics', 3, 5)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4041, N'Macroeconomics', 3, 5)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2021, 9)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2042, 9)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1045, 10)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1050, 11)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3141, 11)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1050, 12)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4022, 13)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4041, 13)
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (1, N'Temp1', 0.0000, CAST(N'2014-12-23T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (2, N'English', 350000.0000, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (3, N'Mathematics', 100000.0000, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 10)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (4, N'Engineering', 350000.0000, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 11)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (5, N'Economics', 100000.0000, CAST(N'2007-09-01T00:00:00.000' AS DateTime), 12)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (1, 1050, 1, 0)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (2, 4022, 1, 2)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (3, 4041, 1, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (4, 1045, 2, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (5, 3141, 2, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (6, 2021, 2, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (7, 1050, 3, NULL)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (8, 4022, 3, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (9, 1050, 4, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (10, 2021, 5, 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (11, 2042, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (10, N'Smith 17')
GO
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (11, N'Gowan 27')
GO
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (12, N'Thompson 304')
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (1, N'Alexander', N'Carson', NULL, CAST(N'2010-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (2, N'Alonso', N'Meredith', NULL, CAST(N'2012-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (3, N'Anand', N'Arturo', NULL, CAST(N'2013-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (4, N'Barzdukas', N'Gytis', NULL, CAST(N'2012-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (5, N'Li', N'Yan', NULL, CAST(N'2012-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (6, N'Justice', N'Peggy', NULL, CAST(N'2011-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (7, N'Norman', N'Laura', NULL, CAST(N'2013-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (8, N'Olivetto', N'Nino', NULL, CAST(N'2005-09-01T00:00:00.000' AS DateTime), N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (9, N'Abercrombie', N'Kim', CAST(N'1995-03-11T00:00:00.000' AS DateTime), NULL, N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (10, N'Fakhouri', N'Fadi', CAST(N'2002-07-06T00:00:00.000' AS DateTime), NULL, N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (11, N'Harui', N'Roger', CAST(N'1998-07-01T00:00:00.000' AS DateTime), NULL, N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (12, N'Kapoor', N'Candace', CAST(N'2001-01-15T00:00:00.000' AS DateTime), NULL, N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (13, N'Zheng', N'Roger', CAST(N'2004-02-12T00:00:00.000' AS DateTime), NULL, N'Instructor')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
/****** Object:  Index [IX_DepartmentID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentID] ON [dbo].[Course]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[CourseInstructor]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[CourseInstructor]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[Department]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[Enrollment]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[Enrollment]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 2/16/2022 2:36:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[OfficeAssignment]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((1)) FOR [DepartmentID]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ('Instructor') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Course_dbo.Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_dbo.Course_dbo.Department_DepartmentID]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CourseInstructor_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_dbo.CourseInstructor_dbo.Course_CourseID]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CourseInstructor_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_dbo.CourseInstructor_dbo.Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Department_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_dbo.Department_dbo.Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enrollment_dbo.Person_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_dbo.Enrollment_dbo.Person_StudentID]
GO
ALTER TABLE [dbo].[OfficeAssignment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OfficeAssignment_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[OfficeAssignment] CHECK CONSTRAINT [FK_dbo.OfficeAssignment_dbo.Instructor_InstructorID]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO
