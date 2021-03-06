IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPMTCTPeriodDrugTaken]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPMTCTPeriodDrugTaken]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPMTCTPeriodDrugTaken]    Script Date: 5/20/2018 4:47:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get regimen classification
-- =============================================
Create PROCEDURE [dbo].[sp_getPMTCTPeriodDrugTaken]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @lookUpMasterID int = (select Id from lookupmaster where name = 'PeriodDrugsTaken')

	select * from lookupmasteritem where lookupmasterid = @lookUpMasterID order by ordrank

End








