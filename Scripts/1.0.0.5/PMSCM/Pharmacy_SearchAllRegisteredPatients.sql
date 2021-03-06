IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_SearchAllRegisteredPatients]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_SearchAllRegisteredPatients]
GO 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Pharmacy_SearchAllRegisteredPatients] 
	@fname varchar(50) = null,
	@mname varchar(50) = null,
	@lname varchar(50) = null,
	@patientid varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Ptn_Pk
	  ,	   convert(varchar(50), decryptbykey(FirstName))							 fname
	  ,	   convert(varchar(50), decryptbykey(MiddleName))							 mname
	  ,	   convert(varchar(50), decryptbykey(LastName))								 lname
	  ,	   PatientEnrollmentID
	  ,	   cast(round(datediff(Hour, DOB, getdate()) / 8766.0, 2) As numeric(18, 2)) age
	  ,	   b.name																	 gender
	  ,	   c.name																	 [service]
	From mst_patient a
	Left Join mst_decode b On a.sex = b.id
	Left Join mst_decode c On a.ServiceRegisteredForAtPharmacy = c.id
	Where RegisteredAtPharmacy = 1 
	and convert(varchar(50), decryptbykey(FirstName)) like '%' + @fname + '%'
	and convert(varchar(50), decryptbykey(MiddleName)) like '%' + @mname + '%'
	and convert(varchar(50), decryptbykey(LastName)) like '%' + @lname + '%'
	and PatientEnrollmentID like '%' + @patientid + '%'
	
END

