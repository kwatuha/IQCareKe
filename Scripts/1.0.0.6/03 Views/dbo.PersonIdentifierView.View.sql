/****** Object:  View [dbo].[PersonIdentifierView]    Script Date: 25-May-2018 11:59:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonIdentifierView]'))
DROP VIEW [dbo].[PersonIdentifierView]
GO
/****** Object:  View [dbo].[PersonIdentifierView]    Script Date: 25-May-2018 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonIdentifierView]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[PersonIdentifierView] as
Select B.Id
	  ,A.Id PersonId
	  ,P.Id PatientId
	  ,P.Ptn_PK Ptn_Pk
	  ,C.Id IdentifierId
	  ,C.Code IdentifierCode
	  ,C.Name IdentifierName
	  ,B.IdentifierValue
	  ,B.Active IdentifierActive
	  ,B.AssigningFacility
	  ,isnull(C.AssigningAuthority, '''') AssigningAuthority
From Person A
Inner Join PersonIdentifier B On A.Id = B.PersonId
Inner Join Identifiers C On C.Id = B.IdentifierId
Left Outer Join Patient P On P.PersonId = A.Id
Where B.DeleteFlag = 0
And A.DeleteFlag = 0
And C.DeleteFlag = 0
And C.IdentifierType = 2




' 
GO
