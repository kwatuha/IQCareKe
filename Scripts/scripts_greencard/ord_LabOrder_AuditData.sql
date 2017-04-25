/*
   Tuesday, March 21, 201710:49:26 AM
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
ALTER TABLE dbo.ord_LabOrder ADD
	AuditData xml NULL
ALTER TABLE dbo.ord_LabOrder ADD PatientMasterVisitId int NOT NULL

GO
ALTER TABLE dbo.ord_LabOrder SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ord_LabOrder', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ord_LabOrder', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ord_LabOrder', 'Object', 'CONTROL') as Contr_Per 