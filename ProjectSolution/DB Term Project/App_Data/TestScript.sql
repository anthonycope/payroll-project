USE [master]
GO
/****** Object:  Database [DBProject]    Script Date: 03/23/2013 23:30:28 ******/
CREATE DATABASE [DBProject] ON  PRIMARY 
( NAME = N'DBProject', FILENAME = N'C:\Users\Henry\Documents\GitHub\payroll-project\Database Files\DBProject.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBProject_log', FILENAME = N'C:\Users\Henry\Documents\GitHub\payroll-project\Database Files\DBProject_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBProject] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBProject] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBProject] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBProject] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBProject] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBProject] SET ARITHABORT OFF
GO
ALTER DATABASE [DBProject] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBProject] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBProject] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBProject] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBProject] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBProject] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBProject] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBProject] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBProject] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBProject] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBProject] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBProject] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBProject] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBProject] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBProject] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBProject] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBProject] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBProject] SET  READ_WRITE
GO
ALTER DATABASE [DBProject] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DBProject] SET  MULTI_USER
GO
ALTER DATABASE [DBProject] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBProject] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBProject', N'ON'
GO
USE [DBProject]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03/23/2013 23:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[Eid] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[birthdate] [date] NULL,
	[position] [varchar](50) NULL,
	[mgrid] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Eid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Weekly_Hours]    Script Date: 03/23/2013 23:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekly_Hours](
	[Eid] [int] NOT NULL,
	[weekOf] [date] NOT NULL,
	[Hours_Worked] [real] NULL,
 CONSTRAINT [PK_Weekly_Hours] PRIMARY KEY CLUSTERED 
(
	[weekOf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Daily_Hours]    Script Date: 03/23/2013 23:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_Hours](
	[Eid] [int] NOT NULL,
	[Day_Of] [date] NOT NULL,
	[Hours_Worked] [real] NULL,
 CONSTRAINT [PK_Daily_Hours] PRIMARY KEY CLUSTERED 
(
	[Day_Of] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Approval]    Script Date: 03/23/2013 23:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Approval](
	[Eid] [int] NOT NULL,
	[weekOf] [date] NOT NULL,
	[mgrid] [int] NOT NULL,
	[Approved] [varchar](50) NULL,
 CONSTRAINT [PK_Approval] PRIMARY KEY CLUSTERED 
(
	[weekOf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Employees_Employees]    Script Date: 03/23/2013 23:30:29 ******/
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([Eid])
REFERENCES [dbo].[Employees] ([Eid])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
/****** Object:  ForeignKey [FK_Weekly_Hours_Employees]    Script Date: 03/23/2013 23:30:29 ******/
ALTER TABLE [dbo].[Weekly_Hours]  WITH CHECK ADD  CONSTRAINT [FK_Weekly_Hours_Employees] FOREIGN KEY([Eid])
REFERENCES [dbo].[Employees] ([Eid])
GO
ALTER TABLE [dbo].[Weekly_Hours] CHECK CONSTRAINT [FK_Weekly_Hours_Employees]
GO
/****** Object:  ForeignKey [FK_Daily_Hours_Employees]    Script Date: 03/23/2013 23:30:29 ******/
ALTER TABLE [dbo].[Daily_Hours]  WITH CHECK ADD  CONSTRAINT [FK_Daily_Hours_Employees] FOREIGN KEY([Eid])
REFERENCES [dbo].[Employees] ([Eid])
GO
ALTER TABLE [dbo].[Daily_Hours] CHECK CONSTRAINT [FK_Daily_Hours_Employees]
GO
/****** Object:  ForeignKey [FK_Approval_Employees]    Script Date: 03/23/2013 23:30:29 ******/
ALTER TABLE [dbo].[Approval]  WITH CHECK ADD  CONSTRAINT [FK_Approval_Employees] FOREIGN KEY([Eid])
REFERENCES [dbo].[Employees] ([Eid])
GO
ALTER TABLE [dbo].[Approval] CHECK CONSTRAINT [FK_Approval_Employees]
GO
/****** Object:  ForeignKey [FK_Approval_Weekly_Hours]    Script Date: 03/23/2013 23:30:29 ******/
ALTER TABLE [dbo].[Approval]  WITH CHECK ADD  CONSTRAINT [FK_Approval_Weekly_Hours] FOREIGN KEY([weekOf])
REFERENCES [dbo].[Weekly_Hours] ([weekOf])
GO
ALTER TABLE [dbo].[Approval] CHECK CONSTRAINT [FK_Approval_Weekly_Hours]
GO
