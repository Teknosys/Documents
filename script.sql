USE [master]
GO
/****** Object:  Database [WareHouseMgt]    Script Date: 5/21/2018 12:42:57 PM ******/
CREATE DATABASE [WareHouseMgt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WarehouseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WarehouseManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WarehouseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WarehouseManagement_log.ldf' , SIZE = 35712KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WareHouseMgt] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WareHouseMgt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WareHouseMgt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WareHouseMgt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WareHouseMgt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WareHouseMgt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WareHouseMgt] SET ARITHABORT OFF 
GO
ALTER DATABASE [WareHouseMgt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WareHouseMgt] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WareHouseMgt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WareHouseMgt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WareHouseMgt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WareHouseMgt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WareHouseMgt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WareHouseMgt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WareHouseMgt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WareHouseMgt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WareHouseMgt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WareHouseMgt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WareHouseMgt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WareHouseMgt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WareHouseMgt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WareHouseMgt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WareHouseMgt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WareHouseMgt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WareHouseMgt] SET RECOVERY FULL 
GO
ALTER DATABASE [WareHouseMgt] SET  MULTI_USER 
GO
ALTER DATABASE [WareHouseMgt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WareHouseMgt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WareHouseMgt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WareHouseMgt] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WareHouseMgt]
GO
/****** Object:  UserDefinedTableType [dbo].[mItemBarCode]    Script Date: 5/21/2018 12:42:59 PM ******/
CREATE TYPE [dbo].[mItemBarCode] AS TABLE(
	[ItemBarCodeRecNo] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[mItemGSTSlab]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[mItemGSTSlab] AS TABLE(
	[ItemGSTSlabRecNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[mItemGSTSlabNew]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[mItemGSTSlabNew] AS TABLE(
	[ItemGSTSlabRecNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[mItemHSNCode]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[mItemHSNCode] AS TABLE(
	[ItemHSNCodeRecNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[HSNCode] [nvarchar](16) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tFinishedGoodsTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tFinishedGoodsTransactionDetails] AS TABLE(
	[FinishedGoodTranRecNo] [numeric](18, 0) NULL,
	[FinishedGoodCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tMaterialInwardTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tMaterialInwardTransactionDetails] AS TABLE(
	[MaterialInwardTransRecNo] [numeric](18, 0) NULL,
	[MaterialInwardCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[UserCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tProdBOMDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tProdBOMDetails] AS TABLE(
	[ProdBOMRecNo] [numeric](18, 0) NULL,
	[ProdBOMTicketNo] [numeric](18, 0) NULL,
	[RequisitionTicketNo] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](50) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ItemProvideDate] [datetime] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tProjectDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tProjectDetails] AS TABLE(
	[ProjectDetailsRecNo] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Rate] [numeric](18, 3) NULL,
	[DiscType] [nvarchar](max) NULL,
	[Discount] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tProjectDetailsNew]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tProjectDetailsNew] AS TABLE(
	[ProjectDetailsRecNo] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Rate] [numeric](18, 3) NULL,
	[DiscType] [nvarchar](max) NULL,
	[Discount] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[HSNCode] [nvarchar](max) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tProjectInvoiceDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tProjectInvoiceDetails] AS TABLE(
	[InvoiceDetailsRecNo] [numeric](18, 0) NULL,
	[InvoiceCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[HSNCode] [nvarchar](max) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Rate] [numeric](18, 3) NULL,
	[DiscType] [nvarchar](max) NULL,
	[Discount] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tPurchaseReturnTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tPurchaseReturnTransactionDetails] AS TABLE(
	[PurchaseReturnTransRecNo] [numeric](18, 0) NULL,
	[PurchaseReturnCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[UserCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tPurchaseTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tPurchaseTransactionDetails] AS TABLE(
	[PurchaseTranRecID] [numeric](18, 0) NULL,
	[PurchaseCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ExpectedReceiveDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[Amount] [numeric](18, 3) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tRequisitionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tRequisitionDetails] AS TABLE(
	[RequisitionRecNo] [numeric](18, 0) NULL,
	[RequisitionTicketNo] [numeric](18, 0) NULL,
	[ProductionCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[RequisitionDate] [datetime] NULL,
	[ExpReceiveDate] [datetime] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tTicketProdBOMDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tTicketProdBOMDetails] AS TABLE(
	[ProdBOMRecNo] [numeric](18, 0) NULL,
	[TicketNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ItemProvidedDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tTicketRequisitionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
CREATE TYPE [dbo].[tTicketRequisitionDetails] AS TABLE(
	[TicketDetailRecNo] [numeric](18, 0) NULL,
	[TicketNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ExpReceiveDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[InsertItemBarCode]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertItemBarCode]  
 @tblItemBarCode mItemBarCode READONLY ,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 INSERT INTO mItemBarCode(ItemBarCodeRecNo,BarCode,ItemCode,RecAddDate,UserCode)
			 SELECT ItemBarCodeRecNo,BarCode,ItemCode,RecAddDate,UserCode 
			 FROM @tblItemBarCode 
			 SET @Status = 1
		     SET @ErrorMessage='' 
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END
GO
/****** Object:  StoredProcedure [dbo].[InsertmItemGSTSlab]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertmItemGSTSlab]
 @tblGSTSlab mItemGSTSlab READONLY ,
 @Status int=0 OUTPUT ,
 @ItemCode bigint=0,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
	     Declare @EntryCount numeric(18)
	     set @EntryCount=(select count(*) from mItemGSTSlab where ItemCode=@ItemCode and RecEndDate is null)
		 IF(@EntryCount =0)
		 BEGIN
			 INSERT INTO mItemGSTSlab(ItemGSTSlabRecNo,ItemCode,GSTSlab,CGST,SGST,IGST,RecAddDate,UserCode)
			 SELECT ItemGSTSlabRecNo,ItemCode,GSTSlab,CGST,SGST,IGST,RecAddDate,UserCode
			 FROM @tblGSTSlab 
			 SET @Status = 1
		     SET @ErrorMessage='' 
		 END
			 ELSE 
			 BEGIN
				update mItemGSTSlab set RecEndDate =GETDATE() where RecEndDate is null and ItemCode=@ItemCode
				  INSERT INTO mItemGSTSlab(ItemGSTSlabRecNo,ItemCode,GSTSlab,CGST,SGST,IGST,RecAddDate,UserCode)
				  SELECT ItemGSTSlabRecNo,ItemCode,GSTSlab,CGST,SGST,IGST,RecAddDate,UserCode
				  FROM @tblGSTSlab 
				  SET @Status = 1
				  SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END
GO
/****** Object:  StoredProcedure [dbo].[InserttFinishedGodosTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InserttFinishedGodosTransactionDetails]
 @tbltFinishedGodosTransactionDetails tFinishedGoodsTransactionDetails READONLY ,
 @FinishedGoodCode numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tFinishedGoodsTransactionDetails where FinishedGoodCode=@FinishedGoodCode and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tFinishedGoodsTransactionDetails(FinishedGoodTranRecNo,FinishedGoodCode,ItemCode,Quantity,BarCode,UserCode,RecAddDate,RecEndDate)
				 SELECT   FinishedGoodTranRecNo,FinishedGoodCode,ItemCode,Quantity,BarCode,UserCode,RecAddDate,RecEndDate
				 FROM @tbltFinishedGodosTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
			  update tFinishedGoodsTransactionDetails set RecEndDate =GETDATE() where RecEndDate is null and FinishedGoodCode=@FinishedGoodCode
				INSERT INTO tFinishedGoodsTransactionDetails(FinishedGoodTranRecNo,FinishedGoodCode,ItemCode,Quantity,BarCode,UserCode,RecAddDate,RecEndDate)
				 SELECT   FinishedGoodTranRecNo,FinishedGoodCode,ItemCode,Quantity,BarCode,UserCode,RecAddDate,RecEndDate
				 FROM @tbltFinishedGodosTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END

 


GO
/****** Object:  StoredProcedure [dbo].[InserttMaterialInwardTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InserttMaterialInwardTransactionDetails]
 @tbltMaterialInwardTransactionDetails tMaterialInwardTransactionDetails READONLY ,
 @MaterialInwardCode numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tMaterialInwardTransactionDetails where MaterialInwardCode=@MaterialInwardCode and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tMaterialInwardTransactionDetails(MaterialInwardTransRecNo,MaterialInwardCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate)
				 SELECT MaterialInwardTransRecNo,MaterialInwardCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate
				 FROM @tbltMaterialInwardTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
			  update tMaterialInwardTransactionDetails set RecEndDate =GETDATE() where RecEndDate is null and MaterialInwardCode=@MaterialInwardCode
			 INSERT INTO tMaterialInwardTransactionDetails(MaterialInwardTransRecNo,MaterialInwardCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate)
				 SELECT MaterialInwardTransRecNo,MaterialInwardCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate
				 FROM @tbltMaterialInwardTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END

 


GO
/****** Object:  StoredProcedure [dbo].[InserttProdBOMDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InserttProdBOMDetails]
 @tbltProdBOMDetails tProdBOMDetails READONLY ,
 @ProdBOMTicketNo numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tProdBOMDetails where ProdBOMTicketNo=@ProdBOMTicketNo and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tProdBOMDetails( ProdBOMRecNo,ProdBOMTicketNo,RequisitionTicketNo,BarCode,ItemCode,Quantity,ItemProvideDate,RecAddDate,RecEndDate,UserCode)
				 SELECT  ProdBOMRecNo,ProdBOMTicketNo,RequisitionTicketNo,BarCode,ItemCode,Quantity,ItemProvideDate,RecAddDate,RecEndDate,UserCode
				 FROM @tbltProdBOMDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tProdBOMDetails set RecEndDate =GETDATE() where RecEndDate is null and ProdBOMTicketNo=@ProdBOMTicketNo
				INSERT INTO tProdBOMDetails( ProdBOMRecNo,ProdBOMTicketNo,RequisitionTicketNo,BarCode,ItemCode,Quantity,ItemProvideDate,RecAddDate,RecEndDate,UserCode)
				 SELECT  ProdBOMRecNo,ProdBOMTicketNo,RequisitionTicketNo,BarCode,ItemCode,Quantity,ItemProvideDate,RecAddDate,RecEndDate,UserCode
				 FROM @tbltProdBOMDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END



GO
/****** Object:  StoredProcedure [dbo].[InserttProjectDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserttProjectDetails]
 @tbltProjectDetails tProjectDetailsNew READONLY ,
 @ProjectCode numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tProjectDetails where ProjectCode=@ProjectCode and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tProjectDetails(ProjectDetailsRecNo,ProjectCode,ItemCode,Quantity,Rate,DiscType,Discount,NetAmount,RecAddDate,UserCode,HSNCode,GSTSlab,SGST,CGST,IGST)
				 SELECT ProjectDetailsRecNo,ProjectCode,ItemCode,Quantity,Rate,DiscType,Discount,NetAmount,RecAddDate,UserCode,HSNCode,GSTSlab,SGST,CGST,IGST
				 FROM @tbltProjectDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tProjectDetails set RecEndDate =GETDATE() where RecEndDate is null and ProjectCode=@ProjectCode
				 INSERT INTO tProjectDetails(ProjectDetailsRecNo,ProjectCode,ItemCode,Quantity,Rate,DiscType,Discount,NetAmount,RecAddDate,UserCode,HSNCode,GSTSlab,SGST,CGST,IGST)
				 SELECT ProjectDetailsRecNo,ProjectCode,ItemCode,Quantity,Rate,DiscType,Discount,NetAmount,RecAddDate,UserCode,HSNCode,GSTSlab,SGST,CGST,IGST
				 FROM @tbltProjectDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END
GO
/****** Object:  StoredProcedure [dbo].[InserttProjectInvoiceDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InserttProjectInvoiceDetails]
 @tbltProjectInvoiceDetails tProjectInvoiceDetails READONLY ,
 @InvoiceCode numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tProjectInvoiceDetails where InvoiceCode=@InvoiceCode and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tProjectInvoiceDetails(InvoiceDetailsRecNo,InvoiceCode,BarCode,ItemCode,HSNCode,GSTSlab,CGST,SGST,IGST,Quantity,Rate,DiscType,Discount,NetAmount,UserCode,RecAddDate,RecEndDate)
				 SELECT   InvoiceDetailsRecNo,InvoiceCode,BarCode,ItemCode,HSNCode,GSTSlab,CGST,SGST,IGST,Quantity,Rate,DiscType,Discount,NetAmount,UserCode,RecAddDate,RecEndDate
				 FROM @tbltProjectInvoiceDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tProjectInvoiceDetails set RecEndDate =GETDATE() where RecEndDate is null and InvoiceCode=@InvoiceCode
				INSERT INTO tProjectInvoiceDetails(InvoiceDetailsRecNo,InvoiceCode,BarCode,ItemCode,HSNCode,GSTSlab,CGST,SGST,IGST,Quantity,Rate,DiscType,Discount,NetAmount,UserCode,RecAddDate,RecEndDate)
				 SELECT   InvoiceDetailsRecNo,InvoiceCode,BarCode,ItemCode,HSNCode,GSTSlab,CGST,SGST,IGST,Quantity,Rate,DiscType,Discount,NetAmount,UserCode,RecAddDate,RecEndDate
				 FROM @tbltProjectInvoiceDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END

 


GO
/****** Object:  StoredProcedure [dbo].[InserttPurchaseReturnTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InserttPurchaseReturnTransactionDetails]
 @tbltPurchaseReturnTransactionDetails tPurchaseReturnTransactionDetails READONLY ,
 @PurchaseReturnCode numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tPurchaseReturnTransactionDetails where PurchaseReturnCode=@PurchaseReturnCode and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tPurchaseReturnTransactionDetails(PurchaseReturnTransRecNo,PurchaseReturnCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate)
				 SELECT PurchaseReturnTransRecNo,PurchaseReturnCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate
				 FROM @tbltPurchaseReturnTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
			  update tPurchaseReturnTransactionDetails set RecEndDate =GETDATE() where RecEndDate is null and PurchaseReturnCode=@PurchaseReturnCode
			 INSERT INTO tPurchaseReturnTransactionDetails(PurchaseReturnTransRecNo,PurchaseReturnCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate)
				 SELECT PurchaseReturnTransRecNo,PurchaseReturnCode,BarCode,ItemCode,Quantity,UserCode,RecAddDate,RecEndDate
				 FROM @tbltPurchaseReturnTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END

 


GO
/****** Object:  StoredProcedure [dbo].[InserttPurchaseTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InserttPurchaseTransactionDetails]
 @tbltPurchaseTransactionDetails tPurchaseTransactionDetails READONLY ,
 @PurchaseCode numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tPurchaseTransactionDetails where PurchaseCode=@PurchaseCode and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tPurchaseTransactionDetails(PurchaseTranRecID,PurchaseCode,ItemCode,Quantity,ExpectedReceiveDate,UserCode,RecStartDate,RecEndDate,Amount)
				 SELECT   PurchaseTranRecID,PurchaseCode,ItemCode,Quantity,ExpectedReceiveDate,UserCode,RecStartDate,RecEndDate,Amount
				 FROM @tbltPurchaseTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tPurchaseTransactionDetails set RecEndDate =GETDATE() where RecEndDate is null and PurchaseCode=@PurchaseCode
				 INSERT INTO tPurchaseTransactionDetails(PurchaseTranRecID,PurchaseCode,ItemCode,Quantity,ExpectedReceiveDate,UserCode,RecStartDate,RecEndDate,Amount)
				 SELECT   PurchaseTranRecID,PurchaseCode,ItemCode,Quantity,ExpectedReceiveDate,UserCode,RecStartDate,RecEndDate,Amount
				 FROM @tbltPurchaseTransactionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END

 


GO
/****** Object:  StoredProcedure [dbo].[InserttRequisitionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InserttRequisitionDetails]
 @tbltRequisitionDetails tRequisitionDetails READONLY ,
 @RequisitionTicketNo numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tRequisitionDetails where RequisitionTicketNo=@RequisitionTicketNo and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tRequisitionDetails(  RequisitionRecNo,RequisitionTicketNo,ProductionCode,ItemCode,Quantity,RequisitionDate,ExpReceiveDate,RecAddDate,RecEndDate,UserCode)
				 SELECT   RequisitionRecNo,RequisitionTicketNo,ProductionCode,ItemCode,Quantity,RequisitionDate,ExpReceiveDate,RecAddDate,RecEndDate,UserCode
				 FROM @tbltRequisitionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tRequisitionDetails set RecEndDate =GETDATE() where RecEndDate is null and RequisitionTicketNo=@RequisitionTicketNo
				INSERT INTO tRequisitionDetails(  RequisitionRecNo,RequisitionTicketNo,ProductionCode,ItemCode,Quantity,RequisitionDate,ExpReceiveDate,RecAddDate,RecEndDate,UserCode)
				 SELECT   RequisitionRecNo,RequisitionTicketNo,ProductionCode,ItemCode,Quantity,RequisitionDate,ExpReceiveDate,RecAddDate,RecEndDate,UserCode
				 FROM @tbltRequisitionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END

 


GO
/****** Object:  StoredProcedure [dbo].[InserttTicketProdBOMDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InserttTicketProdBOMDetails]
 @tbltTicketProdBOMDetails tTicketProdBOMDetails READONLY ,
 @TicketNo numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tTicketProdBOMDetails where TicketNo=@TicketNo and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tTicketProdBOMDetails(ProdBOMRecNo,TicketNo,ItemCode,BarCode,Quantity,ItemProvidedDate,RecAddDate,UserCode)
				 SELECT ProdBOMRecNo,TicketNo,ItemCode,BarCode,Quantity,ItemProvidedDate,RecAddDate,UserCode
				 FROM @tbltTicketProdBOMDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tTicketProdBOMDetails set RecEndDate =GETDATE() where RecEndDate is null and TicketNo=@TicketNo
				 INSERT INTO tTicketProdBOMDetails(ProdBOMRecNo,TicketNo,ItemCode,BarCode,Quantity,ItemProvidedDate,RecAddDate,UserCode)
				 SELECT ProdBOMRecNo,TicketNo,ItemCode,BarCode,Quantity,ItemProvidedDate,RecAddDate,UserCode
				 FROM @tbltTicketProdBOMDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END
GO
/****** Object:  StoredProcedure [dbo].[InserttTicketRequisitionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InserttTicketRequisitionDetails]
 @tbltTicketRequisitionDetails tTicketRequisitionDetails READONLY ,
 @TicketNo numeric(18)=0,
 @Status int=0 OUTPUT ,
 @ErrorMessage nvarchar(max)=null OUTPUT 
  AS  
  BEGIN
	  BEGIN TRY
	  BEGIN TRANSACTION
			 Declare @EntryCount numeric(18)
			 set @EntryCount=(select count(*) from tTicketRequisitionDetails where TicketNo=@TicketNo and RecEndDate is null)
			 IF(@EntryCount =0)
			 BEGIN
				 INSERT INTO tTicketRequisitionDetails(TicketDetailRecNo,TicketNo,ItemCode,BarCode,Quantity,ExpReceiveDate,RecAddDate,UserCode)
				 SELECT TicketDetailRecNo,TicketNo,ItemCode,BarCode,Quantity,ExpReceiveDate,RecAddDate,UserCode
				 FROM @tbltTicketRequisitionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
			 ELSE 
			 BEGIN
				update tTicketRequisitionDetails set RecEndDate =GETDATE() where RecEndDate is null and TicketNo=@TicketNo
				 INSERT INTO tTicketRequisitionDetails(TicketDetailRecNo,TicketNo,ItemCode,BarCode,Quantity,ExpReceiveDate,RecAddDate,UserCode)
				 SELECT TicketDetailRecNo,TicketNo,ItemCode,BarCode,Quantity,ExpReceiveDate,RecAddDate,UserCode
				 FROM @tbltTicketRequisitionDetails 
				 SET @Status = 1
				 SET @ErrorMessage='' 
			 END
	  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
 END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCustomer]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateCustomer]
    @CustomerRecNo numeric(18)=0,
	@CustomerCode numeric(18)=0,
	@CustomerName nvarchar(max)=null,
	@BillingAddress nvarchar(max)=null,
	@BillingPinCode nvarchar(10)=null,
	@BillingCity int=0,
	@BillingState int=0,
	@BillingCountry int=0,
	@ShippingAddress nvarchar(max)=null,
	@ShippingPinCode nvarchar(10)=null,
	@ShippingCity int=0,
	@ShippingState int=0,
	@ShippingCountry int=0,
	@ContactPerson nvarchar(max)=null,
	@EmailAddress nvarchar(max)=null,
	@MobileNo nvarchar(12)=null,
	@TelNo nvarchar(max)=null,
	@GSTNo nvarchar(max)=null,
	@PANNo nvarchar(max)=null,
	@Note nvarchar(max)=null,
	@DiscardCustomer bit=0,
	@UserCode int=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	DECLARE @CustomerCnt int
	set @CustomerCnt =(select count(*) from mCustomer WHERE  CustomerName = @CustomerName AND CustomerCode!=@CustomerCode and DiscardCustomer=0 AND RecEndDate is null)
	
	IF (@CustomerCnt > 0)
	BEGIN 
		SET @Status = 2
		SET @ErrorMessage='Customer with same name already exist'
	END
	
	ELSE
	BEGIN
		SET @CustomerRecNo = (select isnull(max(CustomerRecNo),0)+1 from mCustomer) 
			IF(@CustomerRecNo IS NULL)
			BEGIN
				SET @CustomerRecNo = 1				
			END
			if(@CustomerCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mCustomer WHERE CustomerCode = @CustomerCode AND RecEndDate is null)
				BEGIN
					UPDATE mCustomer SET RecEndDate = GetDate() WHERE CustomerCode = @CustomerCode and RecEndDate is null
					INSERT INTO mCustomer
						   (
							CustomerRecNo,
							CustomerCode,
							CustomerName,
							BillingAddress,
							BillingPinCode,
							BillingCity,
							BillingState,
							BillingCountry,
							ShippingAddress,
							ShippingPinCode,
							ShippingCity,
							ShippingState,
							ShippingCountry,
							ContactPerson,
							EmailAddress,
							MobileNo,
							TelNo,
							GSTNo,
							PANNo,
							Note,
							DiscardCustomer,
							RecStartDate,
							UserCode
						   )
					 VALUES
						   (
							@CustomerRecNo,
							@CustomerCode,
							@CustomerName,
							@BillingAddress,
							@BillingPinCode,
							@BillingCity,
							@BillingState,
							@BillingCountry,
							@ShippingAddress,
							@ShippingPinCode,
							@ShippingCity,
							@ShippingState,
							@ShippingCountry,
							@ContactPerson,
							@EmailAddress,
							@MobileNo,
							@TelNo,
							@GSTNo,
							@PANNo,
							@Note,
							@DiscardCustomer,
							GETDATE(),
							@UserCode
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This customer code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @CustomerCode = (select max(CustomerCode)+1 from mCustomer) 
				IF(@CustomerCode IS NULL)
				BEGIN
					SET @CustomerCode = 1001				
				END

				INSERT INTO mCustomer
						   (
							CustomerRecNo,
							CustomerCode,
							CustomerName,
							BillingAddress,
							BillingPinCode,
							BillingCity,
							BillingState,
							BillingCountry,
							ShippingAddress,
							ShippingPinCode,
							ShippingCity,
							ShippingState,
							ShippingCountry,
							ContactPerson,
							EmailAddress,
							MobileNo,
							TelNo,
							GSTNo,
							PANNo,
							Note,
							DiscardCustomer,
							RecStartDate,
							UserCode
						   )
					 VALUES
						   (
							@CustomerRecNo,
							@CustomerCode,
							@CustomerName,
							@BillingAddress,
							@BillingPinCode,
							@BillingCity,
							@BillingState,
							@BillingCountry,
							@ShippingAddress,
							@ShippingPinCode,
							@ShippingCity,
							@ShippingState,
							@ShippingCountry,
							@ContactPerson,
							@EmailAddress,
							@MobileNo,
							@TelNo,
							@GSTNo,
							@PANNo,
							@Note,
							@DiscardCustomer,
							GETDATE(),
							@UserCode
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END
END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@CustomerCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END




GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateEmployee]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateEmployee]
    @EmpRecNo numeric(18)=0,
	@EmpCode numeric(18)=0,
	@EmpName nvarchar(max)=null,
	@PermanentAddress nvarchar(max)=null,
	@PermanentPinCode nvarchar(10)=null,
	@PermanentCountryCode int=0,
	@PermanentStateCode int=0,
	@PermanentCityCode int=0,
	@TempAddress nvarchar(max)=null,
	@TempPinCode nvarchar(10)=null,
	@TempCountryCode int=0,
	@TempStateCode int=0,
	@TempCityCode int=0,

	@EmpTypeCode int=0,
	@MobileNo nvarchar(12)=null,
	@TelephoneNo nvarchar(max)=null,
	@PersonalEmailID nvarchar(max)=null,
	@OfficialEmailID nvarchar(max)=null,
	@BirthDate datetime=null,
	@JoiningDate datetime=null,
	@ServiceTerminateDate datetime=null,
	@DiscardEmployee bit=0,
	@UserCode int=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	DECLARE @EmployeeCnt int
	set @EmployeeCnt =(select count(*) from mEmployee WHERE  EmpName = @EmpName AND EmpCode!=@EmpCode and DiscardEmployee=0  AND RecEndDate is null)
	
	IF (@EmployeeCnt > 0)
	BEGIN 
		SET @Status = 2
		SET @ErrorMessage='Employee with same name already exist'
	END
	
	ELSE
	BEGIN
		SET @EmpRecNo = (select isnull(max(EmpRecNo),0)+1 from mEmployee) 
			IF(@EmpRecNo IS NULL)
			BEGIN
				SET @EmpRecNo = 1				
			END
			if(@EmpCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mEmployee WHERE EmpCode = @EmpCode AND RecEndDate is null)
				BEGIN
					UPDATE mEmployee SET RecEndDate = GetDate() WHERE EmpCode = @EmpCode and RecEndDate is null
					INSERT INTO mEmployee
						   (
							EmpRecNo,
							EmpCode,
							EmpName,
							PermanentAddress,
							PermanentPinCode,
							PermanentCountryCode,
							PermanentStateCode,
							PermanentCityCode,
							TempAddress,
							TempPinCode,
							TempCountryCode,
							TempStateCode,
							TempCityCode,
							EmpTypeCode,
							MobileNo,
							TelephoneNo,
							PersonalEmailID,
							OfficialEmailID,
							BirthDate,
							JoiningDate,
							ServiceTerminateDate,
							UserCode,
							DiscardEmployee,
							RecAddDate

						   )
					 VALUES
						   (
							@EmpRecNo,
							@EmpCode,
							@EmpName,
							@PermanentAddress,
							@PermanentPinCode,
							@PermanentCountryCode,
							@PermanentStateCode,
							@PermanentCityCode,
							@TempAddress,
							@TempPinCode,
							@TempCountryCode,
							@TempStateCode,
							@TempCityCode,
							@EmpTypeCode,
							@MobileNo,
							@TelephoneNo,
							@PersonalEmailID,
							@OfficialEmailID,
							@BirthDate,
							@JoiningDate,
							@ServiceTerminateDate,
							@UserCode,
							0,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This employee code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @EmpCode = (select max(EmpCode)+1 from mEmployee) 
				IF(@EmpCode IS NULL)
				BEGIN
					SET @EmpCode = 1001				
				END

				INSERT INTO mEmployee
						   (
							EmpRecNo,
							EmpCode,
							EmpName,
							PermanentAddress,
							PermanentPinCode,
							PermanentCountryCode,
							PermanentStateCode,
							PermanentCityCode,
							TempAddress,
							TempPinCode,
							TempCountryCode,
							TempStateCode,
							TempCityCode,
							EmpTypeCode,
							MobileNo,
							TelephoneNo,
							PersonalEmailID,
							OfficialEmailID,
							BirthDate,
							JoiningDate,
							ServiceTerminateDate,
							UserCode,
							DiscardEmployee,
							RecAddDate

						   )
					 VALUES
						   (
							@EmpRecNo,
							@EmpCode,
							@EmpName,
							@PermanentAddress,
							@PermanentPinCode,
							@PermanentCountryCode,
							@PermanentStateCode,
							@PermanentCityCode,
							@TempAddress,
							@TempPinCode,
							@TempCountryCode,
							@TempStateCode,
							@TempCityCode,
							@EmpTypeCode,
							@MobileNo,
							@TelephoneNo,
							@PersonalEmailID,
							@OfficialEmailID,
							@BirthDate,
							@JoiningDate,
							@ServiceTerminateDate,
							@UserCode,
							0,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END
END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@EmpCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END




GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateFinishedGoods]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateFinishedGoods]

@FinishedGoodsRecNo numeric(18)=0,
@FinishedGoodCode numeric(18)=0,
@ProjectCode numeric(18)=0,
@DiscardFinishedGood bit=0,
@UserCode int=0,
@Status int=0 OUTPUT,
@ErrorMessage nvarchar(max)=null OUTPUT



AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	SET @FinishedGoodsRecNo = (select isnull(max(FinishedGoodsRecNo),0)+1 from mFinishedGoods ) 
			IF(@FinishedGoodsRecNo IS NULL)
			BEGIN
				SET @FinishedGoodsRecNo = 1				
			END
			if(@FinishedGoodCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mFinishedGoods WHERE FinishedGoodCode = @FinishedGoodCode AND RecEndDate is null and DiscardFinishedGood=0)
				BEGIN
					UPDATE mFinishedGoods SET RecEndDate = GetDate() WHERE FinishedGoodCode = @FinishedGoodCode and RecEndDate is null and DiscardFinishedGood=0
					INSERT INTO mFinishedGoods
						   (
						    FinishedGoodsRecNo,
							FinishedGoodCode,
							ProjectCode,
							DiscardFinishedGood,
							UserCode,
							RecAddDate
						   )
					 VALUES
						   (
							@FinishedGoodsRecNo,
							@FinishedGoodCode,
							@ProjectCode,
							@DiscardFinishedGood,
							@UserCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This finished good code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @FinishedGoodCode = (select max(FinishedGoodCode)+1 from mFinishedGoods) 
				IF(@FinishedGoodCode IS NULL)
				BEGIN
					SET @FinishedGoodCode = 1				
				END

			INSERT INTO mFinishedGoods
						   (
						    FinishedGoodsRecNo,
							FinishedGoodCode,
							ProjectCode,
							DiscardFinishedGood,
							UserCode,
							RecAddDate
						   )
					 VALUES
						   (
							@FinishedGoodsRecNo,
							@FinishedGoodCode,
							@ProjectCode,
							@DiscardFinishedGood,
							@UserCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@FinishedGoodCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateItem]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateItem]
	@ItemRecNo numeric(18)=0,
	@ItemCode numeric(18)=0,
	@ItemName nvarchar(max)=null,
	@ItemDescription nvarchar(max)=null,
	@ItemTypeCode int=0,
	@UOMCode int=0,
	@HSNCode nvarchar(max)=null,
	@DiscardItem bit=0,
	@UserCode int=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	DECLARE @ItemCnt int
	DECLARE @ItemCodeCnt int 
	set @ItemCnt =(select count(*) from mItem WHERE  ItemName = @ItemName AND ItemCode!=@ItemCode and DiscardItem=0 AND RecEndDate is null)
	

	IF (@ItemCnt > 0)
	BEGIN 
		SET @Status = 2
		SET @ErrorMessage='Item with same name already exist'
	END
	
	ELSE
	BEGIN
		SET @ItemRecNo = (select isnull(max(ItemRecNo),0)+1 from mItem) 
			IF(@ItemRecNo IS NULL)
			BEGIN
				SET @ItemRecNo = 1				
			END
			if(@ItemCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mItem WHERE ItemCode = @ItemCode AND RecEndDate is null and DiscardItem=0)
				BEGIN
					UPDATE mItem SET RecEndDate = GetDate() WHERE ItemCode = @ItemCode and RecEndDate is null and DiscardItem=0
					INSERT INTO mItem
				   (ItemRecNo,
					ItemCode,
					ItemName,
					ItemDescription,
					ItemTypeCode,
					UOMCode,
					HSNCode,
					RecAddDate,
					UserCode,
					DiscardItem
				   )
			 VALUES
				   (@ItemRecNo,
					@ItemCode,
					@ItemName,
					@ItemDescription,
					@ItemTypeCode,
					@UOMCode,
					@HSNCode,
					GETDATE(),
					@UserCode,
					0
				   )
				   SET @Status = 1
				   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This Item code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @ItemCode = (select max(ItemCode)+1 from mItem) 
				IF(@ItemCode IS NULL)
				BEGIN
					SET @ItemCode = 1001				
				END

				INSERT INTO mItem
				   (ItemRecNo,
					ItemCode,
					ItemName,
					ItemDescription,
					ItemTypeCode,
					UOMCode,
					HSNCode,
					RecAddDate,
					UserCode,
					DiscardItem
				   )
			 VALUES
				   (@ItemRecNo,
					@ItemCode,
					@ItemName,
					@ItemDescription,
					@ItemTypeCode,
					@UOMCode,
					@HSNCode,
					GETDATE(),
					@UserCode,
					0
				   )
				   SET @Status = 1
				   SET @ErrorMessage=''
			END
END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@ItemCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateMaterialInward]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateMaterialInward]

@MaterialInwardRecNo numeric(18)=0,
@MaterialInwardCode numeric(18)=0,
@PurchaseCode numeric(18)=0,
@MaterialInwardDate datetime=null,
@DiscardInward bit=0,
@UserCode int=0,
@Status int=0 OUTPUT,
@ErrorMessage nvarchar(max)=null OUTPUT



AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	SET @MaterialInwardRecNo = (select isnull(max(MaterialInwardRecNo),0)+1 from mMaterialInward ) 
			IF(@MaterialInwardRecNo IS NULL)
			BEGIN
				SET @MaterialInwardRecNo = 1				
			END
			if(@MaterialInwardCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mMaterialInward WHERE MaterialInwardCode = @MaterialInwardCode AND RecEndDate is null and DiscardInward=0)
				BEGIN
					UPDATE mMaterialInward SET RecEndDate = GetDate() WHERE MaterialInwardCode = @MaterialInwardCode and RecEndDate is null and DiscardInward=0
					INSERT INTO mMaterialInward
						   (
						    MaterialInwardRecNo,
							MaterialInwardCode,
							PurchaseCode,
							MaterialInwardDate,
							DiscardInward,
							UserCode,
							RecAddDate
						   )
					 VALUES
						   (
							@MaterialInwardRecNo,
							@MaterialInwardCode,
							@PurchaseCode,
							@MaterialInwardDate,
							@DiscardInward,
							@UserCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This materal inward code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @MaterialInwardCode = (select max(MaterialInwardCode)+1 from mMaterialInward) 
				IF(@MaterialInwardCode IS NULL)
				BEGIN
					SET @MaterialInwardCode = 1				
				END

			INSERT INTO mMaterialInward
						   (
						    MaterialInwardRecNo,
							MaterialInwardCode,
							PurchaseCode,
							MaterialInwardDate,
							DiscardInward,
							UserCode,
							RecAddDate
						   )
					 VALUES
						   (
							@MaterialInwardRecNo,
							@MaterialInwardCode,
							@PurchaseCode,
							GETDATE(),
							@DiscardInward,
							@UserCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@MaterialInwardCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateProduction]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertUpdateProduction]
	@ProductionRecNo numeric(18)=0,
	@ProductionCode numeric(18)=0,
	@ProjectCode numeric(18)=0,
	@ProductionDate datetime=null,
	@ExpReceivedDate datetime=null,
	@UserCode int=0,
	@DiscardProject bit=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	
		SET @ProductionRecNo = (select isnull(max(ProductionRecNo),0)+1 from mProduction ) 
			IF(@ProductionRecNo IS NULL)
			BEGIN
				SET @ProductionRecNo = 1				
			END
			if(@ProductionCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mProduction WHERE ProductionCode = @ProductionCode AND RecEndDate is null and CloseTickit=0)
				BEGIN
					UPDATE mProduction SET RecEndDate = GetDate() WHERE ProductionCode= @ProductionCode and RecEndDate is null and CloseTickit=0
					INSERT INTO mProduction
						   (
							ProductionRecNo,
							ProductionCode,
							ProjectCode,
							ProductionDate,
							ExpReceivedDate,
							RecAddDate,
							UserCode,
							CloseTickit

						   )
					 VALUES
						   (
							@ProductionRecNo,
							@ProductionCode,
							@ProjectCode,
							GETDATE(),
							@ExpReceivedDate,
							GETDATE(),
							@UserCode,
							0
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This Production code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @ProductionCode = (select max(ProductionCode)+1 from mProduction) 
				IF(@ProductionCode IS NULL)
				BEGIN
					SET @ProductionCode = 1				
				END

			INSERT INTO mProduction
						   (
							ProductionRecNo,
							ProductionCode,
							ProjectCode,
							ProductionDate,
							ExpReceivedDate,
							RecAddDate,
							UserCode,
							CloseTickit

						   )
					 VALUES
						   (
							@ProductionRecNo,
							@ProductionCode,
							@ProjectCode,
							GETDATE(),
							@ExpReceivedDate,
							GETDATE(),
							@UserCode,
							0
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END


  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@ProductionCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateProject]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateProject]
	@ProjectRecNo numeric(18)=0,
	@ProjectCode numeric(18)=0,
	@ProjectName nvarchar(max)=null,
	@ProjectStatus nvarchar(max)=null,
	@ProjectPriority nvarchar(max)=null,
	@ProjectType nvarchar(max)=null,
	@CustomerCode numeric(18)=0,
	@ExpectedStartDate datetime=null,
	@ExpectedEndDate datetime=null,
	@EstimatedCost numeric(18,3)=0,
	@ExpectedProfitRatio numeric(18,3)=0,
	@Notes nvarchar(max)=null,
	@SalesPersonEmpCode numeric(18)=0,
	@ProjectManagerEmpCode numeric(18)=0,
	@ShippingAddress nvarchar(max)=null,
	@PaymentTerms nvarchar(max)=null,
	@Instructions nvarchar(max)=null,
	@InvoiceAmt numeric(18,3)=0,
	@Discount numeric(18,3)=0,
	@TaxAmt numeric(18,3)=0,
	@NetAmount numeric(18,3)=0,
	@UserCode int=0,
	@DiscardProject bit=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	DECLARE @ProjectCnt int
	set @ProjectCnt =(select count(*) from mProject WHERE  ProjectName = @ProjectName AND ProjectCode!=@ProjectCode and DiscardProject=0  AND RecEndDate is null)
	

	IF (@ProjectCnt > 0)
	BEGIN 
		SET @Status = 2
		SET @ErrorMessage='Project with same name already exist'
	END
	
	ELSE
	BEGIN
		SET @ProjectRecNo = (select isnull(max(ProjectRecNo),0)+1 from mProject ) 
			IF(@ProjectRecNo IS NULL)
			BEGIN
				SET @ProjectRecNo = 1				
			END
			if(@ProjectCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mProject WHERE ProjectCode = @ProjectCode AND RecEndDate is null and DiscardProject=0)
				BEGIN
					UPDATE mProject SET RecEndDate = GetDate() WHERE ProjectCode = @ProjectCode and RecEndDate is null and DiscardProject=0
					INSERT INTO mProject
						   (
							ProjectRecNo,
							ProjectCode,
							ProjectName,
							ProjectStatus,
							ProjectPriority,
							ProjectType,
							CustomerCode,
							ExpectedStartDate,
							ExpectedEndDate,
							EstimatedCost,
							ExpectedProfitRatio,
							Notes,
							SalesPersonEmpCode,
							ProjectManagerEmpCode,
							ShippingAddress,
							PaymentTerms,
							Instructions,
							RecStartDate,
							UserCode,
							DiscardProject,
							InvoiceAmt,
							Discount,
							TaxAmt,
							NetAmount
						   )
					 VALUES
						   (
							@ProjectRecNo,
							@ProjectCode,
							@ProjectName,
							@ProjectStatus,
							@ProjectPriority,
							@ProjectType,
							@CustomerCode,
							@ExpectedStartDate,
							@ExpectedEndDate,
							@EstimatedCost,
							@ExpectedProfitRatio,
							@Notes,
							@SalesPersonEmpCode,
							@ProjectManagerEmpCode,
							@ShippingAddress,
							@PaymentTerms,
							@Instructions,
							GETDATE(),
							@UserCode,
							0,
							@InvoiceAmt,
							@Discount,
							@TaxAmt,
							@NetAmount
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This Project code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @ProjectCode = (select max(ProjectCode)+1 from mProject) 
				IF(@ProjectCode IS NULL)
				BEGIN
					SET @ProjectCode = 1001				
				END

				INSERT INTO mProject
						   (
							ProjectRecNo,
							ProjectCode,
							ProjectName,
							ProjectStatus,
							ProjectPriority,
							ProjectType,
							CustomerCode,
							ExpectedStartDate,
							ExpectedEndDate,
							EstimatedCost,
							ExpectedProfitRatio,
							Notes,
							SalesPersonEmpCode,
							ProjectManagerEmpCode,
							ShippingAddress,
							PaymentTerms,
							Instructions,
							RecStartDate,
							UserCode,
							DiscardProject,
							InvoiceAmt,
							Discount,
							TaxAmt,
							NetAmount
						   )
					 VALUES
						   (
							@ProjectRecNo,
							@ProjectCode,
							@ProjectName,
							@ProjectStatus,
							@ProjectPriority,
							@ProjectType,
							@CustomerCode,
							@ExpectedStartDate,
							@ExpectedEndDate,
							@EstimatedCost,
							@ExpectedProfitRatio,
							@Notes,
							@SalesPersonEmpCode,
							@ProjectManagerEmpCode,
							@ShippingAddress,
							@PaymentTerms,
							@Instructions,
							GETDATE(),
							@UserCode,
							0,
							@InvoiceAmt,
							@Discount,
							@TaxAmt,
							@NetAmount
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END
END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@ProjectCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateProjectInvoice]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUpdateProjectInvoice]
	@ProjectInvoiceRecNo numeric(18)=0,
	@InvoiceCode numeric(18)=0,
	@ProjectCode numeric(18)=0,
	@InvoiceDate datetime=null,
	@InvoiceAmt numeric(18,3)=0,
	@Discount numeric(18,3)=0,
	@TaxAmt numeric(18,3)=0,
	@NetAmount numeric(18,3)=0,
	@UserCode int=0,
	@PaymentTerms nvarchar(max)=null,
	@Instructions nvarchar(max)=null,
	@ShippingCountry int=0,
	@ShippingState int=0,
    @ShippingCity int=0,
	@ShippingAddress nvarchar(max)=null,
	@ShippingPinCode nvarchar(max)=null,
	@DiscardInvoice bit=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	SET @ProjectInvoiceRecNo = (select isnull(max(ProjectInvoiceRecNo),0)+1 from mProjectInvoice ) 
			IF(@ProjectInvoiceRecNo IS NULL)
			BEGIN
				SET @ProjectInvoiceRecNo = 1				
			END
			if(@InvoiceCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mProjectInvoice WHERE InvoiceCode = @InvoiceCode AND RecEndDate is null and DiscardInvoice=0)
				BEGIN
					UPDATE mProjectInvoice SET RecEndDate = GetDate() WHERE InvoiceCode= @InvoiceCode and RecEndDate is null and DiscardInvoice=0
					INSERT INTO mProjectInvoice
						   (
							ProjectInvoiceRecNo,
							InvoiceCode,
							ProjectCode,
							InvoiceDate,
							InvoiceAmt,
							Discount,
							TaxAmt,
							NetAmount,
							DiscardInvoice,
							UserCode,
							PaymentTerms,
							Instructions,
							ShippingCountry,
							ShippingState,
							ShippingCity,
							ShippingAddress,
							ShippingPinCode,
							RecStartDate
						   )
					 VALUES
						   (
							@ProjectInvoiceRecNo,
							@InvoiceCode,
							@ProjectCode,
							@InvoiceDate,
							@InvoiceAmt,
							@Discount,
							@TaxAmt,
							@NetAmount,
							@DiscardInvoice,
							@UserCode,
							@PaymentTerms,
							@Instructions,
							@ShippingCountry,
							@ShippingState,
							@ShippingCity,
							@ShippingAddress,
							@ShippingPinCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This project invoice code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @InvoiceCode = (select max(InvoiceCode)+1 from mProjectInvoice) 
				IF(@InvoiceCode IS NULL)
				BEGIN
					SET @InvoiceCode = 1				
				END

			INSERT INTO mProjectInvoice
						   (
							ProjectInvoiceRecNo,
							InvoiceCode,
							ProjectCode,
							InvoiceDate,
							InvoiceAmt,
							Discount,
							TaxAmt,
							NetAmount,
							DiscardInvoice,
							UserCode,
							PaymentTerms,
							Instructions,
							ShippingCountry,
							ShippingState,
							ShippingCity,
							ShippingAddress,
							ShippingPinCode,
							RecStartDate
						   )
					 VALUES
						   (
							@ProjectInvoiceRecNo,
							@InvoiceCode,
							@ProjectCode,
							GETDATE(),
							@InvoiceAmt,
							@Discount,
							@TaxAmt,
							@NetAmount,
							@DiscardInvoice,
							@UserCode,
							@PaymentTerms,
							@Instructions,
							@ShippingCountry,
							@ShippingState,
							@ShippingCity,
							@ShippingAddress,
							@ShippingPinCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@InvoiceCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePurchase]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdatePurchase]

@PurchaseRecNo numeric(18)=0,
@VendorCode numeric(18)=0,
@PurchaseCode numeric(18)=0,
@TotalAmount numeric(18,3)=0,
@PurchaseDate datetime=null,
@ExpectedReceiveDate datetime=null,
@ShippingAddress nvarchar(max)=null,
@ShippingPinCode int=0,
@ShippingCountry int=0,
@ShippingState int=0,
@ShippingCity int=0,
@PaymentTerms nvarchar(max)=null,
@Instructions nvarchar(max)=null,
@DiscardPurchase bit=0,
@UserCode int=0,
@Status int=0 OUTPUT,
@ErrorMessage nvarchar(max)=null OUTPUT

AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	SET @PurchaseRecNo = (select isnull(max(PurchaseRecNo),0)+1 from mPurchase ) 
			IF(@PurchaseRecNo IS NULL)
			BEGIN
				SET @PurchaseRecNo = 1				
			END
			if(@PurchaseCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mPurchase WHERE PurchaseCode = @PurchaseCode AND RecEndDate is null and DiscardPurchase=0)
				BEGIN
					UPDATE mPurchase SET RecEndDate = GetDate() WHERE PurchaseCode= @PurchaseCode and RecEndDate is null and DiscardPurchase=0
					INSERT INTO mPurchase
						   (
							PurchaseRecNo,
							PurchaseCode,
							VendorCode,
							PurchaseDate,
							ExpectedReceiveDate,
							ShippingAddress,
							ShippingPinCode,
							ShippingCountry,
							ShippingState,
							ShippingCity,
							PaymentTerms,
							Instructions,
							DiscardPurchase,
							UserCode,
							TotalAmount,
							RecStartDate
						   )
					 VALUES
						   (
							@PurchaseRecNo,
							@PurchaseCode,
							@VendorCode,
							@PurchaseDate,
							@ExpectedReceiveDate,
							@ShippingAddress,
							@ShippingPinCode,
							@ShippingCountry,
							@ShippingState,
							@ShippingCity,
							@PaymentTerms,
							@Instructions,
							@DiscardPurchase,
							@UserCode,
							@TotalAmount,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This purchase code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @PurchaseCode = (select max(PurchaseCode)+1 from mPurchase) 
				IF(@PurchaseCode IS NULL)
				BEGIN
					SET @PurchaseCode = 1				
				END

			INSERT INTO mPurchase
						   (
							PurchaseRecNo,
							PurchaseCode,
							VendorCode,
							PurchaseDate,
							ExpectedReceiveDate,
							ShippingAddress,
							ShippingPinCode,
							ShippingCountry,
							ShippingState,
							ShippingCity,
							PaymentTerms,
							Instructions,
							DiscardPurchase,
							UserCode,
							TotalAmount,
							RecStartDate
						   )
					 VALUES
						   (
							@PurchaseRecNo,
							@PurchaseCode,
							@VendorCode,
							GETDATE(),
							@ExpectedReceiveDate,
							@ShippingAddress,
							@ShippingPinCode,
							@ShippingCountry,
							@ShippingState,
							@ShippingCity,
							@PaymentTerms,
							@Instructions,
							@DiscardPurchase,
							@UserCode,
							@TotalAmount,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@PurchaseCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePurchaseReturn]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdatePurchaseReturn]

@PurchaseReturnRecNo numeric(18)=0,
@PurchaseReturnCode numeric(18)=0,
@PurchaseCode numeric(18)=0,
@MaterialInwardCode numeric(18)=0,
@PurchaseReturnDate datetime=null,
@DiscardReturn bit=0,
@UserCode int=0,
@Status int=0 OUTPUT,
@ErrorMessage nvarchar(max)=null OUTPUT



AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	SET @PurchaseReturnRecNo = (select isnull(max(PurchaseReturnRecNo),0)+1 from mPurchaseReturn ) 
			IF(@PurchaseReturnRecNo IS NULL)
			BEGIN
				SET @PurchaseReturnRecNo = 1				
			END
			if(@PurchaseReturnCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mPurchaseReturn WHERE PurchaseReturnCode = @PurchaseReturnCode AND RecEndDate is null and DiscardReturn=0)
				BEGIN
					UPDATE mPurchaseReturn SET RecEndDate = GetDate() WHERE PurchaseReturnCode = @PurchaseReturnCode and RecEndDate is null and DiscardReturn=0
					INSERT INTO mPurchaseReturn
						   (
						    PurchaseReturnRecNo,
							PurchaseReturnCode,
							PurchaseCode,
							MaterialInwardCode,
							PurchaseReturnDate,
							DiscardReturn,
							UserCode,
							RecAddDate
						   )
					 VALUES
						   (
							@PurchaseReturnRecNo,
							@PurchaseReturnCode,
							@PurchaseCode,
							@MaterialInwardCode,
							@PurchaseReturnDate,
							@DiscardReturn,
							@UserCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This purchase return code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @PurchaseReturnCode = (select max(PurchaseReturnCode)+1 from mPurchaseReturn) 
				IF(@PurchaseReturnCode IS NULL)
				BEGIN
					SET @PurchaseReturnCode = 1				
				END

			INSERT INTO mPurchaseReturn
						   (
						    PurchaseReturnRecNo,
							PurchaseReturnCode,
							PurchaseCode,
							MaterialInwardCode,
							PurchaseReturnDate,
							DiscardReturn,
							UserCode,
							RecAddDate
						   )
					 VALUES
						   (
							@PurchaseReturnRecNo,
							@PurchaseReturnCode,
							@PurchaseCode,
							@MaterialInwardCode,
							GETDATE(),
							@DiscardReturn,
							@UserCode,
							GETDATE()
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@PurchaseReturnCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateTicket]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateTicket]
	@TicketRecNo numeric(18)=0,
	@TicketNo numeric(18)=0,
	@ProjectCode numeric(18)=0,
	@TicketReaisedDate datetime=null,
	@ExpReceivedDate datetime=null,
	@UserCode int=0,
	@DiscardProject bit=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	
		SET @TicketRecNo = (select isnull(max(TicketRecNo),0)+1 from mTicket ) 
			IF(@TicketRecNo IS NULL)
			BEGIN
				SET @TicketRecNo = 1				
			END
			if(@TicketNo!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mTicket WHERE TicketNo = @TicketNo AND RecEndDate is null and DiscardTicket=0)
				BEGIN
					UPDATE mTicket SET RecEndDate = GetDate() WHERE TicketNo = @TicketNo and RecEndDate is null and DiscardTicket=0
					INSERT INTO mTicket
						   (
							TicketRecNo,
							TicketNo,
							ProjectCode,
							TicketReaisedDate,
							ExpReceivedDate,
							RecStartDate,
							UserCode,
							DiscardTicket
						   )
					 VALUES
						   (
							@TicketRecNo,
							@TicketNo,
							@ProjectCode,
							@TicketReaisedDate,
							@ExpReceivedDate,
							GETDATE(),
							@UserCode,
							0
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This ticket no is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @TicketNo = (select max(TicketNo)+1 from mTicket) 
				IF(@TicketNo IS NULL)
				BEGIN
					SET @TicketNo = 1				
				END

			INSERT INTO mTicket
						   (
							TicketRecNo,
							TicketNo,
							ProjectCode,
							TicketReaisedDate,
							ExpReceivedDate,
							RecStartDate,
							UserCode,
							DiscardTicket
						   )
					 VALUES
						   (
							@TicketRecNo,
							@TicketNo,
							@ProjectCode,
							GETDATE(),
							@ExpReceivedDate,
							GETDATE(),
							@UserCode,
							0
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END


  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@TicketNo
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateVendor]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUpdateVendor]
    @VendorRecNo numeric(18)=0,
	@VendorCode numeric(18)=0,
	@VendorName nvarchar(max)=null,
	@VendorAddress nvarchar(max)=null,
	@PinCode nvarchar(10)=nll,
	@City int=0,
	@State int=0,
	@Country int=0,
	@ContactPerson nvarchar(max)=null,
	@EmailAddress nvarchar(max)=null,
	@MobileNo nvarchar(12)=null,
	@TelNo nvarchar(max)=null,
	@GSTNo nvarchar(max)=null,
	@PANNo nvarchar(max)=null,
	@Note nvarchar(max)=null,
	@DiscardVendor bit=0,
	@UserCode int=0,
	@Status int=0 OUTPUT,
	@ErrorMessage nvarchar(max)=null OUTPUT
	
AS
BEGIN
  BEGIN TRY
  BEGIN TRANSACTION

	DECLARE @VendorCnt int
	set @VendorCnt =(select count(*) from mVendor WHERE  VendorName = @VendorName AND VendorCode!=@VendorCode and DiscardVendor=0  AND RecEndDate is null)
	
	IF (@VendorCnt > 0)
	BEGIN 
		SET @Status = 2
		SET @ErrorMessage='Vendor with same name already exist'
	END
	
	ELSE
	BEGIN
		SET @VendorRecNo = (select isnull(max(VendorRecNo),0)+1 from mVendor) 
			IF(@VendorRecNo IS NULL)
			BEGIN
				SET @VendorRecNo = 1				
			END
			if(@VendorCode!=0)
			BEGIN
				IF EXISTS(SELECT 1 FROM mVendor WHERE VendorCode = @VendorCode AND RecEndDate is null)
				BEGIN
					UPDATE mVendor SET RecEndDate = GetDate() WHERE VendorCode = @VendorCode and RecEndDate is null
					INSERT INTO mVendor
						   (
							VendorRecNo,
							VendorCode,
							VendorName,
							VendorAddress,
							PinCode,
							City,
							State,
							Country,
							ContactPerson,
							EmailAddress,
							MobileNo,
							TelNo,
							GSTNo,
							PANNo,
							Note,
							DiscardVendor,
							RecStartDate,
							UserCode
						   )
					 VALUES
						   (
							@VendorRecNo,
							@VendorCode,
							@VendorName,
							@VendorAddress,
							@PinCode,
							@City,
							@State,
							@Country,
							@ContactPerson,
							@EmailAddress,
							@MobileNo,
							@TelNo,
							@GSTNo,
							@PANNo,
							@Note,
							@DiscardVendor,
							GETDATE(),
							@UserCode
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
				END 
				ELSE 
				BEGIN
					SET @Status = 0
					SET @ErrorMessage='This vendor code is not exist'
				END
				
			END
			ELSE
			BEGIN
				SET @VendorCode = (select max(VendorCode)+1 from mVendor) 
				IF(@VendorCode IS NULL)
				BEGIN
					SET @VendorCode = 1001				
				END

				INSERT INTO mVendor
						   (
							VendorRecNo,
							VendorCode,
							VendorName,
							VendorAddress,
							PinCode,
							City,
							State,
							Country,
							ContactPerson,
							EmailAddress,
							MobileNo,
							TelNo,
							GSTNo,
							PANNo,
							Note,
							DiscardVendor,
							RecStartDate,
							UserCode
						   )
					 VALUES
						   (
							@VendorRecNo,
							@VendorCode,
							@VendorName,
							@VendorAddress,
							@PinCode,
							@City,
							@State,
							@Country,
							@ContactPerson,
							@EmailAddress,
							@MobileNo,
							@TelNo,
							@GSTNo,
							@PANNo,
							@Note,
							@DiscardVendor,
							GETDATE(),
							@UserCode
						   )
						   SET @Status = 1
						   SET @ErrorMessage=''
			END
END

  COMMIT TRANSACTION
  if(@Status=1)
  BEGIN
  set @Status=@VendorCode
  END
  END TRY
  BEGIN CATCH
  SET @Status = 0
  SET @ErrorMessage='ERROR'
  END CATCH
  SELECT @Status,@ErrorMessage
END




GO
/****** Object:  Table [dbo].[mCity]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mCity](
	[CityCode] [int] NULL,
	[CityName] [nvarchar](max) NULL,
	[StateCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mCountry]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mCountry](
	[CountryCode] [int] NULL,
	[CountryName] [nvarchar](max) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mCustomer]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mCustomer](
	[CustomerRecNo] [numeric](18, 0) NULL,
	[CustomerCode] [numeric](18, 0) NULL,
	[CustomerName] [nvarchar](max) NULL,
	[BillingAddress] [nvarchar](max) NULL,
	[BillingPinCode] [nvarchar](10) NULL,
	[BillingCity] [int] NULL,
	[BillingState] [int] NULL,
	[BillingCountry] [int] NULL,
	[ShippingAddress] [nvarchar](max) NULL,
	[ShippingPinCode] [nvarchar](10) NULL,
	[ShippingCity] [int] NULL,
	[ShippingState] [int] NULL,
	[ShippingCountry] [int] NULL,
	[ContactPerson] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[MobileNo] [nvarchar](12) NULL,
	[TelNo] [nvarchar](max) NULL,
	[GSTNo] [nvarchar](max) NULL,
	[PANNo] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[DiscardCustomer] [bit] NULL,
	[UserCode] [int] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mEmployee]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mEmployee](
	[EmpRecNo] [numeric](18, 0) NULL,
	[EmpCode] [numeric](18, 0) NULL,
	[EmpName] [nvarchar](max) NULL,
	[PermanentAddress] [nvarchar](max) NULL,
	[PermanentPinCode] [nvarchar](10) NULL,
	[PermanentCountryCode] [int] NULL,
	[PermanentStateCode] [int] NULL,
	[PermanentCityCode] [int] NULL,
	[TempAddress] [nvarchar](max) NULL,
	[TempPinCode] [nvarchar](10) NULL,
	[TempCountryCode] [int] NULL,
	[TempStateCode] [int] NULL,
	[TempCityCode] [int] NULL,
	[EmpTypeCode] [int] NULL,
	[MobileNo] [nvarchar](12) NULL,
	[TelephoneNo] [nvarchar](max) NULL,
	[PersonalEmailID] [nvarchar](max) NULL,
	[OfficialEmailID] [nvarchar](max) NULL,
	[BirthDate] [datetime] NULL,
	[JoiningDate] [datetime] NULL,
	[ServiceTerminateDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[DiscardEmployee] [bit] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mEmployeeType]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mEmployeeType](
	[EmpTypeCode] [int] NULL,
	[EmpType] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mFinishedGoods]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mFinishedGoods](
	[FinishedGoodsRecNo] [numeric](18, 0) NULL,
	[FinishedGoodCode] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[UserCode] [int] NULL,
	[DiscardFinishedGood] [bit] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mItem]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mItem](
	[ItemRecNo] [numeric](18, 0) NOT NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[ItemName] [nvarchar](max) NULL,
	[ItemDescription] [nvarchar](max) NULL,
	[ItemTypeCode] [int] NULL,
	[UOMCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[HSNCode] [nvarchar](max) NULL,
	[DiscardItem] [bit] NULL,
 CONSTRAINT [PK_mItem] PRIMARY KEY CLUSTERED 
(
	[ItemRecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mItemBarCode]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mItemBarCode](
	[ItemBarCodeRecNo] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mItemGSTSlab]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mItemGSTSlab](
	[ItemGSTSlabRecNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mItemHSNCode]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mItemHSNCode](
	[ItemHSNCodeRecNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[HSNCode] [nvarchar](16) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mItemType]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mItemType](
	[ItemTypeID] [int] NULL,
	[ItemType] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mMaterialInward]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mMaterialInward](
	[MaterialInwardRecNo] [numeric](18, 0) NULL,
	[MaterialInwardCode] [numeric](18, 0) NULL,
	[PurchaseCode] [numeric](18, 0) NULL,
	[MaterialInwardDate] [datetime] NULL,
	[DiscardInward] [bit] NULL,
	[UserCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mProduction]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mProduction](
	[ProductionRecNo] [numeric](18, 0) NULL,
	[ProductionCode] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[ProductionDate] [datetime] NULL,
	[ExpReceivedDate] [datetime] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[CloseTickit] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mProject]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mProject](
	[ProjectRecNo] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[ProjectName] [nvarchar](max) NULL,
	[ProjectStatus] [nvarchar](max) NULL,
	[ProjectPriority] [nvarchar](max) NULL,
	[ProjectType] [nvarchar](max) NULL,
	[CustomerCode] [numeric](18, 0) NULL,
	[ExpectedStartDate] [datetime] NULL,
	[ExpectedEndDate] [datetime] NULL,
	[EstimatedCost] [numeric](18, 3) NULL,
	[ExpectedProfitRatio] [numeric](18, 3) NULL,
	[Notes] [nvarchar](max) NULL,
	[SalesPersonEmpCode] [numeric](18, 0) NULL,
	[ProjectManagerEmpCode] [numeric](18, 0) NULL,
	[ShippingAddress] [nvarchar](max) NULL,
	[PaymentTerms] [nvarchar](max) NULL,
	[Instructions] [nvarchar](max) NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[DiscardProject] [bit] NULL,
	[InvoiceAmt] [numeric](18, 3) NULL,
	[Discount] [numeric](18, 3) NULL,
	[TaxAmt] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mProjectInvoice]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mProjectInvoice](
	[ProjectInvoiceRecNo] [numeric](18, 0) NULL,
	[InvoiceCode] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceAmt] [numeric](18, 3) NULL,
	[Discount] [numeric](18, 3) NULL,
	[TaxAmt] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL,
	[DiscardInvoice] [bit] NULL,
	[PaymentTerms] [nvarchar](max) NULL,
	[Instructions] [nvarchar](max) NULL,
	[ShippingCountry] [int] NULL,
	[ShippingState] [int] NULL,
	[ShippingCity] [int] NULL,
	[ShippingAddress] [nvarchar](max) NULL,
	[ShippingPinCode] [nvarchar](10) NULL,
	[UserCode] [int] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mProjectStatus]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mProjectStatus](
	[ProjectStatusCode] [int] NULL,
	[ProjectStatus] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mProjectType]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mProjectType](
	[ProjectTypeCode] [int] NULL,
	[ProjectType] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mPurchase]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mPurchase](
	[PurchaseRecNo] [numeric](18, 0) NULL,
	[PurchaseCode] [numeric](18, 0) NULL,
	[VendorCode] [numeric](18, 0) NULL,
	[PurchaseDate] [datetime] NULL,
	[ExpectedReceiveDate] [datetime] NULL,
	[ShippingAddress] [nvarchar](max) NULL,
	[ShippingPinCode] [nvarchar](10) NULL,
	[ShippingCountry] [int] NULL,
	[ShippingState] [int] NULL,
	[ShippingCity] [int] NULL,
	[PaymentTerms] [nvarchar](max) NULL,
	[Instructions] [nvarchar](max) NULL,
	[DiscardPurchase] [bit] NULL,
	[UserCode] [int] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[TotalAmount] [numeric](18, 3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mPurchaseReturn]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mPurchaseReturn](
	[PurchaseReturnRecNo] [numeric](18, 0) NULL,
	[PurchaseReturnCode] [numeric](18, 0) NULL,
	[PurchaseCode] [numeric](18, 0) NULL,
	[MaterialInwardCode] [numeric](18, 0) NULL,
	[PurchaseReturnDate] [datetime] NULL,
	[DiscardReturn] [bit] NULL,
	[UserCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mState]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mState](
	[StateCode] [int] NULL,
	[StateName] [nvarchar](max) NULL,
	[CountryCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mTicket]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mTicket](
	[TicketRecNo] [numeric](18, 0) NULL,
	[TicketNo] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[TicketReaisedDate] [datetime] NULL,
	[ExpReceivedDate] [datetime] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[DiscardTicket] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mUOM]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mUOM](
	[UOMID] [int] NULL,
	[UOM] [nvarchar](max) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mVendor]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mVendor](
	[VendorRecNo] [numeric](18, 0) NULL,
	[VendorCode] [numeric](18, 0) NULL,
	[VendorName] [nvarchar](max) NULL,
	[VendorAddress] [nvarchar](max) NULL,
	[PinCode] [nvarchar](10) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Country] [int] NULL,
	[ContactPerson] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[MobileNo] [nvarchar](12) NULL,
	[TelNo] [nvarchar](max) NULL,
	[GSTNo] [nvarchar](max) NULL,
	[PANNo] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[DiscardVendor] [bit] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tFinishedGoodsTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tFinishedGoodsTransactionDetails](
	[FinishedGoodTranRecNo] [numeric](18, 0) NULL,
	[FinishedGoodCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tMaterialInwardTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMaterialInwardTransactionDetails](
	[MaterialInwardTransRecNo] [numeric](18, 0) NULL,
	[MaterialInwardCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[UserCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProdBOMDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProdBOMDetails](
	[ProdBOMRecNo] [numeric](18, 0) NULL,
	[ProdBOMTicketNo] [numeric](18, 0) NULL,
	[RequisitionTicketNo] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](50) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ItemProvideDate] [datetime] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectDetails](
	[ProjectDetailsRecNo] [numeric](18, 0) NULL,
	[ProjectCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Rate] [numeric](18, 3) NULL,
	[DiscType] [nvarchar](max) NULL,
	[Discount] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[HSNCode] [nvarchar](max) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tProjectInvoiceDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProjectInvoiceDetails](
	[InvoiceDetailsRecNo] [numeric](18, 0) NULL,
	[InvoiceCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[HSNCode] [nvarchar](max) NULL,
	[GSTSlab] [numeric](18, 2) NULL,
	[CGST] [numeric](18, 2) NULL,
	[SGST] [numeric](18, 2) NULL,
	[IGST] [numeric](18, 2) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Rate] [numeric](18, 3) NULL,
	[DiscType] [nvarchar](max) NULL,
	[Discount] [numeric](18, 3) NULL,
	[NetAmount] [numeric](18, 3) NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tPurchaseReturnTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPurchaseReturnTransactionDetails](
	[PurchaseReturnTransRecNo] [numeric](18, 0) NULL,
	[PurchaseReturnCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[UserCode] [numeric](18, 0) NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tPurchaseTransactionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPurchaseTransactionDetails](
	[PurchaseTranRecID] [numeric](18, 0) NULL,
	[PurchaseCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ExpectedReceiveDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[RecStartDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[Amount] [numeric](18, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tRequisitionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRequisitionDetails](
	[RequisitionRecNo] [numeric](18, 0) NULL,
	[RequisitionTicketNo] [numeric](18, 0) NULL,
	[ProductionCode] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[RequisitionDate] [datetime] NULL,
	[ExpReceiveDate] [datetime] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL,
	[UserCode] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tTicketProdBOMDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTicketProdBOMDetails](
	[ProdBOMRecNo] [numeric](18, 0) NULL,
	[TicketNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ItemProvidedDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tTicketRequisitionDetails]    Script Date: 5/21/2018 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTicketRequisitionDetails](
	[TicketDetailRecNo] [numeric](18, 0) NULL,
	[TicketNo] [numeric](18, 0) NULL,
	[ItemCode] [numeric](18, 0) NULL,
	[BarCode] [nvarchar](max) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[ExpReceiveDate] [datetime] NULL,
	[UserCode] [int] NULL,
	[RecAddDate] [datetime] NULL,
	[RecEndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [WareHouseMgt] SET  READ_WRITE 
GO
