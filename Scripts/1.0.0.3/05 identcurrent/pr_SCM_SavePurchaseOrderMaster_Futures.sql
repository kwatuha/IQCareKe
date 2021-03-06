/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePurchaseOrderMaster_Futures]    Script Date: 11/29/2015 07:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pr_SCM_SavePurchaseOrderMaster_Futures]       ( 
	@LocationID  int,        
	@SupplierID int ,        
	@OrderDate datetime ,        
	@AuthorizedBy int,        
	@PreparedBy int=null,        
	@Status int,        
	@SourceStoreID int,        
	@DestinStoreID int,        
	@UserID int,  
	--@IsRejectedStatus bit =0,  
	@IsUpdate bit =0,  
	@Poid int =0       
) 
as         
Begin
         
	declare @temPoId int;
        
	if(@IsUpdate =0 )  begin
		Insert Into ord_PurchaseOrder (
			LocationID,
			SupplierID,
			OrderDate,
			AuthorizedBy,
			PreparedBy,
			Status,
			SourceStoreID,
			DestinStoreID,
			UserID,
			CreateDate)
		Values (
			@LocationID,
			@SupplierID,
			@OrderDate,
			@AuthorizedBy,
			@PreparedBy,
			@Status,
			@SourceStoreID,
			@DestinStoreID,
			@UserID,
			Getdate() );
		Set @temPoId = scope_identity();
		Update ord_PurchaseOrder Set
			OrderNo = 'PO-' + Convert(varchar(100), @temPoId)
		Where POID = @temPoId;
	End 
	Else Begin
		Update ord_PurchaseOrder Set
			AuthorizedBy = @AuthorizedBy,
			PreparedBy = @PreparedBy,
			Status = @Status,
			DestinStoreID = @DestinStoreID,
			UpdateDate = Getdate()
		Where POId = @Poid;
		Set @temPoId = @Poid;
	End
	Select @temPoId
End