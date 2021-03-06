USE [master]
GO
/****** Object:  Database [OnlineStoreDatabase]    Script Date: 12/24/2019 1:04:26 AM ******/
CREATE DATABASE [OnlineStoreDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineStoreDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OnlineStoreDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineStoreDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OnlineStoreDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineStoreDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineStoreDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineStoreDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineStoreDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineStoreDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineStoreDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineStoreDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineStoreDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineStoreDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineStoreDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineStoreDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineStoreDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineStoreDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineStoreDatabase] SET QUERY_STORE = OFF
GO
USE [OnlineStoreDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OnlineStoreDatabase]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 12/24/2019 1:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[AdminName] [varchar](45) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandName] [varchar](45) NULL,
	[Category] [varchar](45) NULL,
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collaborators]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collaborators](
	[License] [int] NULL,
	[CollabID] [int] NULL,
	[CollabName] [varchar](45) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerName] [varchar](45) NULL,
	[Address] [varchar](45) NULL,
	[MobileNumber] [int] NULL,
	[AccountBalance] [float] NULL,
	[CreditCardInfo] [varchar](45) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[MaxPrice] [int] NULL,
	[MinPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSpecs]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSpecs](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](45) NULL,
	[Category] [varchar](45) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](45) NULL,
	[ProductPrice] [int] NULL,
	[StoreID] [int] NULL,
	[BrandID] [int] NULL,
	[ItemID] [int] NULL,
	[InitialQuantity] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 12/24/2019 1:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](45) NULL,
	[StoreType] [varchar](45) NULL,
	[Address] [varchar](45) NULL,
	[Category] [varchar](45) NULL,
	[License] [int] NULL,
	[Approval] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreOwner]    Script Date: 12/24/2019 1:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreOwner](
	[OwnerName] [varchar](45) NULL,
	[NumberOfStores] [int] NULL,
	[License] [int] NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[License] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/24/2019 1:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](45) NULL,
	[Password] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ItemSpecs]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([License])
REFERENCES [dbo].[StoreOwner] ([License])
GO
ALTER TABLE [dbo].[StoreOwner]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [OnlineStoreDatabase] SET  READ_WRITE 
GO
