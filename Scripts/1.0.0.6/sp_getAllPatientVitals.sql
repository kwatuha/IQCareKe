-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 23rd Jan 2018
-- Description:	Get all vitals from all modules
-- =============================================
create PROCEDURE sp_getAllPatientVitals
	-- Add the parameters for the stored procedure here
	@PatientId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 12 * from (
	select patientid, height,[weight],bmi, createdate from patientvitals where patientid = @PatientId and deleteflag=0
	union
	select b.id patientid, a.height,a.[weight], cast(isnull(a.[weight]/((a.height/100)*(a.height/100)),0) as decimal(36,2)) bmi, c.visitdate from dtl_patientvitals a inner join patient b on a.ptn_pk = b.ptn_pk 
	inner join ord_visit c on a.visit_pk = c.visit_id
	where b.id = @PatientId) vitals
	where vitals.height > 0 
	and vitals.[weight] > 0 and vitals.createdate > dateadd(year, -1, getdate())
	order by vitals.createdate desc
	
END
GO
