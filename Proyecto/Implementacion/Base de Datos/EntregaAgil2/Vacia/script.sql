USE [master]
GO
/****** Object:  Database [PharmaGoDb]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE DATABASE [PharmaGoDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmaGoDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PharmaGoDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PharmaGoDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PharmaGoDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PharmaGoDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmaGoDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmaGoDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmaGoDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmaGoDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmaGoDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmaGoDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmaGoDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmaGoDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmaGoDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmaGoDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmaGoDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmaGoDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmaGoDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PharmaGoDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmaGoDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmaGoDb] SET  MULTI_USER 
GO
ALTER DATABASE [PharmaGoDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmaGoDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmaGoDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmaGoDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PharmaGoDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PharmaGoDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PharmaGoDb] SET QUERY_STORE = OFF
GO
USE [PharmaGoDb]
GO
/****** Object:  User [marcelo]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE USER [marcelo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[marcelo]
GO
/****** Object:  Schema [marcelo]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE SCHEMA [marcelo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Symptom] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](14, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Prescription] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[UnitMeasureId] [int] NULL,
	[PresentationId] [int] NULL,
	[PharmacyId] [int] NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invitations]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[PharmacyId] [int] NULL,
	[RoleId] [int] NULL,
	[UserCode] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Invitations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacys]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pharmacys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentations]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Presentations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [decimal](14, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
	[PharmacyId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](14, 2) NOT NULL,
	[PurchaseId] [int] NULL,
	[PharmacyId] [int] NULL,
	[Status] [nvarchar](max) NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_PurchaseDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDate] [datetime2](7) NOT NULL,
	[TotalAmount] [decimal](14, 2) NOT NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[TrackingCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockRequestDetails]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockRequestDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[StockRequestId] [int] NULL,
 CONSTRAINT [PK_StockRequestDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockRequests]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[RequestDate] [datetime2](7) NOT NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_StockRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitMeasures]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMeasures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UnitMeasures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2023 5:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[RegistrationDate] [datetime2](7) NULL,
	[RoleId] [int] NULL,
	[PharmacyId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Drugs_PharmacyId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Drugs_PharmacyId] ON [dbo].[Drugs]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drugs_PresentationId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Drugs_PresentationId] ON [dbo].[Drugs]
(
	[PresentationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drugs_UnitMeasureId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Drugs_UnitMeasureId] ON [dbo].[Drugs]
(
	[UnitMeasureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invitations_PharmacyId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Invitations_PharmacyId] ON [dbo].[Invitations]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invitations_RoleId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Invitations_RoleId] ON [dbo].[Invitations]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_PharmacyId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_PharmacyId] ON [dbo].[Products]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_DrugId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_DrugId] ON [dbo].[PurchaseDetails]
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_PharmacyId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_PharmacyId] ON [dbo].[PurchaseDetails]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_ProductId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_ProductId] ON [dbo].[PurchaseDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseDetails_PurchaseId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseDetails_PurchaseId] ON [dbo].[PurchaseDetails]
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockRequestDetails_DrugId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_StockRequestDetails_DrugId] ON [dbo].[StockRequestDetails]
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockRequestDetails_StockRequestId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_StockRequestDetails_StockRequestId] ON [dbo].[StockRequestDetails]
(
	[StockRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockRequests_EmployeeId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_StockRequests_EmployeeId] ON [dbo].[StockRequests]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_PharmacyId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_PharmacyId] ON [dbo].[Users]
(
	[PharmacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 11/11/2023 5:00:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [PharmacyId]
GO
ALTER TABLE [dbo].[Invitations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_Presentations_PresentationId] FOREIGN KEY([PresentationId])
REFERENCES [dbo].[Presentations] ([Id])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_Presentations_PresentationId]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD  CONSTRAINT [FK_Drugs_UnitMeasures_UnitMeasureId] FOREIGN KEY([UnitMeasureId])
REFERENCES [dbo].[UnitMeasures] ([Id])
GO
ALTER TABLE [dbo].[Drugs] CHECK CONSTRAINT [FK_Drugs_UnitMeasures_UnitMeasureId]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Invitations_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Invitations_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Invitations_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Invitations_Roles_RoleId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Drugs_DrugId] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Drugs_DrugId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Purchases_PurchaseId] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchases] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Purchases_PurchaseId]
GO
ALTER TABLE [dbo].[StockRequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StockRequestDetails_Drugs_DrugId] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([Id])
GO
ALTER TABLE [dbo].[StockRequestDetails] CHECK CONSTRAINT [FK_StockRequestDetails_Drugs_DrugId]
GO
ALTER TABLE [dbo].[StockRequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_StockRequestDetails_StockRequests_StockRequestId] FOREIGN KEY([StockRequestId])
REFERENCES [dbo].[StockRequests] ([Id])
GO
ALTER TABLE [dbo].[StockRequestDetails] CHECK CONSTRAINT [FK_StockRequestDetails_StockRequests_StockRequestId]
GO
ALTER TABLE [dbo].[StockRequests]  WITH CHECK ADD  CONSTRAINT [FK_StockRequests_Users_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[StockRequests] CHECK CONSTRAINT [FK_StockRequests_Users_EmployeeId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Pharmacys_PharmacyId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [PharmaGoDb] SET  READ_WRITE 
GO
