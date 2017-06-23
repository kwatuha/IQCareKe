
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyPatientsExpected]    Script Date: 6/23/2017 2:30:20 PM ******/
DROP PROCEDURE [dbo].[sp_getPharmacyPatientsExpected]
GO
/****** Object:  StoredProcedure [dbo].[pr_SystemAdmin_Backup_Constella]    Script Date: 6/23/2017 2:30:20 PM ******/
DROP PROCEDURE [dbo].[pr_SystemAdmin_Backup_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetStockSummary_Futures]    Script Date: 6/23/2017 2:30:20 PM ******/
DROP PROCEDURE [dbo].[pr_SCM_GetStockSummary_Futures]
GO
/****** Object:  StoredProcedure [dbo].[Pr_SCM_GetPurcaseOrderItem]    Script Date: 6/23/2017 2:30:20 PM ******/
DROP PROCEDURE [dbo].[Pr_SCM_GetPurcaseOrderItem]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 6/23/2017 2:30:20 PM ******/
DROP PROCEDURE [dbo].[Pharmacy_GetPrescription]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 6/23/2017 2:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get pending pharmacy prescriptions
-- =============================================
CREATE PROCEDURE [dbo].[Pharmacy_GetPrescription] 
	-- Add the parameters for the stored procedure here
	@PrescriptionDate datetime , 
	@LocationId int,
	@PrescriptionStatus int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @PrescriptionDate), 0)) ,	@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @PrescriptionDate)+1, 0))
    -- Insert statements for procedure here
	Select	PV.Ptn_pk
		,	PatientEnrollmentID PatientFacilityId
		,	ptn_pharmacy_pk	OrderId
		,	ReportingID		PrescriptionNumber
		,	FirstName
		,	MiddleName
		,	LastName
		,	DOB
		,	Sex
		,	convert(varchar(20),OrderedByDate,106) OrderedByDate
		,	Case
				When PO.OrderStatus = 1 Then 'New Order'
				When PO.OrderStatus = 3 Then 'Partial Dispense'
				Else 'Already Dispensed Order'
			End [Status]
		,  convert(varchar(20),PO.CreateDate,106) CreateDate
		--,	cast(datediff(Hour, PO.CreateDate, getdate()) As varchar) + ' hrs ' + cast(datediff(Minute, PO.CreateDate, getdate()) % 60 As varchar) + ' mins' Duration
		, datediff(Minute, PO.CreateDate, getdate()) Duration
		,	(
			Select UserFirstName + ' ' + UserLastName
			From mst_User U
			Where U.UserId = PO.OrderedBy
			)				
			PrescribedBy
	From ord_PatientPharmacyOrder PO
	Inner Join PatientView PV On PV.Ptn_Pk = PO.Ptn_pk 
	Where orderstatus = @PrescriptionStatus
	And PO.DeleteFlag = 0 And PV.DeleteFlag = 0 And OrderedByDate Between @StartDate And @EndDate
	And PO.LocationId = @LocationId
	order by Duration desc
END



GO
/****** Object:  StoredProcedure [dbo].[Pr_SCM_GetPurcaseOrderItem]    Script Date: 6/23/2017 2:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Pr_SCM_GetPurcaseOrderItem] (                                        
@isPO int =0,                            
@UserID int,                        
@StoreID int =0  
)                                      
as                                          
                                          
begin
                                          
--0                                  
If(@isPO =1) begin
	Select	a.Drug_Pk	[ItemID]
		,	a.DrugName	[ItemName]
		,  a.ItemTypeID
		,	b.SupplierId
	From Mst_Drug a
	Inner Join lnk_supplierItem b On a.Drug_pk = b.ItemId and b.ItemTypeId=a.ItemTypeID
	Where a.DeleteFlag = 0
	Group By	a.Drug_Pk
			,	a.DrugName
			,	b.SupplierId
			,	a.ItemTypeID
	Order By a.DrugName Asc
End 
Else If (@isPO = 2) Begin
Select	convert(varchar(100), a.Drug_Pk) + '-' + convert(varchar(100), Stock.BatchId) + '-' + convert(varchar, Stock.ExpiryDate, 101) [ItemID],
		a.DrugName + ' - ' + Stock.BatchName + ' - ' + convert(varchar, Stock.ExpiryDate, 106) + ' - ' + Convert(varchar,Stock.AvailableQTY) ItemName,
		
		f.Name [DispensingUnit],
		f.Id [UnitId],
		isnull(Stock.BatchName, '') [Batch],
		 [BatchId],
		Stock.StoreID,
		a.Drug_Pk [StockItemID],
	
		Stock.[AvailableQTY] / a.QtyPerPurchaseUnit [AvailableQTY],
		replace(convert(varchar, Stock.ExpiryDate, 106), ' ', '-') [ExpiryDate]
From dbo.Mst_Drug a
	Inner Join
		(
			Select	sum(T.Quantity)	As AvailableQTY
				,	SI.StoreID
				,	T.ItemId		As Drug_pk
				,	T.BatchId
				,	T.ExpiryDate
				,	Store.Name		As StoreName
				,	Mst_Batch.Name	As BatchName
			From Dtl_StockTransaction As T
			Inner Join lnk_StoreItem As SI On T.ItemId = SI.ItemId
			Inner Join Mst_Store As Store On SI.StoreID = Store.Id
			Inner Join Mst_Batch On Mst_Batch.ID = T.BatchId
			Where (T.StoreId = @StoreId)
			Group By	SI.StoreID
					,	T.ItemId
					,	T.BatchId
					,	T.ExpiryDate
					,	Store.Name
					,	Mst_Batch.Name
			Having (sum(T.Quantity) > 0)
		) Stock On  Stock.Drug_pk = a.Drug_pk
	Left Outer Join Mst_DispensingUnit f On a.DispensingUnit = f.Id
	Where Stock.StoreId = @StoreID

Order By [ItemName]
End
--1                                    

Select	c.Drug_Pk,
		DrugId,
		c.ItemTypeID,
		c.DrugName [ItemName],
		dbo.fn_GetDrugGenericCommaSeprated(c.Drug_Pk) [GenericName],
		dbo.fn_Drug_Abbrev_Constella(c.Drug_Pk) [GenAbbr],
		c.FDACode,
		c.DispensingUnit,
		(
			Select
				name
			From Mst_DispensingUnit
			Where id = c.DispensingUnit
		)
		[DispensingunitName],
		c.MinStock,
		c.MaxStock,
		c.PurchaseUnit,
		(
			Select
				name
			From Mst_DispensingUnit
			Where id = c.PurchaseUnit
		)
		[PurchaseUnitName],
		c.QtyPerPurchaseUnit,
		isnull(c.PurchaseUnitPrice, 0) [PurchaseUnitPrice],
		c.Manufacturer,
		c.DispensingUnitPrice,
		c.DispensingMargin,
		isnull(c.SellingUnitPrice, 0) [SellingUnitPrice],
		c.EffectiveDate,
		c.DeleteFlag
From Mst_Drug c

---2           
If (@isPO = 1) Begin
Select	'' [ItemCode],
		'' [Units],
		'' [UnitQuantity],
		'' [OrderQuantity],
		'' [Price],
		'' [TotPrice],
		'' [Isfunded]
End Else If (@isPO = 2) Begin
Select	'' [ItemCode],
		'' [Units],
		'' [OrderQuantity],
		'' [Price],
		'' [TotPrice],
		'' [Isfunded],
		'' BatchID,
		'' BatchName,
		'' AvailableQTY,
		'' [ExpiryDate]
End
--3                            
If (@UserID = 1) Begin
Select	a.EmployeeID,
		rtrim(ltrim(a.FirstName)) + ' ' + rtrim(ltrim(a.LastName)) [EmpName]
From mst_employee a
--inner join mst_user b on a.EmployeeID =b.UserID                             
End Else Begin
Select	a.EmployeeID,
		rtrim(ltrim(a.FirstName)) + ' ' + rtrim(ltrim(a.LastName)) [EmpName]
From mst_employee a
	Inner Join mst_user b
		--on a.EmployeeID =b.UserID where b.userID=@UserID 
		On a.EmployeeID = b.EmployeeID
Where b.userID = @UserID;
End


--- 4                       
Select Distinct	c.Drug_Pk,
				c.DrugName [ItemName],
				c.ItemTypeID,
				Case
					When f.donorid > 0 Then 1
					Else 0
				End [Isfunded]
From Mst_Drug c
	Inner Join Lnk_ProgramItem e On e.ItemId = c.Drug_Pk
	Inner Join Lnk_DonorProgram f On f.ProgramId = e.ProgramId
		And convert(datetime, convert(varchar, getdate(), 106)) >= convert(datetime, convert(varchar, fundingstartdate, 106))
		And convert(datetime, convert(varchar, getdate(), 106)) <= convert(datetime, convert(varchar, FundingEndDate, 106))
Group By	c.Drug_Pk,
			c.DrugName,
			f.donorid,
			c.ItemTypeID

End



GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetStockSummary_Futures]    Script Date: 6/23/2017 2:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_SCM_GetStockSummary_Futures]                                                        
@StoreId int=NULL,                                                    
@ItemId int=NULL,                                                    
@FromDate datetime=NULL,                                                    
@ToDate datetime=NULL                                                    
                                                        
AS                                                                  
BEGIN
--0                                                    
Set @Todate = dateadd(dd, 1, @Todate)
Set @ItemId = Case When @ItemId = 0 Then Null Else @ItemId End

Select Distinct	ls.StoreID	As StoreId
			,	md.Drug_pk
			,	md.DrugName
From lnk_StoreItem As ls
Inner Join Mst_Drug As md On ls.ItemId = md.Drug_pk
--Inner Join Dtl_StockTransaction As dt On md.Drug_pk = dt.ItemId
Where (ls.StoreID = @StoreId)
Group By	ls.StoreID
		,	md.Drug_pk
		,	md.DrugName
Order By md.Drug_pk
--1                                
Select	Drg.Drug_Pk																																			[ItemId]
	,	Drg.DrugName																																		[ItemName]
	,	Unit.Name																																			[DispensingUnit]
	--,	P.OpeningQuantity																																	[OpeningStock]
	, (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and TransactionDate <= @FromDate)					[OpeningStock]
	--,	Recq.RecQty																																			[QtyRecieved]
	, (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and TransactionDate >= @FromDate and TransactionDate <= @ToDate and POid > 0 and quantity > 0) [QtyRecieved]
	--,	r.IssQty																																			[QtyDispensed]
	, (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and TransactionDate >= @FromDate and TransactionDate <= @ToDate and quantity < 0 and poid is null and openingstock is null and AdjustId is null) [QtyDispensed]
	--,	s.InterStoreIssueQty
	, (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and TransactionDate >= @FromDate and TransactionDate <= @ToDate and POid > 0 and quantity < 0) [InterStoreIssueQty]
	--,	(isnull(P.OpeningQuantity, 0) + isnull(Recq.RecQty, 0) + isnull(t.AdjustmentQuantity, 0)) - (isnull(s.InterstoreIssueQty, 0) + isnull(R.IssQty, 0))	[ClosingQty]
	, (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and transactiondate <= @ToDate) [ClosingQty]
	,	@StoreId																																			[StoreId]
	,	(	Select Top 1 Name		From Mst_Store		Where Id = @StoreId		)	[StoreName]
	--,	t.AdjustmentQuantity
	, (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and TransactionDate >= @FromDate and TransactionDate <= @ToDate and AdjustId is not null) AdjustmentQuantity
From Mst_Drug Drg
Left Outer Join Mst_DispensingUnit Unit On Drg.DispensingUnit = Unit.Id
--Left Outer Join (
--Select	tmp.drug_pk
--	,	tmp.drugname
--	,	tmp.dispensingunit
--	,	sum(openingquantity)	[OpeningQuantity]
--From (
--Select	a.Drug_Pk
--	,	a.DrugName
--	,	c.Name			[DispensingUnit]
--	,	sum(b.Quantity)	[OpeningQuantity]
--From mst_drug a
--Left Outer Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
--Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
--Where b.storeid = @StoreId 
--	And b.ExpiryDate >= @FromDate 
--	And transactiondate >= @FromDate 
--	And transactiondate < @ToDate 
--	And openingstock = 1 
--	And (a.Drug_pk = @ItemId Or @ItemId Is Null)
--Group By	a.drug_pk
--		,	a.drugname
--		,	c.name
--Union
--Select	a.Drug_Pk
--	,	a.DrugName
--	,	c.Name																	[DispensingUnit]
--	,	nullif(dbo.fn_GetItemOpeningStock(a.Drug_pk, @StoreId, @FromDate), 0)	[OpeningQuanitity]
--From mst_drug a
--Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
--Group By	a.drug_pk
--		,	a.drugname
--		,	c.name
--) tmp
--Group By	tmp.drug_pk
--		,	tmp.drugname
--		,	tmp.dispensingunit
--) p On Drg.Drug_Pk = p.Drug_pk
--Left Outer Join (
--Select	q.drug_pk
--	,	q.drugname
--	,	q.dispensingunit
--	,	sum(q.RecQty)	[RecQty]
--From       
--(
--Select	a.Drug_Pk
--	,	a.DrugName
--	,	c.Name			[DispensingUnit]
--	,	sum(Quantity)	[RecQty]
--From mst_drug a
--Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
--Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
--Where b.Openingstock Is Null 
--	And b.AdjustId Is Null 
--	And b.storeid = @StoreId --And (b.GrnId Is Not Null Or b.GrnId > 0) 
--	And b.Quantity > 0 
--	And b.ExpiryDate >= @FromDate
--	 And b.transactiondate >= @FromDate And b.transactiondate < @ToDate
--Group By	a.drug_pk
--		,	a.drugname
--		,	c.name
--Having sum(Quantity) >= 0
--) q
--Group By	q.drug_pk
--		,	q.drugname
--		,	q.dispensingunit
--) Recq On Drg.Drug_Pk = Recq.Drug_Pk
--Left Outer Join (
--	Select	a.Drug_Pk
--		,	a.DrugName
--		,	c.Name				[DispensingUnit]
--		,	abs(sum(Quantity))	[IssQty]
--	From mst_drug a
--	Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
--	Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
--	Where b.storeid = @StoreId 
--		And b.Ptn_Pharmacy_pk > 0 
--		And b.ExpiryDate >= @FromDate 
--		And b.transactiondate >= @FromDate 
--		And b.transactiondate < @ToDate
--	Group By	b.StoreId
--			,	a.drug_pk
--			,	a.drugname
--			,	c.name
--) r On Drg.Drug_Pk = r.Drug_Pk
--Left Outer Join (
--	Select	a.Drug_Pk
--		,	a.DrugName
--		,	c.Name				[DispensingUnit]
--		,	sum(abs(Quantity))	[InterStoreIssueQty]
--	From mst_drug a
--	Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
--	Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
--	Where b.storeid = @StoreId 
--		--And (b.GrnId Is Not Null Or b.GrnId > 0) 
--		And b.Quantity < 0 And b.ExpiryDate >= @FromDate 
--		And b.transactiondate >= @FromDate
--		And b.transactiondate < @ToDate
--		And (a.Drug_pk = @ItemId Or @ItemId Is Null)
--	Group By	a.drug_pk
--			,	a.drugname
--			,	c.name
--) s On Drg.Drug_Pk = s.Drug_Pk
--Left Outer Join (
--	Select	a.Drug_Pk
--		,	a.DrugName
--		,	c.Name			[DispensingUnit]
--		,	sum(b.Quantity)	[AdjustmentQuantity]
--	From mst_drug a
--	Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
--	Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
--	Where b.storeid = @StoreId 
--		And b.ExpiryDate >= @FromDate 
--		And b.AdjustId Is Not Null 
--		And b.transactiondate >= @FromDate 
--		And b.transactiondate < @ToDate
--		And (a.Drug_pk = @ItemId Or @ItemId Is Null)
--	Group By	a.drug_pk
--			,	a.drugname
--			,	c.name
--) t On Drg.Drug_Pk = t.Drug_Pk

--Where (p.OpeningQuantity Is Not Null Or Recq.RecQty Is Not Null Or r.IssQty Is Not Null Or s.InterStoreIssueQty Is Not Null)
--	And (Drg.Drug_pk = @ItemId Or @ItemId Is Null)
where (select sum(quantity) from dtl_stocktransaction where storeid = @StoreId and itemid = Drg.drug_pk and transactiondate <= @ToDate) is not null
Order By Drg.DrugName



End


GO
/****** Object:  StoredProcedure [dbo].[pr_SystemAdmin_Backup_Constella]    Script Date: 6/23/2017 2:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_SystemAdmin_Backup_Constella]                
@FileName varchar(500),      
@LocationId int,  
@Deidentified int,  
@dbKey varchar(50)  
                
as                
                
declare @InstanceName varchar(1000)               
declare @dir varchar(500)        
declare @Ver varchar(20)  
declare @Loc varchar(200)             
      
if @Deidentified = 1 Begin      
  
     declare @Tsql varchar(500)  
     set @Tsql = 'Open symmetric key Key_CTC decryption by password = '+@dbKey  
     exec(@Tsql)  
           
	Create Table #PtnMaster(Ptn_Pk int,FirstName varchar(200),MiddleName varchar(200),LastName varchar(200),Address varchar(200),Phone varchar(200))      
		Insert Into #PtnMaster (
				Ptn_Pk
			,	FirstName
			,	MiddleName
			,	LastName
			,	Address
			,	Phone)
		Select	Ptn_Pk
			,	decryptbykey(FirstName)
			,	decryptbykey(MiddleName)
			,	decryptbykey(LastName)
			,	decryptbykey(Address)
			,	decryptbykey(Phone)
		From mst_patient      
           
     Create Table #PtnContacts(Ptn_Pk int,GuardianName varchar(200),GuardianInformation varchar(200),EmergContactName varchar(200),EmergContactPhone varchar(200),      
     EmergContactAddress varchar(200),TenCellLeader varchar(200),TenCellLeaderAddress varchar(200),TreatmentSupportName varchar(100),CommunitySupportGroup varchar(200),  
     TreatmentSupportAddress varchar(200))       
  
 
		Insert Into #PtnContacts
		Select	Ptn_Pk
			,	decryptbykey(GuardianName)
			,	decryptbykey(GuardianInformation)
			,	EmergContactName
			,	EmergContactPhone
			,	EmergContactAddress
			,	decryptbykey(TenCellLeader)
			,	decryptbykey(TenCellLeaderAddress)
			,	TreatmentSupportName
			,	CommunitySupportGroup
			,	TreatmentSupportAddress
		From dtl_patientcontacts     
      
     Create Table #PtnRelations(Ptn_Pk int,RFirstName varchar(200),RLastName varchar(200), Id int)      
		Insert Into #PtnRelations
		Select	Ptn_Pk
			,	decryptbykey(RFirstName)
			,	decryptbykey(RLastName)
			,	id
		From dtl_FamilyInfo      
       
		Update mst_patient Set
				FirstName = encryptbykey(key_guid('Key_CTC'), 'FName')
			,	MiddleName = encryptbykey(key_guid('Key_CTC'), 'LName')
			,	LastName = encryptbykey(key_guid('Key_CTC'), 'LName')
			,	Address = encryptbykey(key_guid('Key_CTC'), 'Address')
			,	Phone = encryptbykey(key_guid('Key_CTC'), '')     
  
		Update dtl_patientcontacts Set
				GuardianName = encryptbykey(key_guid('Key_CTC'), 'GName')
			,	GuardianInformation = encryptbykey(key_guid('Key_CTC'), 'GInfo')
			,	EmergContactName = 'EContactName'
			,	EmergContactPhone = ''
			,	EmergContactAddress = 'EAddress'
			,	TenCellLeader = encryptbykey(key_guid('Key_CTC'), 'TCellLeader')
			,	TenCellLeaderAddress = encryptbykey(key_guid('Key_CTC'), 'TCellLeaderAdd')
			,	TreatmentSupportName = 'TSuppName'
			,	CommunitySupportGroup = 'ComSuppGroup'
			,	TreatmentSupportAddress = 'TSuppAddress'       
  
		Update dtl_FamilyInfo Set
				RFirstName = encryptbykey(key_guid('Key_CTC'), 'RFName')
			,	RLastName = encryptbykey(key_guid('Key_CTC'), 'RLName')      
       
	--Update mst_Employee Set
	--		LastName = 'LName'
	--	,	FirstName = 'FName'

	--Update mst_User Set
	--		UserLastName = 'LName'
	--	,	UserFirstName = 'FName'
    
  End      
  
set @Loc = ''  
        
select @Ver = isnull(appver,'') from appadmin where id = 1  
if @LocationId > 0  
    select @Loc = isnull(FacilityName,'') from mst_facility where facilityid = @LocationId  
          
set @dir = 'md ' + @filename              
exec xp_cmdshell @dir              
  
set @dir = 'EXECUTE master.dbo.xp_delete_file 0,N'''+ @FileName+''',N''*.bak'',N'''+convert(varchar,dateadd(dd,-14,getdate()),106)+''''  
exec(@dir)  
      
if @Deidentified = 1   Begin                
     set @FileName = @FileName + '\IQCare-Deidentified-'+ @Ver + ' ' +@Loc+ ' ' + convert(varchar,getdate(),23)+'.bak'               
     print(@FileName)    
     set @InstanceName = 'iqcare_backup_Deidt' + @Loc + convert(varchar,getdate(),23)                
 end              
else  begin      
     set @FileName = @FileName + '\IQCare-'+ @Ver + ' ' + @Loc + ' ' + convert(varchar,getdate(),23) +'.bak'                
     set @InstanceName = 'iqcare_backup' +@Loc+convert(varchar,getdate(),23)                
 end     
  
declare @dbname varchar(100)  
select @dbname= db_name()  
set @TSQL = 'BACKUP DATABASE ['+@dbname+'] TO  DISK = '''+@FileName+''' WITH NOFORMAT, NOINIT,  NAME = '''+@InstanceName+''', SKIP, REWIND, NOUNLOAD, STATS = 10'  
exec(@TSQL)  
      
if @Deidentified = 1   begin      
      
		Update mst_patient Set
				mst_patient.FirstName = encryptbykey(key_guid('Key_CTC'), b.FirstName)
			,	mst_patient.MiddleName = encryptbykey(key_guid('Key_CTC'), b.MiddleName)
			,	mst_patient.LastName = encryptbykey(key_guid('Key_CTC'), b.LastName)
			,	mst_patient.Address = encryptbykey(key_guid('Key_CTC'), b.Address)
			,	mst_patient.Phone = encryptbykey(key_guid('Key_CTC'), b.Phone)
		From #PtnMaster b
		Where mst_patient.Ptn_Pk = b.Ptn_Pk      
      
 

		Update dtl_patientcontacts Set
				dtl_patientcontacts.GuardianName = encryptbykey(key_guid('Key_CTC'), b.GuardianName)
			,	dtl_patientcontacts.GuardianInformation = encryptbykey(key_guid('Key_CTC'), b.GuardianInformation)
			,	dtl_patientcontacts.EmergContactName = b.EmergContactName
			,	dtl_patientcontacts.EmergContactPhone = b.EmergContactPhone
			,	dtl_patientcontacts.EmergContactAddress = b.EmergContactAddress
			,	dtl_patientcontacts.TenCellLeader = encryptbykey(key_guid('Key_CTC'), b.TenCellLeader)
			,	dtl_patientcontacts.TenCellLeaderAddress = encryptbykey(key_guid('Key_CTC'), b.TenCellLeaderAddress)
			,	dtl_patientcontacts.Treatmentsupportname = b.TreatmentSupportName
			,	dtl_patientcontacts.CommunitySupportGroup = b.CommunitySupportGroup
			,	dtl_patientcontacts.TreatmentSupportAddress = b.TreatmentSupportAddress
		From #PtnContacts b
		Where dtl_patientcontacts.ptn_pk = b.ptn_pk   
        
		Update dtl_FamilyInfo Set
				dtl_FamilyInfo.RFirstName = encryptbykey(key_guid('Key_CTC'), b.RFirstName)
			,	dtl_FamilyInfo.RLastName = encryptbykey(key_guid('Key_CTC'), b.RLastName)
		From #PtnRelations b
		Where dtl_FamilyInfo.ptn_pk = b.ptn_pk
		And dtl_familyinfo.Id = b.Id      
      
     Drop Table #PtnMaster      
     Drop Table #PtnContacts      
     Drop Table #PtnRelations      
     Close symmetric key Key_CTC  
  
  end


GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyPatientsExpected]    Script Date: 6/23/2017 2:30:20 PM ******/
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
	--where appreason = @pharmacyReason and (deleteflag = 0 or deleteflag is null) and cast(AppDate as date) = cast(@Date as date)
	where (deleteflag = 0 or deleteflag is null) and cast(AppDate as date) = cast(@Date as date)

	--1 Actual
	select count(*) actual  from ord_patientpharmacyorder 
	where (deleteflag=0 or deleteflag is null) and cast(dispensedbydate as date) = cast(@Date as date)
	
End









GO
