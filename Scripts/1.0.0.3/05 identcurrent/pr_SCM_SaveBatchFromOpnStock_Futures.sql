/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveBatchFromOpnStock_Futures]    Script Date: 11/29/2015 08:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_SCM_SaveBatchFromOpnStock_Futures]        
@BatchName varchar(100),  
@UserId int  ,
@ItemID int, 
@ExpiryDatetime datetime
  
AS            
BEGIN         
--0      
  Declare @SRNo int  
  select @SRNo=Max(SRNO) from mst_batch where DeleteFlag=0  
    
  Insert into mst_batch(Name, DeleteFlag, SRNo, UserId, CreateDate ,ItemID ,ExpiryDate)  
  values(@BatchName, 0, @SRNo+1, @UserId, getdate(),@ItemID ,@ExpiryDatetime)  
    
  Select scope_identity() [BatchId];  
  Select * from mst_batch where DeleteFlag=0  
  
END
