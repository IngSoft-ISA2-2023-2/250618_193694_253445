USE [PharmaGoDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invitations]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacys]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentations]    Script Date: 6/10/2022 16:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Presentations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 6/10/2022 16:53:38 ******/
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
 CONSTRAINT [PK_PurchaseDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 6/10/2022 16:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDate] [datetime2](7) NOT NULL,
	[TotalAmount] [decimal](14, 2) NOT NULL,
	[PharmacyId] [int] NULL,
	[BuyerEmail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockRequestDetails]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockRequests]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitMeasures]    Script Date: 6/10/2022 16:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMeasures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UnitMeasures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/10/2022 16:53:38 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220910212258_InitialCreate', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220917182456_AddSession', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220917191530_ChangeSession', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220917232725_CheckSession', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220918192623_RemoveUseCodeFromUserEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221001173323_UpdateUserAndInvitationEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221001183953_UnitMeasurePresentationConversions', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221002194836_nullablePharmacyOfDrug', N'6.0.8')
GO
SET IDENTITY_INSERT [dbo].[Drugs] ON 

INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (1, N'XDEA', N'Novemina', N'Dolor de cabeza', 1000, CAST(50.00 AS Decimal(14, 2)), 1933, 0, 0, 1, 1, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (2, N'ABCD', N'Perifar Flex', N'Fiebre', 1000, CAST(125.00 AS Decimal(14, 2)), 1155, 1, 0, 1, 2, 1)
INSERT [dbo].[Drugs] ([Id], [Code], [Name], [Symptom], [Quantity], [Price], [Stock], [Prescription], [Deleted], [UnitMeasureId], [PresentationId], [PharmacyId]) VALUES (3, N'ZASW', N'Aspirina', N'Dolor en general', 2000, CAST(25.00 AS Decimal(14, 2)), 199958, 1, 1, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[Drugs] OFF
GO
SET IDENTITY_INSERT [dbo].[Invitations] ON 

INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (1, N'admin1', CAST(N'2022-10-06T16:37:17.7558876' AS DateTime2), NULL, 1, N'391668', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (2, N'employee1', CAST(N'2022-10-06T16:38:41.2817995' AS DateTime2), 1, 2, N'026041', 0)
INSERT [dbo].[Invitations] ([Id], [UserName], [Created], [PharmacyId], [RoleId], [UserCode], [IsActive]) VALUES (3, N'owner1', CAST(N'2022-10-06T16:38:55.3009591' AS DateTime2), 1, 3, N'138667', 0)
SET IDENTITY_INSERT [dbo].[Invitations] OFF
GO
SET IDENTITY_INSERT [dbo].[Pharmacys] ON 

INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (1, N'Farmacia 1234', N'Av Uruguay 23223')
INSERT [dbo].[Pharmacys] ([Id], [Name], [Address]) VALUES (2, N'Farmacia Av. Italia', N'Av Italia 9822')
SET IDENTITY_INSERT [dbo].[Pharmacys] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentations] ON 

INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (1, N'capsules', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (2, N'tablet', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (3, N'liquid', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (4, N'patches', 0)
INSERT [dbo].[Presentations] ([Id], [Name], [Deleted]) VALUES (5, N'injections', 0)
SET IDENTITY_INSERT [dbo].[Presentations] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetails] ON 

INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (1, 2, 20, CAST(125.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (2, 1, 10, CAST(50.00 AS Decimal(14, 2)), 1)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (3, 2, 2, CAST(125.00 AS Decimal(14, 2)), 2)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (4, 1, 45, CAST(50.00 AS Decimal(14, 2)), 2)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (5, 3, 35, CAST(25.00 AS Decimal(14, 2)), 2)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (6, 2, 23, CAST(125.00 AS Decimal(14, 2)), 3)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (7, 1, 12, CAST(50.00 AS Decimal(14, 2)), 3)
INSERT [dbo].[PurchaseDetails] ([Id], [DrugId], [Quantity], [Price], [PurchaseId]) VALUES (8, 3, 7, CAST(25.00 AS Decimal(14, 2)), 3)
SET IDENTITY_INSERT [dbo].[PurchaseDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 

INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [PharmacyId], [BuyerEmail]) VALUES (1, CAST(N'2022-11-06T10:21:31.8160000' AS DateTime2), CAST(3000.00 AS Decimal(14, 2)), 1, N'carlos@gmail.com')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [PharmacyId], [BuyerEmail]) VALUES (2, CAST(N'2022-10-05T10:21:31.8160000' AS DateTime2), CAST(3375.00 AS Decimal(14, 2)), 1, N'roberto@gmail.com')
INSERT [dbo].[Purchases] ([Id], [PurchaseDate], [TotalAmount], [PharmacyId], [BuyerEmail]) VALUES (3, CAST(N'2022-10-05T10:21:31.8160000' AS DateTime2), CAST(3650.00 AS Decimal(14, 2)), 1, N'santi@gmail.com')
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Employee')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Owner')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (1, N'3a3c2363-d3ca-4deb-b2dd-c71300429d84', 1)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (2, N'e9e0e1e9-3812-4eb5-949e-ae92ac931401', 4)
INSERT [dbo].[Sessions] ([Id], [Token], [UserId]) VALUES (3, N'326df984-a9f4-45a8-8a0b-79328578cc7c', 3)
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[StockRequestDetails] ON 

INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (1, 2, 1200, 1)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (2, 1, 2000, 1)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (3, 3, 200000, 1)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (4, 2, 200, 2)
INSERT [dbo].[StockRequestDetails] ([Id], [DrugId], [Quantity], [StockRequestId]) VALUES (5, 1, 350, 2)
SET IDENTITY_INSERT [dbo].[StockRequestDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[StockRequests] ON 

INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (1, 3, CAST(N'2022-10-06T16:46:17.4805118' AS DateTime2), 4)
INSERT [dbo].[StockRequests] ([Id], [Status], [RequestDate], [EmployeeId]) VALUES (2, 2, CAST(N'2022-10-06T16:47:37.9672539' AS DateTime2), 4)
SET IDENTITY_INSERT [dbo].[StockRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitMeasures] ON 

INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (1, N'mg', 0)
INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (2, N'g', 0)
INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (3, N'ml', 0)
INSERT [dbo].[UnitMeasures] ([Id], [Name], [Deleted]) VALUES (4, N'l', 0)
SET IDENTITY_INSERT [dbo].[UnitMeasures] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (1, N'admin', N'admin@gmail.com', N'Aqwertyu2.', N'Av. Rivera 3366', CAST(N'2022-10-06T14:25:10.4870000' AS DateTime2), 1, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (2, N'admin1', N'admin1@gmail.com', N'Aqwertyu2.', N'18 de Julio', CAST(N'2022-10-06T08:22:14.1010000' AS DateTime2), 1, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (3, N'owner1', N'owner1@gmail.com', N'Aqwertyu2.', N'18 de Julio 33333', CAST(N'2022-10-06T08:22:14.1010000' AS DateTime2), 3, 1)
INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [Address], [RegistrationDate], [RoleId], [PharmacyId]) VALUES (4, N'employee1', N'employee1@gmail.com', N'Aqwertyu2.', N'Charrua 123', CAST(N'2022-10-06T08:22:14.1010000' AS DateTime2), 2, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [PharmacyId]
GO
ALTER TABLE [dbo].[Invitations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Presentations] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[UnitMeasures] ADD  DEFAULT (N'') FOR [Name]
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
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Drugs_DrugId] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Drugs_DrugId]
GO
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_Purchases_PurchaseId] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchases] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_Purchases_PurchaseId]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Pharmacys_PharmacyId] FOREIGN KEY([PharmacyId])
REFERENCES [dbo].[Pharmacys] ([Id])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Pharmacys_PharmacyId]
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
