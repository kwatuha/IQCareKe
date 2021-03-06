/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_SaveUpdatePharmacy_CTC_Constella]    Script Date: 11/29/2015 07:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_Pharmacy_SaveUpdatePharmacy_CTC_Constella]                                            
@Ptn_pk int,
@ptn_pharmacy_pk int,
@LocationID int,
@OrderedBy int,
@OrderedByDate datetime,
@UserID int,                                            
@RegimenType varchar(50),
@DispensedBy int,
@DispensedByDate datetime ,
@Signature int,
@EmployeeID int,                                            
@OrderType int,
@HoldMedicine int,
@ProgID int,
@ProviderID int,
@RegimenID INT,
@Prophylaxis int=null,
@flag int                                            
                                            
AS    
Declare @ptn_pharmacy int                                                
Declare @Visit_Pk int                                
Declare @ARTStartDate datetime   
Declare @VisitId int                                                 
if @flag=1
begin                                          
                                              
                                          
if exists(select * from ord_patientpharmacyorder where ptn_pk = @Ptn_pk and orderedbydate = @OrderedByDate and ordertype = 116)                                          
    begin                                          
  if exists(select a.visitid from ord_patientpharmacyorder a inner join ord_Visit b                                      
          on a.visitID=b.Visit_ID where a.ptn_pk=@Ptn_pk and a.orderedBydate=@OrderedByDate and (b.Deleteflag =0 or b.deleteFlag is null ) and a.ordertype = 116)                                      
  begin                                       
   select 0                                          
   return                                          
  end                                       
    end                                          
                                          
 Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,UserID,Createdate)                                                
 Values (@Ptn_pk,@LocationID,@OrderedByDate,4,@UserID,getdate())                                                
                                                 
 set @Visit_Pk = scope_identity();                                    
                                              
 Insert Into ord_PatientPharmacyOrder(Ptn_pk,VisitID,LocationID,OrderedBy,OrderedByDate,DispensedBy,DispensedByDate,OrderType,                                            
 HoldMedicine,ProgID,Signature,EmployeeID,UserID,CreateDate,ProviderID)                                                
 Values (@Ptn_pk,@Visit_Pk,@LocationID,@OrderedBy,@OrderedByDate,@DispensedBy,@DispensedByDate,@OrderType,@HoldMedicine,@ProgID,                                            
 @Signature,@EmployeeID,@UserID,getdate(),@ProviderID)                                                
                                              
set @ptn_pharmacy = scope_identity();
                                               
if(@ProgID=222 or @ProgID=223)                
begin                
                     
 if( @RegimenType <> '')                                    
  begin          
   if(@Prophylaxis=0)        
   begin                                         
   Insert Into dtl_RegimenMap(Ptn_Pk,LocationID,Visit_Pk,RegimenType,OrderId,UserID,CreateDate)                                                
   Values(@Ptn_pk,@LocationID,@Visit_Pk,@RegimenType,@ptn_pharmacy,@UserID,getdate())                                                
   end        
  end          
  if(@Prophylaxis <> 0)                                    
  begin                                           
   Insert Into dtl_RegimenMap(Ptn_Pk,LocationID,Visit_Pk,RegimenType,OrderId,UserID,CreateDate)                                                
   Values(@Ptn_pk,@LocationID,@Visit_Pk,@RegimenType,@ptn_pharmacy,@UserID,getdate())                                                
  end                                        
                      
 set @ARTStartDate= dbo.fn_GetPatientARTStartDate_constella(@Ptn_pk)              
 declare @ARTStart_Date varchar              
 select @ARTStart_Date=artstartdate from mst_patient where ptn_pk=@Ptn_Pk              
          
  update mst_Patient set ARTStartDate=@ARTStartDate where Ptn_Pk=@Ptn_pk              
                                
end           
 declare @ARTCount int            
    select @ARTCount=count(*) from ord_patientpharmacyorder where ptn_pk=@Ptn_pk and progid=222 and (DeleteFlag is null or DeleteFlag=0)            
   if @ARTCount is null and @ARTCount=0            
 begin            
 update mst_Patient set ARTStartDate=null where Ptn_Pk=@Ptn_pk            
 end                                            
 select @ptn_pharmacy                                   
                                                
END 
if @flag=2
begin
                                 
                                    
                                      
 Update [ord_PatientPharmacyOrder] Set [OrderedBy]=@OrderedBy,[OrderedByDate] = @OrderedByDate,[DispensedBy]= @DispensedBy ,                                   
 [DispensedByDate] = @DispensedByDate,[Signature] = @Signature,[EmployeeID] = @EmployeeID,[ProgID]=@ProgID,[HoldMedicine] = @HoldMedicine,                                  
[ProviderId] = @ProviderID,UserID=@UserID,                               
[UpdateDate] = getdate() Where ([ptn_pharmacy_pk] = @ptn_pharmacy_pk)                                         
                  
select @Ptn_Pk = Ptn_Pk, @LocationId = LocationId, @VisitId = @VisitId from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk                          
if(@ProgID=222 or @ProgID=223)          
begin                  
if exists(select ptn_pk from dtl_RegimenMap where OrderId = @ptn_Pharmacy_pk)                  
begin                                     
                        
 Select @RegimenId = RegimenMap_Pk from dtl_regimenmap a,ord_patientpharmacyorder b where a.ptn_pk = b.ptn_pk                                  
 and b.ptn_pharmacy_pk=a.orderID                                   
 and b.Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk   
    
 Update [dtl_RegimenMap] Set [RegimenType]=@RegimenType ,[UpdateDate]=getdate()                                     
 Where ([RegimenMap_Pk] = @RegimenId)       
                        
end                  
else if @RegimenType <>''                  
begin                  
  Insert into [dtl_RegimenMap](Ptn_Pk,LocationId,Visit_Pk,RegimenID,RegimenType,OrderId,DeleteFlag,UserId,CreateDate)                  
  values(@Ptn_Pk,@LocationId,@VisitId,@RegimenID,@RegimenType,@ptn_pharmacy_pk,0,@UserId,getdate())                  
end                  
                 
 declare @VID int                            
 select @VID=VisitID from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk                            
 update ord_Visit set VisitDate=@OrderedByDate where Visit_Id=@VID                            
 set @ARTStartDate=dbo.fn_GetPatientARTStartDate_constella(@Ptn_Pk)         
          
 select @ARTStart_Date=artstartdate from mst_patient where ptn_pk=@Ptn_Pk          
 if @RegimenType <>''         
 begin         
   update mst_Patient set ARTStartDate=@ARTStartDate where Ptn_Pk=@Ptn_Pk          
 end           
                      
end      
else      
begin      
 update mst_Patient set ARTStartDate=dbo.fn_GetPatientARTStartDate_constella(@Ptn_Pk) where Ptn_Pk=@Ptn_Pk       
end                         
select @ptn_pharmacy_pk                                        

end
