
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacy_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterVaccines]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterTS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPHDP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPHDP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPatientManagement]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterComplaints]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].sp_savePatientEncounterAllergies') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterAllergies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].sp_savePatientEncounterAdverseEvents') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[sp_getZScores]    Script Date: 6/12/2017 9:09:29 AM ******/
DROP PROCEDURE [dbo].[sp_getZScores]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getTreatmentProgram]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getTreatmentProgram]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRegimenClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getRegimenClassification]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyRegimens]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyRegimens]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyPatientsExpected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyPatientsExpected]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyFields]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugSwitchSubReasons]    Script Date: 6/12/2017 9:09:29 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugSwitchSubReasons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 6/12/2017 9:09:29 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugList]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugFrequency]    Script Date: 6/12/2017 9:09:29 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugFrequency]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugFrequency]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyBatch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyBatch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPendingPrescriptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPendingPrescriptions]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientWorkPlan]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientWorkPlan]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientWorkPlan]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientPharmacyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientLatestPharmacyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientLatestPharmacyPrescription]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterVaccines]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterHistory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterExam]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterComplaints]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterAllergies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounter]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getItemIdByGroupAndItemName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getFacility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getFacility]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getCurrentRegimen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getCurrentRegimen]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePharmacyPrescription_GreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeletePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DeletePharmacyPrescription_GreenCard]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterVaccines]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPHDP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPHDP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterComplaints]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterAllergies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAdverseEvents]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update AdverseEvent set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAllergies]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	save patient encounter - delete allergies
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update patientallergy set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterChronicIllness]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientChronicIllness set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterComplaints]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th April 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PresentingComplaints set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterDiagnosis]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientDiagnosis set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterGeneralExam]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
		declare @generalExamID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')
		
		UPDATE PhysicalExamination SET DeleteFlag = 1
		where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamID
		
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPHDP]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPHDP]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
		UPDATE PatientPHDP SET DeleteFlag = 1
		where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPhysicalExam]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @generalExamID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')

	update PhysicalExamination set DeleteFlag = 1 
	where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ExaminationTypeId <> @generalExamID
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPresentingComplaints]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th April 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
create PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PresentingComplaints set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterVaccines]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
create PROCEDURE [dbo].[sp_deletePatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update Vaccination set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientFamilyPlanningMethod]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	delete family planning method
-- =============================================
CREATE PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod]
	-- Add the parameters for the stored procedure here
	@PatientID varchar(50) = null,
	@FPId varchar(50) = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientFamilyPlanningMethod set DeleteFlag = 1 where PatientId = @PatientID and PatientFPId = @FPId
End








GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePharmacyPrescription_GreenCard]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeletePharmacyPrescription_GreenCard]                                    
	@ptn_pharmacy_pk int = null                             
                                    
AS                                        
Begin
	delete from dtl_PatientPharmacyOrder where ptn_pharmacy_pk = @ptn_pharmacy_pk
	delete from Dtl_StockTransaction where ptn_pharmacy_pk = @ptn_pharmacy_pk
End





GO
/****** Object:  StoredProcedure [dbo].[sp_getCurrentRegimen]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get current regimen
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCurrentRegimen]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	--select top 1 a.RegimenId, a.RegimenLineId, b.VisitDate
	--from ARVTreatmentTracker a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.id
	--where a.PatientId = @PatientID
	--order by b.VisitDate desc

	select top 1 V.RegimenId,V.RegimenLineId, V.VisitDate from PatientTreatmentTrackerView V
	where v.PatientId=@PatientID AND v.RegimenId <> 0
	order by V.Id desc

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getFacility]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th April 2017
-- Description:	get Facility
-- =============================================
create PROCEDURE [dbo].[sp_getFacility]
	-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select FacilityID,FacilityName,SatelliteID,DeleteFlag, UserID from mst_facility where deleteflag=0

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getItemIdByGroupAndItemName]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th April 2017
-- Description:	get ItemId By Group And ItemName
-- =============================================
CREATE PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName]
	-- Add the parameters for the stored procedure here
	@groupName varchar(100) = null,
	@ItemName varchar(100) = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select * from [dbo].[LookupItemView] where MasterName = @groupName and ItemName = @ItemName

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounter]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounter]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @TBScreeningTypeID int = (Select Id from LookupMaster where name = 'TBStatus')
	declare @NutritionScreeningTypeID int = (Select Id from LookupMaster where name = 'NutritionStatus')
	declare @GeneralExamMasterId int = (Select top 1 Id from LookupMaster where name = 'GeneralExamination')
	declare @ARVAdherenceType int = (Select Id from LookupMaster where name = 'ARVAdherence')
	declare @CTXAdherenceType int = (Select Id from LookupMaster where name = 'CTXAdherence')

	--0
	select * from PatientMasterVisit where id = @PatientMasterVisitID and patientId = @PatientID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--1
	select * from ComplaintsHistory where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--2
	select * from PhysicalExamination where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID
	and ExaminationTypeId = @GeneralExamMasterId and (DeleteFlag is null OR DeleteFlag = 0)
	
	--TB Screening 3
	select ScreeningValueId from PatientScreening 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and ScreeningTypeId = @TBScreeningTypeID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--Nutrition Screening 4
	select ScreeningValueId from PatientScreening 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and ScreeningTypeId = @NutritionScreeningTypeID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--5
	select * from PatientPHDP where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID 
	and (DeleteFlag is null OR DeleteFlag = 0)

	--6 ARV Adherence
	select Score from AdherenceOutcome 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and AdherenceType = @ARVAdherenceType
	and (DeleteFlag is null OR DeleteFlag = 0)

	--7 CTX Adherence
	select Score from AdherenceOutcome 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and AdherenceType = @CTXAdherenceType
	and (DeleteFlag is null OR DeleteFlag = 0)

	--8 workplan
	select * from PatientClinicalNotes
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--9 ICF
	select * from [dbo].[PatientIcf]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--10 ICF Action
	select * from [dbo].[PatientIcfAction]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--11 IPT
	select * from [dbo].[PatientIpt]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--12 IPT Outcome
	select * from [dbo].[PatientIptOutcome]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--13 IPT Workup
	select * from [dbo].[PatientIptWorkup]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1
	
	--14 WHO Stage
	select * from [dbo].[PatientWHOStage]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID

End





GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAdverseEvents]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select Severity SeverityID,EventName,EventCause,b.DisplayName Severity,[Action] 
	from AdverseEvent a left join LookupItem b on a.Severity = b.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAllergies]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	get patient encounter Allergies
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select Allergen allergyId,reaction reactionId, severity severityId, b.displayname allergy, c.DisplayName reaction, 
	d.DisplayName severity, CONVERT(varchar(20),a.onsetdate,106) onsetDate
	from patientallergy a inner join lookupitem b on a.allergen = b.Id
	left join lookupitem c on a.Reaction = c.id
	left join lookupitem d on a.severity = d.id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterChronicIllness]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select chronicIllness chronicIllnessID, b.DisplayName chronicIllnessName, Treatment,dose,
	convert(varchar(20),OnsetDate,106) OnsetDate,active 
	from PatientChronicIllness a inner join LookupItem b on a.ChronicIllness = b.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterComplaints]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter complaints
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select presentingComplaintsId, b.DisplayName complaint, convert(varchar(20), onsetDate, 106) onsetDate
	from presentingComplaints a left join LookupItem b on a.presentingComplaintsId = b.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterDiagnosis]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Diagnosis
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.Diagnosis, b.DisplayName, ManagementPlan
	from PatientDiagnosis a inner join lookupitem b on a.diagnosis = b.id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterExam]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Physical Exam
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @generalExamMasterID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')

	select ExaminationTypeId examTypeID, ExamId examID, b.DisplayName examType, c.DisplayName exam, Finding findings
	from PhysicalExamination a 
	inner join LookupItem b on a.ExaminationTypeId = b.Id
	left join LookupItem c on a.ExamId = c.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	and ExaminationTypeId <> @generalExamMasterID
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter History
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterHistory]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @enrollmentVisitType int = (select id from lookupitem where name = 'Enrollment')

	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Encounter' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.PatientMasterVisit.VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag, '' [status]
	FROM            dbo.PatientMasterVisit INNER JOIN
							 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID and  (dbo.PatientMasterVisit.VisitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) --and dbo.PatientMasterVisit.visittype is null
	UNION
	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Pharmacy' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.ord_patientpharmacyorder.orderedbyDate VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag, convert(varchar(20),ord_patientpharmacyorder.orderstatus) [status]
	FROM            dbo.PatientMasterVisit INNER JOIN
							 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID INNER JOIN
							 ord_patientpharmacyorder ON PatientMasterVisit.Id = ord_patientpharmacyorder.patientmastervisitid
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) --and dbo.PatientMasterVisit.visittype is null
	UNION
	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Lab Order' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.ord_laborder.orderDate VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag, ord_laborder.orderstatus [status]
	FROM            dbo.PatientMasterVisit INNER JOIN
							 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID INNER JOIN
							 ord_laborder ON PatientMasterVisit.Id = ord_laborder.patientmastervisitid
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) and (ord_laborder.deleteflag = 0 or ord_laborder.deleteflag is null)

	order by visitdate desc
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterVaccines]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Vaccines
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select vaccine vaccineID, VaccineStage VaccineStageID, b.DisplayName VaccineName, c.DisplayName VaccineStageName, Convert(varchar(12),VaccineDate,106)VaccineDate
	from Vaccination a 
	inner join LookupItem b on a.Vaccine = b.Id
	left join LookupItem c on a.VaccineStage = c.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientLatestPharmacyPrescription]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th May 2017
-- Description:	get patient latest pharmacy prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientLatestPharmacyPrescription]
	-- Add the parameters for the stored procedure here
	@PatientId int = null,
	@FacilityId int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacy_pk int, @latestDispenseDate datetime
	set @latestDispenseDate = (select top 1 max(dispensedbydate) from ord_PatientPharmacyOrder where patientid = @PatientId and deleteflag <> 1) 
	set @pharmacy_pk = (select top 1 ptn_pharmacy_pk from ord_PatientPharmacyOrder 
						where dispensedbydate = @latestDispenseDate and DeleteFlag <> 1)


	if exists (select 1 from lnk_FacilityModule where facilityid = @FacilityId and ModuleId = 201)
	begin
		select a.Drug_Pk, 0 batchId, a.FrequencyID, b.abbreviation abbr, b.DrugName, '' batchName, a.SingleDose dose, 
		d.Name freq, a.duration, a.OrderedQuantity,0 DispensedQuantity, a.Prophylaxis
		from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
		--left join Mst_Batch c on a.BatchNo = c.ID
		left join mst_Frequency d on a.FrequencyID = d.ID
		where a.ptn_pharmacy_pk = @pharmacy_pk
	end
	Else
	begin
		select a.Drug_Pk, 0 batchId, a.FrequencyID, b.abbreviation abbr, b.DrugName, '' batchName, a.SingleDose dose, 
		d.Name freq, a.duration, a.OrderedQuantity, a.DispensedQuantity, a.Prophylaxis
		from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
		--left join Mst_Batch c on a.BatchNo = c.ID
		left join mst_Frequency d on a.FrequencyID = d.ID
		where a.ptn_pharmacy_pk = @pharmacy_pk
	end
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientPharmacyPrescription]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 13th Mar 2017
-- Description:	get patient pharmacy prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacy_pk int
	set @pharmacy_pk = (select ptn_pharmacy_pk from ord_PatientPharmacyOrder 
						where PatientMasterVisitId = @PatientMasterVisitID and DeleteFlag <> 1)

	select a.Drug_Pk,
	--(select batchId from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = a.ptn_pharmacy_pk and drug_pk = a.Drug_Pk) batchId,
	a.BatchNo batchId,
	a.FrequencyID,b.abbreviation abbr,b.DrugName,c.Name batchName,a.SingleDose dose, 
	d.Name freq,a.duration,a.OrderedQuantity,a.DispensedQuantity,
	--(select dispensedQuantity from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = a.ptn_pharmacy_pk and drug_pk = a.Drug_Pk)DispensedQuantity,
	a.Prophylaxis
	from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
	left join Mst_Batch c on a.BatchNo = c.ID
	left join mst_Frequency d on a.FrequencyID = d.ID
	--left join dtl_patientPharmacyDispensed e on a.ptn_pharmacy_pk = e.ptn_pharmacy_pk
	where a.ptn_pharmacy_pk = @pharmacy_pk
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientWorkPlan]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 13th May 2017
-- Description:	get patient work plan
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPatientWorkPlan]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select convert(varchar(20),b.visitdate,106) visitDate, a.clinicalNotes
	from patientclinicalnotes a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.Id
	where b.patientid = @PatientID and b.DeleteFlag <> 1
	order by b.visitdate desc
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPendingPrescriptions]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 16th Mar 2017
-- Description:	get patient encounter Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPendingPrescriptions]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.PatientMasterVisitId, a.Ptn_pk, e.identifiervalue, c.FirstName, c.MidName, c.LastName, d.UserLastName + d.UserFirstName as prescribedBy 
	from ord_PatientPharmacyOrder a inner join patient b on a.ptn_pk = b.Id
	inner join person c on b.PersonId = c.Id
	inner join mst_User d on a.OrderedBy = d.UserID
	inner join PatientIdentifier e on e.PatientId = a.Ptn_pk
	where (a.DeleteFlag is null or a.DeleteFlag = 0) and (a.orderstatus = 1 or a.orderstatus = 3)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyBatch]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy drug batches
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyBatch]
	-- Add the parameters for the stored procedure here
	@DrugPk int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.id, a.Name + ' ~ Expiry Date: ' + Convert(varchar(20), a.ExpiryDate,106) + ' ~ Quantity: ' + CONVERT(varchar(20),sum(b.Quantity)) as Name 
	from Mst_Batch a inner join Dtl_StockTransaction b on a.id = b.batchid
	where a.ItemID = @DrugPk and a.DeleteFlag <> 1
	group by a.id, a.Name, a.ExpiryDate
	order by a.ExpiryDate asc

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugFrequency]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 3rd June 2017
-- Description:	get pharmacy drug frequency
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyDrugFrequency]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select id,name,multiplier from mst_Frequency where DeleteFlag <> 1
End

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy drug list
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyDrugList]
	-- Add the parameters for the stored procedure here
	@pmscm int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	--select Drug_pk, DrugName,CONCAT(Drug_pk, '~',abbreviation, '~', DrugName)val 
	--from mst_drug

	IF(@pmscm = 1)
	BEGIN
		Select	D.Drug_pk, D.DrugName,
		(Cast(Drug_Pk as varchar(5)) + '~' + isnull(Abbreviation,'') + '~' + DrugName)val 
		From Dtl_StockTransaction As ST	Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1
		Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId 
		where D.DeleteFlag = 0
		Group By D.Drug_pk,	D.DrugName, D.abbreviation
		having Sum(ST.Quantity) > 0
	END
	ELSE
	BEGIN
		Select	D.Drug_pk, D.DrugName,
		(Cast(Drug_Pk as varchar(5)) + '~' + isnull(Abbreviation,'') + '~' + DrugName)val 
		From Dtl_StockTransaction As ST	Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1
		Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId 
		where D.DeleteFlag = 0
		Group By D.Drug_pk,	D.DrugName, D.abbreviation
	END

End

GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugSwitchSubReasons]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 8th Mar 2017
-- Description:	get pharmacy drug switch, substitution reasons
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons]
	-- Add the parameters for the stored procedure here
	@TreatmentPlan int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select LookupItemId, DisplayName from LookupMasterItem where LookupMasterId = @TreatmentPlan
	order by OrdRank
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyFields]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy fields
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyFields]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

		--13 Pharmacy Parameters
	select b.ProgID, b.pharmacyPeriodTaken ,a.TreatmentStatusId,a.TreatmentStatusReasonId, a.RegimenLineId, a.RegimenId,
	convert(varchar(30),b.OrderedByDate,106) OrderedByDate,convert(varchar(30),b.DispensedByDate,106) DispensedByDate
	from ARVTreatmentTracker a inner join ord_PatientPharmacyOrder b on a.PatientMasterVisitId = b.PatientMasterVisitId
	where a.PatientMasterVisitId = @PatientMasterVisitID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyPatientsExpected]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get number of patients expected to come for pharmacy
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyPatientsExpected]
	-- Add the parameters for the stored procedure here
	@Date datetime

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacyReason int = (select top 1 id from mst_decode where name = 'Pharmacy Refill')
	--0 expected
	select count(*) expected from dtl_patientappointment 
	where appreason = @pharmacyReason and (deleteflag = 0 or deleteflag is null) and cast(AppDate as date) = cast(@Date as date)

	--1 Actual
	select count(*) actual  from ord_patientpharmacyorder 
	where (deleteflag=0 or deleteflag is null) and cast(dispensedbydate as date) = cast(@Date as date)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyRegimens]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 8th Mar 2017
-- Description:	get pharmacy drug switch, substitution reasons
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPharmacyRegimens]
	-- Add the parameters for the stored procedure here
	@regimenLine varchar(50) = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On

	select LookupItemId, b.name + '(' + b.displayname + ')' DisplayName 
	from LookupMasterItem a inner join lookupitem b on a.lookupitemid = b.id
	where a.LookupMasterId = (select id from lookupmaster where name = @regimenLine)
	order by OrdRank
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getRegimenClassification]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get regimen classification
-- =============================================
CREATE PROCEDURE [dbo].[sp_getRegimenClassification]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @lookUpMasterID int = (select Id from lookupmaster where name = 'RegimenClassification')

	select * from lookupmasteritem where lookupmasterid = @lookUpMasterID order by ordrank

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getTreatmentProgram]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 4th May 2017
-- Description:	get pharmacy Treatment Program
-- =============================================
CREATE PROCEDURE [dbo].[sp_getTreatmentProgram]
	-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select id, name from [dbo].[mst_decode] where codeid = 33 and deleteflag = 0

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getZScores]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  John Macharia      
-- Create date:       
-- Modify date: 31 July 2014    
-- Description: Paediatric  scores    
-- =============================================  
CREATE procedure [dbo].[sp_getZScores]
(
	@PatientID int=null,
	@sex varchar(10)=null,
	@height float = null
)

As

begin
Declare @ageInDays int, @ageInMonths int;

Select @ageInMonths = Datediff(Month, DateOfBirth, Getdate()),
	@ageInDays = Datediff(Day, DateOfBirth, Getdate())
From patient
Where Id = @PatientID;


--0 weight for Age
If (@ageInDays <= 1856) 
Begin
	Select *
	From [dbo].[z_waz_young]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And agedays = @ageInDays;
End
Else If(@ageInMonths >=61)
Begin
	Select *
	From [dbo].[z_waz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And ageMos = @ageInMonths;
End
Else
Begin	
	Select 1
End
--0 weight for Age
--If (@sex = 'Female' And @ageInDays <= 1856) Begin
--Select * From [dbo].[z_waz_young] Where Sex = 2 And agedays = @ageInDays
--End 
--Else If (@sex = 'Male' And @ageInDays <= 1856) Begin
--Select * From [dbo].[z_waz_young] Where Sex = 1 And agedays = @ageInDays
--End 

--Else If (@sex = 'Female' And @ageInMonths >= 61) Begin
--Select *
--From [dbo].[z_waz_old]
--Where Sex = 2
--And Agemos = @ageInMonths
--End Else If (@sex = 'Male' And @ageInMonths >= 61) Begin
--Select *
--From [dbo].[z_waz_old]
--Where Sex = 1
--And Agemos = @ageInMonths
--End Else Begin
--Select 1
--End

--1 weight for Height

If (@height Between 45 And 110) 
Begin
	Select *
	From [dbo].[z_whz_young]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And LengthCm = @height;
End
Else If (@height Between 65 And 120) 
Begin
	Select *
	From [dbo].[z_whz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And HeightCm = @height;
End
Else
Begin	
	Select 1
End

--If (@sex = 'Female' And @height >= 45 And @height <= 110) Begin
--Select *
--From [dbo].[z_whz_young]
--Where Sex = 2
--And LengthCm = @height
--End 
--Else If (@sex = 'Male' And @height >= 45 And @height <= 110) Begin
--Select *
--From [dbo].[z_whz_young]
--Where Sex = 1
--And LengthCm = @height
--End 
--Else If (@sex = 'Female' And @height >= 65 And @height <= 120) Begin
--Select *
--From [dbo].[z_whz_old]
--Where Sex = 2
--And HeightCm = @height
--End Else If (@sex = 'Male' And @height >= 65 And @height <= 120) Begin
--Select *
--From [dbo].[z_whz_old]
--Where Sex = 1
--And HeightCm = @height
--End Else Begin
--Select 1
--End

/* 2 BMIz */
If (@ageInDays Between 0 And 1856) 
Begin
	Select *
	From [dbo].z_bmiz_young
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And agedays = @ageInDays;
End
Else If (@ageInMonths Between 61 And 229) 
Begin
	Select *
	From [dbo].[z_bmiz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And Agemos = @ageInMonths;
End
Else
Begin	
	Select 1
End

--If (@sex = 'Female' And @ageInDays >= 0 And @ageInDays <= 1856) Begin
--Select *
--From z_bmiz_young
--Where Sex = 2
--And agedays = @ageInDays
--End Else If (@sex = 'Male' And @ageInDays >= 0 And @ageInDays <= 1856) Begin
--Select *
--From z_bmiz_young
--Where Sex = 1
--And agedays = @ageInDays
--End Else If (@sex = 'Female' And @ageInMonths >= 61 And @ageInMonths <= 229) Begin
--Select *
--From z_bmiz_old
--Where Sex = 2
--And Agemos = @ageInMonths
--End Else If (@sex = 'Male' And @ageInMonths >= 61 And @ageInMonths <= 229) Begin
--Select *
--From z_bmiz_old
--Where Sex = 1
--And Agemos = @ageInMonths
--End Else Begin
--Select 1
--End
End




GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAdverseEvents]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@adverseEvent varchar(250) = null,
	@medicineCausingAE varchar(250) = null,
	@adverseSeverity varchar(250) = null,
	@adverseAction varchar(250) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
if exists(select 1 from AdverseEvent where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and EventName = @adverseEvent)
	BEGIN
		update AdverseEvent set EventCause = @medicineCausingAE, Severity = @adverseSeverity,[Action] = @adverseAction, DeleteFlag = 0
		where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and EventName = @adverseEvent
	END
	ELSE
	BEGIN
		insert into AdverseEvent(PatientId,PatientMasterVisitId,EventName,EventCause,Severity,[Action],DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@adverseEvent,@medicineCausingAE,@adverseSeverity,@adverseAction,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAllergies]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	save patient encounter - Allergies
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@allergy varchar(50) = null,
	@allergyReaction varchar(50) = null,
	@allergySeverity varchar(50) = null,
	@allergyOnsetDate varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from patientallergy where Allergen = @allergy and PatientId = @PatientID)
	BEGIN
		update patientallergy set Allergen = @allergy, Reaction = @allergyReaction, severity = @allergySeverity,
		OnsetDate = @allergyOnsetDate, DeleteFlag = 0
		where Allergen = @allergy and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into patientallergy(PatientId,PatientMasterVisitId,Allergen,Reaction,Severity,OnsetDate,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@allergy,@allergyReaction,@allergySeverity,@allergyOnsetDate, 0,@userID,GETDATE())
	END

End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterChronicIllness]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@chronicIllness varchar(50) = null,
	@treatment varchar(250) = null,
	@dose varchar(50) = null,
	@onsetDate varchar(20) = null,
	@active int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PatientChronicIllness where ChronicIllness = @chronicIllness and PatientId = @PatientID)
	BEGIN
		update PatientChronicIllness set Treatment = @treatment,Dose = @dose,OnsetDate = @onsetDate, active = @active, DeleteFlag = 0
		where ChronicIllness = @chronicIllness and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into PatientChronicIllness(PatientId,PatientMasterVisitId,ChronicIllness,Treatment,Dose,OnsetDate,active,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@chronicIllness,@treatment,@dose,@onsetDate,@active,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterComplaints]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th Apr 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@presentingComplaintID int = null,
	@onsetDate varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
if exists(select 1 from presentingComplaints where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and PresentingComplaintsId = @presentingComplaintID)
	BEGIN
		update presentingComplaints set onsetDate = @onsetDate, DeleteFlag = 0
		where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and PresentingComplaintsId = @presentingComplaintID
	END
	ELSE
	BEGIN
		insert into presentingComplaints(PatientId,PatientMasterVisitId,PresentingComplaintsId,onsetDate,DeleteFlag,CreatedBy,CreatedDate) 
		values(@PatientID,@MasterVisitID,@presentingComplaintID,@onsetDate,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterDiagnosis]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@diagnosis varchar(250) = null,
	@treatment varchar(250) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PatientDiagnosis where Diagnosis = @diagnosis and PatientId = @PatientID and PatientMasterVisitID = @masterVisitID)
	BEGIN
		update PatientDiagnosis set ManagementPlan = @treatment, DeleteFlag = 0
		where Diagnosis = @diagnosis and PatientId = @PatientID and PatientMasterVisitID = @masterVisitID
	END
	ELSE
	BEGIN
		insert into PatientDiagnosis(PatientId,PatientMasterVisitId,Diagnosis,ManagementPlan,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@diagnosis,@treatment,0,@userID,GETDATE())
	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterGeneralExam]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 27th Apr 2017
-- Description:	save patient encounter - General Examination
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@Exam varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here

	declare @generalExamMasterID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')
	declare @ExamID int = (select LookupItemId from LookupMasterItem where LookupMasterId = @generalExamMasterID and DisplayName = @Exam)

	if exists(select 1 from PhysicalExamination where PatientMasterVisitId = @MasterVisitID
	and PatientId = @PatientID and ExaminationTypeId = @generalExamMasterID and ExamId = @ExamID)
	BEGIN
		update PhysicalExamination set DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamMasterID
		and ExamId = @ExamID
	END
	ELSE
	BEGIN
		insert into PhysicalExamination(PatientId,PatientMasterVisitId,ExaminationTypeId,ExamId,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@generalExamMasterID,@ExamID,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPatientManagement]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Patient Management
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@ARVAdherence int = null,
	@CTXAdherence int = null,
	@WorkPlan varchar(1000) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @ARVAdherenceType int = (Select Id from LookupMaster where name = 'ARVAdherence')
	declare @CTXAdherenceType int = (Select Id from LookupMaster where name = 'CTXAdherence')

	if(@PatientMasterVisitID > 0)
	BEGIN
		if(@ARVAdherence > 0)
		BEGIN
			if exists(select 1 from AdherenceOutcome where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @ARVAdherenceType)
			BEGIN
				update AdherenceOutcome set Score = @ARVAdherence
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @ARVAdherenceType
			END
			ELSE
			BEGIN
				insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@ARVAdherenceType,@ARVAdherence,0,@userID,GETDATE())
			END
		END

		if(@CTXAdherence > 0)
		BEGIN
			if exists(select 1 from AdherenceOutcome where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @CTXAdherenceType)
			BEGIN
				update AdherenceOutcome set Score = @CTXAdherence
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @CTXAdherenceType
			END
			ELSE
			BEGIN
				insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@CTXAdherenceType,@CTXAdherence,0,@userID,GETDATE())
			END
		END

		if exists(select 1 from PatientClinicalNotes where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID)
		BEGIN
			update PatientClinicalNotes set ClinicalNotes = @WorkPlan
			where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		END
		ELSE
		BEGIN
			insert into PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate) 
			values(@PatientID,@PatientMasterVisitID,203,@WorkPlan,0,@userID,GETDATE())
		END
	END
	ELSE
	BEGIN
		if(@ARVAdherence > 0)
		BEGIN
			insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@ARVAdherenceType,@ARVAdherence,0,@userID,GETDATE())
		END

		if(@CTXAdherence > 0)
		BEGIN
			insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@CTXAdherenceType,@CTXAdherence,0,@userID,GETDATE())
		END

		insert into PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate) 
		values(@PatientID,@PatientMasterVisitID,203,@WorkPlan,0,@userID,GETDATE())
	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPHDP]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterPHDP]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@phdp varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @phdpMasterID int = (select Id from LookupMaster where Name = 'PHDP')
	declare @phdpID int = (select LookupItemId from LookupMasterItem where LookupMasterId = @phdpMasterID and DisplayName = @phdp)

	if exists(select 1 from PatientPHDP where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and Phdp = @phdpID)
	BEGIN
		UPDATE PatientPHDP SET DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and Phdp = @phdpID
	END
	ELSE
	BEGIN
		insert into PatientPHDP(PatientId,PatientMasterVisitId,phdp,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@phdpID,0,@userID,GETDATE())
	END
	
	
End







GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPhysicalExam]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 7th Feb 2017
-- Description:	save patient encounter - Physical Examination
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@examType int = null,
	@exam varchar(250) = null,
	@findings varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PhysicalExamination where PatientMasterVisitId = @MasterVisitID
	and PatientId = @PatientID and ExaminationTypeId = @examType and ExamId = @exam)
	BEGIN
		update PhysicalExamination set Finding = @findings, DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and ExaminationTypeId = @examType and ExamId = @exam
	END
	ELSE
	BEGIN
		insert into PhysicalExamination(PatientId,PatientMasterVisitId,ExaminationTypeId,ExamId,Finding,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@examType,@exam,@findings,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPresentingComplaints]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 20th Jan 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@serviceID int = null,
	@VisitDate datetime = null,
	@VisitScheduled int =null,
	@VisitBy int = null,
	@anyPresentingComplaints int = null,
	@ComplaintsNotes nvarchar(1000) = null,
	@TBScreening int = null,
	@NutritionalStatus int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @TBScreeningTypeID int = (Select Id from LookupMaster where name = 'TBStatus')
	declare @NutritionScreeningTypeID int = (Select Id from LookupMaster where name = 'NutritionStatus')

	IF(@PatientMasterVisitID > 0)
	BEGIN
		update PatientMasterVisit set visitDate = @VisitDate, visitScheduled = @VisitScheduled, visitBy = @VisitBy
		where id = @PatientMasterVisitID and PatientId = @PatientID

		if exists(select 1 from ComplaintsHistory where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID)
		BEGIN
			update ComplaintsHistory set PresentingComplaint = @ComplaintsNotes, AnyComplaint = @anyPresentingComplaints 
			where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		END
		ELSE
		BEGIN
			insert into ComplaintsHistory (PatientId,PatientMasterVisitId,AnyComplaint,PresentingComplaint,DeleteFlag,CreateBy,CreateDate) 
			values(@PatientID,@PatientMasterVisitID,@anyPresentingComplaints,@ComplaintsNotes,0,@userID,GETDATE())
		END

		if(@TBScreening > 0)
		begin
			IF EXISTS(SELECT 1 FROM PatientScreening WHERE PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID 
			and ScreeningTypeId = @TBScreeningTypeID)
			BEGIN
				update PatientScreening set ScreeningValueId = @TBScreening
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ScreeningTypeId = @TBScreeningTypeID
			END
			ELSE
			BEGIN
				insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@TBScreeningTypeID,1,@TBScreening,0,@userID,GETDATE())
			END
		end

		if(@NutritionalStatus > 0)
		begin
			IF EXISTS(SELECT 1 FROM PatientScreening WHERE PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID 
			and ScreeningTypeId = @NutritionScreeningTypeID)
			BEGIN
				update PatientScreening set ScreeningValueId = @NutritionalStatus
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ScreeningTypeId = @NutritionScreeningTypeID
			END
			ELSE
			BEGIN
				insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@NutritionScreeningTypeID,1,@NutritionalStatus,0,@userID,GETDATE())
			END
		end
		
		select @PatientMasterVisitID as PatientMasterVisitID
	END
	ELSE
	BEGIN
		insert into PatientMasterVisit (patientId,serviceId,start,active,createdBy,createDate,visitDate,visitScheduled,visitBy)
		values(@PatientID,@serviceID,CONVERT (time, GETDATE()),1,@userID,GETDATE(),@VisitDate,@VisitScheduled,@VisitBy)
		SELECT @PatientMasterVisitID = SCOPE_IDENTITY()

		insert into ComplaintsHistory (PatientId,PatientMasterVisitId,AnyComplaint,PresentingComplaint,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@PatientMasterVisitID,@anyPresentingComplaints,@ComplaintsNotes,0,@userID,GETDATE())

		if(@TBScreening > 0)
		begin
			insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@TBScreeningTypeID,1,@TBScreening,0,@userID,GETDATE())
		end
		if(@NutritionalStatus > 0)
		begin
			insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@NutritionScreeningTypeID,1,@NutritionalStatus,0,@userID,GETDATE())
		end
		

		select @PatientMasterVisitID as PatientMasterVisitID

	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterTS]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 20th Jan 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterTS]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@serviceID int = null,
	@VisitDate datetime = null,
	@VisitScheduled int =null,
	@VisitBy int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	IF(@PatientMasterVisitID > 0)
	BEGIN
		update PatientMasterVisit set visitDate = @VisitDate, visitScheduled = @VisitScheduled, visitBy = @VisitBy
		where id = @PatientMasterVisitID and PatientId = @PatientID
		
		select @PatientMasterVisitID as PatientMasterVisitID
	END
	ELSE
	BEGIN
		insert into PatientMasterVisit (patientId,serviceId,start,active,createdBy,createDate,visitDate,visitScheduled,visitBy)
		values(@PatientID,@serviceID,CONVERT (time, GETDATE()),1,@userID,GETDATE(),@VisitDate,@VisitScheduled,@VisitBy)
		SELECT @PatientMasterVisitID = SCOPE_IDENTITY()
		

		select @PatientMasterVisitID as PatientMasterVisitID

	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterVaccines]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@vaccine varchar(50) = null,
	@vaccineStage varchar(50) = null,
	@vaccineDate varchar(50) = null,
	@dose int = null,
	@duration int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from Vaccination where Vaccine = @vaccine and VaccineStage = @vaccineStage and PatientId = @PatientID)
	BEGIN
		update Vaccination set VaccineDate = @vaccineDate, DeleteFlag = 0
		where Vaccine = @vaccine and VaccineStage = @vaccineStage and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into Vaccination(PatientId,PatientMasterVisitId,Vaccine,VaccineStage,VaccineDate,DeleteFlag,CreatedBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@vaccine,@vaccineStage,@vaccineDate, 0,1,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientFamilyPlanningMethod]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th Mar 2017
-- Description:	save patient family planning method
-- =============================================
CREATE PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod]
	-- Add the parameters for the stored procedure here
	@PatientID int = null,
	@FPId int = null,
	@fpMethod int = null
	

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	IF EXISTS(SELECT 1 FROM PatientFamilyPlanningMethod where patientid = @PatientID and PatientFPId = @FPId and FPMethodId = @fpMethod)
	BEGIN
		update PatientFamilyPlanningMethod set DeleteFlag = 0
		where patientid = @PatientID and PatientFPId = @FPId and FPMethodId = @fpMethod
	END
	ELSE
	BEGIN
		insert into PatientFamilyPlanningMethod (PatientId,PatientFPId, FPMethodId,DeleteFlag)
		values(@PatientID,@FPId,@fpMethod,0)
	END
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacy_GreenCard]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard]                                                
( 
 @PatientMasterVisitID int = 0,                                               
 @PatientId int = null,                                                
 @LocationID int = null,                                                
 @OrderedBy int = null,                                                                                                                                          
 @UserID int = null,                                                 
 @RegimenType varchar(50) = null,                                                
 @DispensedBy int=null,                                                    
 @RegimenLine int = null,                
 @PharmacyNotes varchar(200) = null,
 @ModuleID int = null,

 @TreatmentProgram int = null,
 @PeriodTaken int = null,

 @TreatmentPlan int = null, 
 @TreatmentPlanReason int = null,
 @Regimen int = null,
 @PrescribedDate varchar(50) = null,
 @DispensedDate varchar(50) = null                 
)                                                
                                                
As       
Begin               
	Declare @ptn_pharmacy int,@RegimenMap_Pk int,@ARTStartDate datetime,@Ptn_Pharmacy_Pk int, @ptn_pk int, @visitPK int

	Select @RegimenType = Nullif(Ltrim(Rtrim(@RegimenType)), '')

	set @ptn_pk = (select ptn_pk from patient where id = @PatientId)

	if(@DispensedDate = '')
	begin
		set @DispensedDate = null
		set @DispensedBy = null
	end

	IF EXISTS(select 1 from ord_PatientPharmacyOrder where PatientMasterVisitId = @PatientMasterVisitID) 
	BEGIN
		set @Ptn_Pharmacy_Pk = (select ptn_pharmacy_pk from ord_PatientPharmacyOrder where patientmasterVisitID = @PatientMasterVisitID);
		IF @TreatmentPlan = 0 BEGIN (select TOP 1 @Regimenline = RegimenLine, @TreatmentProgram = [ProgID] from ord_PatientPharmacyOrder where patientmasterVisitID = @PatientMasterVisitID); END;
		Update [ord_PatientPharmacyOrder] Set
			[OrderedBy] = @OrderedBy, [DispensedBy] = @DispensedBy,
			[ProgID] = @TreatmentProgram, [UpdateDate] = Getdate(),
			[ProviderID] = 1, OrderedByDate = @PrescribedDate, [DispensedByDate] = @DispensedDate,
			UserID = @UserID,	Regimenline = @Regimenline,
			PharmacyNotes = @PharmacyNotes, pharmacyperiodtaken = @PeriodTaken
		Where patientmasterVisitID = @PatientMasterVisitID;

		IF @TreatmentPlan = 0 BEGIN (SELECT TOP 1 @Regimen = RegimenId, @RegimenLine = RegimenLineId, @TreatmentPlan = TreatmentStatusId, @TreatmentPlanReason = TreatmentStatusReasonId FROM ARVTreatmentTracker WHERE PatientMasterVisitId = @PatientMasterVisitID); END;
		Update ARVTreatmentTracker set regimenid = @Regimen, regimenLineId = @RegimenLine, TreatmentStatusId = @TreatmentPlan,
		TreatmentStatusReasonId = @TreatmentPlanReason

		If(@RegimenType Is Not Null) 
		Begin
		
			Select @RegimenMap_Pk = RegimenMap_Pk
			From dtl_regimenmap a, ord_patientpharmacyorder b
			Where a.ptn_pk = b.ptn_pk
			And b.ptn_pharmacy_pk = a.orderID
			And b.Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk;

			Update [dtl_RegimenMap] Set
				[RegimenType] = @RegimenType,
				[UpdateDate] = Getdate()
			Where ([RegimenMap_Pk] = @RegimenMap_Pk)
		End
		
		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@ptn_pk)
		
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @ptn_pk;

		Select @ptn_pharmacy_pk;
	END
	ELSE
	BEGIN
		insert into ord_Visit (ptn_pk,locationid,VisitDate,VisitType,DataQuality,DeleteFlag,UserID,CreateDate,CreatedBy)
		values(@ptn_pk, @locationID,GETDATE(),4,1,0,@UserID,GETDATE(),@UserID)

		set @visitPK = SCOPE_IDENTITY();

		Insert Into dbo.ord_PatientPharmacyOrder (
			Ptn_pk, PatientID, patientmasterVisitID, LocationID, OrderedBy, OrderedByDate, DispensedBy, DispensedByDate, ProgID,
			UserID, CreateDate, ProviderID, Regimenline, PharmacyNotes, VisitID, pharmacyPeriodTaken)
		Values (
			@ptn_pk,@PatientId, @PatientMasterVisitID, @LocationID, @OrderedBy, @PrescribedDate, @DispensedBy, @DispensedDate, @TreatmentProgram, 
			@UserID, Getdate(), 1, @RegimenLine, @PharmacyNotes, @visitPK, @PeriodTaken);

		Set @ptn_pharmacy =SCOPE_IDENTITY();

		Insert into ARVTreatmentTracker (PatientId,ServiceAreaId,PatientMasterVisitId,RegimenId,RegimenLineId,
		TreatmentStatusId,TreatmentStatusReasonId, DeleteFlag, CreateBy, createdate)
		values(@patientid,@moduleid,@PatientMasterVisitID,@Regimen,@RegimenLine,@TreatmentPlan,@TreatmentPlanReason,
		0,@UserID,GETDATE())

		Update ord_PatientPharmacyOrder Set
			ReportingID = (Select Right('000000' + Convert(varchar, @ptn_pharmacy), 6))
		Where ptn_pharmacy_pk = @ptn_pharmacy;

		--If (@DispensedByDate Is Not Null And @DispensedBy > 0) Begin
		--	Update ord_PatientPharmacyOrder Set
		--		OrderStatus = 2
		--	Where ptn_pharmacy_pk = @ptn_pharmacy;
		--End

		
		If(@RegimenType Is Not Null) 
		Begin	
			Insert Into dtl_RegimenMap (Ptn_Pk,	LocationID,	Visit_Pk, RegimenType, OrderId,	UserID,	CreateDate)
			Values (@ptn_pk, @LocationID, @visitPK, @RegimenType, @ptn_pharmacy, @UserID, Getdate());
		End

		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@ptn_pk)
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @ptn_pk;

		Select @ptn_pharmacy;

	END
End






GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]    Script Date: 6/12/2017 9:09:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]                                    
	@ptn_pharmacy_pk int = null,
	@DrugId int = null,
	@BatchId varchar(50) = null,
	@Dose decimal(18,2)=0,                                 
	@FreqId int = null,
	@Duration decimal(18,2) = null,
	@qtyPres decimal(18,2) = null,
	@qtyDisp decimal(18,2) = null,
	@UserID int = null,                
	@Prophylaxis int = null,
	@pmscm varchar(50) = null                               
                                    
AS                                        
Begin
	declare @TotalOrderedQuantity int,@TotalDispensedQuantity int
	Select @TotalOrderedQuantity = 0, @TotalDispensedQuantity = 0
			
	Insert Into dtl_PatientPharmacyOrder (
		ptn_pharmacy_pk,Drug_Pk,SingleDose,FrequencyID,Duration,OrderedQuantity,BatchNo, DispensedQuantity, UserID,CreateDate,Prophylaxis,
		genericid,StrengthID)
	Values (
		@ptn_pharmacy_pk,@DrugId,@Dose,@FreqId,@Duration,@qtyPres,@BatchId,@qtyDisp,@UserID,Getdate(),@Prophylaxis,0,0);



	if(@pmscm = 1 and @qtyDisp > 0)
	BEGIN
		--INSERT into dtl_patientPharmacyDispensed
		--(ptn_pharmacy_pk,drug_pk,batchId,frequencyID,dose,duration,dispensedQuantity,dispensedDate,deleteFlag)
		--values(@ptn_pharmacy_pk,@DrugId,@BatchId,@FreqId,@Dose,@Duration,@qtyDisp,GETDATE(),0)

		declare @ptn_pk int = (select Ptn_pk from ord_patientpharmacyorder where ptn_pharmacy_pk=@ptn_pharmacy_pk)
		declare @storeID int = (select top 1 StoreId from Dtl_StockTransaction where BatchId = @BatchId)

		insert into Dtl_StockTransaction
		(ItemId,BatchId,ptn_pharmacy_pk, PtnPk,storeid,transactiondate,quantity,UserId,createdate)
		values(@DrugId,@BatchId,@ptn_pharmacy_pk,@ptn_pk,@storeID,getdate(),-@qtyDisp,@UserID,GETDATE())

	END

	Select	@TotalOrderedQuantity = Sum(a.OrderedQuantity),
			@TotalDispensedQuantity = Sum(a.dispensedQuantity)
	From dtl_PatientPharmacyOrder a
	Where a.ptn_pharmacy_pk = @ptn_pharmacy_pk

	Update ord_PatientPharmacyOrder Set
		OrderStatus = Case 
						When DispensedByDate Is Null Then 1 --new order
						When DispensedByDate Is Not Null  And @TotalDispensedQuantity = @TotalOrderedQuantity Then 2 --complete
						When DispensedByDate Is Not Null  And @TotalDispensedQuantity < @TotalOrderedQuantity Then 3 --partial
						Else orderstatus End
	Where ptn_pharmacy_pk = @ptn_pharmacy_pk

                                     
End





GO
