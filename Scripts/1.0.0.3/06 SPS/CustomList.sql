IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_InsertCustomField_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Admin_InsertCustomField_Constella]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_Admin_InsertCustomField_Constella]                                                                       
(                           
 @Label varchar(100),                                                                        
 @FeatureID int,                                                                        
 @SectionID int,                                                                        
 @ControlID int,                              
 @flddesc varchar(8000),                                                                     
 @UserID int ,                                                                
 @UnitFlag int,                                                                 
 @Min int,                                                                
 @Max int,                                                                
 @Units varchar(50),                                                              
 @DataType varchar(50),                                                    
 @Size int ,                      
 @DecodeValues  varchar(1000),                      
 @deleteValues varchar(100),                   
 @SystemId int,          
@rowcount  int                                                                
)                      
AS                                                                        
Begin                       
 DECLARE @CustomId int                       
    DECLARE @CodeId int                       
    Declare @FeatureName varchar(100)                                                         
    Declare @TableName varchar(500)                      

INSERT INTO [mst_CustomField]( Label, FeatureID, SectionID, ControlID,FieldDesc,UserID,CreateDate, SystemId,srno)                                                         
        VALUES ( @Label, @FeatureID, @SectionID,@ControlID,@flddesc,@UserID,getDate(),@SystemId,@rowcount)                            
                      
 Select @CustomId = scope_identity()                        
                                                                
 if @UnitFlag = 1  Begin                      
                      
   INSERT INTO [dtl_CustomFieldUnit](CustomFieldID,MinControl,MaxControl,Unit, SystemId)                                                                 
            VALUES(@CustomId,@Min, @Max,@Units, @SystemId)                         
  End                        
                        
                    
 if ((@ControlID = 4) or (@ControlID = 9)) Begin                      
   DECLARE @DecodeName varchar(50)                      
   DECLARE @DeleteValue varchar(50)                      
   DECLARE @srNo int                      
   DECLARE @Start int                      
   DECLARE @End int                      
   DECLARE @Start1 int                      
   DECLARE @End1 int     
   DECLARE @MaxCodeId int    
         	     
 Select @MaxCodeId =CodeId from mst_code where Codeid<201    
                      
    SET IDENTITY_INSERT MST_CODE ON                  
     INSERT INTO [mst_Code] ([CODEID], [Name], [UserID],CreateDate)                                   
         VALUES (@MaxCodeId+1, @Label, @UserID,getDate());    
     SET IDENTITY_INSERT MST_CODE OFF                                   
                               
     --set @CodeId =Ident_Current('mst_Code')    
 set @CodeId =@MaxCodeId+1                          
     update mst_customfield set mstcodeid = @CodeId where customfieldid = @CustomId 
     set @srNo = 1;                      
     Set @Start =  1;                      
     Set @End = charindex ('/n',@DecodeValues);                  
                      
        if @deleteValues = ''                      
    begin                      
       While (@End > 0)                      
      Begin                      
       Set @DecodeName = Substring(@DecodeValues, @Start, @End - @Start);                      
       Set @Start = @End + 2;                      
       Set @End = charindex ('/n',@DecodeValues, @End+1);                      
                      
         INSERT INTO [mst_Decode] ([Name],CodeID,SRNO,UserID,CreateDate, SystemId,Code)                   
                      VALUES(@DecodeName,@CodeID,@srNo,@UserID,getDate(), @SystemId,'LIST') ;                                  
       set @srNo = @srNo + 1;                      
      End                      
    end                      
   Else                      
    begin                      
     Set @Start1 =  1;                      
     Set @End1 = charindex ('/n',@deleteValues);                      
                      
     While (@End > 0)                      
      Begin                      
       Set @DecodeName = Substring(@DecodeValues, @Start, @End - @Start);                 
       Set @Start = @End + 2;                      
       Set @End = charindex ('/n',@DecodeValues, @End+1);                      
                      
       Set @DeleteValue = convert(int,Substring(@deleteValues, @Start1, @End1 - @Start1));                      
       Set @Start1 = @End1 + 2;                      
       Set @End1 = charindex ('/n',@deleteValues, @End1+1);                      
                      
         INSERT INTO [mst_Decode] ([Name],CodeID,SRNO,UserID,CreateDate,DeleteFlag, SystemId, Code)                       
             VALUES(@DecodeName,@CodeID,@srNo,@UserID,getDate(),@DeleteValue, @SystemId, 'LIST') ;                                  
       set @srNo = @srNo + 1;                      
      End                      
    End                      
  End                       
                      
                     
 Select @FeatureName=Replace(Replace(Replace(FeatureName,Space(1),'_'),'-','_'),'/','_') from mst_Feature where FeatureID=@FeatureID   
	if(UPPER(@FeatureName)='PAEDIATRIC_PHARMACY')
	 Begin
		SET @FeatureName='Pharmacy'
	 End                                                      
 if (@ControlID = 9)                      
  Begin                      
   SET @TableName='dtl_CustomField_'+LTRIM(RTRIM(@FeatureName))  + '_' +  @Label                         
  End                      
 Else                       
  Begin                      
                     
   SET @TableName='dtl_CustomField_'+LTRIM(RTRIM(@FeatureName))                          
  End                      
                
 If Exists(Select * from sysobjects  where [Name]=@TableName and xtype='U') ---Not for (@ControlID = 9)                      
  Begin                      
   EXEC('ALTER TABLE '+@TableName +' ADD  ['+ @Label +']  '+@DataType+' ') 
   --PRINT 'ALTER TABLE '+@TableName +' ADD  ['+ @Label +']  '+@DataType+' '                      
  End                      
 Else                      
  Begin                      
                      
   If @FeatureID=5                             
    Begin                             
     EXEC('CREATE TABLE ['+@TableName +'] ( ID int IDENTITY(1,1) , Ptn_pk int NOT NULL ,LocationID int NOT NULL,LabID int ,OrderedbyDate DateTime, ['+@Label+'] '+@DataType+', Primary Key(ID))')                                                
    End                             
   ELSE IF @FeatureID=3 Or @FeatureID=4 or @FeatureID = 72                            
    Begin                                
     EXEC('CREATE TABLE ['+@TableName +'] ( ID int IDENTITY(1,1), Ptn_pk int NOT NULL ,LocationID int NOT NULL,ptn_pharmacy_pk int ,OrderedByDate DateTime, ['+@Label+'] '+@DataType+',  Primary Key(ID))')                                                
    End                            
   ELSE IF @FeatureID=8                             
    Begin                                
     EXEC('CREATE TABLE ['+@TableName +'] ( ID int IDENTITY(1,1), Ptn_pk int NOT NULL ,LocationID int NOT NULL,TrackingId int ,CareendedId int, ['+@Label+'] '+@DataType+',  Primary Key(ID))')                                           
    End                
 ELSE IF @FeatureID=9                             
    Begin                                            
     EXEC('CREATE TABLE ['+@TableName +'] ( ID int IDENTITY(1,1), Ptn_pk int NOT NULL ,LocationID int NOT NULL,HomeVisitId int NOT NULL, ['+@Label+'] '+@DataType+',  Primary Key(ID))')                                                
    End                               
   ELSE                             
    Begin                     
     EXEC('CREATE TABLE ['+@TableName +'] ( ID int IDENTITY(1,1), Ptn_pk int NOT NULL ,LocationID int NOT NULL,Visit_pk int ,Visit_Date DateTime, ['+@Label+'] '+@DataType+',  Primary Key(ID))')                                                
    End                            
  End               
                      
End

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_SaveCustomListMasters_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Admin_SaveCustomListMasters_Constella]
GO

/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetCustomListMastersDetails_Constella]    Script Date: 06/05/2015 11:13:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_GetCustomListMastersDetails_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Admin_GetCustomListMastersDetails_Constella]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetUpdatePriortorizeCustomListMasters_Constella]    Script Date: 06/05/2015 11:13:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_GetUpdatePriortorizeCustomListMasters_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Admin_GetUpdatePriortorizeCustomListMasters_Constella]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetUpdatePriortorizeCustomListMasters_Constella]    Script Date: 06/05/2015 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_GetUpdatePriortorizeCustomListMasters_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_Admin_GetUpdatePriortorizeCustomListMasters_Constella]                                                                  
(                                                                  
 @TableName varchar(50),                                                   
 @Category int = Null,                                                   
 @SRNo varchar(10)= Null,                          
 @SystemId int = Null                                                              
)                                                                  
AS                                                                  
declare @sql varchar(2000)
                                                  
Begin
Set @SRNo = NullIf(@SRNo, '''')
If (@TableName = ''mst_Decode'' 
	Or @TableName = ''mst_PMTCTDecode'' 	
	Or @TableName = ''mst_ModDecode'' 
	Or @TableName = ''mst_PreDefinedFields'' 
	Or @TableName = ''mst_bluedecode'') Begin
	If (@TableName = ''mst_PreDefinedFields'') Begin
		Set @TableName = ''mst_ModDecode''
	End
	Set @sql = ''If Exists(Select UpdateFlag From '' + @TableName + '' Where CodeID = '' + Convert(varchar, @Category) + '' And                                                   
                  SRNo = '' + Convert(varchar, @SRno) + '' And SystemId ='' + Convert(varchar, @SystemId) + '')                                                   
                 Begin                                                  
                    Declare @uflag int                                                   
                    Select @uflag=UpdateFlag from '' + @TableName + '' Where CodeID = '' + Convert(varchar, @Category) + '' And                                                   
                    SRNo = '' + Convert(varchar, @SRno) + '' And SystemId ='' + Convert(varchar, @SystemId) + ''                                                    
                    If (@uflag Is Null )Begin                                                  
                        Select 1 [updateflag] ;
                        return     ;                                             
                      End                                                  
                    Else  Begin                                                  
                        Select 2 [updateflag];
                         return            ;                                       
                      End                                                  
                    End                                                  
                  Else                                                   
                    Begin                                                  
                      Select 0 [updateflag] ;
                      return         ;                                         
                    End''
                    Print @sql;
	Exec (@sql)

End 
	
Else If (@TableName = ''mst_Reason'') Begin
	Set @sql = ''If ExIsts(Select UpdateFlag from '' + @TableName + '' Where CategoryID = '' + Convert(varchar, @Category) + '' And                                                   
                 SRNo = '' + Convert(varchar, @SRno) + '' And SystemId ='' + Convert(varchar, @SystemId) + '')                                                  
                 Begin                                                  
                   Declare @uflag int                                                   
                   Select @uflag=UpdateFlag from '' + @TableName + '' Where CategoryID = '' + Convert(varchar, @Category) + '' And        
                   SRNo = '' + Convert(varchar, @SRno) + '' And SystemId ='' + Convert(varchar, @SystemId) + ''                                                    
                   If (@uflag Is Null) Begin                                                  
                       Select 1 [updateflag];
                        return      ;                                            
                     End                                             
                   Else  Begin                                                 
                        Select 2 [updateflag];
                         return ;                                                  
                   End                                                  
                 End                              
                Else  Begin                                                  
                 Select 0 [updateflag];
                  return     ;                              
             End''
Exec (@sql)

End 
Else If (@TableName = ''mst_Symptom'') Begin
	Set @sql = ''If Exists(Select UpdateFlag from '' + @TableName + '' Where CategoryID = '' + Convert(varchar, @Category) + '' And                                                   
					SRNo = '' + Convert(varchar, @SRno) + ''  And SystemId ='' + Convert(varchar, @SystemId) + '')                                                
				Begin                                                  
					Declare @uflag int  ;                                                 
					Select @uflag=UpdateFlag From '' + @TableName + '' Where CategoryID = '' + Convert(varchar, @Category) 
						+ '' And SRNo = '' + Convert(varchar, @SRno) + '' And SystemId ='' + Convert(varchar, @SystemId) + ''  ;                                                  
					  If (@uflag Is Null)   Begin                                                  
						  Select 1 [updateflag] ;
						  return ;                                                 
					   End 
					   Else  Begin                                                  
						   Select 2 [updateflag] ;
						   return    ;                                               
						End                                                  
					  End                                        
				   Else                                                   
					  Begin                                                  
						 Select 0 [updateflag] ;
						 return  ;                                                
				   End''
	Exec (@sql)
End 
Else If (@TableName = ''mst_HivDIsease'') Begin
	Set @sql = ''If Exists(Select UpdateFlag from '' + @TableName + '' Where SectionID = '' + Convert(varchar, @Category) + '' And                                                   
					 SRNo = '' + Convert(varchar, @SRno) + ''  And SystemId ='' + Convert(varchar, @SystemId) + '')             
		 Begin                                                  
		 Declare @uflag int  ;                                                 
		 Select @uflag=UpdateFlag from '' + @TableName + '' Where SectionID = '' + Convert(varchar, @Category) + '' And                                                   
		 SRNo = '' + Convert(varchar, @SRno) + '' And SystemId ='' + Convert(varchar, @SystemId) + ''                                                    
         If (@uflag Is Null) Begin                                                  
			Select 1 [updateflag] 
			return    ;                                              
          End                                                  
		  Else Begin                         
			Select 2 [updateflag] ;
			return   ;                                                
		  End                                                  
        End                   
		Else  Begin                                                  
			Select 0 [updateflag];
			 return     ;                                             
		End''
	Exec (@sql)

End 

Else If (@TableName = ''mst_LabDepartments'') Begin
	Select 0 UpdateFlag;	
	Return;
End
Else Begin
Set @sql = ''If ExIsts (Select UpdateFlag from '' + @TableName + '' Where SRNo = '' + Convert(varchar, @SRNo) + '' And  SystemId ='' + Convert(varchar, @SystemId) + '')                                                
        If ((Select UpdateFlag from '' + @TableName + '' Where SRNo = '' + Convert(varchar, @SRNo) + '' And  SystemId ='' + Convert(varchar, @SystemId) + '')Is Null)                              
        Begin                                                  
           Select 1 [UpdateFlag];
            return  ;                                                
        End                                 
                 Else                                                  
  Begin                                                  
          Select 2 [UpdateFlag];
           return   ;                                                
       End                           
                                    
      Else                            
      Begin                                                  
        Select 0 [UpdateFlag];
         return      ;                                             
      End''
Exec (@sql)

end

End' 
END
GO
/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetCustomListMastersDetails_Constella]    Script Date: 06/05/2015 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_GetCustomListMastersDetails_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_Admin_GetCustomListMastersDetails_Constella]                                    
(                                    
 @TableName varchar(50),                                    
 @ID int,                          
 @SystemId int                          
                           
                                   
)                                    
AS                                    
declare @sql varchar(2000)
                                    
BEGIN

Set Nocount On;

If @TableName = ''mst_Reason'' Or @TableName = ''mst_Symptom'' Begin
Set @sql = ''SELECT ID,CategoryId, Name,Code,UserID,DeleteFlag,SRNO from '' + @TableName + '' where ID= '' + Convert(varchar, @ID)
End 
Else If @TableName = ''mst_Decode'' Or @TableName = ''mst_pmtctdecode'' Begin
Set @sql = ''SELECT ID,CodeId, Name, Code,UserID,DeleteFlag,SRNO from '' + @TableName + '' where SystemId in (0, '' + Convert(varchar, @SystemId) + '') and ID= '' + Convert(varchar, @ID)
End 
Else If @TableName = ''mst_ModDecode'' Begin
Set @sql = ''SELECT ID,CodeId, Name, Code,UserID,DeleteFlag,SRNO from '' + @TableName + '' where SystemId in (0, '' + Convert(varchar, @SystemId) + '') and ID= '' + Convert(varchar, @ID)
End 
Else If @TableName = ''mst_HivDisease'' Or @TableName = ''mst_BreastStatus'' Or @TableName = ''mst_CervixStatus'' Or @TableName = ''mst_DeliveryOutcome'' Or @TableName = ''mst_MothersCondition'' Or @TableName = ''mst_ARVSideEffects'' Begin
Set @sql = ''SELECT ID, Name, Code,UserID,DeleteFlag,SRNO from '' + @TableName + '' where SystemId in (0, '' + Convert(varchar, @SystemId) + '') and ID= '' + Convert(varchar, @ID)
End
Else If @TableName = ''mst_AidsDefEvents'' Begin
Set @sql = ''SELECT ID, Name, UserID,Code,Stage, DeleteFlag,SRNO from '' + @TableName + ''                              
                     where SystemId = '' + Convert(varchar, @SystemId) + '' and ID= '' + Convert(varchar, @ID)
End
--------------------------------------Added Naveen 28-Dec-2010---------------------------------------        
Else If @TableName = ''mst_PreDefinedFields'' Begin
Set @sql = ''SELECT ID,CodeId, Name, Code,UserID,DeleteFlag,SRNO from mst_ModDecode where ID= '' + Convert(varchar, @ID)
End 
Else If @TableName = ''mst_Frequency'' Begin
Set @sql = ''SELECT ID, Name, UserID,DeleteFlag ,SRNO,multiplier from '' + @TableName + '' where ID= '' + Convert(varchar, @ID)
End
Else IF (@TableName = ''mst_LabDepartments'')                            
Begin                            
 Select @sql = ''SELECT LabDepartmentID ID,0 CodeId, LabDepartmentName Name, 0 Code, UserID,DeleteFlag ,LabDepartmentID SRNO From mst_LabDepartment Where LabDepartmentID = ''  +Convert(varchar, @ID)  
                                 
End 
-------------------------------------------------------------------------                         
Else Begin
Set @sql = ''SELECT ID, Name, UserID,DeleteFlag ,SRNO from '' + @TableName + '' where ID= '' + Convert(varchar, @ID)
End

Exec (@sql)
print (@sql)         

End' 
END
GO

/****** Object:  StoredProcedure [dbo].[Pr_Admin_SaveCustomListMasters_Constella]    Script Date: 06/05/2015 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_SaveCustomListMasters_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[Pr_Admin_SaveCustomListMasters_Constella]                                                                                                                           
	@TableName varchar(50),                                                                                                                              
	@Name Varchar(50),                  
	@ListName Varchar(100),                                                                                                  
	@Sequence int ,                                                                                                                              
	@Category int = 0,                                                                                                                              
	@UserId int=NULL ,                                                                                                
	@SystemId int=null,                                                    
	@Code Varchar(10)=null,                                                                                          
	@Stage Varchar(10)=null,                          
	@CID int=null,        
	@ModuleID int=null,  
	@multiplier int=null                                                                                                    
As
Begin
                                                                                                        
declare @sql varchar(5000),@Seq int,@PredefinedId int;                                                                           
                                                                                                                          
--------------------------------Validation---------------------------------                                      
  
                                                                                              
	If (@Category = 0)   Begin                    
		If (@TableName = ''mst_Decode'' or @TableName =''mst_PMTCTDecode'' or @TableName =''mst_ModDecode'')                     
		Begin
			Set @sql = ''If Exists(Select 1 From '' + @TableName + '' Where name ='''''' + @name + '''''' And deleteflag <> 1 And CodeId ='' + Convert(varchar, @Category) + '' And SystemId = '' + Convert(varchar, @SystemId) + '')                                                            
			 Begin                                                        
			   Raiserror(''''Duplicate Name found. Try Again.'''',16,1) ;                                         
			   Return; ;                                                           
			 End''
		End 
		Else If (@TableName = ''mst_LabDepartments'') Begin
			Set @sql =  ''If Exists(Select 1 From mst_LabDepartment Where LabDepartmentName =''''''+ @Name +'''''' And DeleteFlag <> 1) Begin
				Raiserror(''''Duplicate lab department name  found. Try again.'''',16,1);
				Return;;
			End;'';
		End
		Else Begin
			Set @sql = ''If Exists(Select * From  '' + @TableName + ''  Where name ='''''' + @name + '''''' And deleteflag <> 1  And SystemId = '' + Convert(varchar, @SystemId) + '')                                                            
				 Begin                                                        
				   raiserror(''''Duplicate Name found. Try Again.'''',16,1)                                          
				   Return;                                                            
				 End''
		End
		If @Code <> '''' Begin
			Set @sql = @sql + '' If Exists(Select * From  '' + @TableName + ''  Where code ='''''' + @code + ''''''  And deleteflag <> 1)  Begin                                                     
			  Raiserror(''''Duplicate Code found. Try Again.'''',16,1)    ;                                
			 Return;     ;                                  
			 End''
		End
	End 

	Else Begin
		Declare @Tsql varchar(200);
		Select 
			@Tsql = Case 
						When @tableName In (''mst_Decode'', ''mst_blueDecode'',''mst_ModDecode'',''mst_PMTCTDecode'') Then '' CodeId = ''
						When @tableName In (''mst_Symptom'',''mst_Reason'') Then  '' CategoryId = '' 
						When @tableName = ''mst_HIVDisease'' Then '' SectionId = ''
			End;
		If (@TableName = ''mst_Decode'' And @ModuleId Is Not Null) Begin
			Set @sql = ''If Exists(Select * From  '' + @TableName + ''  Where name ='''''' + @name + '''''' And deleteflag <> 1                                    
			   And '' + @Tsql + '''' + Convert(varchar, @Category) + '' And ModuleId='' + Convert(varchar, @ModuleId) + '')                                                         
			   Begin                                                    
				   Raiserror(''''Duplicate Name found. Try Again.'''',16,1)                                      
				   Return;                                                        
			   End''

			If (@Code <> '''') Begin
				Set @sql = @sql + '' If Exists(Select * From  '' + @TableName + ''  Where code ='''''' + @code + '''''' And deleteflag <> 1                                    
					  And '' + @Tsql + '''' + Convert(varchar, @Category) + '' And ModuleId='' + Convert(varchar, @ModuleId) + '')                                                                          
				   Begin                                                     
					 Raiserror(''''Duplicate Code found. Try Again.'''',16,1)                                                        
					 Return;                                       
				   End''
			End
		End 
		Else Begin
			Set @sql = ''If Exists(Select * From  '' + @TableName + ''  Where name ='''''' + @name + '''''' And deleteflag <> 1 And '' + @Tsql + '''' + Convert(varchar, @Category) + '')                                                        
			   Begin                                                    
				   Raiserror(''''Duplicate Name found. Try Again.'''',16,1)                                      
				   Return;                                                        
			   End''
			If (@Code <> '''') Begin
				Set @sql = @sql + '' If Exists(Select * From  '' + @TableName + ''  Where code ='''''' + @code + '''''' And deleteflag <> 1 And '' + @Tsql + '''' + Convert(varchar, @Category) + '')                                                                          
				  Begin                                                     
					Raiserror(''''Duplicate Code found. Try Again.'''',16,1)                                                        
					Return;     
				  End''
			End
		End
	End
	--Print @sql;
	--If (@sql <> '''') Exec (@sql);
	--Select @sql='''';
--------------------------------Sequence ----------------------------------                        

	If (@TableName = ''mst_Decode'' Or @TableName = ''mst_bluedecode'') Begin ----------- CodeId  		       
		If (@TableName = ''mst_Decode'' And @ModuleId Is Not Null) Begin
			Set @sql = @sql + ''                 
				If Exists(Select 1 From '' + @tablename + '' Where srno = '' + Convert(varchar, @sequence) + '' And  CodeId = '' + Convert(varchar, @Category) + '' And SystemId In(0, '' + Convert(varchar, @SystemId) + '')         
				And ModuleId='' + Convert(varchar, @ModuleId) + '')  
				Begin                                             
					Update '' + @Tablename + '' Set SRNO = SRNO + 1  Where SRNO >= '' + Convert(varchar, @sequence) + '' And CodeId = '' + Convert(varchar, @Category) + ''                                             
					And SystemId In(0, '' + Convert(varchar, @SystemId) + '') And ModuleId='' + Convert(varchar, @ModuleId) + ''   ;                                                   
					Declare @Seq int Set @Seq = '' + Convert(varchar, @sequence) + '' ;                                            
				 End                                                                        
				 Else Begin                                                               
					 declare @maxSRNO int Set @Seq = '' + Convert(varchar, @sequence) + ''  ;                                                                      
					 Select @maxSRNO = MAX(SRNo) From '' + @tablename + ''  Where CodeId = '' + Convert(varchar, @Category) + '' And deleteflag = 0 And ModuleId='' + Convert(varchar, @ModuleId) + ''         
					If('' + Convert(varchar, @sequence) + ''> @maxSRNO)  Begin                                                               
						Set @Seq = @maxSRNO+1  ;                                                             
					End                                                                         
				End''
		End 
		Else Begin
			Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + '' Where srno = '' + Convert(varchar, @sequence) + '' And  CodeId = '' + Convert(varchar, @Category) + '' And SystemId In(0, '' + Convert(varchar, @SystemId) + ''))                                                             
			  Begin                                             
					Update '' + @Tablename + '' Set SRNO = SRNO + 1  Where SRNO >= '' + Convert(varchar, @sequence) + '' And CodeId = '' + Convert(varchar, @Category) + ''                                             
					And SystemId In(0, '' + Convert(varchar, @SystemId) + '') ;                                                     
					declare @Seq int Set @Seq = '' + Convert(varchar, @sequence) + '' ;                                            
			  End                                                                        
			  Else Begin                                                               
				 declare @maxSRNO int Set @Seq = '' + Convert(varchar, @sequence) + '' ;                                                                       
				 Select @maxSRNO = MAX(SRNo) From '' + @tablename + ''  Where CodeId = '' + Convert(varchar, @Category) + '' And deleteflag = 0  ;
				 If('' + Convert(varchar, @sequence) + ''> @maxSRNO) Begin                                                               
					Set @Seq = @maxSRNO+1  ;                                                             
				  End      
			  End''
		End 
	End
	Else If (@TableName = ''mst_PMTCTDecode'' Or @TableName = ''mst_ModDecode'') Begin ----------- CodeId	
		Set @sql = @sql + '' If Exists(Select * From '' + @tablename + '' Where srno = '' + Convert(varchar, @sequence) + '' And  CodeId = '' + Convert(varchar, @Category) + '' And SystemId In(0, '' + Convert(varchar, @SystemId) + '')) 
		Begin                                             
			Update '' + @Tablename + '' Set SRNO = SRNO + 1  Where SRNO >= '' + Convert(varchar, @sequence) + '' And CodeId = '' + Convert(varchar, @Category) + ''                                             
			And SystemId In(0, '' + Convert(varchar, @SystemId) + '') ;                       
			declare @Seq int Set @Seq = '' + Convert(varchar, @sequence) + ''     ;                                        
		End                                                                        
      Else Begin                                                               
		declare @maxSRNO int Set @Seq = '' + Convert(varchar, @sequence) + '' ;                                                                       
		Select @maxSRNO = MAX(SRNo) From '' + @tablename + ''  Where CodeId = '' + Convert(varchar, @Category) + '' And deleteflag = 0 ; 
		If('' + Convert(varchar, @sequence) + ''> @maxSRNO)   Begin                                                               
			Set @Seq = @maxSRNO+1  ;                       
		End                                                                         
     End''
	End 
	Else If @TableName = ''mst_Symptom'' Or @TableName = ''mst_Reason'' Begin ---------- CategoryId                                                                                                                    
		Set @sql = @sql + ''If Exists(Select 1 From '' + @tablename + '' Where srno = '' + Convert(varchar, @sequence) + '' And CategoryId = '' + Convert(varchar, @Category) + ''                                            
                    And SystemId In(0, '' + Convert(varchar, @SystemId) + ''))                                                                                                                                
            Begin                                               
				Update '' + @Tablename + '' Set SRNO = SRNO + 1 Where SRNO >= '' + Convert(varchar, @Sequence) + '' And CategoryId = '' + Convert(varchar, @Category) + ''                                             
				And SystemId In(0, '' + Convert(varchar, @SystemId) + '')  ;                                          
				declare @Seq int  ;                                           
				Set @Seq = '' + Convert(varchar, @Sequence) + ''  ;                                           
			End                 
			Else Begin                                             
			 declare @maxSRNO int ;                                            
			 Set @Seq = '' + Convert(varchar, @Sequence) + ''                                             
			 Select top 1  @maxSRNO = srno From '' + @tablename + '' Where CategoryId = '' + Convert(varchar, @category) + '' And SystemId In(0, '' + Convert(varchar, @SystemId) + '') Order by srno desc  ;                                                         
			 If('' + Convert(varchar, @Sequence) + ''>@maxSRNO)  Begin                                             
                Set @Seq = @maxSRNO+1  ;                                            
              End                                             
            End''
	End 
	Else If @TableName = ''mst_HIVDisease'' Begin ------- SectionId    
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + '' Where srno = '' + Convert(varchar, @sequence) + '' And SectionId = '' + Convert(varchar, @Category) + '') Begin                                                                              
			Update '' + @Tablename + '' Set SRNO = SRNO + 1 Where SRNO >= '' + Convert(varchar, @Sequence) + '' And SectionId = '' + Convert(varchar, @Category) + ''                                            
			   And SystemId In(0, '' + Convert(varchar, @SystemId) + '')  ;                                                                                          
			declare @Seq int  ;                                           
			Set @Seq = '' + Convert(varchar, @Sequence) + ''   ;                                         
			End                                                                                                        
			Else Begin                                             
				 declare @maxSRNO int;                                             
				 Set @Seq = '' + Convert(varchar, @Sequence) + '' ;                                            
				 Select top 1  @maxSRNO = srno From '' + @tablename + '' Where SectionId = '' + Convert(varchar, @category) + '' And SystemId In(0, '' + Convert(varchar, @SystemId) + '') Order by srno desc;                                                                              
				 If('' + Convert(varchar, @Sequence) + ''>@maxSRNO)  Begin                                             
					 Set @Seq = @maxSRNO+1   ;                                           
				 End                                            
		  End''
	End 
	Else If ((@TableName = ''mst_AidsDefEvents'') Or (@Code <> '''')) Begin -------- StageId   
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + '' Where srno = '' + Convert(varchar, @sequence) + '' And SystemId In(0, '' + Convert(varchar, @SystemId) + ''))                                                                        
						Begin     
			 Update '' + @Tablename + '' Set SRNO = SRNO + 1  Where SRNO >= '' + Convert(varchar, @sequence) + '' And   SystemId In(0, '' + Convert(varchar, @SystemId) + '') ;                                                     
			 declare @Seq int  ;                                           
			 Set @Seq = '' + Convert(varchar, @sequence) + ''   ;                                          
			End                                                             
			 Else Begin                                             
				  declare @maxSRNO int  ;                                           
					  Set @Seq = '' + Convert(varchar, @sequence) + ''  ;                                           
				   Select top 1  @maxSRNO = max(srno) From '' + @tablename + ''  ;                                                                                  
				   If('' + Convert(varchar, @sequence) + ''> @maxSRNO)  Begin                                             
					Set @Seq = @maxSRNO+1   ;                                           
				   End                                                                                
			End''
	End 
	Else If (@TableName <> ''mst_LabDepartments'') Begin
		Set @sql = @sql + ''                 
		 If Exists(Select * From '' + @TableName + '' Where SRNO = '' + Convert(varchar, @Sequence) + '' )                                                                                                                                
		 Begin                                                                               
		  Update '' + @TableName + '' Set SRNO = SRNO + 1 Where SRNO >= '' + Convert(varchar, @Sequence) + ''                                                                                                      
		  declare @Seq int Set  @Seq = '' + Convert(varchar, @Sequence) + ''                                                                               
		 End                                                                                    
		 Else                                                                               
		 Begin                                             
		  declare @maxSRNO int                                             
		  Set @Seq = '' + Convert(varchar, @sequence) + ''                                             
		  Select top 1  @maxSRNO = max(srno) From '' + @tablename + ''                                                                                    
		  If('' + Convert(varchar, @sequence) + ''> @maxSRNO)                                             
		  Begin                                             
		   Set @Seq = @maxSRNO+1                                              
		  End                                                                                
		 End''
	End
	--Print @sql;
	--If (@sql <> '''') Exec (@sql);
	--Select @sql='''';
---------------------------Save In Table -------------------------------------------                                                  


	If (@TableName = ''mst_Decode'')Begin
		If (@ModuleId Is Not Null) Begin
			Set @sql = @sql + '' Insert Into '' + @tablename + ''(Name,SystemId,SRNO,CodeId,UserId,DeleteFlag,CreateDate,Code,ModuleId)                                                   
				Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''',@Seq,'''''' + Convert(varchar, @Category) + '''''',                                             
				'''''' + Convert(varchar, @UserId) + '''''', 0 ,'''''' + Convert(varchar, Getdate()) + '''''','''''' + @Code + '''''','''''' + Convert(varchar, @ModuleId) + '''''')  ;                                                                         
				Select '' + Convert(varchar, @Category) + ''[CategoryId];'';
		End 
		Else Begin
			Set @sql = @sql + '' Insert Into '' + @tablename + ''(Name,SystemId,SRNO,CodeId,UserId,DeleteFlag,CreateDate,Code)                                                                                                       
			   Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''',@Seq,'''''' + Convert(varchar, @Category) + '''''',                                             
				'''''' + Convert(varchar, @UserId) + '''''', 0 ,'''''' + Convert(varchar, Getdate()) + '''''','''''' + @Code + '''''') ;                                                                          
				Select '' + Convert(varchar, @Category) + ''[CategoryId];'';
		End
	End
	Else If (@TableName = ''mst_bluedecode'') Begin
		Set @sql = @sql + '' Insert Into '' + @tablename + ''(Name,SystemId,SRNO,CodeId,UserId,DeleteFlag,CreateDate)                                                                                                       
		 Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''',@Seq,'''''' + Convert(varchar, @Category) + '''''',                                             
			 '''''' + Convert(varchar, @UserId) + '''''', 0 ,'''''' + Convert(varchar, Getdate()) + '''''') ;                                                                          
			 Select '' + Convert(varchar, @Category) + ''[CategoryId];'';
	End
	Else If (@TableName = ''mst_ModDecode'') Begin
		If (@Category = 0) Begin
			Select @PredefinedId = Id	From mst_predefinedfields	Where PdfName = @ListName;
			If (@PredefinedId <> 0 Or @PredefinedId Is Not Null) Begin
				Set @sql = @sql + '' Insert Into mst_Modcode(FieldId,DeleteFlag,Predefined,UserId,CreateDate)                                                                                                       
				Values('''''' + Convert(varchar, @PredefinedId) + '''''',0,1,'''''' + Convert(varchar, @UserId) + '''''','''''' + Convert(varchar, Getdate()) + '''''') ;'' ;
			End
			Set @sql = @sql + '' Insert Into '' + @tablename + ''(Name,SystemId,SRNO,CodeId,UserId,DeleteFlag,CreateDate,Code)                                                                                                       
			Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''',@Seq,ident_current(''''dbo.mst_Modcode''''), 
			'''''' + Convert(varchar, @UserId) + '''''', 0 ,'''''' + Convert(varchar, Getdate()) + '''''','''''' + @Code + '''''') ;   
			Select max(CodeId)[CategoryId] From  mst_Modcode;'';
		End 
		Else Begin
			Set @sql = @sql + '' Insert Into '' + @tablename + ''(Name,SystemId,SRNO,CodeId,UserId,DeleteFlag,CreateDate,Code)                                                                                              
			Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''',@Seq,'''''' + Convert(varchar, @Category) + '''''',                               
			 '''''' + Convert(varchar, @UserId) + '''''', 0 ,'''''' + Convert(varchar, Getdate()) + '''''','''''' + @Code + '''''') ;                                                                          
			 Select '' + Convert(varchar, @Category) + ''[CategoryId];'';
		End
	End 
	Else If (@TableName = ''mst_PMTCTDecode'') Begin
		Set @sql = @sql + ''                                       
				 Insert Into '' + @tablename + ''(Name,SystemId,SRNO,CodeId,UserId,DeleteFlag,CreateDate,Code)                                                                                                       
		Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''',@Seq,'''''' + Convert(varchar, @Category) + '''''',                                             
				 '''''' + Convert(varchar, @UserId) + '''''', 0 ,'''''' + Convert(varchar, Getdate()) + '''''','''''' + @Code + '''''')  ;                                                                         
				 Select '' + Convert(varchar, @Category) + ''[CategoryId];'';
	End 
	Else If (@TableName = ''mst_Reason'' Or @TableName = ''mst_Symptom'') Begin
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + '' Where name = '''''' + @name + '''''' And CategoryId = '' + Convert(varchar, @Category) + ''                                        
		 And SystemId = '' + Convert(varchar, @SystemId) + '' )                                                                                                            
		 Begin                                             
		  Select 0 ;                                            
		 Return;                                             
		 End                                                                     
		 Else  Begin                                             
		  Insert Into '' + @tablename + ''(Name,SRNO,CategoryId,UserId,DeleteFlag,CreateDate,Code,SystemId)                                                                                                               
		  Values('''''' + @Name + '''''',@Seq,'' + Convert(varchar, @Category) + '','' + Convert(varchar, @UserId) + '', 0 ,'''''' + Convert(varchar, Getdate()) + '''''',                                            
		  '''''' + @Code + '''''','' + Convert(varchar, @SystemId) + '') ;                                                      
		  Select '' + Convert(varchar, @Category) + ''[CategoryId];                                             
		 End''
	End 
	Else If (@TableName = ''mst_HIVDisease'') Begin
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + '' Where name = '''''' + @name + '''''' And SectionId = '' + Convert(varchar, @Category) + '') Begin                         
		Select 0 ;                                            
		Return;                                             
		End                                                     
		Else Begin                                             
		  Insert Into '' + @tablename + ''(Name,SRNO,SectionId,SystemId,UserId,DeleteFlag,CreateDate)                                                                                           
		  Values('''''' + @Name + '''''',@Seq,'' + Convert(varchar, @Category) + '','' + Convert(varchar, @SystemId) + '','' + Convert(varchar, @UserId) + '', 0 ,'''''' + Convert(varchar, Getdate()) + '''''')   ;                                                     
		  Select '' + Convert(varchar, @Category) + ''[CategoryId] ;                                            
		End''
	End 
	Else If (@TableName = ''mst_AidsDefEvents'') Begin
		Set @sql = @sql + ''If Exists(Select 1 From '' + @tablename + '' Where Name = '''''' + @name + '''''' And SystemId = '' + Convert(varchar, @SystemId) + '') Begin                                             
				  Select 0 ;                                            
				  Return;                                             
			End                                                                                      
			Else  Begin                                             
			 Insert Into '' + @tablename + ''(Name,SystemId, SRNO, UserId,DeleteFlag,CreateDate,Code, Stage)                                                                
			 Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''', @Seq  ,'' + Convert(varchar, @UserId) + '', 0 ,'''''' + Convert(varchar, Getdate()) + '''''',                                            
			 '''''' + @Code + '''''', '''''' + @Stage + '''''') ;                                                                          
			 Select * From '' + @tablename + '' ;                                            
			 End''
	End 
	Else If (@TableName = ''mst_Frequency'') Begin
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + '' Where name = '''''' + @name + '''''' And SystemId = '' + Convert(varchar, @SystemId) + '')                                                                   
		 Begin                                             
		  Select 0  ;                                           
		  Return;                                             
		 End                                                                                      
		 Else  Begin                                             
		 Insert Into '' + @tablename + ''(Name,SystemId, SRNO, UserId,DeleteFlag,CreateDate,multiplier)                                                                
		 Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''', @Seq  ,'' + Convert(varchar, @UserId) + '', 0 ,'''''' + Convert(varchar, Getdate()) + '''''',                                            
		 '''''' + Convert(varchar, @multiplier) + '''''') ;                                                                          
		 Select * From '' + @tablename + ''    ;                                         
		 End''
	End 
	Else If (@TableName = ''mst_LabDepartments'') Begin
		Set @sql = @sql +''If Not Exists(Select 1 From mst_LabDepartment Where LabDepartmentName = ''''''+ @Name+ '''''' And DeleteFlag<> 1) Begin
			Insert Into mst_LabDepartment(LabDepartmentName,DeleteFlag,UserID,CreateDate)
			Values(''''''+@Name + '''''',0,''+ Convert(varchar,@UserID) + '',''''''+ Convert(varchar,getdate()) +'''''');
			Select * From mst_LabDepartment;
			Return;
		End
		Else Begin
			Select 0;
			Return;
		End'';
	End
	Else If (@Code <> '''') Begin---- Code   
		Set @sql = @sql + ''                 
		 If Exists(Select * From '' + @tablename + '' Where name = '''''' + @name + '''''' And SystemId = '' + Convert(varchar, @SystemId) + '')                                                                   
		 Begin                                             
		  Select 0                                             
		 Return;                                             
		 End                                                                                      
		 Else                                             
		 Begin                 
		  Insert Into '' + @tablename + ''(Name,SystemId, SRNO, UserId,DeleteFlag,CreateDate,Code)                                                     
		  Values('''''' + @Name + '''''','''''' + Convert(varchar, @SystemId) + '''''', @Seq  ,'' + Convert(varchar, @UserId) + '', 0 ,'''''' + Convert(varchar, Getdate()) + '''''',                                            
		  '''''' + @Code + '''''')                                                                           
		  Select * From '' + @tablename + ''                                            
		 End''
	End 
	Else If @CID <> 99 And @CID <> 0 Begin
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + ''  Where name = '''''' + @name + '''''' )                           
		 Begin                                                      
		  Select 0                                             
		 Return;                                                      
		 End                                                                                      
		 Else                                            
		 Begin                                            
		  Insert Into '' + @TableName + ''(Name,  SRNO,UserId,SystemId, DeleteFlag,CreateDate,Countryid)                                                
		  Values('''''' + @Name + '''''',@Seq, '' + Convert(varchar, @UserId) + '', '' + Convert(varchar, @SystemId) + '', 0,'''''' + Convert(varchar, Getdate()) + '''''','' + Convert(varchar, @CID) + '') ;                                                             
		  Select * From '' + @TableName + ''   ;                                      
		 End''
	End 
	Else Begin
		Set @sql = @sql + '' If Exists(Select 1 From '' + @tablename + ''  Where name = '''''' + @name + '''''' )                                                                                      
		 Begin                                                
		  Select 0  ;                                           
		 Return;                                                      
		 End                                                                                      
		 Else                                            
		 Begin                                            
		  Insert Into '' + @TableName + ''(Name,  SRNO,UserId,SystemId, DeleteFlag,CreateDate)                                                
		  Values('''''' + @Name + '''''',@Seq, '' + Convert(varchar, @UserId) + '', '' + Convert(varchar, @SystemId) + '', 0,'''''' + Convert(varchar, Getdate()) + '''''');                                                                                          
		  Select * From '' + @TableName + '' ;                                                            
		 End''
  End

--Print (@sql)
If (@sql <> '''') Exec (@sql);
End' 
END
GO

/****** Object:  StoredProcedure [dbo].[Pr_Admin_GetCustomListMasters_Constella]    Script Date: 06/05/2015 11:13:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Admin_GetCustomListMasters_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Admin_GetCustomListMasters_Constella]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pr_Admin_GetCustomListMasters_Constella]                                                                                  
(                                                                                  
 @TableName varchar(50),                                                                                  
 @CategoryType int=0,                                                              
 @SystemId int                                
                                                                                  
)                                                                                  
AS                                                                                  
declare @sql varchar(2000)         
declare @SRsql varchar(max)                                                                                 
BEGIN                                                                                  
                                                                                  
 SET NOCOUNT ON;                                                                                  
         
 set @SRsql = ' 
 IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''' +@TableName +''') AND type in (N''U''))     Begin
   if Exists(select * from sys.columns where Name = N''codeid'' and Object_ID = Object_ID(N'''+ @TableName +'''))      
   Begin      
   Declare @SQLST varchar(max)      
      
   SET @SQLST = ''      
   if exists(select * from ' + @TableName + ' where srno=0 and SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+')        
     Begin        
     Declare @max int        
             
     Select @max=MAX(SRNo) from ' + @TableName + ' where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+'          
               
                declare @ID int         
                                   
                declare SRIDs cursor                     
                for                    
                Select ID from '+@TableName+' where srno=0 and SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+'                    
                open SRIDs                    
                fetch next from SRIDs into @ID                    
                while @@Fetch_Status = 0                    
                begin                    
                                    
                 update '+@TableName+' set SRNO=@max+1 where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+' and ID=@ID        
                  PRINT(@max+1)        
      SET @max=@max+1                      
                  fetch next from SRIDs into @ID                    
                end                     
              close SRIDs                    
              deallocate SRIDs         
        
            End''      
       EXEC(@SQLST)       
         End      
   ELSE      
    Begin  SET @SQLST = ''      
   if exists(select * from ' + @TableName + ' where srno=0 and SystemId in ('+convert(varchar,@SystemId)+',0))  Begin        
     Declare @max int        
             
     Select @max=MAX(SRNo) from ' + @TableName + ' where SystemId in ('+convert(varchar,@SystemId)+',0)          
               
                declare @ID int         
                                   
                declare SRIDs cursor                     
                for                    
                Select ID from '+@TableName+' where srno=0 and SystemId in ('+convert(varchar,@SystemId)+',0)                    
                open SRIDs                    
                fetch next from SRIDs into @ID                    
                while @@Fetch_Status = 0                    
                begin                    
                                    
                 update '+@TableName+' set SRNO=@max+1 where SystemId in ('+convert(varchar,@SystemId)+',0) and ID=@ID        
                  PRINT(@max+1)        
      SET @max=@max+1                      
         fetch next from SRIDs into @ID                    
                end                     
              close SRIDs                    
              deallocate SRIDs         
        
            End''      
       EXEC(@SQLST)      
    End End'      
print(@SRsql)         
EXEC(@SRsql)                                                         
                                                                                  
 if   @TableName = 'mst_symptom' --- CategoryId                                                                         
       begin                                                                                  
  set @sql =   'SELECT A.ID, A.CategoryId, B.ICDCodeId, C.Code+'' ''+C.Name[ICDCodeName], A.Name, A.UserID, Status = Case A.DeleteFlag  when 0     
       then ''Active'' when 1 then ''InActive'' end, A.SRNO, A.Code from ' + @TableName + ' A left outer join dbo.lnk_DiseaseICDCode B on  A.ID=B.DiseaseId      
       left outer join dbo.mst_ICDCodes C on B.ICDCodeId=C.Id where Categoryid = '+ convert(varchar,@CategoryType) +' and     
       A.SystemId in ('+convert(varchar,@SystemId)+',0) order by A.DeleteFlag, A.SRNO, A.Name'              
  end    
else if @TableName = 'mst_Reason'    
    begin     
    set @sql =  'SELECT ID,CategoryId, Name, UserID,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO,Code from ' + @TableName + ' where Categoryid = '                                                                  
     +  convert(varchar,@CategoryType) + ' and SystemId in ('+convert(varchar,@SystemId)+',0) order by DeleteFlag,SRNO,Name'                                                                                  
       end                                                                          
    
 else if @TableName = 'mst_Decode' ---CodeId                                                                       
       begin       
          if Exists(select * from sys.columns where Name = N'ModuleId'      
            and Object_ID = Object_ID(N'mst_Decode'))    
   begin                                                                     
    set @sql =  'SELECT ID,CodeId, Name,ModuleId, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                      
                       where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+' order by DeleteFlag,SRNO,Name'    
      End    
          Else    
           Begin    
    set @sql =  'SELECT ID,CodeId, Name, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                      
                       where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+' order by DeleteFlag,SRNO,Name'    
     End                                                              
       end                                
  
else if @TableName = 'mst_bluedecode' ---CodeId                                                                     
       begin                                                                      
           set @sql =  'SELECT ID,CodeId, Name, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                    
                       where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+' order by DeleteFlag,SRNO,Name'                                                                      
       end          
  
else if @TableName = 'mst_PMTCTDecode' ---CodeId                                                                       
       begin                                                                        
           set @sql =  '        
      SELECT ID,CodeId, Name, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                      
                       where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+' order by DeleteFlag,SRNO,Name'                                                                        
       end                                                                
                          
else if @TableName = 'mst_ModDecode' ---CodeId                       
       begin                                                                        
           set @sql =  'SELECT ID,CodeId, Name, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                      
                       where SystemId in ('+convert(varchar,@SystemId)+',0) and codeid = '+convert(varchar,@CategoryType)+' order by DeleteFlag,SRNO,Name'                                                                        
       end                                                                
                          
 else if @TableName = 'mst_AidsDefEvents'  -----Stage                                                           
 begin                                                            
          set @sql = 'SELECT ID, Name, UserID,Code,Stage,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                            
                     where SystemId in ('+convert(varchar,@SystemId)+',0) order by DeleteFlag,SRNO, Name'                                                                                
       end                                            
 else  if @TableName = 'mst_HivDisease' ------------Section                                                          
       begin              
    set @sql = 'SELECT A.ID, B.ICDCodeId, C.Code+'' ''+C.Name[ICDCodeName], A.Name, A.UserID, Status = Case A.DeleteFlag  when 0     
       then ''Active'' when 1 then ''InActive'' end, A.SRNO, A.Code from ' + @TableName + ' A left outer join dbo.lnk_DiseaseICDCode B on  A.ID=B.DiseaseId      
       left outer join dbo.mst_ICDCodes C on B.ICDCodeId=C.Id where A.SectionId = 1 and A.SystemId in ('+convert(varchar,@SystemId)+',0)    
       order by A.DeleteFlag, A.SRNO, A.Name'                                                        
              
--   set @sql = 'SELECT ID, Name, UserID,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO, Code from ' + @TableName + '                                                                  
--                     where SectionId = 1 and SystemId in ('+convert(varchar,@SystemId)+',0) order by DeleteFlag,SRNO, Name'                                                                                  
       end                                                                  
                                   
else if @TableName = 'mst_BreastStatus' or @TableName = 'mst_CervixStatus' or @TableName = 'mst_DeliveryOutcome' or @TableName = 'mst_MothersCondition'                                 
 begin                                                            
          set @sql = 'SELECT ID, Name, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                                            
                     where SystemId in ('+convert(varchar,@SystemId)+',0) order by DeleteFlag,SRNO, Name'                                                                                  
       end                              
else if @TableName = 'mst_tbregimen'                            
 begin                            
  set @sql = 'SELECT ID, Name, UserID,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                      
                    order by DeleteFlag,SRNO,Name'                            
 end                         
--------------------------------Added Naveen-28-Dec-2010------------------------------------                        
else if @TableName = 'mst_PreDefinedFields'                            
 begin                            
  set @sql = 'SELECT ID,CodeId, Name, UserID,Code,Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from mst_ModDeCode      
     where codeid in ('+ convert(varchar,@CategoryType) +')                                       
              order by DeleteFlag,SRNO,Name'                            
 end           
 else if @TableName = 'mst_LabDepartments'                            
 begin                            
 Select @sql = 'SELECT LabDepartmentID ID,0 CodeId, LabDepartmentName Name, UserID,0 Code,Status = Case DeleteFlag  When 0 Then ''Active'' When 1 Then ''InActive'' End ,Row_number() Over (Order by LabDepartmentName Asc) SRNO From mst_LabDepartment '    
                                 
 end                    
----------------------------------------------------------------------------------------------                                 
else  ----- Other Tables                                            
       begin                                                                                  
           set @sql = 'SELECT ID, Name, UserID,''''[Code],Status = Case DeleteFlag  when 0 then ''Active'' when 1 then ''InActive'' end ,SRNO from ' + @TableName + '                                      
               where SystemId in ('+convert(varchar,@SystemId)+',0) order by DeleteFlag,SRNO,Name'                                                                                  
       end                                                                                                                            
exec (@sql)                         
--print (@sql)                                                                                  
END

GO
