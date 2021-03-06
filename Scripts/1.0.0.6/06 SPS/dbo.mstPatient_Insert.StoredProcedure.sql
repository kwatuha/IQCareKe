/****** Object:  StoredProcedure [dbo].[mstPatient_Insert]    Script Date: 25-May-2018 12:22:00 ******/
DROP PROCEDURE [dbo].[mstPatient_Insert]
GO
/****** Object:  StoredProcedure [dbo].[mstPatient_Insert]    Script Date: 25-May-2018 12:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: Insert
-- =============================================
CREATE PROCEDURE [dbo].[mstPatient_Insert] 
 -- Add the parameters for the stored procedure here
 @FirstName varchar(150),
 @LastName varchar(150),
 @MiddleName varchar(150) = null,
 @LocationID int,
 @PatientEnrollmentID varchar(50),
 @ReferredFrom int,
 @RegistrationDate datetime,
 @Sex int,
 @DOB datetime,
 @DobPrecision int,
 @MaritalStatus int,
 @Address varchar(250),
 @Phone varchar(250),
 @UserID int,
 @PosId varchar(10),
 @ModuleId int,
 @StartDate datetime,
 @CreateDate datetime
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 DECLARE @Ptn_Pk int;
 DECLARE @EntryPointName varchar(50);
 DECLARE @Referral int;
 DECLARE @MaritalStatusName varchar(50);
 DECLARE @MaritalStatusId int;

 BEGIN
  Select @EntryPointName = ItemName
  from LookupItemView where ItemId=@ReferredFrom;

  SELECT @MaritalStatusName = ItemName
  from LookupItemView where ItemId=@MaritalStatus;

  select TOP 1 @Referral = ID from mst_Decode where NAME LIKE + '%'+ @EntryPointName + '%' AND CodeID = 17;
  select TOP 1 @MaritalStatusId = ID from mst_Decode where Name LIKE + '%'+ @MaritalStatusName + '%' AND CodeID=12;

  IF @Referral IS NULL
  BEGIN
  select TOP 1 @Referral = ID from mst_Decode where NAME = 'VCT'
  END
 END

    -- Insert statements for procedure here
 Insert Into mst_Patient(FirstName, LastName, MiddleName, LocationID, PatientEnrollmentID, ReferredFrom, RegistrationDate, Sex, DOB, DobPrecision, MaritalStatus, Address, Phone, UserID, PosId, Status, DeleteFlag, CreateDate,MovedToPatientTable)
 Values(
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MiddleName),
  @LocationID,
  @PatientEnrollmentID,
  @Referral,
  @RegistrationDate,
  @Sex,
  @DOB,
  @DobPrecision,
  @MaritalStatusId,
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@Address),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@Phone),
  @UserID,
  @PosId,
  0,
  0,
  @CreateDate,
  1
 );
 SELECT @Ptn_Pk=SCOPE_IDENTITY();
 SELECT @Ptn_Pk Ptn_Pk;

 Insert Into Lnk_PatientProgramStart(Ptn_pk, ModuleId, StartDate, UserID, CreateDate)
 Values(
  @Ptn_Pk,
  @ModuleId,
  @StartDate,
  @UserID,
  @CreateDate
 );
END

GO
