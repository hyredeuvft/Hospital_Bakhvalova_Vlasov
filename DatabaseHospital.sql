USE [master]
GO
/****** Object:  Database [Hospital_Vlasov_Bahvalova_4ISP9-14]    Script Date: 03.11.2023 13:47:07 ******/
CREATE DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital_Vlasov_Bahvalova_4ISP9-14', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hospital_Vlasov_Bahvalova_4ISP9-14.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_Vlasov_Bahvalova_4ISP9-14_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hospital_Vlasov_Bahvalova_4ISP9-14_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital_Vlasov_Bahvalova_4ISP9-14].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hospital_Vlasov_Bahvalova_4ISP9-14]
GO
/****** Object:  UserDefinedFunction [dbo].[CostService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[CostService]()
RETURNS decimal (10,2)
AS
BEGIN
DECLARE @avgProd decimal(10,2)
	SELECT @avgProd = AVG(Cost) 
	FROM MedicalService 
RETURN @avgProd
END
GO
/****** Object:  UserDefinedFunction [dbo].[EndDate]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[EndDate](@StartTime datetime, @DurationSecond int)
RETURNS datetime
AS
BEGIN
DECLARE @EndTime datetime = DATEADD(SECOND, @DurationSecond, @StartTime)
RETURN @EndTime
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFullName]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[fn_getFullName](@FullName nvarchar(50))
returns nvarchar(50)
as
begin
declare @Surename nvarchar(50) = Substring(@FullName,0,CharIndex(' ',@FullName))
set @FullName = SUBSTRING(@FullName,LEN(@Surename) + 2,Len(@FullName))
declare @FirstName nvarchar(50) = Substring(@FullName,0,CharIndex(' ',@FullName))
set @FullName = SUBSTRING(@FullName,LEN(@FirstName) + 2,Len(@FullName))
declare @Patron nvarchar(50) = @FullName

return UPPER(Concat(@Surename, ' ', LEFT(@FirstName,1), '. ', Left(@Patron,1), '.') )
end
GO
/****** Object:  UserDefinedFunction [dbo].[OldPatient]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[OldPatient] (@dateBirth date)
RETURNS INT
AS
BEGIN
DECLARE @Age int = datediff(year, @dateBirth, getdate() ) 
RETURN @Age
END
GO
/****** Object:  Table [dbo].[Order]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAppointment] [int] NOT NULL,
	[IDPatient] [int] NOT NULL,
	[TotalPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDEmployee] [int] NOT NULL,
	[IDMedicalService] [int] NOT NULL,
	[DateService] [datetime] NOT NULL,
	[TotalPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TitleService] [nvarchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Qnt] [int] NULL,
 CONSTRAINT [PK_MedicalService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[MName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [varchar](25) NOT NULL,
	[IdGender] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PassportSeries] [char](4) NULL,
	[PassportNumber] [char](6) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[MName] [nvarchar](50) NULL,
	[PassportSeries] [nchar](4) NOT NULL,
	[PassportNumber] [nchar](6) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[DateBirthday] [date] NULL,
	[Phone] [nchar](12) NOT NULL,
	[IDDepartament] [int] NOT NULL,
	[IDPost] [int] NOT NULL,
	[IDGender] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_InfoPation]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Создайте представление с выводом информации о пациентах (полное ФИО через пробелы), услугах (полное название), 
--сотрудниках (Фамилия И.О.), которые предоставляли данные услуги, должность сотрудника (полное название). 
CREATE   VIEW [dbo].[VW_InfoPation]
AS
SELECT CONCAT(p.LName, ' ', p.FName, ' ', p.MName) AS 'Full name pation', ms.TitleService,
	CONCAT(e.LName, ' ', LEFT(e.FName, 1), '. ', LEFT(e.MName,1), '.') AS 'Full name employee', ps.PostName
FROM Patient p LEFT JOIN [Order] o ON p.ID = o.IDPatient 
	LEFT JOIN Appointment a ON o.IDAppointment = a.ID
	LEFT JOIN MedicalService ms ON a.IDMedicalService=ms.ID
	LEFT JOIN Employee e ON a.IDEmployee = e.ID
	LEFT JOIN Post ps ON e.IDPost=ps.ID
GO
/****** Object:  Table [dbo].[Departament]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departament](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departament] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_InfoPation2]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VW_InfoPation2]
AS
SELECT CONCAT(p.LName, ' ', p.FName, ' ', p.MName) AS 'Full name pation', ms.TitleService,
	CONCAT(e.LName, ' ', LEFT(e.FName, 1), '. ', LEFT(e.MName,1), '.') AS 'Full name employee', d.PostName
FROM Patient p LEFT JOIN [Order] o ON p.ID = o.IDPatient 
	LEFT JOIN Appointment a ON o.IDAppointment = a.ID
	LEFT JOIN MedicalService ms ON a.IDMedicalService=ms.ID
	LEFT JOIN Employee e ON a.IDEmployee = e.ID
	LEFT JOIN Departament D on e.IDDepartament = d.ID
GO
/****** Object:  View [dbo].[VW_InfoService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   view [dbo].[VW_InfoService]
as
select ms.TitleService, CONCAT(e.LName, ' ', LEFT(e.FName, 1), '. ', LEFT(e.MName,1), '.') AS 'Full name employee',p.PostName
from MedicalService ms
left join Appointment a on ms.ID = a.IDMedicalService
left join Employee e on a.IDEmployee = e.ID
left join Post p on p.ID = e.IDPost
where (select count(*) from Appointment a where a.IDMedicalService = ms.ID) > 5
group by ms.TitleService, e.LName, e.MName, e.FName, p.PostName
GO
/****** Object:  View [dbo].[VW_InfoService2]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   view [dbo].[VW_InfoService2]
as
Select ms.TitleService, CONCAT(p.LName, ' ', p.FName, ' ', p.MName) AS 'Full name pation', p.DateBirthday
from MedicalService ms left join Appointment a on a.IDMedicalService = ms.ID
left join [Order] o on o.IDAppointment = a.ID
left join Patient p on o.IDPatient = p.ID
where MONTH(p.DateBirthday) = 10
GO
/****** Object:  View [dbo].[VW_InfoService3]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Фамилия и Инициалы клиента, Название услуги, стоимость, Дата предоставления услуги, Продолжительность в минутах.
CREATE   VIEW [dbo].[VW_InfoService3]
AS
SELECT CONCAT(p.LName, ' ', LEFT(p.FName,1), ' ', LEFT(p.MName,1)) AS 'Full name pation', ms.TitleService, ms.Cost, ms.Duration
FROM MedicalService ms RIGHT JOIN Appointment a ON ms.ID = a.IDMedicalService 
	LEFT JOIN [Order] o ON a.ID = o.IDAppointment JOIN Patient p ON o.IDPatient=p.ID
WHERE MONTH(a.DateService) = 3 AND YEAR(a.DateService) = 2020
GO
/****** Object:  View [dbo].[VW_AppointmentFuture]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   view [dbo].[VW_AppointmentFuture]
as
	select p.ID, a.DateService, ms.TitleService, dbo.fn_getFullName(concat(e.LName, ' ', e.FName, ' ', e.MName)) as 'Employee' from Appointment a
	join [Order] o on a.ID = o.IDAppointment
	join Patient p on o.IDPatient = p.ID
	join MedicalService ms on a.IDMedicalService = ms.ID
	join Employee e on a.IDEmployee = e.ID 
GO
/****** Object:  Table [dbo].[City]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[IdCity] [int] IDENTITY(1,1) NOT NULL,
	[NameCity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[IdCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiagnosis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPatient] [int] NOT NULL,
	[IDDiagnosis] [int] NOT NULL,
 CONSTRAINT [PK_PatientDiagnosis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfPatient]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfPatient](
	[IdTag] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TagOfPatient] PRIMARY KEY CLUSTERED 
(
	[IdTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (1, 17, 16, CAST(N'2022-03-31T22:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (2, 18, 21, CAST(N'2022-04-18T20:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (3, 17, 16, CAST(N'2020-01-12T15:09:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (4, 34, 17, CAST(N'2020-03-16T16:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (5, 18, 21, CAST(N'2020-07-20T10:18:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (6, 31, 17, CAST(N'2020-09-30T12:15:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (7, 15, 21, CAST(N'2022-09-23T22:14:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (8, 35, 17, CAST(N'2024-05-23T16:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (9, 13, 25, CAST(N'2020-04-11T10:35:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (10, 30, 22, CAST(N'2022-11-08T01:34:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (11, 14, 19, CAST(N'2021-04-14T09:39:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (12, 16, 11, CAST(N'2021-11-28T10:07:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (13, 30, 22, CAST(N'2021-01-05T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (14, 14, 19, CAST(N'2022-09-18T20:08:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (15, 7, 22, CAST(N'2021-06-13T13:38:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (16, 34, 19, CAST(N'2022-07-20T00:48:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (17, 16, 22, CAST(N'2021-06-03T11:34:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (18, 13, 19, CAST(N'2020-08-04T13:41:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (19, 11, 13, CAST(N'2021-04-12T09:39:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (20, 8, 12, CAST(N'2022-12-03T21:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (21, 34, 17, CAST(N'2021-08-01T02:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (22, 24, 13, CAST(N'2021-02-22T13:19:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (23, 26, 25, CAST(N'2022-07-20T22:35:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (24, 13, 25, CAST(N'2023-08-04T05:44:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (25, 8, 12, CAST(N'2021-01-19T18:48:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (26, 5, 12, CAST(N'2020-10-26T06:58:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (27, 32, 20, CAST(N'2022-02-25T00:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (28, 3, 8, CAST(N'2022-12-08T01:34:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (29, 14, 24, CAST(N'2022-02-06T23:32:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (30, 7, 8, CAST(N'2021-02-28T13:19:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (31, 35, 8, CAST(N'2023-03-07T19:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (32, 15, 15, CAST(N'2021-02-16T20:05:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (33, 27, 24, CAST(N'2021-11-25T13:21:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (34, 14, 24, CAST(N'2020-01-21T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (35, 4, 6, CAST(N'2023-02-24T12:26:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (36, 15, 15, CAST(N'2022-12-13T13:11:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (37, 15, 6, CAST(N'2020-09-09T09:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (38, 35, 15, CAST(N'2023-01-29T11:42:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (39, 14, 15, CAST(N'2021-12-17T13:42:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (40, 5, 18, CAST(N'2022-02-15T00:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (41, 16, 11, CAST(N'2020-07-24T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (42, 17, 5, CAST(N'2022-02-16T23:32:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (43, 32, 20, CAST(N'2022-04-20T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (44, 9, 20, CAST(N'2020-11-25T15:46:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (45, 18, 20, CAST(N'2023-08-07T13:28:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (46, 15, 23, CAST(N'2022-03-18T20:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (47, 16, 10, CAST(N'2020-04-13T10:35:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (48, 15, 23, CAST(N'2023-01-05T17:42:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (49, 5, 28, CAST(N'2023-06-21T09:47:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (50, 16, 10, CAST(N'2020-03-03T07:42:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (51, 16, 28, CAST(N'2020-12-29T04:24:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (52, 13, 10, CAST(N'2020-02-19T07:28:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (53, 15, 10, CAST(N'2022-08-18T15:31:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (54, 12, 8, CAST(N'2021-02-26T20:05:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (55, 9, 7, CAST(N'2022-08-20T22:35:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (56, 13, 2, CAST(N'2021-10-21T05:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (57, 25, 8, CAST(N'2022-12-04T21:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (58, 28, 23, CAST(N'2021-07-25T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (59, 7, 8, CAST(N'2020-03-26T21:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (60, 9, 7, CAST(N'2021-03-12T08:56:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (61, 35, 8, CAST(N'2021-10-21T22:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (62, 13, 2, CAST(N'2023-01-03T11:59:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (63, 22, 8, CAST(N'2021-04-06T22:37:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (64, 4, 8, CAST(N'2023-02-07T15:21:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (65, 6, 7, CAST(N'2023-07-22T22:57:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (66, 32, 8, CAST(N'2022-07-26T06:45:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (67, 33, 2, CAST(N'2020-10-18T11:11:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (68, 20, 8, CAST(N'2021-07-24T23:24:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (69, 35, 2, CAST(N'2022-12-08T03:48:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (70, 7, 26, CAST(N'2021-07-01T02:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (71, 4, 6, CAST(N'2021-02-04T16:47:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (72, 31, 4, CAST(N'2022-04-02T07:11:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (73, 19, 18, CAST(N'2023-07-24T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (74, 31, 4, CAST(N'2022-12-06T19:48:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (75, 17, 5, CAST(N'2021-07-18T22:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (76, 19, 18, CAST(N'2020-02-15T22:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (77, 21, 27, CAST(N'2021-04-18T06:38:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (78, 8, 4, CAST(N'2020-11-08T13:05:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (79, 14, 5, CAST(N'2023-04-15T10:12:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (80, 17, 4, CAST(N'2021-10-17T18:45:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (81, 8, 14, CAST(N'2022-03-07T19:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (82, 5, 28, CAST(N'2021-07-18T15:38:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (83, 20, 9, CAST(N'2023-03-31T22:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (84, 22, 14, CAST(N'2021-04-18T15:38:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (85, 35, 9, CAST(N'2022-06-15T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (86, 10, 3, CAST(N'2020-10-21T05:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (87, 6, 27, CAST(N'2022-11-29T12:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (88, 33, 26, CAST(N'2020-06-15T14:25:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (89, 21, 1, CAST(N'2022-02-04T16:47:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (90, 23, 3, CAST(N'2022-11-30T12:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (91, 6, 27, CAST(N'2022-09-20T13:26:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (92, 33, 26, CAST(N'2021-09-19T15:45:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (93, 20, 1, CAST(N'2020-07-12T18:41:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (94, 17, 27, CAST(N'2022-02-02T13:17:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (95, 30, 26, CAST(N'2022-04-30T06:28:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (96, 19, 26, CAST(N'2022-09-04T04:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (97, 4, 9, CAST(N'2022-03-02T07:11:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (98, 34, 3, CAST(N'2020-03-16T16:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (99, 31, 3, CAST(N'2020-09-30T12:15:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (100, 35, 3, CAST(N'2022-05-23T16:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (101, 13, 3, CAST(N'2020-04-11T10:35:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (102, 16, 3, CAST(N'2021-11-28T10:07:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (103, 3, 3, CAST(N'2022-12-08T01:34:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (104, 7, 3, CAST(N'2021-02-28T13:19:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (105, 35, 3, CAST(N'2023-03-07T19:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (106, 4, 3, CAST(N'2023-02-24T12:26:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (107, 15, 3, CAST(N'2020-09-09T09:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (108, 5, 3, CAST(N'2022-02-15T00:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (109, 32, 3, CAST(N'2022-04-20T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (110, 9, 3, CAST(N'2020-11-25T15:46:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (111, 18, 3, CAST(N'2023-08-07T13:28:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (112, 28, 3, CAST(N'2021-07-25T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (113, 7, 3, CAST(N'2021-07-01T02:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (114, 17, 3, CAST(N'2021-07-18T22:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (115, 14, 3, CAST(N'2023-04-15T10:12:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (116, 5, 3, CAST(N'2021-07-18T15:38:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (117, 6, 3, CAST(N'2022-11-29T12:54:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (118, 21, 3, CAST(N'2022-02-04T16:47:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (119, 6, 3, CAST(N'2022-09-20T13:26:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (120, 20, 3, CAST(N'2020-07-12T18:41:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (121, 17, 3, CAST(N'2022-02-02T13:17:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (122, 4, 3, CAST(N'2022-03-02T07:11:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (123, 20, 12, CAST(N'2020-03-12T07:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (126, 5, 8, CAST(N'2023-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (127, 5, 8, CAST(N'2023-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (128, 5, 8, CAST(N'2023-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (129, 5, 8, CAST(N'2023-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (130, 5, 8, CAST(N'2023-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (131, 1, 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (132, 7, 14, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (133, 8, 7, CAST(N'2023-11-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (134, 9, 7, CAST(N'2023-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (135, 3, 7, CAST(N'2023-11-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Appointment] ([ID], [IDEmployee], [IDMedicalService], [DateService], [TotalPrice]) VALUES (136, 1, 1, CAST(N'2023-11-16T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([IdCity], [NameCity]) VALUES (1, N'Москва')
INSERT [dbo].[City] ([IdCity], [NameCity]) VALUES (2, N'Санкт-Петербург')
INSERT [dbo].[City] ([IdCity], [NameCity]) VALUES (3, N'Самара')
INSERT [dbo].[City] ([IdCity], [NameCity]) VALUES (4, N'Казань')
INSERT [dbo].[City] ([IdCity], [NameCity]) VALUES (5, N'Калининград')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Departament] ON 

INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (1, N'Гастроэнтерологическое 
')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (2, N'Гинекологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (3, N'Дерматологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (4, N'Кардиологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (5, N'Онкологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (6, N'Ортопедическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (7, N'Оториноларингологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (8, N'Офтальмологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (9, N'Педиатрическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (10, N'Психиатрическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (11, N'Психотерапевтическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (12, N'Пульмонологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (13, N'Ревматологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (14, N'Стоматологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (15, N'Терапевтическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (16, N'Урологическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (17, N'Хирургическое')
INSERT [dbo].[Departament] ([ID], [PostName]) VALUES (18, N'Эндокринологическое')
SET IDENTITY_INSERT [dbo].[Departament] OFF
GO
SET IDENTITY_INSERT [dbo].[Diagnosis] ON 

INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (1, N'Ангина')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (2, N'Артрит')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (3, N'Астма')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (4, N'Бронхит')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (5, N'Гастрит')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (6, N'Гепатит')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (7, N'Гипертиреоз')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (8, N'Гипотиреоз')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (9, N'Грипп')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (10, N'Депрессия')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (11, N'Диабет')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (12, N'Мигрень')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (13, N'ОРВИ')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (14, N'Остеопороз')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (15, N'Остеохондроз')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (16, N'Панкреатит')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (17, N'Пневмония')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (18, N'Холецистит')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (19, N'Эпилепсия')
INSERT [dbo].[Diagnosis] ([ID], [Title]) VALUES (20, N'Язва желудка')
SET IDENTITY_INSERT [dbo].[Diagnosis] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (1, N'Платон', N'Семенов', N'Ильич', N'1234', N'321321', N'г. Санкт-Петербург,ул. Черноморская, 348', CAST(N'1978-07-10' AS Date), N'7926378391  ', 15, 17, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (2, N'Милана', N'Волкова', N'Сергеевна', N'1212', N'421232', N'г. Санкт-Петербург, площадь Светлая, 906', CAST(N'1985-01-24' AS Date), N'75178831686 ', 9, 12, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (3, N'Артём', N'Попов', N'Александрович', N'9876', N'567890', N'г. Санкт-Петербург, ул. Производственная, 081 ', CAST(N'1982-12-20' AS Date), N'7819127494  ', 4, 7, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (4, N'Михаил', N'Анисимов', N'Иванович', N'1234', N'512345', N'г. Санкт-Петербург, ал. Донская, 895', CAST(N'1996-07-12' AS Date), N'7,73177E+11 ', 15, 17, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (5, N'Ксения', N'Воробьева', N'Александровна', N'9878', N'902345', N'г. Санкт-Петербург,набережная Кленовая, 590', CAST(N'1991-04-21' AS Date), N'7615242998  ', 17, 19, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (6, N'Екатерина', N'Горелова', N'Тимофеевна', N'7653', N'456789', N'г. Санкт-Петербург,Петровская аллея, 182', CAST(N'1986-09-10' AS Date), N'76714421904 ', 9, 12, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (7, N'Максим', N'Тимофеев', N'Захарович', N'1212', N'332222', N'г. Санкт-Петербург, ул. Линейная, 943', CAST(N'1979-06-09' AS Date), N'75815700085 ', 15, 17, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (8, N'Анна', N'Соколова', N'Артёмовна', N'9999', N'999999', N'г. Санкт-Петербург, Абрикосовая аллея, 209', CAST(N'1981-11-29' AS Date), N'7818964242  ', 17, 19, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (9, N'Ксения', N'Кузнецова', N'Александровна', N'6545', N'676543', N'г. Санкт-Петербург, аллея Ореховая, 801', CAST(N'1987-05-16' AS Date), N'7985403509  ', 2, 6, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (10, N'София', N'Панкратова', N'Егоровна', N'6655', N'446767', N'г. Санкт-Петербург, ул. Черноморская, 368', CAST(N'1974-12-02' AS Date), N'714578666   ', 6, 9, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (11, N'Злата', N'Смирнова', N'Артемьевна', N'6677', N'889098', N'г. Санкт-Петербург, площадь Светлая, 946', CAST(N'1993-04-28' AS Date), N'7085165673  ', 8, 11, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (12, N'Михаил', N'Одинцов', N'Владиславович', N'9076', N'789997', N'г. Санкт-Петербург, ул. Производственная, 031 ', CAST(N'1979-12-29' AS Date), N'7387436855  ', 16, 18, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (13, N'Ева', N'Новикова', N'Ярославовна', N'6677', N'554432', N'г. Санкт-Петербург, ал. Донская, 875', CAST(N'1997-01-26' AS Date), N'7615771391  ', 3, 1, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (14, N'София', N'Кулешова', N'Тимофеевна', N'5987', N'677885', N'г. Санкт-Петербург, набережная Кленовая, 550', CAST(N'1980-07-12' AS Date), N'7773201624  ', 1, 5, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (15, N'София', N'Григорьева', N'Марковна', N'1934', N'321321', N'г. Санкт-Петербург, Петровская аллея, 382', CAST(N'1993-10-30' AS Date), N'7519775014  ', 18, 20, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (16, N'Александр', N'Овчинников', N'Матвеевич', N'1012', N'421232', N'г. Санкт-Петербург, ул. Линейная, 953', CAST(N'1980-06-06' AS Date), N'7628570857  ', 10, 2, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (17, N'Николай', N'Круглов', N'Артёмович', N'9879', N'567890', N'г. Санкт-Петербург, Абрикосовая аллея, 299', CAST(N'1976-12-13' AS Date), N'7809754215  ', 17, 3, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (18, N'Светлана', N'Соколова', N'Александровна', N'1234', N'12345 ', N'г. Санкт-Петербург, аллея Ореховая, 891', CAST(N'1997-05-07' AS Date), N'7126608014  ', 14, 16, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (19, N'Алиса', N'Громова', N'Петровна', N'9878', N'900045', N'г. Санкт-Петербург, набережная Инженерная, 440', CAST(N'1991-11-05' AS Date), N'7937372190  ', 7, 10, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (20, N'Милана', N'Селиванова', N'Данииловна', N'7653', N'400789', N'г. Санкт-Петербург, Воронежская улица, 653', CAST(N'1996-11-01' AS Date), N'7208419921  ', 2, 4, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (21, N'Всеволод', N'Козлов', N'Романович', N'1212', N'300222', N'г. Санкт-Петербург, Енисейская набережная, 590 ', CAST(N'1985-03-10' AS Date), N'7272503032  ', 13, 15, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (22, N'Владислав', N'Ильинский', N'Станиславович', N'9999', N'988999', N'г. Санкт-Петербург, аллея Ульяновская, 356 ', CAST(N'1987-02-16' AS Date), N'7197882003  ', 5, 8, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (23, N'Андрей', N'Орлов', N'Данилович', N'6545', N'6543  ', N'г. Санкт-Петербург, аллея Производственная, 760', CAST(N'2000-08-15' AS Date), N'7882905708  ', 12, 14, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (24, N'Матвей', N'Корнеев', N'Олегович', N'6650', N'446767', N'г. Санкт-Петербург, Путевая аллея, 136 ', CAST(N'1983-12-30' AS Date), N'70175444    ', 11, 13, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (25, N'Юлия', N'Николаева', N'Владимировна', N'6677', N'880098', N'г. Санкт-Петербург, ал. Снежная, 219', CAST(N'1989-07-16' AS Date), N'72292211010 ', 4, 7, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (26, N'Есения', N'Родионова', N'Львовна', N'9076', N'9997  ', N'г. Санкт-Петербург, Малая пл., 824', CAST(N'1971-08-06' AS Date), N'7408809942  ', 2, 6, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (27, N'Ольга', N'Самсонова', N'Александровна', N'9977', N'554432', N'г. Санкт-Петербург, ул. Линейная, 973', CAST(N'1984-01-25' AS Date), N'7181483316  ', 6, 9, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (28, N'Платон', N'Морозов', N'Тимофеевич', N'7987', N'677885', N'г. Санкт-Петербург, Абрикосовая аллея, 219', CAST(N'1971-01-06' AS Date), N'73869499396 ', 8, 11, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (29, N'Григорий', N'Ершов', N'Даниилович', N'6546', N'765555', N'г. Санкт-Петербург, аллея Ореховая, 831', CAST(N'1992-11-23' AS Date), N'7878132311  ', 16, 18, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (30, N'Виктор', N'Иванов', N'Гордеевич', N'3233', N'445788', N'г. Санкт-Петербург, набережная Инженерная, 740', CAST(N'1990-06-23' AS Date), N'7269362237  ', 3, 1, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (31, N'Владислав', N'Коновалов', N'Александрович', N'5456', N'566211', N'г. Санкт-Петербург, Воронежская улица, 613', CAST(N'1971-09-17' AS Date), N'7761673545  ', 1, 5, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (32, N'Даниэль', N'Алексеев', N'Михайлович', N'6563', N'334455', N'г. Санкт-Петербург, Енисейская набережная, 580 ', CAST(N'1999-01-10' AS Date), N'768697869   ', 18, 20, 1)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (33, N'Агата', N'Ткачева', N'Андреевна', N'4333', N'255444', N'г. Санкт-Петербург, аллея Ульяновская, 6 ', CAST(N'1983-07-26' AS Date), N'729425026   ', 10, 2, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (34, N'Алиса', N'Лебедева', N'Львовна', N'5433', N'445566', N'г. Санкт-Петербург, ал. Донская, 85', CAST(N'1998-03-20' AS Date), N'7834707493  ', 17, 3, 2)
INSERT [dbo].[Employee] ([ID], [FName], [LName], [MName], [PassportSeries], [PassportNumber], [Address], [DateBirthday], [Phone], [IDDepartament], [IDPost], [IDGender]) VALUES (35, N'Василиса', N'Егорова', N'Артёмовна', N'5435', N'544654', N'г. Санкт-Петербург, набережная Кленовая, 50', CAST(N'1987-07-31' AS Date), N'7902491447  ', 14, 16, 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([ID], [GenderName]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([ID], [GenderName]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalService] ON 

INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (1, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (2, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (3, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (4, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (5, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (6, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (7, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (8, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (9, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (10, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (11, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (12, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (13, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (14, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (15, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (16, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (17, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (18, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (19, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (20, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (21, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (22, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (23, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (24, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (25, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (26, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (27, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (28, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (29, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (30, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (31, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (32, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (33, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (34, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (35, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (36, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (37, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (38, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (39, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (40, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (41, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (42, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (43, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (44, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (45, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (46, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (47, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (48, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (49, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (50, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (51, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (52, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (53, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (54, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (55, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (56, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (57, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (58, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (59, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (60, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (61, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (62, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (63, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (64, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (65, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (66, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (67, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (68, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (69, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (70, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (71, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (72, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (73, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (74, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (75, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (76, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (77, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (78, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (79, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (80, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (81, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (82, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (83, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (84, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (85, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (86, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (87, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (88, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (89, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (90, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (91, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (92, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (93, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (94, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (95, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (96, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (97, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (98, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (99, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (100, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (101, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (102, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (103, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (104, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (105, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (106, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (107, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (108, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (109, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (110, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (111, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (112, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (113, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (114, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (115, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (116, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (117, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (118, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (119, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (120, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (121, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (122, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (123, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (124, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (125, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (126, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (127, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (128, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (129, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (130, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (131, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (132, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (133, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (134, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (135, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (136, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (137, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (138, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (139, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (140, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (141, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (142, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (143, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (144, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (145, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (146, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (147, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (148, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (149, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (150, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (151, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (152, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (153, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (154, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (155, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (156, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (157, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (158, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (159, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (160, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (161, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (162, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (163, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (164, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (165, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (166, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (167, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (168, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (169, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (170, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (171, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (172, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (173, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (174, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (175, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (176, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (177, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (178, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (179, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (180, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (181, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (182, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (183, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (184, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (185, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (186, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (187, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (188, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (189, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (190, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (191, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (192, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (193, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (194, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (195, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (196, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (197, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (198, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (199, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (200, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (201, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (202, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (203, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (204, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (205, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (206, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (207, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (208, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (209, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (210, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (211, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (212, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (213, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (214, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (215, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (216, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (217, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (218, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (219, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (220, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (221, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (222, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (223, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (224, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (225, N'Инъекции и внутривенные вливания', 30, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (226, N'Кардиограмма', 15, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (227, N'УЗИ брюшной полости', 10, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (228, N'Эндоскопия бронхов', 50, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (229, N'Рентген легких', 5, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (230, N'Анализ крови на общий анализ', 20, CAST(2340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (231, N'Офтальмоскопия', 30, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (232, N'ЭКГ (электрокардиография)', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (233, N'Флюорография', 10, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (234, N'УЗИ щитовидной железы', 25, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (235, N'Консультация невролога', 14, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (236, N'Рентген позвоночника', 17, CAST(10000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (237, N'Гастроэнтероскопия', 30, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (238, N'Энцефалограмма (ЭЭГ)', 20, CAST(2350.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (239, N'Эндоскопия желудка', 30, CAST(1900.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (240, N'КТ грудной клетки', 12, CAST(7340.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (241, N'Гистологическое исследование', 20, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (242, N'УЗИ суставов', 40, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (243, N'Анализ крови на уровень глюкозы', 5, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (244, N'УЗИ печени', 10, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (245, N'Рентген таза', 50, CAST(2450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (246, N'Анализ крови на наличие инфекций', 5, CAST(3478.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (247, N'УЗИ мочевого пузыря', 20, CAST(2389.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (248, N'Рентген плечевого сустава', 30, CAST(2467.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (249, N'Колоноскопия', 40, CAST(100.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (250, N'Анализ крови на уровень калия', 5, CAST(10400.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (251, N'УЗИ сосудов', 20, CAST(3450.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[MedicalService] ([ID], [TitleService], [Duration], [Cost], [Qnt]) VALUES (252, N'Консультация гинеколога', 40, CAST(2350.00 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[MedicalService] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (1, 65, 67, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (2, 1, 62, CAST(6784.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (3, 2, 22, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (4, 1, 58, CAST(6784.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (5, 50, 24, CAST(23567.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (6, 2, 29, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (7, 6, 4, CAST(23567.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (8, 7, 26, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (9, 8, 49, CAST(23567.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (10, 9, 6, CAST(4326.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (11, 10, 42, CAST(876.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (12, 11, 4, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (13, 12, 23, CAST(7895.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (14, 10, 7, CAST(876.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (15, 11, 19, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (16, 15, 39, CAST(876.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (17, 4, 28, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (18, 12, 31, CAST(876.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (19, 9, 30, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (20, 19, 33, CAST(678.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (21, 20, 69, CAST(644.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (22, 4, 12, CAST(156.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (23, 22, 46, CAST(678.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (24, 23, 49, CAST(4326.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (25, 9, 30, CAST(4326.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (26, 20, 37, CAST(644.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (27, 26, 36, CAST(644.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (28, 27, 11, CAST(123.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (29, 28, 21, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (30, 11, 34, CAST(6547.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (31, 15, 68, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (32, 8, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (33, 7, 57, CAST(436.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (34, 33, 61, CAST(6547.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (35, 11, 60, CAST(6547.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (36, 35, 2, CAST(3225.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (37, 7, 18, CAST(436.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (38, 7, 68, CAST(3225.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (39, 8, 22, CAST(436.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (40, 11, 60, CAST(436.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (41, 26, 38, CAST(4356.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (42, 12, 35, CAST(3225.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (43, 1, 28, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (44, 27, 44, CAST(12235.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (45, 44, 1, CAST(12235.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (46, 2, 46, CAST(12235.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (47, 7, 43, CAST(7895.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (48, 12, 59, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (49, 7, 45, CAST(7895.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (50, 26, 65, CAST(6784.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (51, 12, 8, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (52, 12, 69, CAST(6784.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (53, 9, 50, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (54, 7, 45, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (55, 54, 52, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (56, 44, 16, CAST(866.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (57, 9, 14, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (58, 57, 32, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (59, 58, 53, CAST(6547.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (60, 15, 40, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (61, 44, 47, CAST(866.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (62, 8, 13, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (63, 9, 5, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (64, 63, 56, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (65, 35, 42, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (66, 65, 11, CAST(866.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (67, 27, 57, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (68, 67, 59, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (69, 68, 61, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (70, 8, 53, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (71, 15, 66, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (72, 35, 27, CAST(12235.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (73, 6, 36, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (75, 6, 55, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (76, 1, 63, CAST(765.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (79, 20, 12, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (80, 11, 25, CAST(765.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (81, 1, 17, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (82, 20, 3, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (83, 26, 9, CAST(267.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (84, 68, 25, CAST(678.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (85, 63, 31, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (86, 8, 41, CAST(678.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (88, 65, 10, CAST(765.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (89, 67, 39, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (92, 65, 54, CAST(765.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (93, 67, 51, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (94, 68, 20, CAST(2345.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (95, 1, 16, CAST(765.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (96, 10, 14, CAST(432.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (98, 35, 70, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (99, 4, 1, CAST(1120.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (104, 4, 33, CAST(1120.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (106, 128, 32, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (107, 129, 32, CAST(3478.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (109, 3, 3, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (111, 6, 7, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (112, 6, 7, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (113, 130, 32, CAST(3478.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (117, 134, 1, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ID], [IDAppointment], [IDPatient], [TotalPrice]) VALUES (119, 136, 0, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (0, N'test', N'test', N'test', N'test', N'123456789', 1, CAST(N'2004-05-06' AS Date), N'fdsfsa@test.test', NULL, NULL, N'1', N'1')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (1, N'Андреaccа', N'Фролова', N'Иванова', N'344288, г. Санкт-Петербург, ул. Чехова, 1, кв. 34', N'767454871  ', 2, CAST(N'2001-07-14' AS Date), N'gohufreilagrau-3818@yopmail.com', N'1180', N'176596', N'0Z0O6ad3es', N'k9oq0NGQ5vncOxY')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (2, N'Даниил', N'Николаев', N'Всеволодович', N'614164, г. Санкт-Петербург, ул. Степная, 30, кв. 75', N'7823850372  ', 1, CAST(N'2001-02-10' AS Date), N'xawugosune-1385@yopmail.com', N'2280', N'223523', N'cQW1tGrtGd', N'js1NFE50rOz20jv')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (3, N'Макар', N'Снегирев', N'Иванович', N'394242, г. Санкт-Петербург, ул. Коммунистическая, 43, кв. 57', N'70806870987', 1, CAST(N'1998-05-21' AS Date), N'satrahuddusei-4458@yopmail.com', N'4560', N'354155', N'iXQ2nFCOPl', N'OB1C8eYl37DsiVf')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (4, N'Иван', N'Иванов', N'Ильич', N'660540, г. Санкт-Петербург, ул. Солнечная, 25, кв. 78', N'72137065888', 1, CAST(N'1998-10-01' AS Date), N'boippaxeufrepra-7093@yopmail.com', N'9120', N'554296', N'997QBWzR8L', N'8SjchWVJA87WFv2')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (5, N'Анна', N'Филиппова', N'Глебовна', N'125837, г. Санкт-Петербург, ул. Шоссейная, 40, кв. 92', N'7643159140  ', 2, CAST(N'1976-05-31' AS Date), N'zapramaxesu-7741@yopmail.com', N'2367', N'558134', N'85WDiLI5G5', N'fJuVRMrmTFd9ISt')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (6, N'Михаил', N'Иванов', N'Владимирович', N'125703, г. Санкт-Петербург, ул. Партизанская, 49, кв. 84', N'74955425648', 1, CAST(N'1985-11-04' AS Date), N'rouzecroummegre-3899@yopmail.com', N'7101', N'669343', N'7L1C54nOBY', N'b8AvSOWUiENOzaT')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (7, N'Дмитрий', N'Власов', N'Александрович', N'625283, г. Санкт-Петербург, ул. Победы, 46, кв. 7', N'7480798052  ', 1, CAST(N'1998-08-17' AS Date), N'ziyeuddocrabri-4748@yopmail.com', N'3455', N'719630', N'yfxz5J1Td1', N'YOCkdLBiPK990sg')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (8, N'Екатерина', N'Серова', N'Львовна', N'614611, г. Санкт-Петербург, ул. Молодежная, 50, кв. 78', N'7530545394  ', 2, CAST(N'1984-10-24' AS Date), N'ketameissoinnei-1951@yopmail.com', N'2377', N'871623', N'0hIkH6Sg1b', N'TMT10vrS3pPw9Xf')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (9, N'Ирина', N'Борисова', N'Ивановна', N'454311, г. Санкт-Петербург, ул. Новая, 19, кв. 78', N'74337027466', 2, CAST(N'1976-10-14' AS Date), N'yipraubaponou-5849@yopmail.com', N'8755', N'921148', N'IWLP2vRi1O', N'2S2vlSLdtBHovrw')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (10, N'Никита', N'Зайцев', N'Артёмович', N'660007, г. Санкт-Петербург, ул. Октябрьская, 19, кв. 42', N'7634496850  ', 1, CAST(N'1999-10-14' AS Date), N'crapedocouca-3572@yopmail.com', N'4355', N'104594', N'J3EBzG5hmG', N'4N0F7KOEd8BRmrh')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (11, N'Святослав', N'Медведев', N'Евгеньевич', N'603036, г. Санкт-Петербург, ул. Садовая, 4, кв. 13', N'71547318852', 1, CAST(N'1985-07-13' AS Date), N'ceigoixakaunni-9227@yopmail.com', N'2791', N'114390', N'Mznxs7d2CF', N'GmnDQGArTh9SBaN')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (12, N'Кирилл', N'Коротков', N'Алексеевич', N'450983, г. Санкт-Петербург, ул. Комсомольская, 26, кв. 60', N'7428647211  ', 1, CAST(N'1976-05-26' AS Date), N'yeimmeiwauzomo-7054@yopmail.com', N'5582', N'126286', N'6fImK0voyc', N'lb9tVl0xtwNbrI0')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (13, N'Арина', N'Калашникова', N'Максимовна', N'394782, г. Санкт-Петербург, ул. Чехова, 3, кв. 14', N'7556411327  ', 2, CAST(N'1999-08-13' AS Date), N'poleifenevi-1560@yopmail.com', N'2978', N'133653', N'fcoG4avGh2', N'hdCUbhRggO1YbDg')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (14, N'Таисия', N'Минина', N'Кирилловна', N'603002, г. Санкт-Петербург, ул. Дзержинского, 28, кв. 56', N'70612977619', 2, CAST(N'1985-10-13' AS Date), N'kauprezofautei-6607@yopmail.com', N'7512', N'141956', N'56stnAK0Ca', N'LBNrql3qI5jOJqZ')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (15, N'Серафим', N'Наумов', N'Романович', N'450558, г. Санкт-Петербург, ул. Набережная, 30, кв. 71', N'7269801467  ', 1, CAST(N'1999-04-15' AS Date), N'quaffaullelourei-1667@yopmail.com', N'5046', N'158433', N'bcyUjj2eoH', N'6qtoMrFK2cJl4zz')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (16, N'Василиса', N'Воробьева', N'Евгеньевна', N'394060, г. Санкт-Петербург, ул. Фрунзе, 43, кв. 79', N'781055735   ', 2, CAST(N'1999-01-13' AS Date), N'jsteele@rojas-robinson.net', N'2460', N'169505', N'PAZ28U98xH', N'K0VYKT0QcU4iHoR')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (17, N'Александр', N'Калинин', N'Андреевич', N'410661, г. Санкт-Петербург, ул. Школьная, 50, кв. 53', N'7479460665  ', 1, CAST(N'1999-01-07' AS Date), N'vhopkins@lewis-mullen.com', N'3412', N'174593', N'DfsQYF8NLy', N'ocxELnMjrDv1Qhg')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (18, N'Милана', N'Кузнецова', N'Владиславовна', N'625590, г. Санкт-Петербург, ул. Коммунистическая, 20, кв. 34', N'72491161879', 2, CAST(N'1999-01-24' AS Date), N'nlewis@yahoo.com', N'4950', N'183034', N'8j7KJoyC6I', N'tHYmMLhpM1WMVMA')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (19, N'Егор', N'Фирсов', N'Романович', N'625683, г. Санкт-Петербург, ул. 8 Марта, 20, кв. 21', N'799568013   ', 1, CAST(N'1993-09-02' AS Date), N'garciadavid@mckinney-mcbride.com', N'5829', N'219464', N'9GqEvyXpT2', N'nq3eP4nKPzw65Ht')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (20, N'Агния', N'Зимина', N'Александровна', N'400562, г. Санкт-Петербург, ул. Зеленая, 32, кв. 67', N'70826934858', 2, CAST(N'1998-09-03' AS Date), N'cbradley@castro.com', N'6443', N'208059', N'FXFQ6AuRHT', N'xa578Ejij8RCSTx')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (21, N'Андрей', N'Титов', N'Глебович', N'614510, г. Санкт-Петербург, ул. Маяковского, 47, кв. 72', N'77493805894', 1, CAST(N'1985-10-23' AS Date), N'cuevascatherine@carlson.biz', N'7079', N'213265', N'9tRFWiCz0x', N'M1YdhNGhEnE0BHQ')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (22, N'Николай', N'Орлов', N'Егорович', N'410542, г. Санкт-Петербург, ул. Светлая, 46, кв. 82', N'7412263346  ', 1, CAST(N'1985-07-27' AS Date), N'thomasmoore@wilson-singh.net', N'8207', N'522702', N'y66V7VDVfX', N'fuLu1denKh1F0Yp')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (23, N'Аиша', N'Кузнецова', N'Михайловна', N'620839, г. Санкт-Петербург, ул. Цветочная, 8, кв. 100', N'735739516   ', 2, CAST(N'1998-10-04' AS Date), N'jessica84@hotmail.com', N'9307', N'232158', N'2zl89LGYDT', N'tGWRUoJBvv58TyI')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (24, N'Никита', N'Куликов', N'Георгиевич', N'443890, г. Санкт-Петербург, ул. Коммунистическая, 1, кв. 10', N'719991795   ', 1, CAST(N'1999-04-23' AS Date), N'jessicapark@hotmail.com', N'1357', N'242839', N'dqV54kXSRn', N'21CmClqHp6gD6c1')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (25, N'София', N'Карпова', N'Егоровна', N'603379, г. Санкт-Петербург, ул. Спортивная, 46, кв. 95', N'747900334   ', 2, CAST(N'1993-10-01' AS Date), N'ginaritter@schneider-buchanan.com', N'1167', N'256636', N'kR2ilfBVz6', N'1n1WDYIgaJPT065')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (26, N'Дарья', N'Смирнова', N'Макаровна', N'603721, г. Санкт-Петербург, ул. Гоголя, 41, кв. 57', N'73747860920', 2, CAST(N'1976-03-22' AS Date), N'stephen99@yahoo.com', N'1768', N'266986', N'sR0UWQ10d9', N'nuDtR0weQSxZUGL')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (27, N'Александра', N'Абрамова', N'Мироновна', N'410172, г. Санкт-Петербург, ул. Северная, 13, кв. 86', N'716177038   ', 2, CAST(N'1999-03-26' AS Date), N'lopezlisa@hotmail.com', N'1710', N'427875', N'1NuJFuEJdU', N'b2KWqxdJVyYRgWQ')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (28, N'Руслан', N'Наумов', N'Михайлович', N'420151, г. Санкт-Петербург, ул. Вишневая, 32, кв. 81', N'7035385778  ', 1, CAST(N'1999-10-11' AS Date), N'lori17@hotmail.com', N'1806', N'289145', N'8gwMj8dK5H', N'CO0gHSvHBmLn4IK')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (29, N'Никита', N'Бочаров', N'Матвеевич', N'125061, г. Санкт-Петербург, ул. Подгорная, 8, кв. 74', N'7250200410  ', 1, CAST(N'1997-06-29' AS Date), N'campbellkevin@gardner.com', N'1587', N'291249', N'EIw5fdaI1d', N'DasHjJ4uc1vKF6b')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (30, N'Давид', N'Соловьев', N'Ильич', N'630370, г. Санкт-Петербург, ул. Шоссейная, 24, кв. 81', N'7707778639  ', 1, CAST(N'1984-03-06' AS Date), N'morganhoward@clark.com', N'1647', N'306372', N'av0Zv2IhfW', N'0k9uqtG6whmQJIf')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (31, N'Валерия', N'Васильева', N'Дмитриевна', N'614753, г. Санкт-Петербург, ул. Полевая, 35, кв. 39', N'780661446   ', 2, CAST(N'1999-09-30' AS Date), N'carsontamara@gmail.com', N'1742', N'316556', N'1y3CH3uT16', N'sSm1k8dXFEKxnsc')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (32, N'Василиса', N'Макарова', N'Андреевна', N'426030, г. Санкт-Петербург, ул. Маяковского, 44, кв. 93', N'70672778826', 2, CAST(N'1999-04-08' AS Date), N'kevinpatel@gmail.com', N'1474', N'326347', N'lrXIbfS7Zd', N'VivgA9mX6Lx9qQN')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (33, N'Матвей', N'Алексеев', N'Викторович', N'450375, г. Санкт-Петербург, ул. Клубная, 44, кв. 80', N'70268310391', 1, CAST(N'1998-08-02' AS Date), N'sethbishop@yahoo.com', N'1452', N'339539', N'nsw9wP15uA', N'mQ4vOwykt8hqIt5')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (34, N'Полина', N'Никитина', N'Александровна', N'625560, г. Санкт-Петербург, ул. Некрасова, 12, кв. 66', N'76781483166', 2, CAST(N'1976-09-19' AS Date), N'drollins@schultz-soto.net', N'2077', N'443480', N'M291FBDq4D', N'LI7bc4ymfUYY28j')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (35, N'Олеся', N'Окулова', N'Алексеевна', N'630201, г. Санкт-Петербург, ул. Комсомольская, 17, кв. 25', N'73372406674', 2, CAST(N'1999-04-03' AS Date), N'pblack@copeland-winters.org', N'2147', N'357518', N'EhtUa8ISFc', N'iBhWuYaImLrQh0O')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (36, N'Полина', N'Захарова', N'Яновна', N'190949, г. Санкт-Петербург, ул. Мичурина, 26, кв. 93', N'71575822603', 2, CAST(N'1976-04-21' AS Date), N'johnathon.oberbrunner@yahoo.com', N'2687', N'363884', N'zNNOp8MNqY', N'nYC7TXpr0TLg7XA')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (37, N'Владимир', N'Зайцев', N'Давидович', N'350501, г. Санкт-Петербург, ул. Парковая, 2, кв. 7', N'74216752025', 1, CAST(N'1998-01-26' AS Date), N'bradly29@gmail.com', N'2376', N'443711', N'quwYxDpl7P', N'C5gprNfjShZtoCg')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (38, N'Виталий', N'Иванов', N'Даниилович', N'450048, г. Санкт-Петербург, ул. Коммунистическая, 21, кв. 3', N'77633715380', 1, CAST(N'1976-08-11' AS Date), N'stark.cristina@hilpert.biz', N'2568', N'386237', N'RhHQ9RHyKF', N'mq8GtcUZ8t73Yzl')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (39, N'Матвей', N'Захаров', N'Романович', N'644921, г. Санкт-Петербург, ул. Школьная, 46, кв. 37', N'77213527734', 1, CAST(N'1993-07-12' AS Date), N'bruen.eleanore@yahoo.com', N'2556', N'439376', N'fTBmrL4syo', N'xs3Aj2mU0J9fwxS')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (40, N'Степан', N'Иванов', N'Степанович', N'614228, г. Санкт-Петербург, ул. Дорожная, 36, кв. 54', N'7199248901  ', 1, CAST(N'1998-09-19' AS Date), N'percival.halvorson@yahoo.com', N'2737', N'407501', N'M6XJnhxNgy', N'FztaslxBwi01NkK')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (41, N'Милана', N'Ткачева', N'Тимуровна', N'350940, г. Санкт-Петербург, ул. Первомайская, 23, кв. 2', N'7494230112  ', 2, CAST(N'1998-05-24' AS Date), N'javonte71@kuhlman.biz', N'2581', N'441645', N'8VShidHvrx', N'DRLK7SXLLpfH4mq')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (42, N'Даниил', N'Семенов', N'Иванович', N'344990, г. Санкт-Петербург, ул. Красноармейская, 19, кв. 92', N'755734171   ', 1, CAST(N'1976-01-04' AS Date), N'vconnelly@kautzer.com', N'2675', N'427933', N'eU3ug9ruaS', N'sdLuxblIATykm0n')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (43, N'Вячеслав', N'Виноградов', N'Дмитриевич', N'410248, г. Санкт-Петербург, ул. Чкалова, 11, кв. 75', N'771953865   ', 1, CAST(N'1976-07-12' AS Date), N'anabelle07@schultz.info', N'2967', N'434531', N'sI2WU7amzk', N'DVfK5YGd27Z50FU')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (44, N'Николь', N'Соболева', N'Фёдоровна', N'400839, г. Санкт-Петербург, ул. 8 Марта, 46, кв. 44', N'704060072   ', 2, CAST(N'1976-05-02' AS Date), N'nitzsche.katlynn@yahoo.com', N'3070', N'449655', N'gdRRkjgNi3', N'm8Yh9oVJfViGFcq')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (45, N'Анна', N'Тихонова', N'Львовна', N'450539, г. Санкт-Петербург, ул. Заводская, 3, кв. 81', N'797751169   ', 2, CAST(N'1985-03-23' AS Date), N'corine16@von.com', N'3108', N'451174', N'bxRxGBn7Xt', N'vQFWyPxMznxWQp4')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (46, N'Ульяна', N'Кузнецова', N'Савельевна', N'614591, г. Санкт-Петербург, ул. Цветочная, 20, кв. 40', N'7964607562  ', 2, CAST(N'1999-06-03' AS Date), N'otha.wisozk@lubowitz.org', N'3250', N'464705', N'yL3ABFCrei', N'LhVG4VGKpV84QXW')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (47, N'Анна', N'Смирнова', N'Германовна', N'400260, г. Санкт-Петербург, ул. Больничная, 30, кв. 53', N'76646571801', 2, CAST(N'1997-07-18' AS Date), N'may.kirlin@hotmail.com', N'3392', N'471644', N'H8Z6lsEn1S', N'27dxgpwi9S7yFVN')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (48, N'Анна', N'Черепанова', N'Давидовна', N'660924, г. Санкт-Петербург, ул. Молодежная, 32, кв. 59', N'7881080387  ', 2, CAST(N'1985-11-06' AS Date), N'bryana.kautzer@yahoo.com', N'3497', N'487819', N'rGPE7RWkoE', N'RpNfIeDoKu20lGw')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (49, N'Максим', N'Григорьев', N'Кириллович', N'644133, г. Санкт-Петербург, ул. Гагарина, 28, кв. 69', N'72389415180', 1, CAST(N'1999-05-26' AS Date), N'deborah.christiansen@quigley.biz', N'3560', N'491260', N'gpAs3w9sLq', N'NuVc6NsoTRssJwU')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (50, N'Даниэль', N'Голубев', N'Александрович', N'450698, г. Санкт-Петербург, ул. Вокзальная, 14, кв. 37', N'72653541332', 1, CAST(N'1999-06-14' AS Date), N'connelly.makayla@yahoo.com', N'3620', N'506034', N'tpNSLD6IL3', N'd65vdI5nwU9OSK5')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (51, N'Юрий', N'Миронов', N'Денисович', N'620653, г. Санкт-Петербург, ул. Западная, 15, кв. 25', N'7314915244  ', 1, CAST(N'1985-01-26' AS Date), N'tatum.collins@fay.org', N'3774', N'511438', N'jWRkEr26oX', N'9b6xdla7lETZvwR')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (52, N'Михаил', N'Терехов', N'Андреевич', N'644321, г. Санкт-Петербург, ул. Клубная, 32, кв. 10', N'738901083   ', 1, CAST(N'1976-07-06' AS Date), N'itzel73@anderson.com', N'3862', N'521377', N'z36HOfkcl6', N'vzP1AsnBctc8npH')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (53, N'Алиса', N'Орлова', N'Михайловна', N'603653, г. Санкт-Петербург, ул. Молодежная, 2, кв. 45', N'7361122457  ', 2, CAST(N'1997-02-24' AS Date), N'arjun39@hotmail.com', N'3084', N'535966', N'nh3KKA08ct', N'VCF7pkT5Tb7v12s')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (54, N'Константин', N'Кулаков', N'Даниилович', N'410181, г. Санкт-Петербург, ул. Механизаторов, 16, кв. 74', N'77166288601', 1, CAST(N'1993-06-20' AS Date), N'ohara.rebeka@yahoo.com', N'4021', N'541528', N'qAKaWm7GME', N'RUu7OTxdhXqcDZ5')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (55, N'Максим', N'Кудрявцев', N'Романович', N'394207, г. Санкт-Петербург, ул. Свердлова, 31, кв. 28', N'7305048784  ', 1, CAST(N'1998-05-10' AS Date), N'danika58@rath.com', N'4109', N'554053', N'Wh0ghMAiwQ', N'FqP5sOd6sUuRTtd')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (56, N'Кира', N'Соболева', N'Фёдоровна', N'420633, г. Санкт-Петербург, ул. Матросова, 18, кв. 41', N'77610670396', 2, CAST(N'1998-03-14' AS Date), N'janae.bogan@gmail.com', N'4537', N'564868', N'pq91UfhXmK', N'NepJ20oFASgyqi9')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (57, N'Арсений', N'Коновалов', N'Максимович', N'445720, г. Санкт-Петербург, ул. Матросова, 50, кв. 67', N'728150203   ', 1, CAST(N'1985-02-18' AS Date), N'vern91@yahoo.com', N'4914', N'572471', N'JGa7Z5O8zt', N'6fNz1NkyYdudffd')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (58, N'Михаил', N'Гусев', N'Дмитриевич', N'400646, г. Санкт-Петербург, ул. Октябрьская, 47, кв. 65', N'7674629016  ', 1, CAST(N'1999-11-23' AS Date), N'mariana.leannon@larkin.net', N'4445', N'581302', N'5Wxy1NX40l', N'S7EPE3u1yKS7W05')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (59, N'Варвара', N'Суханова', N'Матвеевна', N'644410, г. Санкт-Петербург, ул. Красная, 17, кв. 69', N'72689823536', 2, CAST(N'1993-09-13' AS Date), N'vmoore@gmail.com', N'4743', N'598180', N'1Obar16idw', N'E1aTTKAs5qoVn8b')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (60, N'Ясмина', N'Орлова', N'Васильевна', N'400750, г. Санкт-Петербург, ул. Школьная, 36, кв. 71', N'7388096464  ', 2, CAST(N'1984-06-24' AS Date), N'damon.mcclure@mills.com', N'4741', N'601821', N'i9SURzqBhu', N'T8Gymc8965PFZdQ')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (61, N'Ксения', N'Васильева', N'Константиновна', N'660590, г. Санкт-Петербург, ул. Дачная, 37, кв. 70', N'77016238407', 2, CAST(N'1999-08-01' AS Date), N'grady.reilly@block.com', N'4783', N'612567', N'aG3N5KmKI6', N'EbOox9lDrWrGknY')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (62, N'Тамара', N'Борисова', N'Данииловна', N'426083, г. Санкт-Петербург, ул. Механизаторов, 41, кв. 26', N'7466105533  ', 2, CAST(N'1993-05-29' AS Date), N'boyd.koss@yahoo.com', N'4658', N'621200', N'BRA0xq16Hm', N'nr9CaiErPMHufW2')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (63, N'Мирон', N'Дмитриев', N'Ильич', N'410569, г. Санкт-Петербург, ул. Парковая, 36, кв. 17', N'7644908888  ', 1, CAST(N'1985-04-13' AS Date), N'obartell@franecki.info', N'4908', N'634613', N'yDM44jguVa', N'zd2Rt3jWJuae9Lq')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (64, N'Анна', N'Лебедева', N'Александровна', N'443375, г. Санкт-Петербург, ул. Дзержинского, 50, кв. 95', N'750897861   ', 2, CAST(N'1985-03-30' AS Date), N'reina75@ferry.net', N'5092', N'642468', N'RVMH4OusyU', N'WF8XWOc835RC7Fg')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (65, N'Артём', N'Пономарев', N'Маркович', N'614316, г. Санкт-Петербург, ул. Первомайская, 48, кв. 31', N'7382981215  ', 1, CAST(N'1984-06-02' AS Date), N'karson28@hotmail.com', N'5155', N'465274', N'8E4mwonbep', N'hRT0fNJbzhGi8kr')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (66, N'Елена', N'Борисова', N'Михайловна', N'445685, г. Санкт-Петербург, ул. Зеленая, 7, кв. 47', N'76035149944', 2, CAST(N'1976-05-23' AS Date), N'damaris61@okon.com', N'5086', N'666893', N'X2A6QjHVrj', N'8KUb8yvzww486Cp')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (67, N'Камиль', N'Моисеев', N'Максимович', N'614505, г. Санкт-Петербург, ул. Нагорная, 37, кв. 31', N'773515759   ', 1, CAST(N'1999-06-17' AS Date), N'carroll.jerod@hotmail.com', N'5333', N'675375', N'aolLl5SD0B', N'363znQk1KnHxTLj')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (68, N'Дарья', N'Герасимова', N'Константиновна', N'426629, г. Санкт-Петербург, ул. Весенняя, 32, кв. 46', N'7845577174  ', 2, CAST(N'1984-10-13' AS Date), N'ron.treutel@quitzon.com', N'5493', N'684572', N'xbf6L1wLS7', N'ujzT6e4CgCLuj03')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (69, N'Мария', N'Михайлова', N'Марковна', N'603743, г. Санкт-Петербург, ул. Матросова, 19, кв. 20', N'709142187   ', 2, CAST(N'1976-12-02' AS Date), N'olen79@yahoo.com', N'5150', N'696226', N'jcc771Khkk', N'NJVp5nviXzxX0k6')
INSERT [dbo].[Patient] ([ID], [FName], [LName], [MName], [Address], [Phone], [IdGender], [Birthday], [Email], [PassportSeries], [PassportNumber], [Login], [Password]) VALUES (70, N'Кирилл', N'Коршунов', N'Максимович', N'450750, г. Санкт-Петербург, ул. Клубная, 23, кв. 90', N'760127976   ', 1, CAST(N'1985-05-22' AS Date), N'pacocha.robbie@yahoo.com', N'1308', N'703305', N'9hKtmsSdr3', N'KEiE8deafBkhcgw')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientDiagnosis] ON 

INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (1, 67, 4)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (2, 62, 8)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (3, 22, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (4, 58, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (5, 24, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (6, 29, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (7, 4, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (8, 26, 5)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (9, 49, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (10, 6, 18)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (11, 42, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (12, 4, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (13, 23, 2)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (14, 7, 17)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (15, 19, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (16, 39, 8)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (17, 28, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (18, 31, 20)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (19, 30, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (20, 33, 20)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (21, 69, 19)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (22, 12, 5)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (23, 46, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (24, 49, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (25, 30, 11)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (26, 37, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (27, 36, 11)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (28, 11, 17)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (29, 21, 9)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (30, 34, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (31, 68, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (32, 1, 20)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (33, 57, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (34, 61, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (35, 60, 7)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (36, 2, 14)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (37, 18, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (38, 68, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (39, 22, 4)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (40, 60, 20)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (41, 38, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (42, 35, 7)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (43, 28, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (44, 44, 5)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (45, 1, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (46, 46, 18)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (47, 43, 11)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (48, 59, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (49, 45, 8)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (50, 65, 12)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (51, 8, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (52, 69, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (53, 50, 17)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (54, 45, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (55, 52, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (56, 16, 10)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (57, 14, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (58, 32, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (59, 53, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (60, 40, 10)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (61, 47, 4)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (62, 13, 18)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (63, 5, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (64, 56, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (65, 42, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (66, 11, 7)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (67, 57, 19)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (68, 59, 10)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (69, 61, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (70, 53, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (71, 66, 17)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (72, 27, 2)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (73, 36, 4)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (74, 50, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (75, 55, 3)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (76, 63, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (77, 64, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (78, 15, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (79, 12, 2)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (80, 25, 3)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (81, 17, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (82, 3, 3)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (83, 9, 15)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (84, 25, 16)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (85, 31, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (86, 41, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (87, 48, 5)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (88, 10, 14)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (89, 39, 3)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (90, 26, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (91, 17, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (92, 54, 19)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (93, 51, 20)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (94, 20, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (95, 16, 13)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (96, 14, 14)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (97, 32, 6)
INSERT [dbo].[PatientDiagnosis] ([ID], [IDPatient], [IDDiagnosis]) VALUES (98, 70, 1)
SET IDENTITY_INSERT [dbo].[PatientDiagnosis] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([ID], [PostName]) VALUES (1, N'Дерматолог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (2, N'Психиатр')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (3, N'Хирург')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (4, N'Акушер-гинеколог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (5, N'Гастроэнтеролог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (6, N'Гинеколог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (7, N'Кардиолог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (8, N'Онколог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (9, N'Ортопед')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (10, N'Оториноларинголог (ЛОР)')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (11, N'Офтальмолог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (12, N'Педиатр')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (13, N'Психотерапевт')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (14, N'Пульмонолог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (15, N'Ревматолог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (16, N'Стоматолог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (17, N'Терапевт')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (18, N'Уролог')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (19, N'Хирург')
INSERT [dbo].[Post] ([ID], [PostName]) VALUES (20, N'Эндокринолог')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[TagOfPatient] ON 

INSERT [dbo].[TagOfPatient] ([IdTag], [Title]) VALUES (1, N'Новый пациент')
INSERT [dbo].[TagOfPatient] ([IdTag], [Title]) VALUES (2, N'Постоянный пациент')
SET IDENTITY_INSERT [dbo].[TagOfPatient] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employee]    Script Date: 03.11.2023 13:47:08 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Employee] FOREIGN KEY([IDEmployee])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Employee]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_MedicalService] FOREIGN KEY([IDMedicalService])
REFERENCES [dbo].[MedicalService] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_MedicalService]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Departament] FOREIGN KEY([IDDepartament])
REFERENCES [dbo].[Departament] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Departament]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([IDPost])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Appointment1] FOREIGN KEY([IDAppointment])
REFERENCES [dbo].[Appointment] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Appointment1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Gender] FOREIGN KEY([IdGender])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Gender]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Diagnosis] FOREIGN KEY([IDDiagnosis])
REFERENCES [dbo].[Diagnosis] ([ID])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Diagnosis]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Patient] FOREIGN KEY([IDPatient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Patient]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee] CHECK  (([FName]<>N''))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_1] CHECK  (([LName]<>N''))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CK_Employee_2] CHECK  (([MName]<>N''))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CK_Employee_2]
GO
ALTER TABLE [dbo].[MedicalService]  WITH CHECK ADD  CONSTRAINT [CK_MedicalService] CHECK  (([duration]>(0)))
GO
ALTER TABLE [dbo].[MedicalService] CHECK CONSTRAINT [CK_MedicalService]
GO
ALTER TABLE [dbo].[MedicalService]  WITH CHECK ADD  CONSTRAINT [CK_MedicalService_1] CHECK  (([Cost]>(0)))
GO
ALTER TABLE [dbo].[MedicalService] CHECK CONSTRAINT [CK_MedicalService_1]
GO
ALTER TABLE [dbo].[MedicalService]  WITH CHECK ADD  CONSTRAINT [CK_MedicalService_2] CHECK  (([Qnt]>(0)))
GO
ALTER TABLE [dbo].[MedicalService] CHECK CONSTRAINT [CK_MedicalService_2]
GO
/****** Object:  StoredProcedure [dbo].[PR_InfoCity]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PR_InfoCity]
	@City nvarchar(50),
	@IntervalStart datetime,
	@IntervalEnd datetime
AS
	--DECLARE @ClientsNumber int = 
	(SELECT COUNT(p.IdCity) AS 'CountCityPation'
	FROM Patient p RIGHT JOIN City c ON p.IdCity = c.IdCity RIGHT JOIN [Order] o ON p.ID = o.IDPatient
		 RIGHT JOIN Appointment a ON o.IDAppointment = a.ID
		WHERE a.DateService BETWEEN @IntervalStart AND @IntervalEnd)
GO
/****** Object:  StoredProcedure [dbo].[PR_InfoService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PR_InfoService]
AS
	SELECT TitleService, Duration, Cost
	FROM MedicalService
GO
/****** Object:  StoredProcedure [dbo].[PR_PopularService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PR_PopularService]
AS
	SELECT TOP 5 (SELECT COUNT(a.IDMedicalService) 
				  FROM Appointment a 
				  WHERE a.IDMedicalService = ms.ID) AS 'CountMedicalService', TitleService
	FROM MedicalService ms LEFT JOIN Appointment a ON ms.ID = a.IDMedicalService
	GROUP BY ms.ID, TitleService
	ORDER BY COUNT(a.IDMedicalService) DESC
GO
/****** Object:  StoredProcedure [dbo].[PR_QuantityService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PR_QuantityService]
	@TitleService nvarchar(100)
AS
	SELECT COUNT(a.IDMedicalService) AS 'CountService', SUM(Cost) AS 'FullCostService'
	FROM MedicalService ms LEFT JOIN Appointment a ON ms.ID = a.IDMedicalService
	WHERE ms.TitleService = @TitleService
GO
/****** Object:  StoredProcedure [dbo].[PR_RecordService]    Script Date: 03.11.2023 13:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[PR_RecordService]
	@nameService nvarchar(1000),
	@startTime nvarchar(10),
	@phone nvarchar(20),
	@idEmployee int
AS
	IF NOT EXISTS (SELECT * FROM MedicalService WHERE TitleService = @nameservice)
		PRINT 'Проверьте правильность наименования услуги, такой услуги в нашей компании нет'
		ELSE
	IF NOT EXISTS (SELECT * FROM Patient WHERE Phone = @phone)
		PRINT 'Клиента с указанным номером телефона нет в базе данных, для записи на услугу добавьте сведения о клиенте'
	ELSE
		BEGIN
	--IF EXISTS (SELECT * FROM Client C JOIN ClientService CS ON C.IdClient = CS.IdClient JOIN Service S ON S.IdService = CS.IdService WHERE Phone = @phone AND Title = @nameservice)
		DECLARE @idService int = (SELECT TOP 1 ID FROM MedicalService WHERE TitleService = @nameservice)
		DECLARE @idPatient int = (SELECT ID FROM Patient WHERE Phone = @phone)
		DECLARE @fullName nvarchar(100) = (SELECT CONCAT(LName, ' ',LEFT(FName,1),'.',LEFT(MName,1),'.') AS 'ФИО' FROM Patient WHERE Phone = @phone)
		INSERT INTO Appointment (IDEmployee, IDMedicalService, DateService)
		VALUES (@idEmployee, @idService, @startTime)
		DECLARE @idAppoitment int = (SELECT TOP 1 ID FROM Appointment ORDER BY ID DESC)
		INSERT INTO [Order] (IDAppointment, IDPatient, TotalPrice)
		VALUES (@idAppoitment, @idPatient, (SELECT Cost FROM MedicalService WHERE ID = @idService))
		PRINT 'Запись на услугу успешно добавлена! ' + @fullName + ' записан(a) на услугу ' + @nameservice + ' на ' + @startTime
		END;
GO
USE [master]
GO
ALTER DATABASE [Hospital_Vlasov_Bahvalova_4ISP9-14] SET  READ_WRITE 
GO
