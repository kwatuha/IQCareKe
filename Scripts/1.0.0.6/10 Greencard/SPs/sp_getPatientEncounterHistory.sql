USE [IQCareMsambweni5thFeb]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 2/7/2018 11:43:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter History
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterHistory]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

select distinct a.patientmastervisitid VisitID,b.displayname VisitName,a.patientid,
(case b.displayname 
	when 'Pharmacy' then convert(varchar(50),isnull((select top 1 DATEADD(d,DATEDIFF(d,0,orderedbydate),0) from ord_patientpharmacyorder where patientmastervisitid = a.patientmastervisitid),'0'))
	when 'Lab' then convert(varchar(50),isnull((select top 1 DATEADD(d,DATEDIFF(d,0,OrderDate),0) from ord_laborder where patientmastervisitid = a.patientmastervisitid),'0'))
	else DATEADD(d,DATEDIFF(d,0,a.encounterstarttime),0)
	end) VisitDate, 

c.username, a.deleteflag,
(case b.displayname 
	when 'Pharmacy' then convert(varchar(50),isnull((select top 1 orderstatus from ord_patientpharmacyorder where patientmastervisitid = a.patientmastervisitid),'0'))
	when 'Lab' then convert(varchar(50),isnull((select top 1 orderstatus from ord_laborder where patientmastervisitid = a.patientmastervisitid),'0'))
	else '0'
	end) [status]
from patientencounter a inner join lookupitem b on a.encountertypeid = b.id
inner join mst_user c on a.createdby = c.userid
where a.patientid = @PatientID
--order by convert(date,a.encounterstarttime) desc

	--declare @enrollmentVisitType int = (select id from lookupitem where name = 'Enrollment')

	--SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Encounter' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.PatientMasterVisit.VisitDate, dbo.mst_User.UserName, 
	--						 dbo.PatientMasterVisit.DeleteFlag, '' [status]
	--FROM            dbo.PatientMasterVisit 
	--						inner join 
	--						PatientScreening on PatientMasterVisit.id = PatientScreening.patientmastervisitid
	--						left JOIN
	--						 dbo.mst_User ON dbo.PatientScreening.CreatedBy = dbo.mst_User.UserID
							  
	--WHERE  dbo.PatientMasterVisit.PatientId = @PatientID 
	----and  (dbo.PatientMasterVisit.VisitDate IS NOT NULL) 
	--AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
	--						 dbo.PatientMasterVisit.DeleteFlag = 0) --and dbo.PatientMasterVisit.visittype is null
	--UNION
	--SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Pharmacy' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.ord_patientpharmacyorder.orderedbyDate VisitDate, dbo.mst_User.UserName, 
	--						 dbo.PatientMasterVisit.DeleteFlag, convert(varchar(20),ord_patientpharmacyorder.orderstatus) [status]
	--FROM            dbo.PatientMasterVisit INNER JOIN
	--						 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID INNER JOIN
	--						 ord_patientpharmacyorder ON PatientMasterVisit.Id = ord_patientpharmacyorder.patientmastervisitid
	--WHERE  dbo.PatientMasterVisit.PatientId = @PatientID 
	----and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) 
	--AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
	--						 dbo.PatientMasterVisit.DeleteFlag = 0) --and dbo.PatientMasterVisit.visittype is null
	--UNION
	--SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Lab Order' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.ord_laborder.orderDate VisitDate, dbo.mst_User.UserName, 
	--						 dbo.PatientMasterVisit.DeleteFlag, ord_laborder.orderstatus [status]
	--FROM            dbo.PatientMasterVisit INNER JOIN
	--						 ord_laborder ON PatientMasterVisit.Id = ord_laborder.patientmastervisitid
	--						 left JOIN
	--						 dbo.mst_User ON dbo.ord_laborder.orderedby = dbo.mst_User.UserID
	--WHERE  dbo.PatientMasterVisit.PatientId = @PatientID 
	----and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) 
	--AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
	--						 dbo.PatientMasterVisit.DeleteFlag = 0) and (ord_laborder.deleteflag = 0 or ord_laborder.deleteflag is null)

	--order by visitdate desc
End
