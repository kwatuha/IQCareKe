IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 5/20/2018 9:47:08 AM ******/
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

select * from (
select distinct a.patientmastervisitid VisitID,b.displayname VisitName,a.patientid,
(case b.displayname 
	when 'Pharmacy' then convert(varchar(50),isnull((select top 1 DATEADD(d,DATEDIFF(d,0,ISNULL(orderedbydate,dispensedbydate)),0) from ord_patientpharmacyorder where patientmastervisitid = a.patientmastervisitid),'0'))
	when 'Lab' then convert(varchar(50),isnull((select top 1 DATEADD(d,DATEDIFF(d,0,OrderDate),0) from ord_laborder where patientmastervisitid = a.patientmastervisitid),'0'))
	when 'CCC' then convert(varchar(50),isnull((select top 1 DATEADD(d,DATEDIFF(d,0,visitdate),0) from PatientMasterVisit where id = a.patientmastervisitid),'0'))
	when 'Triage' then convert(varchar(50),isnull((select top 1 DATEADD(d,DATEDIFF(d,0,visitdate),0) from PatientVitals where patientmastervisitid = a.patientmastervisitid),'0'))
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
inner join PatientMasterVisit d on a.patientmastervisitid = d.id
where a.patientid = @PatientID and d.visitdate is not null) ph
order by convert(date,ph.VisitDate) desc

End