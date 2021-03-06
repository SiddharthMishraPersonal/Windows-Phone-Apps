
USE [ChannelIncentive]
GO
/****** Object:  Table [dbo].[ActionPackMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPackMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PerYearSubscriptionCost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActionPackSubscriptions]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPackSubscriptions](
	[SubscriptionId] [int] NULL,
	[PartnerId] [int] NULL,
	[ActionPackId] [int] NULL,
	[ActionPackOrderDate] [datetime] NULL,
	[SubscriptionStartDate] [datetime] NULL,
	[SubscriptionEndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationReferences]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationReferences](
	[ReferenceID] [int] NULL,
	[CompetencyID] [int] NULL,
	[PartnerID] [int] NULL,
	[ApplicationName] [nvarchar](255) NULL,
	[CustomerID] [int] NULL,
	[CustomerReference] [nvarchar](255) NULL,
	[ReferenceSubmittedOn] [datetime] NULL,
	[PassedApplicationTest] [int] NULL,
	[ApplicationTestID] [int] NULL,
	[ApprovedByCustomer] [bit] NULL,
	[CustomerApprovalDate] [datetime] NULL,
	[CustomerApprover] [int] NULL,
	[ApprovedByMicrosoft] [bit] NULL,
	[MicrosoftApprovalDate] [datetime] NULL,
	[MicrosoftApprover] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationTestsMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationTestsMaster](
	[ApplicationTestId] [int] NOT NULL,
	[ApplicationTestName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CertificationMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertificationMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CertifiedPeople]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertifiedPeople](
	[PartnerId] [int] NOT NULL,
	[CertificationId] [int] NOT NULL,
	[PersonName] [nvarchar](256) NULL,
	[CertifiedOn] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompetencyCertifications]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetencyCertifications](
	[CompentencyID] [int] NOT NULL,
	[CertificationID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompetencyMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetencyMaster](
	[Id] [int] NOT NULL,
	[CompetencyArea] [nvarchar](100) NOT NULL,
	[CompetencyLevel] [nvarchar](50) NOT NULL,
	[CompetencyLevelFee] [int] NULL,
	[MinimumCertifiedIndividuals] [int] NULL,
	[MinimumCustomerReferences] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerEmployeeMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerEmployeeMaster](
	[CustomerId] [int] NOT NULL,
	[CustomerEmployeeAccountId] [int] NOT NULL,
	[CustomerEmployeeName] [nvarchar](500) NULL,
	[IsAdmin] [bit] NULL,
	[Email] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisputedTransactions]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisputedTransactions](
	[TransactionId] [bigint] NOT NULL,
	[DisputedOn] [datetime] NULL,
	[DisputeStatus] [int] NULL,
	[DisputeStatusDate] [datetime] NULL,
	[Notes] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](100) NOT NULL,
	[Subsidiary] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnrollmentMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollmentMaster](
	[InvitationId] [int] NOT NULL,
	[PartnerId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
	[InvitationDate] [datetime] NULL,
	[EnrollmentCompleted] [bit] NULL,
	[EnrollmentDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerCompetencyAttainment]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCompetencyAttainment](
	[PartnerId] [int] NOT NULL,
	[CompetencyId] [int] NOT NULL,
	[CompentencyAttainedOn] [datetime] NULL,
	[CompetencyEndsOn] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerEmployeeMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerEmployeeMaster](
	[PartnerId] [int] NULL,
	[EmployeeAccountId] [int] NULL,
	[EmployeeName] [nvarchar](500) NULL,
	[IsAdmin] [bit] NULL,
	[Email] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[BankName] [nvarchar](100) NULL,
	[RoutingNumber] [nvarchar](50) NULL,
	[BankAccountNumber] [nvarchar](50) NULL,
	[PartnerAccountManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerTransactions]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerTransactions](
	[Id] [bigint] NOT NULL,
	[TransactionDate] [datetime] NULL,
	[PartnerEmployeeAccountId] [int] NULL,
	[ProductId] [int] NULL,
	[CustomerId] [int] NULL,
	[SalesPrice] [bigint] NULL,
	[IncentiveProgramId] [int] NULL,
	[IncentiveCalculationDate] [datetime] NULL,
	[QualifiesforIncentive] [int] NULL,
	[EligibleIncentives] [bigint] NULL,
	[IncentivePayableStatus] [int] NULL,
	[IncentivePaymentDate] [datetime] NULL,
	[CountryId] [int] NULL,
	[NoOfLicensesSold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[StatusId] [int] NOT NULL,
	[Value] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[UnitCost] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramMaster]    Script Date: 2/3/2015 2:49:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CompetencyIDRequired] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ActionPackMaster] ([Id], [Name], [PerYearSubscriptionCost]) VALUES (1, N'Cloud Essentials Pack', 0)
INSERT [dbo].[ActionPackMaster] ([Id], [Name], [PerYearSubscriptionCost]) VALUES (2, N'Solutions Provider Pack', 329)
INSERT [dbo].[ActionPackMaster] ([Id], [Name], [PerYearSubscriptionCost]) VALUES (3, N'Development & Design Pack', 429)
INSERT [dbo].[ActionPackSubscriptions] ([SubscriptionId], [PartnerId], [ActionPackId], [ActionPackOrderDate], [SubscriptionStartDate], [SubscriptionEndDate]) VALUES (1, 1, 2, CAST(N'2014-02-26 00:00:00.000' AS DateTime), CAST(N'2014-03-06 00:00:00.000' AS DateTime), CAST(N'2015-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[ActionPackSubscriptions] ([SubscriptionId], [PartnerId], [ActionPackId], [ActionPackOrderDate], [SubscriptionStartDate], [SubscriptionEndDate]) VALUES (2, 2, 2, CAST(N'2014-11-11 00:00:00.000' AS DateTime), CAST(N'2014-12-08 00:00:00.000' AS DateTime), CAST(N'2015-12-08 00:00:00.000' AS DateTime))
INSERT [dbo].[ActionPackSubscriptions] ([SubscriptionId], [PartnerId], [ActionPackId], [ActionPackOrderDate], [SubscriptionStartDate], [SubscriptionEndDate]) VALUES (3, 3, 3, CAST(N'2014-02-10 00:00:00.000' AS DateTime), CAST(N'2014-03-08 00:00:00.000' AS DateTime), CAST(N'2015-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[ActionPackSubscriptions] ([SubscriptionId], [PartnerId], [ActionPackId], [ActionPackOrderDate], [SubscriptionStartDate], [SubscriptionEndDate]) VALUES (4, 4, 2, CAST(N'2014-09-19 00:00:00.000' AS DateTime), CAST(N'2014-10-02 00:00:00.000' AS DateTime), CAST(N'2015-10-02 00:00:00.000' AS DateTime))
INSERT [dbo].[ActionPackSubscriptions] ([SubscriptionId], [PartnerId], [ActionPackId], [ActionPackOrderDate], [SubscriptionStartDate], [SubscriptionEndDate]) VALUES (5, 5, 1, CAST(N'2014-06-15 00:00:00.000' AS DateTime), CAST(N'2014-07-03 00:00:00.000' AS DateTime), CAST(N'2015-07-03 00:00:00.000' AS DateTime))
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (1, 3, 5, N'Expense Reporting', 1, NULL, CAST(N'2014-07-07 00:00:00.000' AS DateTime), 0, NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (2, 1, 3, N'Ad Management', 1, NULL, CAST(N'2014-08-26 00:00:00.000' AS DateTime), 0, NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (3, 2, 4, N'Travel Management', 1, NULL, CAST(N'2014-07-14 00:00:00.000' AS DateTime), 0, NULL, 1, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 6, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (4, 7, 1, N'Leave Management', 1, NULL, CAST(N'2014-01-07 00:00:00.000' AS DateTime), 0, NULL, 1, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 2, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (5, 9, 2, N'Ticket Booking App', 3, NULL, CAST(N'2014-01-06 00:00:00.000' AS DateTime), 0, NULL, 1, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 2, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (6, 8, 3, N'Personal Finance App', 3, NULL, CAST(N'2014-04-08 00:00:00.000' AS DateTime), 1, 1, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (7, 4, 3, N'Company Intranet', 3, NULL, CAST(N'2014-09-24 00:00:00.000' AS DateTime), 1, 3, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (8, 3, 1, N'Social Analytics Engine', 3, NULL, CAST(N'2014-07-17 00:00:00.000' AS DateTime), 1, 1, 1, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 6, 1, CAST(N'2000-01-30 00:00:00.000' AS DateTime), 12)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (9, 4, 3, N'Payroll Reporting', 2, NULL, CAST(N'2014-06-13 00:00:00.000' AS DateTime), 1, 2, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationReferences] ([ReferenceID], [CompetencyID], [PartnerID], [ApplicationName], [CustomerID], [CustomerReference], [ReferenceSubmittedOn], [PassedApplicationTest], [ApplicationTestID], [ApprovedByCustomer], [CustomerApprovalDate], [CustomerApprover], [ApprovedByMicrosoft], [MicrosoftApprovalDate], [MicrosoftApprover]) VALUES (10, 1, 1, N'Shopping site', 1, NULL, CAST(N'2014-11-16 00:00:00.000' AS DateTime), 1, 3, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (1, N'Silver Competency Test for Windows 8')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (2, N'Silver Competency Test for Windows Server 2012 R2')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (3, N'Silver Competency Test for Microsoft Azure')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (4, N'Silver Competency Test for Windows Phone 8')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (5, N'Gold Competency Test for Windows 8')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (6, N'Gold Competency Test for Windows Server 2012 R2')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (7, N'Gold Competency Test for Microsoft Azure')
INSERT [dbo].[ApplicationTestsMaster] ([ApplicationTestId], [ApplicationTestName]) VALUES (8, N'Gold Competency Test for Windows Phone 8')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (1, N'Exam 70-480: Programming in HTML5 with JavaScript and CSS3')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (2, N'Exam 70-481: Essentials of Developing Windows Store Apps using HTML5 and JavaScript')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (3, N'Exam 70-482: Advanced Store App Development using HTML5 and JavaScript')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (4, N'Exam 70-483: Programming in C#')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (5, N'Exam 70-484: Essentials of Developing Windows Store Apps in C#')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (6, N'Exam 70-485: Advanced Store App Development using C#')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (7, N'Exam 70-486: Developing ASP.NET MVC Web Applications')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (8, N'Exam 70-487: Developing Windows Azure and Web Services')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (9, N'Exam 70-511: Windows Applications Development with Microsoft .NET Framework 4')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (10, N'Exam 70-513: TS: Windows Communication foundation Development with Microsoft .NET Framework 4')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (11, N'Exam 70-516: TS: Accessing Data with Microsoft .NET Framework 4')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (12, N'Exam 70-518: PRO: Designing and Developing Windows Applications Using Microsoft .NET Framework 4')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (13, N'Exam 70-583: PRO: Designing and Developing Windows Azure Applications')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (14, N'Exam 74-353: Windows UX Design')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (15, N'MCSD: Web Apps')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (16, N'MCSD: Windows Store Apps Using HTML5')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (17, N'MCSD: Windows Store Apps Using C#')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (18, N'MCPD: Windows Developer 4')
INSERT [dbo].[CertificationMaster] ([Id], [Name]) VALUES (19, N'MCPD: Windows Azure Developer 4')
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 4, N'Mario Speedwagon', CAST(N'2014-05-28 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (1, 19, N'Petey Cruiser', CAST(N'2014-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (2, 16, N'Anna Sthesia', CAST(N'2014-07-01 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 10, N'Paul Molive', CAST(N'2014-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 12, N'Anna Mull', CAST(N'2014-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 9, N'Gail Forcewind', CAST(N'2014-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (3, 8, N'Paige Turner', CAST(N'2014-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (2, 15, N'Bob Frapples', CAST(N'2014-11-24 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 1, N'Walter Melon', CAST(N'2014-05-03 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (1, 6, N'Nick R. Bocker', CAST(N'2014-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (1, 9, N'Barb Ackue', CAST(N'2014-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (5, 13, N'Buck Kinnear', CAST(N'2014-09-19 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 13, N'Greta Life', CAST(N'2014-09-04 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (3, 7, N'Ira Membrit', CAST(N'2014-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (5, 11, N'Shonda Leer', CAST(N'2014-03-12 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (3, 11, N'Brock Lee', CAST(N'2014-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[CertifiedPeople] ([PartnerId], [CertificationId], [PersonName], [CertifiedOn]) VALUES (4, 6, N'Maya Didas', CAST(N'2014-11-21 00:00:00.000' AS DateTime))
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 1)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 2)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 3)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 4)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 5)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 6)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 7)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 8)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 9)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 10)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 11)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 12)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 13)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (4, 14)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (9, 15)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (9, 16)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (9, 17)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (9, 18)
INSERT [dbo].[CompetencyCertifications] ([CompentencyID], [CertificationID]) VALUES (9, 19)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (1, N'Collaboration & Content', N'Silver', 1850, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (2, N'Business Intelligence', N'Silver', 1850, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (3, N'Web Development', N'Silver', 1850, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (4, N'Application Development', N'Silver', 1660, 2, 3)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (5, N'Small Business', N'Silver', 1850, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (6, N'Collaboration & Content', N'Gold', 3900, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (7, N'Business Intelligence', N'Gold', 3900, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (8, N'Web Development', N'Gold', 3900, 0, 0)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (9, N'Application Development', N'Gold', 4730, 4, 5)
INSERT [dbo].[CompetencyMaster] ([Id], [CompetencyArea], [CompetencyLevel], [CompetencyLevelFee], [MinimumCertifiedIndividuals], [MinimumCustomerReferences]) VALUES (10, N'Small Business', N'Gold', 3900, 0, 0)
INSERT [dbo].[CountryMaster] ([Id], [Name]) VALUES (1, N'India')
INSERT [dbo].[CountryMaster] ([Id], [Name]) VALUES (2, N'USA')
INSERT [dbo].[CountryMaster] ([Id], [Name]) VALUES (3, N'Germany')
INSERT [dbo].[CountryMaster] ([Id], [Name]) VALUES (4, N'France')
INSERT [dbo].[CustomerEmployeeMaster] ([CustomerId], [CustomerEmployeeAccountId], [CustomerEmployeeName], [IsAdmin], [Email]) VALUES (1, 1, N'Prakash', 1, N'prakash@fabrikam.com')
INSERT [dbo].[CustomerEmployeeMaster] ([CustomerId], [CustomerEmployeeAccountId], [CustomerEmployeeName], [IsAdmin], [Email]) VALUES (1, 2, N'Mukesh', 0, N'mukesh@fabrikam.com')
INSERT [dbo].[CustomerEmployeeMaster] ([CustomerId], [CustomerEmployeeAccountId], [CustomerEmployeeName], [IsAdmin], [Email]) VALUES (2, 3, N'Abhishek', 1, N'abhishek@ti.com')
INSERT [dbo].[CustomerEmployeeMaster] ([CustomerId], [CustomerEmployeeAccountId], [CustomerEmployeeName], [IsAdmin], [Email]) VALUES (2, 4, N'Vinay', 0, N'vinay@ti.com')
INSERT [dbo].[CustomerEmployeeMaster] ([CustomerId], [CustomerEmployeeAccountId], [CustomerEmployeeName], [IsAdmin], [Email]) VALUES (3, 5, N'Shahrukh', 0, N'shahrukh@ln.com')
INSERT [dbo].[CustomerEmployeeMaster] ([CustomerId], [CustomerEmployeeAccountId], [CustomerEmployeeName], [IsAdmin], [Email]) VALUES (3, 6, N'Salman', 1, N'salman@ln.com')
INSERT [dbo].[CustomerMaster] ([Id], [Name]) VALUES (1, N'Fabrikam')
INSERT [dbo].[CustomerMaster] ([Id], [Name]) VALUES (2, N'Texas Instruments')
INSERT [dbo].[CustomerMaster] ([Id], [Name]) VALUES (3, N'Lexis Nexis')
INSERT [dbo].[DisputedTransactions] ([TransactionId], [DisputedOn], [DisputeStatus], [DisputeStatusDate], [Notes]) VALUES (20, CAST(N'2014-12-15 00:00:00.000' AS DateTime), 3, CAST(N'2014-12-20 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[DisputedTransactions] ([TransactionId], [DisputedOn], [DisputeStatus], [DisputeStatusDate], [Notes]) VALUES (2, CAST(N'2014-12-20 00:00:00.000' AS DateTime), 2, CAST(N'2014-12-25 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[EmployeeMaster] ([Id], [Name], [Role], [Subsidiary]) VALUES (1, N'Vivek', N'SMSG Analyst', N'US')
INSERT [dbo].[EmployeeMaster] ([Id], [Name], [Role], [Subsidiary]) VALUES (2, N'Henry', N'Partner Account Manager', N'US')
INSERT [dbo].[EmployeeMaster] ([Id], [Name], [Role], [Subsidiary]) VALUES (3, N'Raj', N'Partner Account Manager', N'India')
INSERT [dbo].[EmployeeMaster] ([Id], [Name], [Role], [Subsidiary]) VALUES (4, N'Cynthia', N'Customer Reference Approver', N'')
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (1, 1, 1, CAST(N'2013-07-31 00:00:00.000' AS DateTime), 1, CAST(N'2013-11-10 00:00:00.000' AS DateTime))
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (2, 2, 2, CAST(N'2013-06-24 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (3, 2, 3, CAST(N'2013-06-23 00:00:00.000' AS DateTime), 1, CAST(N'2013-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (4, 3, 2, CAST(N'2013-07-09 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (5, 4, 1, CAST(N'2013-06-10 00:00:00.000' AS DateTime), 1, CAST(N'2013-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (6, 5, 1, CAST(N'2013-07-20 00:00:00.000' AS DateTime), 1, CAST(N'2013-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[EnrollmentMaster] ([InvitationId], [PartnerId], [ProgramId], [InvitationDate], [EnrollmentCompleted], [EnrollmentDate]) VALUES (7, 5, 2, CAST(N'2013-07-31 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (5, 2, CAST(N'2014-06-23 00:00:00.000' AS DateTime), CAST(N'2015-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (3, 5, CAST(N'2014-09-27 00:00:00.000' AS DateTime), CAST(N'2015-09-18 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (4, 8, CAST(N'2014-10-29 00:00:00.000' AS DateTime), CAST(N'2015-10-20 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (2, 3, CAST(N'2014-01-19 00:00:00.000' AS DateTime), CAST(N'2015-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (5, 3, CAST(N'2014-10-30 00:00:00.000' AS DateTime), CAST(N'2015-10-21 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (1, 2, CAST(N'2014-07-30 00:00:00.000' AS DateTime), CAST(N'2015-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerCompetencyAttainment] ([PartnerId], [CompetencyId], [CompentencyAttainedOn], [CompetencyEndsOn]) VALUES (1, 2, CAST(N'2014-01-20 00:00:00.000' AS DateTime), CAST(N'2015-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (1, 1, N'Robin', 1, N'robin@persistent.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (1, 2, N'Asif', 0, N'asif@persistent.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (2, 3, N'Venkat', 1, N'venkat@infosys.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (2, 4, N'Ajay', 0, N'ajay@infosys.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (3, 5, N'Jim', 1, N'jim@hcl.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (4, 6, N'Bob', 1, N'bob@accenture.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (5, 7, N'Raj', 1, N'raj@ig.com')
INSERT [dbo].[PartnerEmployeeMaster] ([PartnerId], [EmployeeAccountId], [EmployeeName], [IsAdmin], [Email]) VALUES (6, 8, N'James', 1, N'james@prometric.com')
INSERT [dbo].[PartnerMaster] ([Id], [Name], [BankName], [RoutingNumber], [BankAccountNumber], [PartnerAccountManagerID]) VALUES (1, N'Persistent Systems Ltd.', N'State Bank of India', N'385382', N'35999', 3)
INSERT [dbo].[PartnerMaster] ([Id], [Name], [BankName], [RoutingNumber], [BankAccountNumber], [PartnerAccountManagerID]) VALUES (2, N'Infosys Ltd.', N'Canara Bank', N'556457', N'25594', 3)
INSERT [dbo].[PartnerMaster] ([Id], [Name], [BankName], [RoutingNumber], [BankAccountNumber], [PartnerAccountManagerID]) VALUES (3, N'HCL', N'Punjab National Bank', N'758077', N'19440', 3)
INSERT [dbo].[PartnerMaster] ([Id], [Name], [BankName], [RoutingNumber], [BankAccountNumber], [PartnerAccountManagerID]) VALUES (4, N'Accenture', N'Bank of America', N'233739', N'38625', 2)
INSERT [dbo].[PartnerMaster] ([Id], [Name], [BankName], [RoutingNumber], [BankAccountNumber], [PartnerAccountManagerID]) VALUES (5, N'Insight Global', N'Wells Fargo', N'104515', N'14917', 2)
INSERT [dbo].[PartnerMaster] ([Id], [Name], [BankName], [RoutingNumber], [BankAccountNumber], [PartnerAccountManagerID]) VALUES (6, N'Prometric', N'', N'', N'', 2)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (1, CAST(N'2014-05-16 00:00:00.000' AS DateTime), 2, 3, 2, 3164, 3, CAST(N'2014-05-19 00:00:00.000' AS DateTime), 1, 158, 1, NULL, 4, 32)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (2, CAST(N'2014-07-03 00:00:00.000' AS DateTime), 2, 5, 2, 3736, 1, CAST(N'2014-07-07 00:00:00.000' AS DateTime), 1, 186, 1, NULL, 2, 36)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (3, CAST(N'2014-06-21 00:00:00.000' AS DateTime), 2, 6, 2, 4608, 1, CAST(N'2014-06-25 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 1, 34)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (4, CAST(N'2014-10-28 00:00:00.000' AS DateTime), 7, 1, 2, 543, 2, CAST(N'2014-11-01 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 3, 22)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (5, CAST(N'2014-03-30 00:00:00.000' AS DateTime), 2, 6, 1, 5924, 1, CAST(N'2014-04-04 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 3, 46)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (6, CAST(N'2014-11-30 00:00:00.000' AS DateTime), 1, 3, 3, 4633, 2, CAST(N'2014-12-03 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 2, 26)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (7, CAST(N'2014-02-07 00:00:00.000' AS DateTime), 3, 4, 1, 6925, 1, CAST(N'2014-02-11 00:00:00.000' AS DateTime), 1, 346, 3, CAST(N'2014-02-16 00:00:00.000' AS DateTime), 4, 36)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (8, CAST(N'2014-09-18 00:00:00.000' AS DateTime), 3, 5, 3, 3848, 2, CAST(N'2014-09-22 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 3, 37)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (9, CAST(N'2014-11-15 00:00:00.000' AS DateTime), 2, 2, 2, 7243, 1, CAST(N'2014-11-19 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 4, 28)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (10, CAST(N'2014-10-31 00:00:00.000' AS DateTime), 6, 6, 1, 6139, 1, CAST(N'2014-11-04 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 3, 44)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (11, CAST(N'2014-02-12 00:00:00.000' AS DateTime), 6, 1, 2, 5165, 1, CAST(N'2014-02-15 00:00:00.000' AS DateTime), 1, 258, 3, CAST(N'2014-02-20 00:00:00.000' AS DateTime), 2, 39)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (12, CAST(N'2014-03-28 00:00:00.000' AS DateTime), 6, 5, 1, 6247, 2, CAST(N'2014-04-02 00:00:00.000' AS DateTime), 1, 312, 2, NULL, 1, 22)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (13, CAST(N'2014-02-07 00:00:00.000' AS DateTime), 2, 2, 3, 2391, 1, CAST(N'2014-02-11 00:00:00.000' AS DateTime), 1, 119, 3, CAST(N'2014-02-26 00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (14, CAST(N'2014-05-15 00:00:00.000' AS DateTime), 7, 3, 3, 9167, 2, CAST(N'2014-05-19 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 4, 21)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (15, CAST(N'2014-06-04 00:00:00.000' AS DateTime), 4, 5, 2, 5100, 3, CAST(N'2014-06-09 00:00:00.000' AS DateTime), 1, 255, 3, CAST(N'2014-06-24 00:00:00.000' AS DateTime), 2, 33)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (16, CAST(N'2014-12-07 00:00:00.000' AS DateTime), 1, 1, 1, 1187, 1, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 1, 59, 1, NULL, 3, 35)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (17, CAST(N'2014-02-15 00:00:00.000' AS DateTime), 3, 1, 3, 5752, 2, CAST(N'2014-02-19 00:00:00.000' AS DateTime), 1, 287, 3, CAST(N'2014-03-11 00:00:00.000' AS DateTime), 1, 50)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (18, CAST(N'2014-07-11 00:00:00.000' AS DateTime), 6, 5, 1, 6667, 1, CAST(N'2014-07-14 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 2, 43)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (19, CAST(N'2014-11-24 00:00:00.000' AS DateTime), 4, 6, 1, 4403, 2, CAST(N'2014-11-27 00:00:00.000' AS DateTime), 1, 220, 3, CAST(N'2014-12-17 00:00:00.000' AS DateTime), 1, 42)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (20, CAST(N'2014-05-24 00:00:00.000' AS DateTime), 7, 3, 3, 7837, 3, CAST(N'2014-05-29 00:00:00.000' AS DateTime), 1, 391, 3, CAST(N'2014-06-08 00:00:00.000' AS DateTime), 3, 33)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (21, CAST(N'2014-10-16 00:00:00.000' AS DateTime), 5, 2, 3, 7410, 1, CAST(N'2014-10-19 00:00:00.000' AS DateTime), 1, 370, 1, NULL, 4, 29)
INSERT [dbo].[PartnerTransactions] ([Id], [TransactionDate], [PartnerEmployeeAccountId], [ProductId], [CustomerId], [SalesPrice], [IncentiveProgramId], [IncentiveCalculationDate], [QualifiesforIncentive], [EligibleIncentives], [IncentivePayableStatus], [IncentivePaymentDate], [CountryId], [NoOfLicensesSold]) VALUES (22, CAST(N'2014-07-01 00:00:00.000' AS DateTime), 3, 6, 3, 8299, 3, CAST(N'2014-07-04 00:00:00.000' AS DateTime), 0, 0, 0, NULL, 1, 25)
INSERT [dbo].[PaymentStatus] ([StatusId], [Value]) VALUES (1, N'Blocked')
INSERT [dbo].[PaymentStatus] ([StatusId], [Value]) VALUES (2, N'In Progress')
INSERT [dbo].[PaymentStatus] ([StatusId], [Value]) VALUES (3, N'Paid')
INSERT [dbo].[ProductMaster] ([Id], [Name], [UnitCost]) VALUES (1, N'Windows 2012', 100)
INSERT [dbo].[ProductMaster] ([Id], [Name], [UnitCost]) VALUES (2, N'Windows 8.1', 100)
INSERT [dbo].[ProductMaster] ([Id], [Name], [UnitCost]) VALUES (3, N'Office 2013', 125)
INSERT [dbo].[ProductMaster] ([Id], [Name], [UnitCost]) VALUES (4, N'Windows 7', 50)
INSERT [dbo].[ProductMaster] ([Id], [Name], [UnitCost]) VALUES (5, N'Dynamics CRM', 125)
INSERT [dbo].[ProductMaster] ([Id], [Name], [UnitCost]) VALUES (6, N'SharePoint 2013', 150)
INSERT [dbo].[ProgramMaster] ([Id], [Name], [CompetencyIDRequired]) VALUES (1, N'Enterprise', 9)
INSERT [dbo].[ProgramMaster] ([Id], [Name], [CompetencyIDRequired]) VALUES (2, N'SMB', 2)
INSERT [dbo].[ProgramMaster] ([Id], [Name], [CompetencyIDRequired]) VALUES (3, N'Solution Incentives', 6)
ALTER TABLE [dbo].[ActionPackSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_ActionPackSubscriptions_PartnerMaster] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[ActionPackSubscriptions] CHECK CONSTRAINT [FK_ActionPackSubscriptions_PartnerMaster]
GO
ALTER TABLE [dbo].[ApplicationReferences]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReferences_ApplicationTestsMaster] FOREIGN KEY([ApplicationTestID])
REFERENCES [dbo].[ApplicationTestsMaster] ([ApplicationTestId])
GO
ALTER TABLE [dbo].[ApplicationReferences] CHECK CONSTRAINT [FK_ApplicationReferences_ApplicationTestsMaster]
GO
ALTER TABLE [dbo].[ApplicationReferences]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReferences_CompetencyMaster] FOREIGN KEY([CompetencyID])
REFERENCES [dbo].[CompetencyMaster] ([Id])
GO
ALTER TABLE [dbo].[ApplicationReferences] CHECK CONSTRAINT [FK_ApplicationReferences_CompetencyMaster]
GO
ALTER TABLE [dbo].[ApplicationReferences]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReferences_CustomerMaster] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerMaster] ([Id])
GO
ALTER TABLE [dbo].[ApplicationReferences] CHECK CONSTRAINT [FK_ApplicationReferences_CustomerMaster]
GO
ALTER TABLE [dbo].[ApplicationReferences]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReferences_PartnerMaster] FOREIGN KEY([PartnerID])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[ApplicationReferences] CHECK CONSTRAINT [FK_ApplicationReferences_PartnerMaster]
GO
ALTER TABLE [dbo].[ApplicationReferences]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReferences_PartnerMaster1] FOREIGN KEY([PartnerID])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[ApplicationReferences] CHECK CONSTRAINT [FK_ApplicationReferences_PartnerMaster1]
GO
ALTER TABLE [dbo].[CertifiedPeople]  WITH CHECK ADD  CONSTRAINT [FK_CertifiedPeople_CertificationMaster] FOREIGN KEY([CertificationId])
REFERENCES [dbo].[CertificationMaster] ([Id])
GO
ALTER TABLE [dbo].[CertifiedPeople] CHECK CONSTRAINT [FK_CertifiedPeople_CertificationMaster]
GO
ALTER TABLE [dbo].[CertifiedPeople]  WITH CHECK ADD  CONSTRAINT [FK_CertifiedPeople_PartnerMaster] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[CertifiedPeople] CHECK CONSTRAINT [FK_CertifiedPeople_PartnerMaster]
GO
ALTER TABLE [dbo].[CompetencyCertifications]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyCertifications_CertificationMaster] FOREIGN KEY([CertificationID])
REFERENCES [dbo].[CertificationMaster] ([Id])
GO
ALTER TABLE [dbo].[CompetencyCertifications] CHECK CONSTRAINT [FK_CompetencyCertifications_CertificationMaster]
GO
ALTER TABLE [dbo].[CompetencyCertifications]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyCertifications_CompetencyMaster] FOREIGN KEY([CompentencyID])
REFERENCES [dbo].[CompetencyMaster] ([Id])
GO
ALTER TABLE [dbo].[CompetencyCertifications] CHECK CONSTRAINT [FK_CompetencyCertifications_CompetencyMaster]
GO
ALTER TABLE [dbo].[CustomerEmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_CustomerEmployeeMaster_CustomerMaster] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomerMaster] ([Id])
GO
ALTER TABLE [dbo].[CustomerEmployeeMaster] CHECK CONSTRAINT [FK_CustomerEmployeeMaster_CustomerMaster]
GO
ALTER TABLE [dbo].[DisputedTransactions]  WITH CHECK ADD  CONSTRAINT [FK_DisputedTransactions_PartnerTransactions] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[PartnerTransactions] ([Id])
GO
ALTER TABLE [dbo].[DisputedTransactions] CHECK CONSTRAINT [FK_DisputedTransactions_PartnerTransactions]
GO
ALTER TABLE [dbo].[EnrollmentMaster]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentMaster_PartnerMaster] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[EnrollmentMaster] CHECK CONSTRAINT [FK_EnrollmentMaster_PartnerMaster]
GO
ALTER TABLE [dbo].[EnrollmentMaster]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentMaster_ProgramMaster] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[ProgramMaster] ([Id])
GO
ALTER TABLE [dbo].[EnrollmentMaster] CHECK CONSTRAINT [FK_EnrollmentMaster_ProgramMaster]
GO
ALTER TABLE [dbo].[PartnerCompetencyAttainment]  WITH CHECK ADD  CONSTRAINT [FK_PartnerCompetencyAttainment_CompetencyMaster] FOREIGN KEY([CompetencyId])
REFERENCES [dbo].[CompetencyMaster] ([Id])
GO
ALTER TABLE [dbo].[PartnerCompetencyAttainment] CHECK CONSTRAINT [FK_PartnerCompetencyAttainment_CompetencyMaster]
GO
ALTER TABLE [dbo].[PartnerCompetencyAttainment]  WITH CHECK ADD  CONSTRAINT [FK_PartnerCompetencyAttainment_PartnerMaster] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[PartnerCompetencyAttainment] CHECK CONSTRAINT [FK_PartnerCompetencyAttainment_PartnerMaster]
GO
ALTER TABLE [dbo].[PartnerEmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_PartnerEmployeeMaster_PartnerMaster] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[PartnerMaster] ([Id])
GO
ALTER TABLE [dbo].[PartnerEmployeeMaster] CHECK CONSTRAINT [FK_PartnerEmployeeMaster_PartnerMaster]
GO
ALTER TABLE [dbo].[PartnerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PartnerTransactions_CustomerMaster] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CustomerMaster] ([Id])
GO
ALTER TABLE [dbo].[PartnerTransactions] CHECK CONSTRAINT [FK_PartnerTransactions_CustomerMaster]
GO
ALTER TABLE [dbo].[PartnerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PartnerTransactions_ProgramMaster] FOREIGN KEY([IncentiveProgramId])
REFERENCES [dbo].[ProgramMaster] ([Id])
GO
ALTER TABLE [dbo].[PartnerTransactions] CHECK CONSTRAINT [FK_PartnerTransactions_ProgramMaster]
GO
USE [master]
GO
ALTER DATABASE [ChannelIncentive] SET  READ_WRITE 
GO
