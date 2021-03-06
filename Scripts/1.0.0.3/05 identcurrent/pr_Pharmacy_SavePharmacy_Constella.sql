/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_SavePharmacy_Constella]    Script Date: 11/29/2015 07:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_Pharmacy_SavePharmacy_Constella]                                      
@Ptn_pk int,@LocationID int,@OrderedBy int,@OrderedByDate datetime,@UserID int,                                      
@RegimenType varchar(50),@DispensedBy int=null,@DispensedByDate datetime=null ,@Signature int,@EmployeeID int,                                      
@OrderType int,@HoldMedicine int,@ProgID int,@ProviderID int,@PeriodTaken int,@Prophylaxis int=null                                         
                                      
AS                                          
                                      
Declare @ptn_pharmacy int                                          
Declare @Visit_Pk int                          
Declare @ARTStartDate datetime                                          
                                          
BEGIN                                          
                                      
if exists(select * from ord_patientpharmacyorder where ptn_pk = @Ptn_pk and orderedbydate = @OrderedByDate and ordertype = 116)                                    
    begin                                    
  if exists(select a.visitid from ord_patientpharmacyorder a inner join ord_Visit b                                
          on a.visitID=b.Visit_ID where a.ptn_pk=@Ptn_pk and a.orderedBydate=@OrderedByDate and (b.Deleteflag =0 or b.deleteFlag is null ) and a.ordertype = 116)                                
  begin                                 
   select 0                                    
   return                                    
  end                                 
    end                                    
                                    
 if(@DispensedByDate is null or @DispensedByDate='' )       
 begin                              
  Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,UserID,Createdate)                                        
  Values (@Ptn_pk,@LocationID,@OrderedByDate,4,@UserID,getdate())            
    end      
  if(@DispensedByDate is not null)       
 begin                              
  Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,UserID,Createdate,DataQuality)                                        
  Values (@Ptn_pk,@LocationID,@OrderedByDate,4,@UserID,getdate(),1)            
    end                                      
                                           
 set @Visit_Pk = scope_identity()    ;                                
                                        
 Insert Into ord_PatientPharmacyOrder(Ptn_pk,VisitID,LocationID,OrderedBy,OrderedByDate,DispensedBy,DispensedByDate,OrderType,                                      
 HoldMedicine,ProgID,Signature,EmployeeID,UserID,CreateDate,ProviderID,PharmacyPeriodTaken)                                          
 Values (@Ptn_pk,@Visit_Pk,@LocationID,@OrderedBy,@OrderedByDate,@DispensedBy,@DispensedByDate,@OrderType,@HoldMedicine,@ProgID,                                      
 @Signature,@EmployeeID,@UserID,getdate(),@ProviderID,@PeriodTaken)                                          
                                        
set @ptn_pharmacy = scope_identity() ;                                       
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
