IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]    Script Date: 3/25/2018 4:40:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]
@Ptn_Pharmacy_Pk int                    
                    
as                    
                    
begin                    
                    
 select 
 case when a.[Weight] = 0 then isnull(c.[weight],0) else isnull(d.[weight],0) end as [Weight],
 case when a.Height = 0 then isnull(c.height,0) else isnull(d.height,0) end as [Height],

 a.ProgID,a.PharmacyPeriodTaken,a.ProviderID,
a.RegimenLine ,
case when b.AppDate is null then e.appointmentdate end AppDate,
isnull(b.AppReason,0)AppReason
from ord_PatientPharmacyOrder a left outer join  dtl_PatientAppointment b on a.visitid=b.Visit_pk 
left outer join dtl_patientvitals c on a.visitid = c.visit_pk
left outer join patientvitals d on a.patientmastervisitid = d.patientmastervisitid
left outer join patientappointment e on a.patientmastervisitid = e.patientmastervisitid
where a.ptn_pharmacy_pk=@Ptn_Pharmacy_Pk                   
end

