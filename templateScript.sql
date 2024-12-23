USE [master]
GO
/****** Object:  Database [Template_DB]    Script Date: 25-11-2024 3.39.29 PM ******/
CREATE DATABASE [Template_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Template_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Template_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Template_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Template_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Template_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Template_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Template_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Template_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Template_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Template_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Template_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Template_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Template_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Template_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Template_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Template_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Template_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Template_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Template_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Template_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Template_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Template_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Template_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Template_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Template_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Template_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Template_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Template_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Template_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Template_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Template_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Template_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Template_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Template_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Template_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Template_DB] SET QUERY_STORE = OFF
GO
USE [Template_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Template_DB]
GO
/****** Object:  Table [dbo].[Classic]    Script Date: 25-11-2024 3.39.29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classic](
	[ClassicID] [int] IDENTITY(1,1) NOT NULL,
	[ClassicName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Festivals]    Script Date: 25-11-2024 3.39.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Festivals](
	[FestivalID] [int] IDENTITY(1,1) NOT NULL,
	[FestivalName] [varchar](50) NOT NULL,
	[MonthID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FestivalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Months]    Script Date: 25-11-2024 3.39.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Months](
	[MonthID] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Templates]    Script Date: 25-11-2024 3.39.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Templates](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](50) NOT NULL,
	[FestivalID] [int] NULL,
	[ClassicID] [int] NULL,
	[TemplateImagePath] [varchar](255) NULL,
	[Day] [int] NULL,
	[creationdate] [date] NULL,
	[updationdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classic] ON 

INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1, N'Welcome')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (5, N'AllTheBest')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (6, N'Birthday')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (8, N'ThankYou')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (9, N'WeddingAnniversary')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1011, N'workanniversary')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1014, N'Congratulations')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1015, N'WorldCancerDay')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1016, N'worldTuberculosisday')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1017, N'worldNurseDay')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1018, N'worldBloodDonerDay')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1019, N'NationalDoctor''sDay')
INSERT [dbo].[Classic] ([ClassicID], [ClassicName]) VALUES (1020, N'worldHealthDay')
SET IDENTITY_INSERT [dbo].[Classic] OFF
GO
SET IDENTITY_INSERT [dbo].[Festivals] ON 

INSERT [dbo].[Festivals] ([FestivalID], [FestivalName], [MonthID]) VALUES (2, N'DurgaPuja', 10)
INSERT [dbo].[Festivals] ([FestivalID], [FestivalName], [MonthID]) VALUES (3, N'Dussehra', 10)
INSERT [dbo].[Festivals] ([FestivalID], [FestivalName], [MonthID]) VALUES (4, N'Navratri', 10)
INSERT [dbo].[Festivals] ([FestivalID], [FestivalName], [MonthID]) VALUES (1004, N'MerryChristmas', 12)
INSERT [dbo].[Festivals] ([FestivalID], [FestivalName], [MonthID]) VALUES (1005, N'HappyNewYear', 12)
SET IDENTITY_INSERT [dbo].[Festivals] OFF
GO
SET IDENTITY_INSERT [dbo].[Months] ON 

INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (1, N'January')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (2, N'February')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (3, N'March')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (4, N'April')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (5, N'May')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (6, N'June')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (7, N'July')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (8, N'August')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (9, N'September')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (10, N'October')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (11, N'November')
INSERT [dbo].[Months] ([MonthID], [MonthName]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[Months] OFF
GO
SET IDENTITY_INSERT [dbo].[Templates] ON 

INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (7, N'DurgaPuja', 2, NULL, N'/Content/Images/Festivals/DurgaPuja/durgapuja.jpg', 9, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (8, N'DurgaPuja', 2, NULL, N'/Content/Images/Festivals/DurgaPuja/durgapuja1.jpg', 9, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (9, N'DurgaPuja', 2, NULL, N'/Content/Images/Festivals/DurgaPuja/durgapuja2.jpg', 9, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (10, N'Dussehra', 3, NULL, N'/Content/Images/Festivals/Dussehra/dussehra.jpg', 12, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (11, N'Dussehra', 3, NULL, N'/Content/Images/Festivals/Dussehra/dussehra1.jpg', 12, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (12, N'Dussehra', 3, NULL, N'/Content/Images/Festivals/Dussehra/dussehra2.jpg', 12, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (34, N'Navratri', 4, NULL, N'/Content/Images/Festivals/Navratri/navratri.jpg', 3, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (35, N'Navratri', 4, NULL, N'/Content/Images/Festivals/Navratri/navratri1.jpg', 3, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (36, N'Navratri', 4, NULL, N'/Content/Images/Festivals/Navratri/navratri3.jpg', 3, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1034, N'welcome', NULL, 1, N'/Content/Images/Classics/welcome/1.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1035, N'AllTheBest', NULL, 5, N'/Content/Images/Classics/AllTheBest/5.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1038, N'ThankYou', NULL, 8, N'/Content/Images/Classics/ThankYou/3.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1039, N'WeddingAnniversary', NULL, 9, N'/Content/Images/Classics/WeddingAnniversary/7.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1040, N'workanniversary', NULL, 1011, N'/Content/Images/Classics/workanniversary/4.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1041, N'Congratulations', NULL, 1014, N'/Content/Images/Classics/Congratulations/6.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1042, N'Birthday', NULL, 6, N'/Content/Images/Classics/Birthday/2.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1043, N'WorldCancerDay', NULL, 1015, N'/Content/Images/Classics/WorldCancerDay/8.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1044, N'worldTuberculosisday', NULL, 1016, N'/Content/Images/Classics/worldTuberculosisday/9.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1045, N'worldNurseDay', NULL, 1017, N'/Content/Images/Classics/worldNurseDay/11.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1046, N'worldBloodDonerDay', NULL, 1018, N'/Content/Images/Classics/worldBloodDonerDay/12.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1047, N'NationalDoctor''sDay', NULL, 1019, N'/Content/Images/Classics/NationalDoctor''sDay/13.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1048, N'worldHealthDay', NULL, 1020, N'/Content/Images/Classics/worldHealthDay/14.jpg', NULL, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1049, N'MerryChristmas', 1004, NULL, N'/Content/Images/Festivals/MerryChristmas/15.jpg', 25, NULL, NULL)
INSERT [dbo].[Templates] ([TemplateID], [TemplateName], [FestivalID], [ClassicID], [TemplateImagePath], [Day], [creationdate], [updationdate]) VALUES (1050, N'HappyNewYear', 1005, NULL, N'/Content/Images/Festivals/HappyNewYear/16.jpg', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Templates] OFF
GO
ALTER TABLE [dbo].[Festivals]  WITH CHECK ADD FOREIGN KEY([MonthID])
REFERENCES [dbo].[Months] ([MonthID])
GO
ALTER TABLE [dbo].[Templates]  WITH CHECK ADD FOREIGN KEY([ClassicID])
REFERENCES [dbo].[Classic] ([ClassicID])
GO
ALTER TABLE [dbo].[Templates]  WITH CHECK ADD FOREIGN KEY([FestivalID])
REFERENCES [dbo].[Festivals] ([FestivalID])
GO
/****** Object:  StoredProcedure [dbo].[sp_Template]    Script Date: 25-11-2024 3.39.30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Template](
    @Action VARCHAR(30),
    @MonID INT = NULL,
    @FesID INT = NULL,
    @ClaID INT = NULL,
    @Day INT = NULL,
    @TemplateName NVARCHAR(100) = NULL,
    @TemplateImagePath NVARCHAR(255) = NULL,
    @FestivalName NVARCHAR(100) = NULL 
)
AS
BEGIN
   IF (@Action = 'GetFestivalsByMonth')
BEGIN
    IF EXISTS (SELECT 1 FROM Months WHERE MonthID = @MonID)
    BEGIN
         SELECT 
            f.FestivalID,
            f.FestivalName,
            MIN(t.Day) AS Day
        FROM 
            Festivals f
        JOIN 
            Templates t ON f.FestivalID = t.FestivalID
        WHERE 
            f.MonthID = @MonID
        GROUP BY 
            f.FestivalID, f.FestivalName 
		order by Day asc;
    END
    ELSE
    BEGIN
        SELECT 'Failure' AS Retval, 'MonthID not found' AS Message;
    END
END

			ELSE IF (@Action = 'GetAllFestivalTemplates')
				BEGIN
						SELECT distinct
						f.FestivalName,
						f.MonthID,
						ISNULL(t.day, 0) AS Day
					   FROM Festivals f
					   INNER JOIN Templates t 
					   ON f.FestivalID = t.FestivalID
				END


    ELSE IF (@Action = 'GetAllClassicTemplates')
    BEGIN
        SELECT ClassicID, ClassicName 
        FROM Classic;
        
      --  SELECT 'Success' AS Retval, 'Classic templates retrieved successfully' AS Message;
    END

    ELSE IF (@Action = 'GetTemplateByFestivalId')
    BEGIN
        IF EXISTS (SELECT 1 FROM Festivals WHERE FestivalID = @FesID)
        BEGIN
            SELECT TemplateName, TemplateImagePath, Day
            FROM Templates 
            WHERE FestivalID = @FesID;
        END
        ELSE
        BEGIN
            SELECT 'Failure' AS Retval, 'FestivalID not found' AS Message;
        END
    END

    ELSE IF (@Action = 'GetTemplateByClassicId')
    BEGIN
        IF EXISTS (SELECT 1 FROM Classic WHERE ClassicID = @ClaID)
        BEGIN
            SELECT TemplateName, TemplateImagePath, Day
            FROM Templates 
            WHERE ClassicID = @ClaID;
        END
        ELSE
        BEGIN
            SELECT 'Failure' AS Retval, 'ClassicID not found' AS Message;
        END
    END

    ELSE IF (@Action = 'InsertTemplateWithFestival')
    BEGIN
        DECLARE @FestivalId INT;

        SELECT @FestivalId = FestivalID 
        FROM Festivals 
        WHERE FestivalName = @FestivalName AND MonthID = @MonID;

        IF (@FestivalId IS NULL)
        BEGIN
            INSERT INTO Festivals (FestivalName, MonthID)
            VALUES (@FestivalName, @MonID);

            SET @FestivalId = SCOPE_IDENTITY();
        END

        IF (@FestivalId IS NOT NULL)
        BEGIN
            INSERT INTO Templates (TemplateName, FestivalID, TemplateImagePath, Day ,creationdate)
            VALUES (@TemplateName, @FestivalId, @TemplateImagePath, @Day,getdate());

            SELECT 'Success' AS Retval, 'Template and Festival inserted successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT 'Failure' AS Retval, 'Failed to insert Festival' AS Message;
        END
    END

    ELSE IF (@Action = 'InsertTemplateClassic')
    BEGIN
        DECLARE @ClassicId INT;

        IF NOT EXISTS (SELECT 1 FROM Classic WHERE ClassicName = @TemplateName)
        BEGIN
            INSERT INTO Classic (ClassicName)
            VALUES (@TemplateName);

            SET @ClassicId = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            SELECT @ClassicId = ClassicID FROM Classic WHERE ClassicName = @TemplateName;
        END

        IF (@ClassicId IS NOT NULL)
        BEGIN
            INSERT INTO Templates (TemplateName, ClassicID, TemplateImagePath, Day,creationdate)
            VALUES (@TemplateName, @ClassicId, @TemplateImagePath, @Day,GETDATE());

            SELECT 'Success' AS Retval, 'Template with ClassicID inserted successfully' AS Message;
        END
        ELSE
        BEGIN
            SELECT 'Failure' AS Retval, 'Failed to retrieve or create ClassicID' AS Message;
        END
    END
    ELSE
    BEGIN
        SELECT 'Failure' AS Retval, 'Invalid Action' AS Message;
    END
END;



--select * from Templates
GO
USE [master]
GO
ALTER DATABASE [Template_DB] SET  READ_WRITE 
GO
