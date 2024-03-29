USE [master]
GO
/****** Object:  Database [db_10000000001]    Script Date: 13-Feb-23 11:06:21 PM ******/
CREATE DATABASE [db_10000000001]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_10000000001', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_10000000001.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_10000000001_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_10000000001_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_10000000001] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_10000000001].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_10000000001] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_10000000001] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_10000000001] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_10000000001] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_10000000001] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_10000000001] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_10000000001] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_10000000001] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_10000000001] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_10000000001] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_10000000001] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_10000000001] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_10000000001] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_10000000001] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_10000000001] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_10000000001] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_10000000001] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_10000000001] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_10000000001] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_10000000001] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_10000000001] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_10000000001] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_10000000001] SET RECOVERY FULL 
GO
ALTER DATABASE [db_10000000001] SET  MULTI_USER 
GO
ALTER DATABASE [db_10000000001] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_10000000001] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_10000000001] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_10000000001] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_10000000001] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_10000000001', N'ON'
GO
ALTER DATABASE [db_10000000001] SET QUERY_STORE = OFF
GO
USE [db_10000000001]
GO
/****** Object:  View [dbo].[Menu]    Script Date: 13-Feb-23 11:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Menu]
AS
SELECT        TOP (1000) idmenu, idmenuProperties, idlanguage, Menu, datecreated, datemodify, createdby, modifyby, activo
FROM            db_master.dbo.Menu
GO
/****** Object:  View [dbo].[MenuProperties]    Script Date: 13-Feb-23 11:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MenuProperties]
AS
SELECT        idmenuProperties, idparentmenu, idlanguage, Menu, Grupo, nivel, Controller, Area, vista, icon, datecreated, datemodify, createdby, modifyby, activo
FROM            db_master.dbo.MenuProperties
GO
/****** Object:  Table [dbo].[log_login]    Script Date: 13-Feb-23 11:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[cDeviceName] [varchar](50) NULL,
	[cDeviceOS] [varchar](50) NULL,
	[deviceOSVersion] [varchar](50) NULL,
	[appVersion] [varchar](50) NULL,
	[LoginTime] [datetime] NULL,
	[LogoffTime] [datetime] NULL,
	[activo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 13-Feb-23 11:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uName] [varchar](250) NULL,
	[uSurName] [varchar](250) NULL,
	[nEmpleado] [varchar](250) NULL,
	[Email] [varchar](350) NULL,
	[photo] [nvarchar](max) NULL,
	[idperfil] [int] NULL,
	[UUID] [varchar](50) NULL,
	[expiresOn] [datetime] NULL,
	[datecreated] [datetime] NULL,
	[datemodify] [datetime] NULL,
	[createdby] [int] NULL,
	[modifyby] [int] NULL,
	[idStatus] [int] NULL,
	[activo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[log_login] ON 

INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-11T17:30:29.587' AS DateTime), CAST(N'2022-08-11T17:30:29.587' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (2, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-11T17:32:55.813' AS DateTime), CAST(N'2022-08-11T17:32:55.813' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (3, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-11T17:36:03.783' AS DateTime), CAST(N'2022-08-11T17:36:03.800' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (4, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-11T17:38:43.063' AS DateTime), CAST(N'2022-08-11T17:38:43.063' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (5, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-11T17:38:46.213' AS DateTime), CAST(N'2022-08-11T17:38:46.213' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (6, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-11T17:39:16.660' AS DateTime), CAST(N'2022-08-11T17:39:16.660' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (7, 1, N'sqlserver', N'windowsxp', N'17', N'0.2', CAST(N'2022-08-14T17:59:00.000' AS DateTime), CAST(N'2022-08-14T17:59:34.247' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (8, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-15T03:37:00.000' AS DateTime), CAST(N'2022-08-15T03:37:03.447' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (9, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-15T04:43:00.000' AS DateTime), CAST(N'2022-08-15T04:43:19.800' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (10, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T05:18:00.000' AS DateTime), CAST(N'2022-08-15T05:18:46.260' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (11, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T05:31:00.000' AS DateTime), CAST(N'2022-08-15T05:31:16.140' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (12, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-08-15T05:51:00.000' AS DateTime), CAST(N'2022-08-15T05:51:34.073' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (13, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:26:00.000' AS DateTime), CAST(N'2022-08-15T06:26:42.310' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (14, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:27:00.000' AS DateTime), CAST(N'2022-08-15T06:27:01.320' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (15, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:27:00.000' AS DateTime), CAST(N'2022-08-15T06:27:35.733' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (16, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:38:00.000' AS DateTime), CAST(N'2022-08-15T06:38:02.570' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (17, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:38:00.000' AS DateTime), CAST(N'2022-08-15T06:38:20.613' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (18, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:40:00.000' AS DateTime), CAST(N'2022-08-15T06:40:03.210' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (19, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:47:00.000' AS DateTime), CAST(N'2022-08-15T06:47:15.907' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (20, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:47:00.000' AS DateTime), CAST(N'2022-08-15T06:47:20.967' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (21, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:48:00.000' AS DateTime), CAST(N'2022-08-15T06:48:43.723' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (22, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:50:00.000' AS DateTime), CAST(N'2022-08-15T06:50:37.987' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (23, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:51:00.000' AS DateTime), CAST(N'2022-08-15T06:51:04.273' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (24, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:51:00.000' AS DateTime), CAST(N'2022-08-15T06:51:16.060' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (25, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:51:00.000' AS DateTime), CAST(N'2022-08-15T06:51:17.823' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (26, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:52:00.000' AS DateTime), CAST(N'2022-08-15T06:52:05.157' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (27, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:52:00.000' AS DateTime), CAST(N'2022-08-15T06:52:45.707' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (28, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:53:00.000' AS DateTime), CAST(N'2022-08-15T06:53:24.913' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (29, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:56:00.000' AS DateTime), CAST(N'2022-08-15T06:56:35.283' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (30, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T06:57:00.000' AS DateTime), CAST(N'2022-08-15T06:57:18.693' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (31, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-15T09:20:00.000' AS DateTime), CAST(N'2022-08-15T09:20:34.820' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (32, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-17T14:58:00.000' AS DateTime), CAST(N'2022-08-17T14:58:07.277' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (33, 1, N'postman', N'windows', N'11', N'1.0', CAST(N'2022-08-22T15:25:00.000' AS DateTime), CAST(N'2022-08-22T15:25:26.760' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (34, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-22T17:14:00.000' AS DateTime), CAST(N'2022-08-22T17:14:05.440' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (35, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-22T17:18:00.000' AS DateTime), CAST(N'2022-08-22T17:18:24.400' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (36, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-22T18:21:00.000' AS DateTime), CAST(N'2022-08-22T18:21:32.840' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (37, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-22T18:22:00.000' AS DateTime), CAST(N'2022-08-22T18:22:12.123' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (38, 1, N'', N'', N'windows11', N'1', CAST(N'2022-08-23T09:22:00.000' AS DateTime), CAST(N'2022-08-23T09:22:36.073' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (39, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-23T11:55:00.000' AS DateTime), CAST(N'2022-08-23T11:55:51.853' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (40, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-23T11:56:00.000' AS DateTime), CAST(N'2022-08-23T11:56:11.377' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (41, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-23T11:57:00.000' AS DateTime), CAST(N'2022-08-23T11:57:58.360' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (42, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-23T11:59:00.000' AS DateTime), CAST(N'2022-08-23T11:59:54.063' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (43, 1, N'Chrome 104', N'Win32', N'104', N'1.0', CAST(N'2022-08-23T12:02:00.000' AS DateTime), CAST(N'2022-08-23T12:02:21.100' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (44, 1, N'Brave', N'Win32', N'104', N'1.0', CAST(N'2022-08-24T09:05:00.000' AS DateTime), CAST(N'2022-08-24T09:05:46.400' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (45, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2022-09-01T11:34:00.000' AS DateTime), CAST(N'2022-09-01T11:34:31.170' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (46, 1, N'', N'', N'windows11', N'1', CAST(N'2022-09-01T11:39:00.000' AS DateTime), CAST(N'2022-09-01T11:39:26.700' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (47, 1, N'', N'', N'windows11', N'1', CAST(N'2022-09-01T11:40:00.000' AS DateTime), CAST(N'2022-09-01T11:40:40.760' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (48, 1, N'', N'', N'windows11', N'1', CAST(N'2022-09-01T11:41:00.000' AS DateTime), CAST(N'2022-09-01T11:41:33.300' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (49, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-09-01T17:22:00.000' AS DateTime), CAST(N'2022-09-01T17:22:41.670' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1045, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-09-22T07:47:00.000' AS DateTime), CAST(N'2022-09-22T07:47:22.807' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1046, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-09-22T08:17:00.000' AS DateTime), CAST(N'2022-09-22T08:17:50.600' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1047, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-09-22T08:25:00.000' AS DateTime), CAST(N'2022-09-22T08:25:58.020' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1048, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-09-22T08:42:00.000' AS DateTime), CAST(N'2022-09-22T08:42:58.787' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1049, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-14T12:29:00.000' AS DateTime), CAST(N'2022-10-14T12:29:23.957' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1050, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-15T15:28:00.000' AS DateTime), CAST(N'2022-10-15T15:28:20.763' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1051, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-15T15:30:00.000' AS DateTime), CAST(N'2022-10-15T15:30:53.083' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1052, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-15T15:34:00.000' AS DateTime), CAST(N'2022-10-15T15:34:24.077' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1053, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-15T15:44:00.000' AS DateTime), CAST(N'2022-10-15T15:44:22.440' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1054, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-15T16:50:00.000' AS DateTime), CAST(N'2022-10-15T16:50:21.753' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1055, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-17T09:08:00.000' AS DateTime), CAST(N'2022-10-17T09:08:22.110' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1056, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-17T10:51:00.000' AS DateTime), CAST(N'2022-10-17T10:51:56.413' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1057, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-17T10:58:00.000' AS DateTime), CAST(N'2022-10-17T10:58:37.803' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1058, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-17T11:12:00.000' AS DateTime), CAST(N'2022-10-17T11:12:39.760' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1059, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-17T11:24:00.000' AS DateTime), CAST(N'2022-10-17T11:24:17.017' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1060, 1, N'Chrome 105', N'Win32', N'105', N'1.0', CAST(N'2022-10-17T12:12:00.000' AS DateTime), CAST(N'2022-10-17T12:12:26.890' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1061, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T08:51:00.000' AS DateTime), CAST(N'2022-10-19T08:51:01.093' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1062, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:11:00.000' AS DateTime), CAST(N'2022-10-19T09:11:42.643' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1063, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:11:00.000' AS DateTime), CAST(N'2022-10-19T09:11:42.643' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1064, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:14:00.000' AS DateTime), CAST(N'2022-10-19T09:14:06.917' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1065, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:15:00.000' AS DateTime), CAST(N'2022-10-19T09:15:27.343' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1066, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:17:00.000' AS DateTime), CAST(N'2022-10-19T09:17:04.583' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1067, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:18:00.000' AS DateTime), CAST(N'2022-10-19T09:18:24.537' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1068, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T09:21:00.000' AS DateTime), CAST(N'2022-10-19T09:21:26.640' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1069, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T10:52:00.000' AS DateTime), CAST(N'2022-10-19T10:52:08.087' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1070, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T13:53:00.000' AS DateTime), CAST(N'2022-10-19T13:53:20.130' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1071, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T13:57:00.000' AS DateTime), CAST(N'2022-10-19T13:57:15.567' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1072, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T13:59:00.000' AS DateTime), CAST(N'2022-10-19T13:59:34.380' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1073, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T16:50:00.000' AS DateTime), CAST(N'2022-10-19T16:50:03.903' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1074, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T17:00:00.000' AS DateTime), CAST(N'2022-10-19T17:00:21.900' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1075, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T19:41:00.000' AS DateTime), CAST(N'2022-10-19T19:41:00.763' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1076, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-19T19:44:00.000' AS DateTime), CAST(N'2022-10-19T19:44:30.457' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1077, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-25T03:08:00.000' AS DateTime), CAST(N'2022-10-25T03:08:51.297' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1078, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-25T03:19:00.000' AS DateTime), CAST(N'2022-10-25T03:19:35.950' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1079, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-25T03:37:00.000' AS DateTime), CAST(N'2022-10-25T03:37:53.133' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1080, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-25T03:52:00.000' AS DateTime), CAST(N'2022-10-25T03:52:08.833' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1081, 1, N'Chrome 106', N'Win32', N'99', N'1.0', CAST(N'2022-10-25T03:54:00.000' AS DateTime), CAST(N'2022-10-25T03:54:42.193' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1082, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2023-02-13T22:39:00.000' AS DateTime), CAST(N'2023-02-13T22:39:05.590' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1083, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2023-02-13T22:39:00.000' AS DateTime), CAST(N'2023-02-13T22:39:26.350' AS DateTime), 1)
INSERT [dbo].[log_login] ([id], [iduser], [cDeviceName], [cDeviceOS], [deviceOSVersion], [appVersion], [LoginTime], [LogoffTime], [activo]) VALUES (1084, 1, N'sql', N'windows', N'16', N'0.1', CAST(N'2023-02-13T22:39:00.000' AS DateTime), CAST(N'2023-02-13T22:39:30.810' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[log_login] OFF
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [uName], [uSurName], [nEmpleado], [Email], [photo], [idperfil], [UUID], [expiresOn], [datecreated], [datemodify], [createdby], [modifyby], [idStatus], [activo]) VALUES (1, N'manu', N'surnamehere', N'123', N'manuel@mail.com', N'../multimedia/images/profile/profile.jpg', 2, N'AEB5B61C-78EB-44A6-914E-D529C9869678', CAST(N'2023-02-13T22:39:00.000' AS DateTime), CAST(N'2022-08-11T17:31:50.197' AS DateTime), CAST(N'2022-08-11T17:31:50.197' AS DateTime), 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
ALTER TABLE [dbo].[log_login] ADD  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[log_login] ADD  DEFAULT (getdate()) FOR [LogoffTime]
GO
ALTER TABLE [dbo].[log_login] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((2)) FOR [idperfil]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [expiresOn]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [datecreated]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [datemodify]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((1)) FOR [createdby]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [modifyby]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0)) FOR [idStatus]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((1)) FOR [activo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Menu (db_master.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MenuProperties (db_master.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MenuProperties'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MenuProperties'
GO
USE [master]
GO
ALTER DATABASE [db_10000000001] SET  READ_WRITE 
GO
