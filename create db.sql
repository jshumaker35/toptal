USE [master]
GO

/****** Object:  Database [TopTal]    Script Date: 11/10/2015 2:08:10 AM ******/
CREATE DATABASE [TopTal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TopTal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TopTal.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TopTal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TopTal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [TopTal] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TopTal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TopTal] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TopTal] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TopTal] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TopTal] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TopTal] SET ARITHABORT OFF 
GO

ALTER DATABASE [TopTal] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TopTal] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TopTal] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TopTal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TopTal] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TopTal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TopTal] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TopTal] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TopTal] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TopTal] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TopTal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TopTal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TopTal] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TopTal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TopTal] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TopTal] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TopTal] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TopTal] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [TopTal] SET  MULTI_USER 
GO

ALTER DATABASE [TopTal] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TopTal] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TopTal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TopTal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [TopTal] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TopTal] SET  READ_WRITE 
GO

/****** Object:  Database [TopTal_Replicate]    Script Date: 11/10/2015 2:09:59 AM ******/
CREATE DATABASE [TopTal_Replicate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TopTal_Replicate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TopTal_Replicate.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TopTal_Replicate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TopTal_Replicate_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [TopTal_Replicate] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TopTal_Replicate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TopTal_Replicate] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET ARITHABORT OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TopTal_Replicate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TopTal_Replicate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TopTal_Replicate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TopTal_Replicate] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [TopTal_Replicate] SET  MULTI_USER 
GO

ALTER DATABASE [TopTal_Replicate] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TopTal_Replicate] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TopTal_Replicate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TopTal_Replicate] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [TopTal_Replicate] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TopTal_Replicate] SET  READ_WRITE 
GO

USE TopTal

CREATE TABLE [agency_offices]
( 
	[agency_office_id]   integer  NOT NULL ,
	[office_address]     varchar(255)  NULL ,
	[num_employees]      integer  NULL ,
	[phone_num]          varchar(20)  NULL ,
	[mgr_document_num]   varchar(20)  NULL 
)
go

ALTER TABLE [agency_offices]
	ADD CONSTRAINT [XPKagency_offices] PRIMARY KEY  CLUSTERED ([agency_office_id] ASC)
go

CREATE TABLE [companies]
( 
	[CUIT]               varchar(20)  NOT NULL ,
	[activity_commencement_date] datetime  NULL ,
	[website]            varchar(255)  NULL ,
	[email_address]      varchar(255)  NULL ,
	[phone_num]          char(18)  NULL ,
	[phone_type_id]      integer  NULL ,
	[primary_owner_document_num] varchar(20)  NULL 
)
go

ALTER TABLE [companies]
	ADD CONSTRAINT [XPKcompanies] PRIMARY KEY  CLUSTERED ([CUIT] ASC)
go

CREATE TABLE [company_owners]
( 
	[CUIT]               varchar(20)  NOT NULL ,
	[document_num]       varchar(20)  NOT NULL 
)
go

ALTER TABLE [company_owners]
	ADD CONSTRAINT [XPKcompany_owners] PRIMARY KEY  CLUSTERED ([CUIT] ASC,[document_num] ASC)
go

CREATE TABLE [individuals]
( 
	[document_num]       varchar(20)  NOT NULL ,
	[full_name]          varchar(50)  NULL ,
	[date_of_birth]      datetime  NULL ,
	[home_address]       varchar(255)  NULL ,
	[email_address]      varchar(255)  NULL ,
	[phone_num]          varchar(20)  NULL ,
	[phone_type_id]      integer  NULL 
)
go

ALTER TABLE [individuals]
	ADD CONSTRAINT [XPKindividuals] PRIMARY KEY  CLUSTERED ([document_num] ASC)
go

CREATE TABLE [phone_type]
( 
	[phone_type_id]      integer  NOT NULL ,
	[phone_type_desc]    char(18)  NOT NULL 
)
go

ALTER TABLE [phone_type]
	ADD CONSTRAINT [XPKphone_type] PRIMARY KEY  CLUSTERED ([phone_type_id] ASC)
go

CREATE TABLE [tax_payments]
( 
	[agency_office_id]   integer  NOT NULL ,
	[amt_paid]           money  NULL ,
	[payment_date]       datetime  NULL ,
	[tax_type_id]        integer  NOT NULL ,
	[tax_payment_id]     integer  NOT NULL ,
	[document_num]       varchar(20)  NULL ,
	[CUIT]               varchar(20)  NULL 
)
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [XPKtax_payments] PRIMARY KEY  CLUSTERED ([tax_payment_id] ASC)
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [XAK1tax_payments] UNIQUE ([agency_office_id]  ASC,[CUIT]  ASC,[document_num]  ASC,[payment_date]  ASC,[tax_type_id]  ASC)
go

CREATE TABLE [tax_type]
( 
	[tax_type_id]        integer  NOT NULL ,
	[tax_type_desc]      varchar(20)  NOT NULL 
)
go

ALTER TABLE [tax_type]
	ADD CONSTRAINT [XPKtax_type] PRIMARY KEY  CLUSTERED ([tax_type_id] ASC)
go


ALTER TABLE [agency_offices]
	ADD CONSTRAINT [fk_individuals_agency_offices_document_num] FOREIGN KEY ([mgr_document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [companies]
	ADD CONSTRAINT [fk_phone_type_companies_phone_type_id] FOREIGN KEY ([phone_type_id]) REFERENCES [phone_type]([phone_type_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [companies]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([primary_owner_document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [company_owners]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([CUIT]) REFERENCES [companies]([CUIT])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [company_owners]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [individuals]
	ADD CONSTRAINT [fk_phone_type_individuals_phone_type_id] FOREIGN KEY ([phone_type_id]) REFERENCES [phone_type]([phone_type_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_agency_offices_tax_payments_agency_office_id] FOREIGN KEY ([agency_office_id]) REFERENCES [agency_offices]([agency_office_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_tax_type_tax_payment_tax_type_id] FOREIGN KEY ([tax_type_id]) REFERENCES [tax_type]([tax_type_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_individuals_tax_payments_document_num] FOREIGN KEY ([document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_companies_tax_payments_cuid] FOREIGN KEY ([CUIT]) REFERENCES [companies]([CUIT])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


USE TopTal_Replicate

CREATE TABLE [agency_offices]
( 
	[agency_office_id]   integer  NOT NULL ,
	[office_address]     varchar(255)  NULL ,
	[num_employees]      integer  NULL ,
	[phone_num]          varchar(20)  NULL ,
	[mgr_document_num]   varchar(20)  NULL 
)
go

ALTER TABLE [agency_offices]
	ADD CONSTRAINT [XPKagency_offices] PRIMARY KEY  CLUSTERED ([agency_office_id] ASC)
go

CREATE TABLE [companies]
( 
	[CUIT]               varchar(20)  NOT NULL ,
	[activity_commencement_date] datetime  NULL ,
	[website]            varchar(255)  NULL ,
	[email_address]      varchar(255)  NULL ,
	[phone_num]          char(18)  NULL ,
	[phone_type_id]      integer  NULL ,
	[primary_owner_document_num] varchar(20)  NULL 
)
go

ALTER TABLE [companies]
	ADD CONSTRAINT [XPKcompanies] PRIMARY KEY  CLUSTERED ([CUIT] ASC)
go

CREATE TABLE [company_owners]
( 
	[CUIT]               varchar(20)  NOT NULL ,
	[document_num]       varchar(20)  NOT NULL 
)
go

ALTER TABLE [company_owners]
	ADD CONSTRAINT [XPKcompany_owners] PRIMARY KEY  CLUSTERED ([CUIT] ASC,[document_num] ASC)
go

CREATE TABLE [individuals]
( 
	[document_num]       varchar(20)  NOT NULL ,
	[full_name]          varchar(50)  NULL ,
	[date_of_birth]      datetime  NULL ,
	[home_address]       varchar(255)  NULL ,
	[email_address]      varchar(255)  NULL ,
	[phone_num]          varchar(20)  NULL ,
	[phone_type_id]      integer  NULL 
)
go

ALTER TABLE [individuals]
	ADD CONSTRAINT [XPKindividuals] PRIMARY KEY  CLUSTERED ([document_num] ASC)
go

CREATE TABLE [phone_type]
( 
	[phone_type_id]      integer  NOT NULL ,
	[phone_type_desc]    char(18)  NOT NULL 
)
go

ALTER TABLE [phone_type]
	ADD CONSTRAINT [XPKphone_type] PRIMARY KEY  CLUSTERED ([phone_type_id] ASC)
go

CREATE TABLE [tax_payments]
( 
	[agency_office_id]   integer  NOT NULL ,
	[amt_paid]           money  NULL ,
	[payment_date]       datetime  NULL ,
	[tax_type_id]        integer  NOT NULL ,
	[tax_payment_id]     integer  NOT NULL ,
	[document_num]       varchar(20)  NULL ,
	[CUIT]               varchar(20)  NULL 
)
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [XPKtax_payments] PRIMARY KEY  CLUSTERED ([tax_payment_id] ASC)
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [XAK1tax_payments] UNIQUE ([agency_office_id]  ASC,[CUIT]  ASC,[document_num]  ASC,[payment_date]  ASC,[tax_type_id]  ASC)
go

CREATE TABLE [tax_type]
( 
	[tax_type_id]        integer  NOT NULL ,
	[tax_type_desc]      varchar(20)  NOT NULL 
)
go

ALTER TABLE [tax_type]
	ADD CONSTRAINT [XPKtax_type] PRIMARY KEY  CLUSTERED ([tax_type_id] ASC)
go


ALTER TABLE [agency_offices]
	ADD CONSTRAINT [fk_individuals_agency_offices_document_num] FOREIGN KEY ([mgr_document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [companies]
	ADD CONSTRAINT [fk_phone_type_companies_phone_type_id] FOREIGN KEY ([phone_type_id]) REFERENCES [phone_type]([phone_type_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [companies]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([primary_owner_document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [company_owners]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([CUIT]) REFERENCES [companies]([CUIT])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [company_owners]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [individuals]
	ADD CONSTRAINT [fk_phone_type_individuals_phone_type_id] FOREIGN KEY ([phone_type_id]) REFERENCES [phone_type]([phone_type_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_agency_offices_tax_payments_agency_office_id] FOREIGN KEY ([agency_office_id]) REFERENCES [agency_offices]([agency_office_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_tax_type_tax_payment_tax_type_id] FOREIGN KEY ([tax_type_id]) REFERENCES [tax_type]([tax_type_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_individuals_tax_payments_document_num] FOREIGN KEY ([document_num]) REFERENCES [individuals]([document_num])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tax_payments]
	ADD CONSTRAINT [fk_companies_tax_payments_cuid] FOREIGN KEY ([CUIT]) REFERENCES [companies]([CUIT])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [dbo].[tax_payments]  WITH CHECK ADD  CONSTRAINT [CK_tax_payments] CHECK  ((([CUIT] IS NULL OR [document_num] IS NULL) AND ([CUIT] IS NOT NULL OR [document_num] IS NOT NULL)))
GO

ALTER TABLE [dbo].[tax_payments] CHECK CONSTRAINT [CK_tax_payments]
GO
