/****** Object:  View [dbo].[PatientIdentifierView]    Script Date: 25-May-2018 11:59:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifierView]'))
DROP VIEW [dbo].[PatientIdentifierView]
GO
/****** Object:  View [dbo].[PatientIdentifierView]    Script Date: 25-May-2018 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifierView]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[PatientIdentifierView] as
Select  B.Id
	  ,A.Id PatientId
	  ,A.PersonId
	  ,A.Ptn_PK Ptn_Pk
	  ,C.Id IdentifierId
	  ,C.Code IdentifierCode
	  ,C.Name IdentifierName
	  ,B.IdentifierValue
	  ,B.Active IdentifierActive
	  ,B.AssigningFacility
	  ,B.PatientEnrollmentId EnrollmentId
	  ,AssigningAuthority
From Patient A
Inner Join PatientIdentifier B On A.Id = B.PatientId
Inner Join Identifiers C On C.Id = B.IdentifierTypeId
Where B.DeleteFlag = 0
And A.DeleteFlag = 0
And C.DeleteFlag = 0
And C.IdentifierType = 1



' 
GO
