
/****** Object:  StoredProcedure [dbo].[Pr_SCM_SaveStockforAdjustment_Futures]    Script Date: 11/29/2015 08:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Pr_SCM_SaveStockforAdjustment_Futures]                                            
@AdjustmentId int=NULL,                
@AdjustReasonId int=NULL,                
@LocationId int = NULL,                
@StoreId int = NULL,                
@AdjustmentPreparedBy int = NULL,                
@AdjustmentAuthorisedBy int = NULL,                
@Updatestock int = NULL,                
@ItemId int = NULL,                   
@BatchId int = NULL,            
@ExpiryDate datetime = NULL,         
@PurchaseUnit int = NULL,                
@AdjustmentQuantity int = NULL,              
@AdjustmentDate datetime = NULL,                
@UserId int = NULL               
as                                             
BEGIN                
              
if not exists(Select AdjustId from Ord_AdjustStock Where StoreId=@StoreId and AdjustmentDate=@AdjustmentDate)              
 Begin                
  Insert into Ord_AdjustStock(LocationId, StoreId, AdjustmentDate, AdjustmentPreparedBy, AdjustmentAuthorisedBy,Updatestock)                 
  values(@LocationId, @StoreId, getdate(), @AdjustmentPreparedBy, @AdjustmentAuthorisedBy, @Updatestock)                
  Select scope_identity() [AdjustId]                
 End              
else               
 Begin             
  Select AdjustId from Ord_AdjustStock Where StoreId=@StoreId and AdjustmentDate=@AdjustmentDate            
 End            
 Insert into Dtl_AdjustStock(AdjustId, ItemId, StoreId, BatchId,ExpiryDate, PurchaseUnit, AdjustReasonId, AdjustmentQuantity,UpdateStock)                
 values(@AdjustmentId, @ItemId, @StoreId, @BatchId, @ExpiryDate, @PurchaseUnit, @AdjustReasonId, @AdjustmentQuantity,@Updatestock)               
 if (@Updatestock = 1)              
 Begin              
 Insert into dtl_StockTransaction(ItemId, BatchId,ExpiryDate,StoreId,TransactionDate, Quantity, UserId, CreateDate, UpdateDate)              
 values(@ItemId,@BatchId,@ExpiryDate,@StoreId, getdate(), @AdjustmentQuantity,@UserId,getdate(),getdate())              
 End               
            
End
