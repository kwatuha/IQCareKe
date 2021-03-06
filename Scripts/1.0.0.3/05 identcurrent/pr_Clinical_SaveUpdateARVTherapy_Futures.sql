/****** Object:  StoredProcedure [dbo].[pr_Clinical_SaveUpdateARVTherapy_Futures]    Script Date: 11/29/2015 08:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_Clinical_SaveUpdateARVTherapy_Futures]  (                                                                 
-- Add the parameters for the stored procedure here             
	@patientid int,
	@locationid int, 
	@Visit_ID int,
	@ARVDateEligible datetime,
	@ARVEligibleThrough int,
	@EligibleWHOStage int,          
	@EligibleCD4 varchar(50), 
	@EligibleCD4percent varchar(50),
	@ARVCohortMonth varchar(50),
	@ARVCohortYear int,          
	@AnotherRegimenStartDate datetime, 
	@AnotherRegimen varchar(200),
	@AnotherWeight varchar(50),
	@AnotherHeight varchar(50),          
	@AnotherWHOStage int, 
	@dataquality int, 
	@UserId int     ,
	@OtherEligibleCriteria varchar(100) = null  ,
	@Muac decimal (4,1) = null                                          
)                       
As                                                                  
Begin
-- SET NOCOUNT ON added to prevent extra result sets from                                                                  
-- interfering with SELECT statements.                                            

	Set Nocount On;
	Declare @Visit_Pk int;

	If (@Visit_ID > 0) Begin
		Update ord_visit Set
			DataQuality = @dataquality,
			UpdateDate = Getdate()
		Where visit_Id = @Visit_ID
		And Ptn_Pk = @patientid
		And LocationID = @locationid;

		Update dtl_PatientARVEligibility Set
			userID = @UserId,
			updateDate = Getdate(),
			dateEligible = @ARVDateEligible,
			eligibleThrough = @ARVEligibleThrough,
			WHOStage = @EligibleWHOStage,
			CD4 = Nullif(@EligibleCD4, ''),
			CD4percent = Nullif(@EligibleCD4percent, ''),
			OtherCriteria = Nullif(@OtherEligibleCriteria,'')
		Where visit_id = @Visit_ID
		And ptn_pk = @patientid
		And locationID = @locationid;

		Update dtl_patientARTCare Set
			FirstLineRegStDate = @AnotherRegimenStartDate,
			FirstLineReg = @AnotherRegimen,
			UserId = @UserId,
			UpdateDate = Getdate()
		Where visit_Id = @Visit_ID
		And ptn_pk = @patientid
		And locationId = @locationid;

		If Exists (Select 1	From dtl_PatientVitals	Where Visit_Pk = @Visit_ID	And Ptn_pk = @patientid	And LocationID = @locationid) Begin
			Update dtl_PatientVitals Set
				[Weight] = Nullif(@AnotherWeight, ''),
				[Height] = Nullif(@AnotherHeight, ''),
				Muac = @Muac,
				[UpdateDate] = Getdate()
			Where Visit_Pk = @Visit_ID
			And ptn_pk = @patientid
			And locationId = @locationid;
		End 
		Else Begin
			Insert Into dtl_PatientVitals (
				[Ptn_pk],
				[LocationID],
				[Visit_pk],
				[Weight],
				[Height],
				Muac,
				[UserID],
				[CreateDate])
			Values (
				@patientid,
				@locationid,
				@Visit_ID,
				Nullif(@AnotherWeight, ''),
				Nullif(@AnotherHeight, ''),
			    @Muac,
				@UserId,
				Getdate() );
		End

		If Exists (Select 1	From dtl_PatientStage	Where Visit_Pk = @Visit_ID	And Ptn_pk = @patientid	And LocationID = @locationid) Begin
			Update dtl_PatientStage Set
				[WHOStage] = @AnotherWHOStage,
				[UpdateDate] = Getdate()
			Where Visit_Pk = @Visit_ID
			And Ptn_pk = @patientid
			And LocationID = @locationid;
		End 
		Else Begin
			Insert Into dtl_PatientStage (
				[Ptn_pk],
				[LocationID],
				[Visit_Pk],
				[WHOStage],
				[UserID],
				[CreateDate])
			Values (
				@patientid,
				@locationid,
				@Visit_ID,
				@AnotherWHOStage,
				@UserId,
				Getdate() )
		End      
	End 
	Else Begin
		Declare @vdate datetime;
		Select @vdate = StartDate From dbo.Lnk_PatientProgramStart	Where Ptn_pk = @patientid	And ModuleId = 203;
		Insert Into ord_Visit (
			Ptn_Pk,
			LocationID,
			VisitDate,
			VisitType,
			DataQuality,
			DeleteFlag,
			UserID,
			CreateDate)
		Values (
			@patientid,
			@locationid,
			@vdate,
			19,
			@dataquality,
			0,
			@UserId,
			Getdate() );
		Select @Visit_Pk = scope_identity();
		Insert Into dtl_PatientARVEligibility (
			ptn_pk,
			locationID,
			visit_id,
			userID,
			createDate,
			dateEligible,
			eligibleThrough,
			WHOStage,
			CD4,
			CD4percent,
			OtherCriteria)
		Values (
			@patientid,
			@locationid,
			@Visit_Pk,
			@UserId,
			Getdate(),
			@ARVDateEligible,
			@ARVEligibleThrough,
			@EligibleWHOStage,
			Nullif(@EligibleCD4, ''),
			Nullif(@EligibleCD4percent, ''),
			Nullif(@OtherEligibleCriteria,'') );

		Insert Into dtl_PatientARTCare (
			ptn_pk,
			visit_Id,
			locationId,
			FirstLineRegStDate,
			FirstLineReg,
			UserId,
			CreateDate)
		Values (
			@patientid,
			@Visit_Pk,
			@locationid,
			@AnotherRegimenStartDate,
			@AnotherRegimen,
			@UserId,
			Getdate() );

		Insert Into dtl_PatientVitals (
			[Ptn_pk],
			[LocationID],
			[Visit_pk],
			[Weight],
			[Height],
			Muac,
			[UserID],
			[CreateDate])
		Values (
			@patientid,
			@locationid,
			@Visit_Pk,
			Nullif(@AnotherWeight, ''),
			Nullif(@AnotherHeight, ''),
			@Muac,
			@UserId,
			Getdate() );

		Insert Into dtl_PatientStage (
			[Ptn_pk],
			[LocationID],
			[Visit_Pk],
			[WHOStage],
			[UserID],
			[CreateDate])
		Values (
			@patientid,
			@locationid,
			@Visit_Pk,
			@AnotherWHOStage,
			@UserId,
			Getdate() );
	End

	If (@Visit_ID > 0) Begin
		Select	Ptn_pk,	
				Visit_Id,
				VisitDate,	
				LocationID 
		From ord_Visit Where Visit_Id = @Visit_ID;
	End 
	Else Begin
		Select	Ptn_pk,	
				Visit_Id,	
				VisitDate,	
				LocationID 
		From ord_Visit Where Visit_Id = @Visit_Pk;
	End

End