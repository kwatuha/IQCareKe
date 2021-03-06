/****** Object:  UserDefinedFunction [dbo].[fn_Billing_GenerateReceiptNumber]    Script Date: 12/11/2014 16:19:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_GenerateReceiptNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_GenerateReceiptNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_getBillID]    Script Date: 12/11/2014 16:19:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_getBillID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_getBillID]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_GetItemPriceOnDate]    Script Date: 12/11/2014 16:19:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_GetItemPriceOnDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_GetItemPriceOnDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PatientAvailableDeposit]    Script Date: 12/11/2014 16:19:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PatientAvailableDeposit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_PatientAvailableDeposit]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FormatRegimen]    Script Date: 12/11/2014 16:19:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_FormatRegimen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_FormatRegimen]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FormatRegimen]    Script Date: 12/11/2014 16:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_FormatRegimen]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[fn_FormatRegimen](@Regimen VARCHAR(100))

RETURNS VARCHAR(50)

AS
BEGIN
      DECLARE @Formatted VARCHAR(50)
      
      SET @Formatted = @Regimen     
      
      --Order the regimens
      DECLARE @SplitRegimens TABLE( Item VARCHAR(10))
      DECLARE @item VARCHAR(10), @Pos INT, @Ordered VARCHAR(50), @delim VARCHAR(2)
      
      SET @delim = ''/''
      
      SET @Formatted = @Formatted + @Delim
      SET @pos = CHARINDEX(@delim, @Formatted, 1)
      WHILE @pos > 0
      BEGIN
            SET @item = LTRIM(RTRIM(LEFT(@Formatted, @pos - 1)))
            IF @item <> '''' INSERT INTO @SplitRegimens VALUES (CAST(@item AS VARCHAR(10)))
            
            SET @Formatted = SUBSTRING(@Formatted, @pos+1, LEN(@Formatted))
            
            SET @pos = CHARINDEX(@delim, @Formatted, 1)
      END
      SELECT @Ordered = COALESCE(@Ordered + @delim,'''') + item
      FROM (SELECT DISTINCT TOP 10 Item FROM @SplitRegimens ORDER BY Item) t

      RETURN Isnull(@Ordered,'''')
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PatientAvailableDeposit]    Script Date: 12/11/2014 16:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PatientAvailableDeposit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njunge
-- Create date: Oct 27 2014
-- Description:	Get the Availble deposit for a patient
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_PatientAvailableDeposit] 
(
	-- Add the parameters for the function here
	@PatientID int,
	@LocationID int
)
RETURNS decimal(9,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Balance decimal(9,2);

	-- Add the T-SQL statements to compute the return value here
	Select 
		@Balance = Sum(Case TransactionType When ''Credit'' Then 1.0* Amount Else -1.0* Amount End )
	From dtl_BillDepositTransaction 
	Where Ptn_PK = @PatientID 
	And LocationID = @LocationID;
	-- Return the result of the function
	RETURN @Balance;

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_getBillID]    Script Date: 12/11/2014 16:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_getBillID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-May-28
-- Description:	Gets the patients current open BillID
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_getBillID](@patientID int) RETURNS int

AS
BEGIN
	-- Declare the return variable here
return(	SELECT TOP 1 BillID from mst_Bill where ptn_pk=@patientID and BillStatus=1)

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_GenerateReceiptNumber]    Script Date: 12/11/2014 16:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_GenerateReceiptNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 2014-10-22
-- Description:	Get the Transaction Receipt Number
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_GenerateReceiptNumber] 
(

)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	

	declare  @StartMonth datetime, @EndMonth datetime, @SettledAmount decimal(18,2), @BillAmount decimal(18,2);
		Select	
			@StartMonth = Dateadd(Month, Datediff(Month, 0, Getdate()), 0),
			@EndMonth = Dateadd(Month, 1, Getdate() - Day(Getdate()));
		
		Declare @Bill_Index Int, @Space Int,@Receipt_Number Varchar(50) ,@ItemCount int;
		Set @Space = 8;
		Select @Bill_Index= Count(TransactionID)+1 From dbo.ord_bill Where TransactionDate Between  @StartMonth And @EndMonth;

		Set @Space = @Space - Len(@Bill_Index);

		Select @Receipt_Number = Replace(Convert(varchar(7),Getdate(),102),''.'','''')+''-'' + Replicate(''0'', @Space)+  Convert(VarChar,@Bill_Index); 
		

	-- Return the result of the function
	RETURN @Receipt_Number

END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PriceList]    Script Date: 03/10/2015 11:45:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PriceList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Billing_PriceList]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Billing_PriceList]    Script Date: 03/10/2015 11:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Billing_PriceList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: March 09 2015
-- Description:	Get Price List on a given date
-- =============================================
CREATE FUNCTION [dbo].[fn_Billing_PriceList] 
(
	-- Add the parameters for the function here
	@ItemID int = null, 
	@ItemTypeID int = null,
	@PriceDate datetime = null
)
RETURNS 
@PriceTable TABLE 
(
	-- Add the column definitions for the TABLE variable here
	ItemID int, 
	ItemTypeID int,
	ItemName varchar(250),
	ItemTypeName varchar(250),
	PriceOnDate decimal(18,2),
	PriceDate datetime,
	IsCurrentPrice bit,
	PriceAge int,
	PriceIndex int,
	PharmacyPriceType bit,	
	VersionStamp bigint,	
	CurrentPrice decimal(18,2),
	CurrentPriceDate datetime,
	CurrentPriceType bit
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	Select @PriceDate = Isnull(@PriceDate,Getdate());
	With PriceList As (
	Select	
			CC.ItemId,
			CC.ItemType ItemTypeID,
			ML.ItemName,
			ML.ItemTypeName,
			CC.ItemSellingPrice PriceOnDate,
			CC.EffectiveDate PriceDate,
			Convert(bit,CC.PriceStatus) IsCurrentPrice,
			Abs(Datediff(dd,@PriceDate,cc.EffectiveDate))PriceAge,
			CC.statusDate,
			Isnull(CC.PharmacyPriceType, 0) PharmacyPriceType,
			CC.VersionStamp,				
			Row_number() Over(Partition By Checksum(cc.ItemId,CC.ItemType) Order by Abs(Datediff(dd,@PriceDate,cc.EffectiveDate)) Asc) PriceIndex,
			ML.PriceDate CurrentPriceDate,
			ML.UnitSellingPrice CurrentPrice ,
			ML.PharmacyPriceType CurrentPriceType
	From dbo.lnk_ItemCostConfiguration CC
	Inner Join
		dbo.vw_Master_ItemList ML On ML.ItemID = CC.ItemId
		And ML.ItemTypeID = CC.ItemType
	Where 
	Case When @ItemId Is Null OR @ItemID=CC.ItemId  Then 1 Else 0 End =1
	And Case	When  @ItemTypeID Is Null OR CC.ItemType= @ItemTypeID Then 1 Else 0 End = 1		
	And (Dateadd(dd, 0, Datediff(dd, 0, CC.EffectiveDate)) <= @PriceDate)
	And CC.DeleteFlag = 0
	And ML.DeleteFlag=0)
	Insert Into @PriceTable
	(
		ItemID , 
		ItemTypeID ,
		ItemName ,
		ItemTypeName ,
		PriceOnDate ,
		PriceDate ,
		IsCurrentPrice ,
		PriceAge ,
		PriceIndex,
		VersionStamp,
		PharmacyPriceType ,			
		CurrentPrice ,
		CurrentPriceDate ,
		CurrentPriceType 
	)
	Select
		ItemID,
		ItemTypeID,
		ItemName ,
		ItemTypeName ,
		PriceOnDate ,
		PriceDate ,
		IsCurrentPrice ,
		PriceAge ,
		PriceIndex,
		VersionStamp,		
		PharmacyPriceType ,	
		CurrentPrice ,
		CurrentPriceDate ,
		CurrentPriceType 
	From PriceList -- Where PriceIndex = 1;
		--Select * From PriceList  Where DaysDiff = 1
		--;
	RETURN 
END
' 
END
GO


/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTStartDate_futures]    Script Date: 01/13/2016 09:11:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientFirstLineARTStartDate_futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientFirstLineARTStartDate_futures]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTStartDate_futures]    Script Date: 01/13/2016 09:11:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_GetPatientFirstLineARTStartDate_futures]                
(                
@Ptn_Pk as int                
)                
Returns datetime                
as                
                
begin
                
declare @StartDate datetime;
Select Top 1 @StartDate = a.DispensedByDate
From	ord_PatientPharmacyOrder a,
		dtl_RegimenMap b
Where a.ptn_pk = b.Ptn_Pk
	And a.ptn_pharmacy_pk = b.orderid
	And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
	And a.regimenline In (1, 2)
	And a.ProgID In (222, 223)
	And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
	And a.ptn_pk = @ptn_pk
	And a.dispensedbydate Is Not Null
	And b.regimentype Is Not Null
	And b.regimentype <> ''
Order By a.dispensedbydate Asc

Return @StartDate
End
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]    Script Date: 01/13/2016 09:13:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientFirstLineARTRegimen_Futures]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]    Script Date: 01/13/2016 09:13:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_GetPatientFirstLineARTRegimen_Futures]              
(              
@Ptn_Pk as int              
)              
Returns varchar(200)              
as              
              
begin
              
declare @Regimen varchar(200);

Select Top 1 @Regimen = b.regimentype
From	ord_PatientPharmacyOrder a,
		dtl_RegimenMap b
Where a.ptn_pk = b.Ptn_Pk
	And a.ptn_pharmacy_pk = b.orderid
	And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
	And a.regimenline In (1, 2)
	And a.ProgID In (222,223)
	And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
	And a.ptn_pk = @ptn_pk
	And a.dispensedbydate Is Not Null
	And b.regimentype Is Not Null
	And b.regimentype <> ''
Order By a.dispensedbydate Asc

Return @Regimen
End
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStartDate_Constella]    Script Date: 01/13/2016 09:12:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientARTStartDate_Constella]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientARTStartDate_Constella]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientARTStartDate_Constella]    Script Date: 01/13/2016 09:12:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_GetPatientARTStartDate_Constella]          
(          
@Ptn_Pk as int          
)          
Returns datetime          
as          
          
begin
          
declare @StartDate datetime;
Select Top 1 @StartDate = a.DispensedByDate
From	ord_PatientPharmacyOrder a,
		dtl_RegimenMap b
Where a.ptn_pk = b.Ptn_Pk
	And a.ptn_pharmacy_pk = b.orderid
	And (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
	And (b.DeleteFlag = 0 Or b.DeleteFlag Is Null)
	And a.ptn_pk = @ptn_pk
	And a.ProgId In (222,223)
	And a.dispensedbydate Is Not Null
	And b.regimentype Is Not Null
	And b.regimentype <> ''
Order By a.dispensedbydate Asc

Return @StartDate
End
GO


/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientAgeInYearsMonth]    Script Date: 5/12/2016 5:21:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetPatientAgeInYearsMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetPatientAgeInYearsMonth]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetPatientAgeInYearsMonth]    Script Date: 5/12/2016 5:21:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_GetPatientAgeInYearsMonth]    
(    
   @Ptn_Pk int  
)    
returns varchar(25)    
as    
Begin    
  
   declare @DeathDate datetime
   declare @DOB datetime 
   declare @Age decimal(5,2);--varchar(10)
   declare @ReturnValue varchar(25);
   select @DeathDate = a.DeathDate from dtl_patientcareended a 
   inner join mst_patient b on a.ptn_pk = b.ptn_pk
   where b.status = 1 and a.careended = 1 and a.ptn_pk = @Ptn_Pk

   select @DOB = Dob from mst_patient where ptn_pk = @Ptn_Pk

   if (@DeathDate is not null or @DeathDate > '1900-01-01')    begin
        select @Age = convert(decimal(5,2),round(cast(datediff(dd,@DOB,@DeathDate)/365.25 as decimal(5,2)),2))
     end  
   else     begin
		select @Age = convert(decimal(5,2),round(cast(datediff(dd,@DOB,getdate())/365.25 as decimal(5,2)),2))
     end  

	 declare @ageYears int;
	 Select @ageYears = floor(@Age);
	 declare @ageMonths int;
	 select @ageMonths = CEILING(@Age - @ageYears)*12

	 Select @ReturnValue = CONVERT(varchar,@age) + ' Yrs ' + CONVERT(varchar,@ageMonths) + ' Mths'

  return @ReturnValue
End

GO
 /****** Object:  UserDefinedFunction [dbo].[GetLookupValues]    Script Date: 6/27/2016 11:18:23 AM ******/
 IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLookupValues]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetLookupValues]
GO

/****** Object:  UserDefinedFunction [dbo].[GetLookupValues]    Script Date: 6/27/2016 11:18:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetLookupValues]
(
	-- Add the parameters for the function here
	@CodeID int,
	@TableName varchar(30),
	@SystemId int = 1
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	Declare @ResultVar as varchar(max)
	Select @ResultVar =  
	Case @TableName
		When 'mst_DeCode'		Then	Stuff( (  Select ';'+ Name From dbo.mst_DeCode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		When 'Mst_PMTCTDeCode'  Then	Stuff( (  Select ';'+ Name From dbo.Mst_PMTCTDeCode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by  t2.SRNo  For XML Path('')  ),1,1,'') 
		When 'Mst_YesNo'		Then    Stuff( (  Select ';'+  Name From dbo.Mst_YesNo t2 Where t2.DeleteFlag= 0 For XML Path('')  ),1,1,'') 
		When 'Mst_ModDeCode'	Then    Stuff( (  Select ';'+ Name From dbo.Mst_ModDeCode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by t2.SRNo  For XML Path('')  ),1,1,'') 
		When 'Mst_BlueDecode'	Then	Stuff( (  Select ';'+ Name From dbo.Mst_BlueDecode t2 Where t2.CodeID=@CodeID And t2.DeleteFlag= 0 order by  t2.SRNo  For XML Path('')  ),1,1,'') 		
		When 'Mst_Employee'	Then	Stuff( (  Select ';'+ t2.FirstName + ' '+ t2.LastName From dbo.mst_Employee t2 Where t2.DeleteFlag= 0 order by  t2.SRNo  For XML Path('')  ),1,1,'') 
		when 'Mst_ARVSideEffects'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_ARVSideEffects t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'mst_LostFollowReason'Then	Stuff( (  Select ';'+ t2.Name From dbo.mst_LostFollowReason t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'Mst_HIVDisease'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_HIVDisease t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'Mst_Education'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_Education t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'Mst_LPTF'Then	Stuff( (  Select ';'+ t2.Name From dbo.Mst_LPTF t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'mst_Symptom'Then	Stuff( (  Select ';'+ t2.Name From dbo.mst_Symptom t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
		when 'mst_Reason'Then	Stuff( (  Select ';'+ t2.Name From dbo.mst_Reason t2  Where t2.DeleteFlag= 0 order by  t2.SRNo For XML Path('')  ),1,1,'') 
	End
	Return @ResultVar

End


GO
/****** Object:  UserDefinedFunction [dbo].[GetLookupName]    Script Date: 7/29/2016 6:34:19 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLookupName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetLookupName]
GO

/****** Object:  UserDefinedFunction [dbo].[GetLookupName]    Script Date: 7/29/2016 6:34:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create FUNCTION [dbo].[GetLookupName]
(
	-- Add the parameters for the function here
	@CodeID int,
	@TableName varchar(30)
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	Declare @ResultVar as varchar(max)
	Select @ResultVar =  
	Case @TableName
		When 'mst_DeCode'			Then	(Select Top 1 Name From mst_Code Where CodeID = @CodeId)
		When 'Mst_PMTCTDeCode'		Then	(Select Top 1 Name From mst_pmtctCode Where CodeID = @CodeId) 
		When 'Mst_ModDeCode'		Then	(Select Top 1 Name From mst_ModCode Where CodeID = @CodeId) 
		When 'Mst_BlueDecode'		Then	(Select Top 1 Name From mst_BlueCode Where CodeID = @CodeId)  
		 
	End
	Return @ResultVar

End

GO

