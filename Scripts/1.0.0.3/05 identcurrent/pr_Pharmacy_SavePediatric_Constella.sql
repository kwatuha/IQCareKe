/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_SavePediatric_Constella]    Script Date: 11/29/2015 07:40:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_Pharmacy_SavePediatric_Constella]                          
(                          
 @Ptn_pk int,                          
 @LocationID int,                          
 @OrderedBy int,                          
 @OrderedByDate datetime,                          
 @VisitType int,                          
 @UserID int,                           
 @RegimenType varchar(50),                          
 @DispensedBy int=null,                          
 @DispensedByDate datetime=null,                          
 @OrderType int,                          
 --@Signature bit,                          
 @Signature int,                          
 @EmployeeID int,                          
 @Height decimal(8,1),                          
 @Weight numeric(8,1),                           
 @FDC int,                  
 @ProgID int,            
 @ProviderID int,
 @PeriodTaken int                         
                           
)                          
                          
As                          
Declare @ptn_pharmacy int,@Visit_Pk int,@ARTStartDate datetime                            
                          
Begin                          
                          
if exists(select * from ord_patientpharmacyorder where ptn_pk = @Ptn_pk and orderedbydate = @OrderedByDate and ordertype = 117)                          
    begin                          
  begin                        
  if exists(select a.visitid from ord_patientpharmacyorder a inner join ord_Visit b                    
          on a.visitID=b.Visit_ID where a.ptn_pk=@Ptn_pk and a.orderedBydate=@OrderedByDate and (b.Deleteflag =0 or b.deleteFlag is null ) and a.ordertype = 117)                    
  begin                     
   select 0                        
   return                        
  end                     
    end                        
    end                          
Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,UserID,Createdate)                            
 Values (@Ptn_pk,@LocationID,@OrderedByDate,@VisitType,@UserID,getdate())                            
 set @Visit_Pk = scope_identity()                           
               
--print "Height---  " @Height              
                         
 Insert Into dbo.ord_PatientPharmacyOrder(Ptn_pk,VisitID,LocationID,OrderedBy,OrderedByDate,DispensedBy,DispensedByDate,OrderType,Height,Weight,FDC,ProgID,Signature,EmployeeID,UserID,CreateDate,ProviderID,PharmacyPeriodTaken)                            
 Values (@Ptn_pk,@Visit_Pk,@LocationID,@OrderedBy,@OrderedByDate,@DispensedBy,@DispensedByDate,@OrderType,@Height,@Weight,@FDC,@ProgID,@Signature,@EmployeeID,@UserID,getdate(),@ProviderID,@PeriodTaken)                            
                          
 set @ptn_pharmacy = scope_identity()                            
                            
 Insert Into dtl_RegimenMap(Ptn_Pk,LocationID,Visit_Pk,RegimenType,OrderId,UserID,CreateDate)                            
 Values(@Ptn_pk,@LocationID,@Visit_Pk,@RegimenType,@ptn_pharmacy,@UserID,getdate())                            
      
set @ARTStartDate=dbo.fn_GetPatientARTStartDate_constella(@Ptn_pk)      
update mst_Patient set ARTStartDate=@ARTStartDate where ptn_pk = @Ptn_pk     
                          
 select @ptn_pharmacy                             
                          
End
