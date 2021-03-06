IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registration_GetIdentifierByServiceArea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Registration_GetIdentifierByServiceArea]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Registration_GetIdentifierByServiceArea] @ServiceAreaId int = 0
AS
BEGIN
	SET NOCOUNT ON

	IF (@ServiceAreaId = 0)
	BEGIN
		SELECT DISTINCT ID IdentifierID
			,FieldName IdentifierName
		FROM mst_PatientIdentifier a
		INNER JOIN lnk_PatientModuleIdentifier b ON a.ID = b.FieldID
		Union All
		Select 0 IdentifierId, 'Unique Patient Id'
	END
	ELSE
	BEGIN
		SELECT DISTINCT ID IdentifierID
			,FieldName IdentifierName
		FROM mst_PatientIdentifier a
		INNER JOIN lnk_PatientModuleIdentifier b ON a.ID = b.FieldID	
		WHERE b.ModuleID = @ServiceAreaId
		Union All
		Select 0 IdentifierId, 'Unique Patient Id'
	END
	--select * from mst_PatientIdentifier
	--select * from lnk_PatientModuleIdentifier
	--select * from mst_module
	SET NOCOUNT OFF
END
Go
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_CreatePatientRevisit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Record_CreatePatientRevisit]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_GetPatientRevisit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Record_GetPatientRevisit]
GO
/****** Object:  StoredProcedure [dbo].[pr_Record_GetPatientRevisit]    Script Date: 09/02/2015 17:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_GetPatientRevisit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 29 Jul 2015
-- Description:	Create a revisit
-- =============================================
CREATE PROCEDURE [dbo].[pr_Record_GetPatientRevisit] 
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@LocationID Int,
	@GetLastVisit bit =0
	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
	Set Nocount On;
	Set Rowcount 0;
	If(@GetLastVisit = 1) Set Rowcount  1
	
	
	Select	O.Visit_Id,
			O.Ptn_Pk,
			O.LocationID,
			O.VisitDate,
			O.VisitType,
			O.DataQuality,
			O.DeleteFlag,
			O.UserID,
			O.CreateDate,
			O.CreatedBy,
			O.ModuleID,
			M.ModuleName,
			V.VisitName
	From ord_Visit As O
	Inner Join
		mst_VisitType As V On O.VisitType = V.VisitTypeID
	Inner Join mst_Module M On M.ModuleID = O.ModuleID
	Where (O.Ptn_Pk = @PatientID)
	And (O.LocationID = @LocationID)
	And (O.DeleteFlag = 0)
	And (V.VisitName = ''Revisit'') Order By VisitDate desc;

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Record_CreatePatientRevisit]    Script Date: 09/02/2015 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Record_CreatePatientRevisit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 29 Jul 2015
-- Description:	Create a revisit
-- =============================================
CREATE PROCEDURE [dbo].[pr_Record_CreatePatientRevisit] 
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@LocationID Int,
	@VisitDate datetime , 
	@VisitTypeName varchar(50) = ''Revisit'',
	@RevistHrsAllowance int =24,
	@ModuleID int,
	@UserID int 
	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
Declare @VisitTypeID int, @LeastVisitDate datetime;

Select @LeastVisitDate = Dateadd(Hour, -@RevistHrsAllowance, @VisitDate);

	If Not Exists (Select 1	From mst_VisitType	Where VisitName = @VisitTypeName And DeleteFlag = 0) Begin
		Return;
	End

	Select @VisitTypeID = VisitTypeID
	From mst_VisitType
	Where VisitName = @VisitTypeName
	And DeleteFlag = 0;

	If Exists (Select 1	From ord_Visit	Where VisitType = @VisitTypeID	And DeleteFlag = 0	And Ptn_PK = @PatientID And VisitDate Between @LeastVisitDate And @VisitDate) Begin
		Return;
	End

	Insert Into ord_Visit (
		Ptn_PK,
		LocationID,
		VisitDate,
		VisitType,
		DataQuality,
		DeleteFlag,
		UserID,
		CreateDate,
		ModuleID,
		CreatedBy)
	Values (
		@PatientID,
		@LocationID,
		@VisitDate,
		@VisitTypeID,
		1,
		0,
		@UserID,
		Getdate(),
		@ModuleID,
		@UserID );

End


' 
END
GO
