USE [master]
GO
/****** Object:  Database [LCWaikikiDB]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE DATABASE [LCWaikikiDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LCWaikikiDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LCWaikikiDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LCWaikikiDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LCWaikikiDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LCWaikikiDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LCWaikikiDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LCWaikikiDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LCWaikikiDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LCWaikikiDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LCWaikikiDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LCWaikikiDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LCWaikikiDB] SET  MULTI_USER 
GO
ALTER DATABASE [LCWaikikiDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LCWaikikiDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LCWaikikiDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LCWaikikiDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LCWaikikiDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LCWaikikiDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LCWaikikiDB', N'ON'
GO
ALTER DATABASE [LCWaikikiDB] SET QUERY_STORE = OFF
GO
USE [LCWaikikiDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Picture] [image] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CreditCardNumber] [nvarchar](50) NULL,
	[CreditCardType] [nvarchar](50) NULL,
	[CardExpMo] [int] NULL,
	[CardExpYr] [int] NULL,
	[BillingAddress] [nvarchar](255) NULL,
	[BillingCity] [nvarchar](50) NULL,
	[BillingRegion] [nvarchar](50) NULL,
	[BillingPostalCode] [nvarchar](50) NULL,
	[BillingCountry] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipCity] [nvarchar](50) NULL,
	[ShipRegion] [nvarchar](50) NULL,
	[ShipPostalCode] [nvarchar](50) NULL,
	[ShipCountry] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NULL,
	[ProductID] [uniqueidentifier] NULL,
	[OrderNumber] [bigint] NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[ShipDate] [datetime] NULL,
	[BillDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[OrderNumber] [bigint] NULL,
	[PaymentID] [uniqueidentifier] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[ShipperID] [uniqueidentifier] NULL,
	[Freight] [nvarchar](50) NULL,
	[SalesTax] [decimal](18, 2) NULL,
	[TransacStatus] [int] NULL,
	[ErrLoc] [nvarchar](50) NULL,
	[ErrMsg] [nvarchar](50) NULL,
	[Deleted] [bit] NULL,
	[Paid] [bit] NULL,
	[PaymentDate] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [uniqueidentifier] NOT NULL,
	[PaymentType] [int] NULL,
	[Allowed] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductDescription] [nvarchar](50) NULL,
	[SupplierID] [uniqueidentifier] NULL,
	[CategoryID] [uniqueidentifier] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[SizeType] [int] NOT NULL,
	[Color] [int] NULL,
	[Picture] [image] NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/4/2022 4:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactFirstName] [nvarchar](50) NULL,
	[ContactLastName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[URL] [nvarchar](50) NULL,
	[Notes] [nvarchar](50) NULL,
	[PaymentMethods] [int] NULL,
	[Logo] [image] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CategoryNameWithActives]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [CategoryNameWithActives] ON [dbo].[Category]
(
	[CategoryName] DESC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CustomersFirstNameOrderByEntryDate]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [CustomersFirstNameOrderByEntryDate] ON [dbo].[Customers]
(
	[FirstName] DESC,
	[EntryDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrderNumberWithMaxDiscount]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [OrderNumberWithMaxDiscount] ON [dbo].[OrderDetails]
(
	[OrderNumber] DESC,
	[Discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrderNumberWithMaxPrice]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [OrderNumberWithMaxPrice] ON [dbo].[OrderDetails]
(
	[OrderNumber] DESC,
	[Total] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrderNumberWithNoError]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [OrderNumberWithNoError] ON [dbo].[Orders]
(
	[OrderNumber] DESC
)
WHERE ([Orders].[ErrMsg] IS NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PaymentTypeCash]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [PaymentTypeCash] ON [dbo].[Payment]
(
	[PaymentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ProdcutNameWithMaxPrice]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [ProdcutNameWithMaxPrice] ON [dbo].[Products]
(
	[ProductName] DESC,
	[UnitPrice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ShippersName]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [ShippersName] ON [dbo].[Shippers]
(
	[CompanyName] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SuppliersWithEmail]    Script Date: 5/4/2022 4:57:47 PM ******/
CREATE NONCLUSTERED INDEX [SuppliersWithEmail] ON [dbo].[Suppliers]
(
	[CompanyName] DESC,
	[PaymentMethods] ASC
)
WHERE ([Suppliers].[Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payment]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [LCWaikikiDB] SET  READ_WRITE 
GO
