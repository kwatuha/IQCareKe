/*
   Tuesday, March 21, 201710:56:54 AM
   User: 
   Server: LAPTOP-DR050DFG\
   Database: IQCareDefault
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO

ALTER TABLE dbo.ord_LabOrder
	DROP CONSTRAINT DF_ord_LabOrder_DeleteFlag
GO
CREATE TABLE dbo.Tmp_ord_LabOrder
	(
	Id int NOT NULL IDENTITY (1, 1),
	Ptn_Pk int NOT NULL,
	LocationId int NOT NULL,
	VisitId int NOT NULL,
	ModuleId int NOT NULL,
	OrderedBy int NULL,
	OrderDate datetime NOT NULL,
	PreClinicLabDate datetime NULL,
	ClinicalOrderNotes varchar(400) NULL,
	OrderNumber varchar(50) NULL,
	CreatedBy int NOT NULL,
	CreateDate datetime NOT NULL,
	OrderStatus varchar(50) NOT NULL,
	UserId int NOT NULL,
	UpdateDate datetime NULL,
	DeleteFlag bit NOT NULL,
	PatientMasterVisitId int NULL,
	LabTestId int NULL,
	AuditData xml NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ord_LabOrder SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_ord_LabOrder ADD CONSTRAINT
	DF_ord_LabOrder_DeleteFlag DEFAULT ((0)) FOR DeleteFlag
GO
SET IDENTITY_INSERT dbo.Tmp_ord_LabOrder ON
GO
IF EXISTS(SELECT * FROM dbo.ord_LabOrder)
	 EXEC('INSERT INTO dbo.Tmp_ord_LabOrder (Id, Ptn_Pk, LocationId, VisitId, ModuleId, OrderedBy, OrderDate, PreClinicLabDate, ClinicalOrderNotes, OrderNumber, CreatedBy, CreateDate, OrderStatus, UserId, UpdateDate, DeleteFlag, PatientMasterVisitId, LabTestId, AuditData)
		SELECT Id, Ptn_Pk, LocationId, VisitId, ModuleId, OrderedBy, OrderDate, PreClinicLabDate, ClinicalOrderNotes, OrderNumber, CreatedBy, CreateDate, OrderStatus, UserId, UpdateDate, DeleteFlag, PatientMasterVisitId, LabTestId, AuditData FROM dbo.ord_LabOrder WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ord_LabOrder OFF
GO
ALTER TABLE dbo.dtl_LabOrderTest
	DROP CONSTRAINT FK_LabOrderTest_LabOrder
GO
-- DROP TABLE dbo.ord_LabOrder
--GO
EXECUTE sp_rename N'dbo.Tmp_ord_LabOrder', N'ord_LabOrder', 'OBJECT' 
GO
ALTER TABLE dbo.ord_LabOrder ADD CONSTRAINT
	PK_ord_LabOrder PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
-- =============================================
-- Author:  <pwangoo>
-- Create date: <18032017>
-- Description: <Insert lab order from ord_table>
-- =============================================

CREATE TRIGGER  [dbo].[lis_loadOrderfrom_ordLab] ON dbo.ord_LabOrder
FOR INSERT AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    INSERT INTO 
    [dbo].[dtl_LabOrderTest]
    (
        LabOrderId,
  LabTestId,  
        TestNotes,
        StatusDate
    )
    SELECT 
        Id, 
  LabTestId,  
        ClinicalOrderNotes, 
        OrderDate
    FROM 
        INSERTED
END


--SELECT * FROM   [dbo].[dtl_LabOrderTest]
GO
-- =============================================
-- Author:		<Patrick Wangoo>[dbo].[ord_LabOrder]
-- Create date: 2017 March 17
-- Description:	Generate Order Number on insert
-- =============================================
CREATE TRIGGER [dbo].[GenerateLabOrderNumber]    ON  dbo.ord_LabOrder  AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
    Declare @RegYear int, @NewPtn_Pk int, @MaxLabOrderId varchar(10);

	Declare @table table(RegYear int, PatientId int);

	Insert Into @table(RegYear, PatientId)

	Select  datepart(Year,I.OrderDate), I.Ptn_Pk From Inserted I  ;
	While Exists(Select 1 From @table) Begin
	   Select Top 1 @RegYear = t.RegYear, @NewPtn_Pk=t.PatientId From @table t  ;
	   Select @MaxLabOrderId= max(Convert(varchar,Replace(OrderNumber,'-',''))) From 
		ord_LabOrder Where  OrderNumber Like Convert(varchar,@RegYear)+'-%'
		If(@MaxLabOrderId Is Null)
			Select @MaxLabOrderId = Convert(varchar(4), @RegYear)  + Replicate('0', 5) + Convert(varchar, 1);
		Else
			Select @MaxLabOrderId = Convert(int,@MaxLabOrderId)+1;
	
		Select @MaxLabOrderId = Stuff(@MaxLabOrderId,5,0,'-')	;
	
		Update ord_LabOrder Set OrderNumber = @MaxLabOrderId Where Ptn_Pk =@NewPtn_Pk And OrderNumber Is Null
		Delete From @table Where  PatientId = @NewPtn_Pk;

		

	End
    
 
    
END
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ord_LabOrder', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ord_LabOrder', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ord_LabOrder', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.dtl_LabOrderTest ADD CONSTRAINT
	FK_LabOrderTest_LabOrder FOREIGN KEY
	(
	LabOrderId
	) REFERENCES dbo.ord_LabOrder
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.dtl_LabOrderTest SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.dtl_LabOrderTest', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.dtl_LabOrderTest', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.dtl_LabOrderTest', 'Object', 'CONTROL') as Contr_Per 