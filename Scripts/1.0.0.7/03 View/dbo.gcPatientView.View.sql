/****** Object:  View [dbo].[gcPatientView]    Script Date: 07-Jun-2018 13:01:23 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[gcPatientView]'))
DROP VIEW [dbo].[gcPatientView]
GO
/****** Object:  View [dbo].[gcPatientView]    Script Date: 07-Jun-2018 13:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[gcPatientView]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[gcPatientView]
AS
SELECT DISTINCT pt.Id
	,pt.PersonId
	,pt.ptn_pk
	--,isnull((
	--		SELECT TOP 1 v.IdentifierValue
	--		FROM patientIdentifier v
	--		WHERE v.PatientId = pt.Id
	--			AND v.IdentifierTypeId IN (
	--				SELECT TOP 1 Id
	--				FROM identifiers z
	--				WHERE z.Code = ''CCCNumber''
	--				)
	--		), 
	--		(ISNULL(convert(varchar(10),pt.FacilityId)+''-00000'',(SELECT top 1 PosID FROM mst_Facility WHERE DeleteFlag=0) +''-00000''))) AS EnrollmentNumber
	,pni.IdentifierValue EnrollmentNumber
	,pt.PatientIndex
	,CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName
	,CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) AS MiddleName
	,CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName
	,pn.Sex
	,pn.Active
	,pt.RegistrationDate
	,ISNULL(pe.EnrollmentDate, ''01-01-1900'') AS [EnrollmentDate]
	,ISNULL(CAST((
				CASE pe.CareEnded
					WHEN 0--(SELECT top 1 i.IdentifierValue FROM patientIdentifier i WHERE i.PatientId=pt.Id AND pt.Id NOT IN(SELECT top 1 d.PatientId FROM PatientCareending d WHERE d.PatientId=pt.Id)) 
						THEN ''Active''
					WHEN 1
						THEN (
								SELECT TOP 1 ItemName
								FROM LookupItemView
								WHERE MasterName = ''CareEnded''
									AND ItemId = ptC.ExitReason
								)
					ELSE ''Not Enrolled''
					END
				) AS VARCHAR(50)), ''Active'') AS PatientStatus
	,ptC.ExitReason
	,pt.DateOfBirth
	,CAST(DECRYPTBYKEY(pt.NationalId) AS VARCHAR(50)) AS NationalId
	,pt.FacilityId
	,pt.PatientType
	,pe.TransferIn
	,(CAST(DECRYPTBYKEY((SELECT top 1 MobileNumber FROM PersonContact WHERE PersonId=pn.Id)) AS VARCHAR(20))) AS MobileNumber
	,ISNULL((
			SELECT TOP (1) ScreeningValueId
			FROM dbo.PatientScreening
			WHERE (PatientId = pt.Id)
				AND (
					ScreeningTypeId IN (
						SELECT Id
						FROM dbo.LookupMaster
						WHERE (Name = ''TBStatus'')
						)
					)
			ORDER BY Id DESC
			), 0) AS TBStatus
	,ISNULL((
			SELECT TOP (1) ScreeningValueId
			FROM dbo.PatientScreening AS PatientScreening_1
			WHERE (PatientId = pt.Id)
				AND (
					ScreeningTypeId IN (
						SELECT Id
						FROM dbo.LookupMaster AS LookupMaster_1
						WHERE (Name = ''NutritionStatus'')
						)
					)
			ORDER BY Id DESC
			), 0) AS NutritionStatus
	,ISNULL((
			SELECT TOP (1) Categorization
			FROM dbo.PatientCategorization
			WHERE (PatientId = pt.Id)
			ORDER BY id DESC
			), 0) AS Categorization
	,ISNULL(pt.DobPrecision, 0) AS DobPrecision
FROM dbo.Patient AS pt
INNER JOIN dbo.Person AS pn ON pn.Id = pt.PersonId
INNER JOIN dbo.PatientEnrollment AS pe ON pt.Id = pe.PatientId
INNER JOIN dbo.PatientIdentifier AS pni ON pni.PatientId = pt.Id
INNER JOIN dbo.Identifiers ON pni.IdentifierTypeId = dbo.Identifiers.Id
LEFT OUTER JOIN (
	SELECT PatientId
		,ExitReason
	FROM dbo.PatientCareending where deleteflag=0
	
	UNION
	
	SELECT dbo.Patient.Id AS PatientId
		,CASE PatientExitReason
			WHEN 91
				THEN 526
			WHEN 93
				THEN 259
			WHEN 115
				THEN 260
			WHEN 118
				THEN 260
			WHEN 414
				THEN 526
			END AS ExitReason
	FROM dbo.dtl_PatientCareEnded
	INNER JOIN dbo.Patient ON dbo.dtl_PatientCareEnded.Ptn_Pk = dbo.Patient.ptn_pk
	) AS ptC ON pt.Id = ptC.PatientId
--LEFT OUTER JOIN dbo.PersonContact AS pc ON pc.PersonId = pn.Id
WHERE  (dbo.Identifiers.Name = ''CCC Registration Number'') AND  (pn.DeleteFlag = 0) And Pt.DeleteFlag=0

	UNION

	SELECT DISTINCT  0  Id 
	,pn.Id PersonId
	,0 ptn_pk
	,(SELECT TOP 1 isnull(convert(varchar(10),PosID), ''00000'') FROM mst_Facility WHERE DeleteFlag = 0) + ''-00000'' AS EnrollmentNumber
	,''00000'' PatientIndex
	,CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName
	,CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) AS MiddleName
	,CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName
	,pn.Sex
	,pn.Active
	,''01-01-1900'' RegistrationDate
	,''01-01-1900'' AS [EnrollmentDate]
	,''Not Enrolled'' AS PatientStatus
	,NULL ExitReason
	,ISNULL(pn.DateOfBirth,''01-01-1900'') DateOfBirth
	,CAST(DECRYPTBYKEY(''99999999'') as varchar(50)) AS NationalId
	,(SELECT top 1 FacilityID FROM mst_Facility WHERE DeleteFlag=0) FacilityId
	,(SELECT top 1 Id FROM LookupItem WHERE Name=''New'') PatientType
	,Cast(0 as bit) TransferIn
	,(CAST(DECRYPTBYKEY((SELECT top 1 MobileNumber FROM PersonContact WHERE PersonId=pn.Id)) AS VARCHAR(20))) AS MobileNumber
	,0 TBStatus
	,0 NutritionStatus
	,0 AS Categorization
	,ISNULL(pn.DobPrecision, 0) AS DobPrecision
FROM dbo.Person AS pn
WHERE
	 pn.Id NOT IN(SELECT personId FROM Patient)

' 
GO
