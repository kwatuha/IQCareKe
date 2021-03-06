
/****** Object:  StoredProcedure [dbo].[pr_Clinical_SaveEnrollment_Constella]    Script Date: 11/29/2015 08:52:54 ******/
Set Ansi_nulls On
Go

Set Quoted_identifier On
Go
ALTER PROCEDURE [dbo].[pr_Clinical_SaveEnrollment_Constella]                                                      
@PatientID varchar(10),                  
@FirstName varchar(50), @LastName varchar(50),@LocationID int, @CountryID varchar(50), @PosID varchar(50),                                         
@SatelliteID varchar(50), @PatientEnrollmentID varchar(50), @PatientClinicID varchar(50), @ReferredFrom varchar(50),                          
@ReferredFromSpecify varchar(10),                                        
@RegistrationDate varchar(50),                                                    
@Sex int, @DOB varchar(50), @DobPrecision varchar(50),                               
@TransferIn varchar(15),                               
@LPTFTransferFrom varchar(50),                              
@LocalCouncil varchar(50),                                                    
@VillageName varchar(50),@DistrictName varchar(50), @Province varchar(50), @Address varchar(50),                                                    
@Phone varchar(50), @MaritalStatus varchar(50), @EducationLevel varchar(50),                                                    
@Literacy varchar(50), @EmployeeID varchar(50), @Status varchar(50), @StatusChangedDate varchar(50),                                                    
@UserID varchar(50), @DataQuality int, @GuardianName varchar(10), @GuardianInformation varchar(10),                                                    
@EmergContactName varchar(50), @EmergContactRelation varchar(50),@EmergContactPhone varchar(50),                                                    
@EmergContactAddress varchar(50), @EmergContactKnowsHIVStatus varchar(50), @DiscussStatus varchar(50),                                                    
@PrevHIVCare varchar(10), @PrevMedRecords varchar(10), @PrevCareHomeBased varchar(10),@PrevCareVCT varchar(10),                                                     
@PrevCareSTI varchar(10), @PrevCarePMTCT varchar(10), @PrevCareInPatient varchar(10), @PrevCareOther varchar(10),                                                    
@PrevCareOtherSpecify varchar(50), @PrevART varchar(10), @PrevARTSSelfFinanced varchar(10),                                                    
@PrevARTSGovtSponsored varchar(10),@PrevARTSUSGSponsered varchar(10), @PrevARTSMissionBased varchar(10),                                                     
@PrevARTSThisFacility varchar(10), @PrevARTSOthers varchar(10), @PrevARTSOtherSpecs varchar(50),                                                    
@EmploymentStatus varchar(10), @Occupation varchar(10), @MonthlyIncome varchar(10),                                                     
@NumChildren varchar(10), @NumPeopleHousehold varchar(10), @DistanceTravelled varchar(10),                                                     
@TimeTravelled varchar(10), @TravelledUnits varchar(10), @HIVStatus varchar(10), @HIVStatus_Child varchar(10),                                                     
@HIVDisclosure varchar(10), @HIVDisclosureOther varchar(10), @NumHouseholdHIVTest varchar(10),                                                                 
@NumHouseholdHIVPositive varchar(10), @NumHouseholdHIVDied varchar(10),  @SupportGroup varchar(10),                                                                 
@SupportGroupName varchar(10), @ReferredFromVCT varchar(10), @ReferredFromOutpatient varchar(10),                                                            
@ReferredFromOtherSource varchar(10), @ReferredFromPMTCT varchar(10), @ReferredFromTBOutpatient varchar(10),                                                     
@ReferredFromInPatientWard varchar(10), @ReferredFromOtherFacility varchar(10), @password varchar(40),          
@VisitId int                                                    
                                                    
AS                                                      
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from                                                      
-- interfering with SELECT statements.                        
Set Nocount On;
Declare @SymKey varchar(400)
Set @SymKey = 'Open symmetric key Key_CTC decryption by password=' + @password + ''
Exec (@SymKey)

-- Insert statements for procedure here            


If (@VisitId < 1 And @PatientID < 1) Begin

If Exists
(
	Select
		ptn_pk
	From mst_patient
	Where PatientClinicID = @PatientClinicID
		And (DeleteFlag Is Null Or DeleteFLag = 0)
) Begin
Raiserror ('Existing Hosp/Clinic # already exists.', 16, 1)
End

If Exists
(
	Select
		PatientEnrollmentID
	From mst_patient
	Where PatientEnrollmentID = @PatientEnrollmentID
		And CountryID = @CountryID
		And PosID = @PosID
		And LocationID = @LocationID
		And SatelliteID = @SatelliteID
) Begin
Raiserror ('Patient EnrollmentID already exists.', 16, 1)
Return
End

Insert Into mst_patient (
	FirstName,
	LastName,
	CountryID,
	PosID,
	LocationID,
	SatelliteID,
	PatientEnrollmentID,
	PatientClinicID,
	ReferredFrom,
	ReferredFromSpecify,
	RegistrationDate,
	Sex,
	DOB,
	DobPrecision,
	TransferIn,
	LPTFTransferID,
	LocalCouncil,
	VillageName,
	DistrictName,
	Province,
	Address,
	Phone,
	MaritalStatus,
	EducationLevel,
	Literacy,
	EmployeeID,
	Status,
	StatusChangedDate,
	ProgramId,
	UserID,
	CreateDate)
Values (
	encryptbykey(key_guid('Key_CTC'), @FirstName),
	encryptbykey(key_guid('Key_CTC'), @LastName),
	@CountryID,
	@PosID,
	@LocationID,
	@SatelliteID,
	@PatientEnrollmentID,
	nullif(@PatientClinicID, ''),
	@ReferredFrom,
	nullif(@ReferredFromSpecify, 0),
	@RegistrationDate,
	@Sex,
	@DOB,
	@DobPrecision,
	@TransferIn,
	nullif(@LPTFTransferFrom, 0),
	nullif(@LocalCouncil, ''),
	@VillageName,
	@DistrictName,
	@Province,
	encryptbykey(key_guid('Key_CTC'), nullif(@Address, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@Phone, '')),
	@MaritalStatus,
	@EducationLevel,
	@Literacy,
	@EmployeeID,
	@Status,
	@StatusChangedDate,
	296,
	@UserID,
	getdate() )
Select @PatientID = scope_identity();

Insert Into dbo.ord_Visit (
	Ptn_Pk,
	LocationID,
	VisitDate,
	VisitType,
	DataQuality,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@locationid,
	@RegistrationDate,
	'0',
	@DataQuality,
	@UserID,
	getdate() )
Select @visitID = scope_identity();
Insert Into lnk_PatientProgramStart (
	Ptn_pk,
	ModuleId,
	StartDate,
	UserID,
	CreateDate)
Values (
	@PatientID,
	2,
	@RegistrationDate,
	@UserID,
	getdate() )

Insert Into dtl_patientContacts (
	ptn_pk,
	LocationID,
	EmployeeID,
	GuardianName,
	GuardianInformation,
	EmergContactName,
	EmergContactRelation,
	EmergContactPhone,
	EmergContactAddress,
	EmergContactKnowsHIVStatus,
	DiscussStatus,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@EmployeeID,
	encryptbykey(key_guid('Key_CTC'), nullif(@GuardianName, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@GuardianInformation, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactName, '')),
	nullif(@EmergContactRelation, ''),
	encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactPhone, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactAddress, '')),
	nullif(@EmergContactKnowsHIVStatus, ''),
	nullif(@DiscussStatus, ''),
	@UserID,
	getdate() )

Insert Into dbo.dtl_PatientHivPrevCareEnrollment (
	ptn_pk,
	locationID,
	Visit_pk,
	PrevHIVCare,
	PrevMedRecords,
	PrevCareHomeBased,
	PrevCareVCT,
	PrevCareSTI,
	PrevCarePMTCT,
	PrevCareInPatient,
	PrevCareOther,
	PrevCareOtherSpecify,
	PrevART,
	PrevARTSSelfFinanced,
	PrevARTSGovtSponsored,
	PrevARTSUSGSponsered,
	PrevARTSMissionBased,
	PrevARTSThisFacility,
	PrevARTSOthers,
	PrevARTSOtherSpecs,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@visitID,
	nullif(@PrevHIVCare, ''),
	nullif(@PrevMedRecords, ''),
	nullif(@PrevCareHomeBased, ''),
	nullif(@PrevCareVCT, ''),
	nullif(@PrevCareSTI, ''),
	nullif(@PrevCarePMTCT, ''),
	nullif(@PrevCareInPatient, ''),
	nullif(@PrevCareOther, ''),
	nullif(@PrevCareOtherSpecify, ''),
	nullif(@PrevART, ''),
	nullif(@PrevARTSSelfFinanced, ''),
	nullif(@PrevARTSGovtSponsored, ''),
	nullif(@PrevARTSUSGSponsered, ''),
	nullif(@PrevARTSMissionBased, ''),
	nullif(@PrevARTSThisFacility, ''),
	nullif(@PrevARTSOthers, ''),
	nullif(@PrevARTSOtherSpecs, ''),
	@UserID,
	getdate() )

Insert Into dbo.dtl_PatientHouseHoldInfo (
	ptn_pk,
	LocationID,
	EmploymentStatus,
	Occupation,
	MonthlyIncome,
	NumChildren,
	NumPeopleHousehold,
	DistanceTravelled,
	TimeTravelled,
	TravelledUnits,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@EmploymentStatus,
	@Occupation,
	nullif(@MonthlyIncome, ''),
	nullif(@NumChildren, ''),
	nullif(@NumPeopleHousehold, ''),
	nullif(@DistanceTravelled, ''),
	nullif(@TimeTravelled, ''),
	nullif(@TravelledUnits, ''),
	@UserID,
	getdate() )

Insert Into dbo.dtl_PatientHivOther (
	ptn_pk,
	LocationID,
	Visit_Pk,
	HIVStatus,
	HIVStatus_Child,
	HIVDisclosure,
	HIVDisclosureOther,
	NumHouseholdHIVTest,
	NumHouseholdHIVPositive,
	NumHouseholdHIVDied,
	SupportGroup,
	SupportGroupName,
	ReferredFromVCT,
	ReferredFromOutpatient,
	ReferredFromOtherSource,
	ReferredFromPMTCT,
	ReferredFromTBOutpatient,
	ReferredFromInPatientWard,
	ReferredFromOtherFacility,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@visitID,
	@HIVStatus,
	nullif(@HIVStatus_Child, ''),
	nullif(@HIVDisclosure, ''),
	nullif(@HIVDisclosureOther, ''),
	nullif(@NumHouseholdHIVTest, ''),
	nullif(@NumHouseholdHIVPositive, ''),
	nullif(@NumHouseholdHIVDied, ''),
	nullif(@SupportGroup, ''),
	nullif(@SupportGroupName, ''),
	nullif(@ReferredFromVCT, ''),
	nullif(@ReferredFromOutpatient, ''),
	nullif(@ReferredFromOtherSource, ''),
	nullif(@ReferredFromPMTCT, ''),
	nullif(@ReferredFromTBOutpatient, ''),
	nullif(@ReferredFromInPatientWard, ''),
	nullif(@ReferredFromOtherFacility, ''),
	@UserID,
	getdate() )


End 
Else Begin

Declare @TmpClinicId varchar(200)
Select @TmpClinicId = PatientClinicId
From mst_Patient
Where Ptn_Pk = @PatientId
If (@TmpClinicId <> @PatientClinicID) Begin
If Exists
(
	Select
		ptn_pk
	From mst_patient
	Where PatientClinicID = @PatientClinicID
		And (DeleteFlag Is Null Or DeleteFLag = 0)
) Begin
Raiserror ('Existing Hosp/Clinic # already exists.', 16, 1)
End
End

Update mst_patient Set
	FirstName = encryptbykey(key_guid('Key_CTC'), @FirstName),
	LastName = encryptbykey(key_guid('Key_CTC'), @LastName),
	PatientEnrollmentID = @PatientEnrollmentID,
	PatientClinicID = nullif(@PatientClinicID, ''),
	ReferredFrom = @ReferredFrom,
	ReferredFromSpecify = nullif(@ReferredFromSpecify, 0),
	Sex = @Sex,
	DOB = @DOB,
	DobPrecision = @DobPrecision,
	TransferIn = @TransferIn,
	LPTFTransferID = nullif(@LPTFTransferFrom, 0),
	LocalCouncil = nullif(@LocalCouncil, ''),
	VillageName = @VillageName,
	DistrictName = @DistrictName,
	Province = @Province,
	Address = encryptbykey(key_guid('Key_CTC'), @Address),
	Phone = encryptbykey(key_guid('Key_CTC'), @Phone),
	MaritalStatus = @MaritalStatus,
	EducationLevel = @EducationLevel,
	Literacy = @Literacy,
	EmployeeID = @EmployeeID,
	Status = @Status,
	StatusChangedDate = @StatusChangedDate,
	UserID = @UserID,
	UpdateDate = getdate()
Where Ptn_Pk = @PatientID

If Exists
(
	Select
		Ptn_pk
	From Ord_visit
	Where Ptn_Pk = @PatientId
		And VisitType = 0
) Begin
Update dbo.ord_Visit Set
	VisitDate = @RegistrationDate,
	DataQuality = @DataQuality,
	UserID = @UserID,
	UpdateDate = getdate()
Where Ptn_Pk = @PatientID
	And Visit_Id = @visitID
End 
Else Begin
Insert Into dbo.ord_Visit (
	Ptn_Pk,
	LocationID,
	VisitDate,
	VisitType,
	DataQuality,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@locationid,
	@RegistrationDate,
	'0',
	@DataQuality,
	@UserID,
	getdate() )
	 Select @visitID = scope_identity();  
End

If Exists
(
	Select
		Ptn_pk
	From Lnk_PatientProgramStart
	Where Ptn_pk = @PatientId
		And ModuleId = 2
) Begin
Update Lnk_PatientProgramStart Set
	StartDate = @RegistrationDate
Where Ptn_pk = @PatientID
	And ModuleId = 2
End 
Else Begin
Insert Into lnk_PatientProgramStart (
	Ptn_pk,
	ModuleId,
	StartDate,
	UserID,
	CreateDate)
Values (
	@PatientID,
	2,
	@RegistrationDate,
	@UserID,
	getdate() )
End

If Exists
(
	Select
		Ptn_Pk
	From dtl_PatientContacts
	Where Ptn_Pk = @PatientId
) Begin
Update dtl_patientContacts Set
	EmployeeID = @EmployeeID,
	GuardianName = encryptbykey(key_guid('Key_CTC'), nullif(@GuardianName, '')),
	GuardianInformation = encryptbykey(key_guid('Key_CTC'), nullif(@GuardianInformation, '')),
	EmergContactName = encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactName, '')),
	EmergContactRelation = nullif(@EmergContactRelation, ''),
	EmergContactPhone = encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactPhone, '')),
	EmergContactAddress = encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactAddress, '')),
	EmergContactKnowsHIVStatus = nullif(@EmergContactKnowsHIVStatus, ''),
	DiscussStatus = nullif(@DiscussStatus, ''),
	UserID = @UserID,
	UpdateDate = getdate()
Where Ptn_Pk = @PatientID
End 
Else Begin
Insert Into dtl_patientContacts (
	ptn_pk,
	LocationID,
	EmployeeID,
	GuardianName,
	GuardianInformation,
	EmergContactName,
	EmergContactRelation,
	EmergContactPhone,
	EmergContactAddress,
	EmergContactKnowsHIVStatus,
	DiscussStatus,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@EmployeeID,
	encryptbykey(key_guid('Key_CTC'), nullif(@GuardianName, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@GuardianInformation, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactName, '')),
	nullif(@EmergContactRelation, ''),
	encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactPhone, '')),
	encryptbykey(key_guid('Key_CTC'), nullif(@EmergContactAddress, '')),
	nullif(@EmergContactKnowsHIVStatus, ''),
	nullif(@DiscussStatus, ''),
	@UserID,
	getdate() )
End

If Exists
(
	Select
		Ptn_Pk
	From dtl_PatientHivPrevCareEnrollment
	Where Ptn_Pk = @PatientId
) Begin
Update dbo.dtl_PatientHivPrevCareEnrollment Set
	PrevHIVCare = nullif(@PrevHIVCare, ''),
	PrevMedRecords = nullif(@PrevMedRecords, ''),
	PrevCareHomeBased = nullif(@PrevCareHomeBased, ''),
	PrevCareVCT = nullif(@PrevCareVCT, ''),
	PrevCareSTI = nullif(@PrevCareSTI, ''),
	PrevCarePMTCT = nullif(@PrevCarePMTCT, ''),
	PrevCareInPatient = nullif(@PrevCareInPatient, ''),
	PrevCareOther = nullif(@PrevCareOther, ''),
	PrevCareOtherSpecify = nullif(@PrevCareOtherSpecify, ''),
	PrevART = nullif(@PrevART, ''),
	PrevARTSSelfFinanced = nullif(@PrevARTSSelfFinanced, ''),
	PrevARTSGovtSponsored = nullif(@PrevARTSGovtSponsored, ''),
	PrevARTSUSGSponsered = nullif(@PrevARTSUSGSponsered, ''),
	PrevARTSMissionBased = nullif(@PrevARTSMissionBased, ''),
	PrevARTSThisFacility = nullif(@PrevARTSThisFacility, ''),
	PrevARTSOthers = nullif(@PrevARTSOthers, ''),
	PrevARTSOtherSpecs = nullif(@PrevARTSOtherSpecs, ''),
	UserID = @UserID,
	UpdateDate = getdate()
Where Ptn_Pk = @PatientID
End 
Else Begin
Insert Into dbo.dtl_PatientHivPrevCareEnrollment (
	ptn_pk,
	locationID,
	Visit_pk,
	PrevHIVCare,
	PrevMedRecords,
	PrevCareHomeBased,
	PrevCareVCT,
	PrevCareSTI,
	PrevCarePMTCT,
	PrevCareInPatient,
	PrevCareOther,
	PrevCareOtherSpecify,
	PrevART,
	PrevARTSSelfFinanced,
	PrevARTSGovtSponsored,
	PrevARTSUSGSponsered,
	PrevARTSMissionBased,
	PrevARTSThisFacility,
	PrevARTSOthers,
	PrevARTSOtherSpecs,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@VisitId,
	nullif(@PrevHIVCare, ''),
	nullif(@PrevMedRecords, ''),
	nullif(@PrevCareHomeBased, ''),
	nullif(@PrevCareVCT, ''),
	nullif(@PrevCareSTI, ''),
	nullif(@PrevCarePMTCT, ''),
	nullif(@PrevCareInPatient, ''),
	nullif(@PrevCareOther, ''),
	nullif(@PrevCareOtherSpecify, ''),
	nullif(@PrevART, ''),
	nullif(@PrevARTSSelfFinanced, ''),
	nullif(@PrevARTSGovtSponsored, ''),
	nullif(@PrevARTSUSGSponsered, ''),
	nullif(@PrevARTSMissionBased, ''),
	nullif(@PrevARTSThisFacility, ''),
	nullif(@PrevARTSOthers, ''),
	nullif(@PrevARTSOtherSpecs, ''),
	@UserID,
	getdate() )
End

If Exists
(
	Select
		Ptn_Pk
	From dtl_PatientHouseHoldInfo
	Where Ptn_Pk = @PatientId
) Begin
Update dbo.dtl_PatientHouseHoldInfo Set
	EmploymentStatus = @EmploymentStatus,
	Occupation = @Occupation,
	MonthlyIncome = nullif(@MonthlyIncome, ''),
	NumChildren = nullif(@NumChildren, ''),
	NumPeopleHousehold = nullif(@NumPeopleHousehold, ''),
	DistanceTravelled = nullif(@DistanceTravelled, ''),
	TimeTravelled = nullif(@TimeTravelled, ''),
	TravelledUnits = @TravelledUnits,
	UserID = @UserID,
	UpdateDate = getdate()
Where Ptn_Pk = @PatientID
End 
Else Begin
Insert Into dbo.dtl_PatientHouseHoldInfo (
	ptn_pk,
	LocationID,
	EmploymentStatus,
	Occupation,
	MonthlyIncome,
	NumChildren,
	NumPeopleHousehold,
	DistanceTravelled,
	TimeTravelled,
	TravelledUnits,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	@EmploymentStatus,
	@Occupation,
	nullif(@MonthlyIncome, ''),
	nullif(@NumChildren, ''),
	nullif(@NumPeopleHousehold, ''),
	nullif(@DistanceTravelled, ''),
	nullif(@TimeTravelled, ''),
	nullif(@TravelledUnits, ''),
	@UserID,
	getdate() )
End

If Exists
(
	Select
		Ptn_Pk
	From dtl_PatientHivOther
	Where Ptn_pk = @PatientId
) Begin
Update dbo.dtl_PatientHivOther Set
	HIVStatus = @HIVStatus,
	HIVStatus_Child = nullif(@HIVStatus_Child, ''),
	HIVDisclosure = nullif(@HIVDisclosure, ''),
	HIVDisclosureOther = nullif(@HIVDisclosureOther, ''),
	NumHouseholdHIVTest = nullif(@NumHouseholdHIVTest, ''),
	NumHouseholdHIVPositive = nullif(@NumHouseholdHIVPositive, ''),
	NumHouseholdHIVDied = nullif(@NumHouseholdHIVDied, ''),
	SupportGroup = nullif(@SupportGroup, ''),
	SupportGroupName = nullif(@SupportGroupName, ''),
	ReferredFromVCT = nullif(@ReferredFromVCT, ''),
	ReferredFromOutpatient = nullif(@ReferredFromOutpatient, ''),
	ReferredFromOtherSource = nullif(@ReferredFromOtherSource, ''),
	ReferredFromPMTCT = nullif(@ReferredFromPMTCT, ''),
	ReferredFromTBOutpatient = nullif(@ReferredFromTBOutpatient, ''),
	ReferredFromInPatientWard = nullif(@ReferredFromInPatientWard, ''),
	ReferredFromOtherFacility = nullif(@ReferredFromOtherFacility, ''),
	UserID = @UserID,
	UpdateDate = getdate()
Where Ptn_Pk = @PatientID
End Else Begin
Insert Into dbo.dtl_PatientHivOther (
	ptn_pk,
	LocationID,
	Visit_Pk,
	HIVStatus,
	HIVStatus_Child,
	HIVDisclosure,
	HIVDisclosureOther,
	NumHouseholdHIVTest,
	NumHouseholdHIVPositive,
	NumHouseholdHIVDied,
	SupportGroup,
	SupportGroupName,
	ReferredFromVCT,
	ReferredFromOutpatient,
	ReferredFromOtherSource,
	ReferredFromPMTCT,
	ReferredFromTBOutpatient,
	ReferredFromInPatientWard,
	ReferredFromOtherFacility,
	UserID,
	CreateDate)
Values (
	@PatientID,
	@LocationID,
	 @visitId ,
	@HIVStatus,
	nullif(@HIVStatus_Child, ''),
	nullif(@HIVDisclosure, ''),
	nullif(@HIVDisclosureOther, ''),
	nullif(@NumHouseholdHIVTest, ''),
	nullif(@NumHouseholdHIVPositive, ''),
	nullif(@NumHouseholdHIVDied, ''),
	nullif(@SupportGroup, ''),
	nullif(@SupportGroupName, ''),
	nullif(@ReferredFromVCT, ''),
	nullif(@ReferredFromOutpatient, ''),
	nullif(@ReferredFromOtherSource, ''),
	nullif(@ReferredFromPMTCT, ''),
	nullif(@ReferredFromTBOutpatient, ''),
	nullif(@ReferredFromInPatientWard, ''),
	nullif(@ReferredFromOtherFacility, ''),
	@UserID,
	getdate() )
End

--////////////////// Table Clear /////////////////////////////////////        
Delete From dtl_HIVAIDSCareTypes
Where Ptn_pk = @PatientId
	And Visit_Pk = @VisitId
Delete From dtl_ARTSponsor
Where Ptn_pk = @PatientId
	And Visit_Pk = @VisitId
Delete From dtl_PatientDisclosure
Where Ptn_pk = @PatientId
	And Visit_Pk = @VisitId
Delete From dtl_PatientHIVBarrier
Where Ptn_pk = @PatientId
	And Visit_Pk = @VisitId
--////////////////// Table Clear /////////////////////////////////////                          
End


Select	a.Ptn_pk 'ptnid',
		Visit_ID [VisitIDEnrol],
		a.FirstName,
		a.LastName,
		a.CountryId + '-' + a.PosId + '-' + a.SatelliteId + '-' + a.PatientEnrollmentId [EnrollmentID]
From	mst_patient a,
		ord_visit b
Where a.ptn_pk = b.ptn_pk
	And a.ptn_pk = @PatientID
	And b.visitType = 0

Close Symmetric Key Key_CTC
Set Nocount Off;

End