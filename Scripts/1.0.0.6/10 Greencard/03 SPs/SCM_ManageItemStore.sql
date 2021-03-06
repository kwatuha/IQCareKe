
/****** Object:  StoredProcedure [dbo].[SCM_ManageItemStore]    Script Date: 4/10/2018 9:57:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 
-- Description:	Insert - update Item store
-- =============================================
ALTER PROCEDURE [dbo].[SCM_ManageItemStore] 
	-- Add the parameters for the stored procedure here
	@Id int=NULL,              
	@StoreId varchar(100)=NULL, 
	@LocationId int ,                     
	@Name varchar(100)=NULL,      
	@StoreCategory varchar(100)=NULL,                     
	@DeleteFlag bit,   
	@Active bit,                   
	@SRNo varchar(10)=NULL,                   
	@CentralStore varchar(10)=NULL ,      
	@DispensingStore varchar(10)=Null,                
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@StoreCategory = 'Purchasing and Dispensing')
	begin
		Set @CentralStore = 1
		Set @DispensingStore = 1
	end
	else
	begin
		Set @CentralStore = Case When @CentralStore='No' then 0                
			When @CentralStore='Yes' then 1 End             
		Set @DispensingStore = Case When @DispensingStore='No' then 0                
			When @DispensingStore='Yes' then 1 End      
	end     
              
    -- Insert statements for procedure here
	If (@Id Is Null ) Or Not Exists(Select Id From Mst_Store Where Id = @Id)  Begin                   
		Insert Into Mst_Store (
				Name
			,	LocationId
			,	StoreId
			,	CentralStore
			,	DispensingStore
			,	DeleteFlag
			,	Active
			,	SRNo
			,	UserId
			,	CreateDate
			,	StoreCategory)
		Values (
				@Name
			,	@LocationId
			,	@StoreId
			,	@CentralStore
			,	@DispensingStore
			,	@DeleteFlag
			,	@Active
			,	@SRNo
			,	@UserId
			,	getdate()
			,	@StoreCategory)                         
     End                  
	Else  Begin                  
		Update Mst_Store Set
				Name = @Name
			,	StoreId = @StoreId
			,	CentralStore = @CentralStore
			,	DispensingStore = @DispensingStore
			,	StoreCategory = @StoreCategory
			,	DeleteFlag = @DeleteFlag
			,	Active = @Active
			,	SRNo = @SRNo
			,	UserId = @UserId
			,	UpdateDate = getdate()
		Where (Id = @Id)               
     End                
END

