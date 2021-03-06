SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledTask]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledTask](
	[TaskName] [varchar](50) NOT NULL,
	[LastRunDate] [datetime] NULL,
	[NextRunDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ScheduledTask] PRIMARY KEY CLUSTERED 
(
	[TaskName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[dtl_BillCreditVoucher]    Script Date: 9/1/2016 2:03:16 PM ******/
		
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_featureBusinessRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_FeatureBusinessRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NOT NULL,
	[BusRuleId] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Value1] [varchar](1000) NULL,
	[SetType] [int] NULL,
 CONSTRAINT [PK_lnk_featureBusinessRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FeatureID] ASC,
	[BusRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[dtl_PatientClinicalNotes]    Script Date: 5/12/2016 5:33:48 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientClinicalNotes]') AND type in (N'U'))
Begin
	If Not exists (Select * From sys.columns Where Name = N'VersionStamp' And Object_ID = Object_id(N'dtl_PatientClinicalNotes'))    
	Begin
		ALTER TABLE [dbo].[dtl_PatientClinicalNotes] DROP CONSTRAINT [PK_dtl_PatientClinicalNotes]	
	  Exec dbo.sp_rename 'dtl_PatientClinicalNotes', 'dtl_PatientClinicalNotes_Old'
	end
End
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientClinicalNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientClinicalNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[Visit_pk] [int] NOT NULL,
	[ModuleId] [int] NULL,
	[UserId] [int] NOT NULL,
	[ClinicalNotes] [varchar](8000) NOT NULL,
	[DeleteFlag] [int] NOT NULL CONSTRAINT [DF_dtl_PatientClinicalNotes_DeleteFlag]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[ModifiedFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_PatientClinicalNotes_ModifiedFlag]  DEFAULT ((0)),
	[ModifiedBy] [int] NULL,
	[VersionStamp] [timestamp] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_dtl_PatientClinicalNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_dtl_PatientClinicalNotes]    Script Date: 5/12/2016 5:33:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientClinicalNotes]') AND name = N'IX_dtl_PatientClinicalNotes')
CREATE NONCLUSTERED INDEX [IX_dtl_PatientClinicalNotes] ON [dbo].[dtl_PatientClinicalNotes]
(
	[Ptn_pk] ASC,
	[Visit_pk] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[dtl_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientWardAdmission](
	[AdmissionID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[WardID] [int] NOT NULL,
	[ReferredFrom] [varchar](50) NOT NULL,
	[AdmissionDate] [datetime] NOT NULL,
	[AdmittedBy] [int] NOT NULL,
	[BedNumber] [varchar](10) NULL,
	[ExpectedDischargeDate] [datetime] NULL,
	[ActualDischargeDate] [datetime] NULL,
	[DischargedBy] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NULL CONSTRAINT [DF_DTL_PatientWardAdmission_DeleteFlag]  DEFAULT ((0)),
	[Discharged]  AS (CONVERT([bit],case when [ActualDischargeDate] IS NULL then (0) else (1) end,(0))) PERSISTED,
 CONSTRAINT [PK_DTL_PatientWardAdmission] PRIMARY KEY CLUSTERED 
(
	[AdmissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mst_PatientWard]    Script Date: 07/21/2015 11:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_PatientWard](
	[WardID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NOT NULL,
	[WardName] [varchar](50) NOT NULL,
	[PatientCategory] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Mst_PatientWard_DeleteFlag]  DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Mst_PatientWard] PRIMARY KEY CLUSTERED 
(
	[WardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_PatientWardKey] UNIQUE NONCLUSTERED 
(
	[WardName] ASC,
	[PatientCategory] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard]  WITH CHECK ADD  CONSTRAINT [CK_Mst_PatientWard_PatientCategory] CHECK  (([PatientCategory]='All' OR [PatientCategory]='Peadiatric' OR [PatientCategory]='Female' OR [PatientCategory]='Male'))
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] CHECK CONSTRAINT [CK_Mst_PatientWard_PatientCategory]
GO




SET ANSI_PADDING OFF
GO

/****** Object:  UserDefinedFunction [dbo].[fn_Admission_GetWardOccupancy]    Script Date: 02/11/2015 16:21:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Admission_GetWardOccupancy]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 27 Jan 2015
-- Description:	Get the occupancy of a ward at the moment
-- =============================================
Create FUNCTION [dbo].[fn_Admission_GetWardOccupancy] 
(
	-- Add the paraers for the function here
	@WardID int
)
	
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Occupancy int;

	-- Add the T-SQL statements to compute the return value here
	Select @Occupancy = Count(AdmissionID)
	From DTL_PatientWardAdmission
	Where WardID = @WardID
	And Discharged = 0;
	-- Return the result of the function
	Return @Occupancy;

End
'
End
GO
If Not exists (Select * From sys.columns Where Name = N'Occupancy' And Object_ID = Object_id(N'mst_PatientWard'))    
Begin
Alter table dbo.mst_PatientWard Add Occupancy  as (dbo.fn_Admission_GetWardOccupancy(WardID) )
End
Go
/****** Object:  Table [dbo].[z_whz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_whz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_whz_young](
	[Sex] [smallint] NULL,
	[LengthCm] [float] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_whz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_whz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_whz_old](
	[Sex] [smallint] NULL,
	[HeightCm] [float] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL,
	[lorh] [varchar](1) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[z_waz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_waz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_waz_young](
	[Sex] [smallint] NULL,
	[agedays] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_waz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_waz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_waz_old](
	[Sex] [smallint] NULL,
	[Agemos] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_haz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_haz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_haz_young](
	[Sex] [smallint] NULL,
	[agedays] [smallint] NULL,
	[L] [smallint] NULL,
	[M] [float] NULL,
	[S] [float] NULL,
	[loh] [varchar](1) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[z_haz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_haz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_haz_old](
	[Sex] [smallint] NULL,
	[Agemos] [smallint] NULL,
	[L] [smallint] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_bmiz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_bmiz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_bmiz_young](
	[Sex] [smallint] NULL,
	[agedays] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL,
	[loh] [varchar](1) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[z_bmiz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_bmiz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_bmiz_old](
	[Sex] [smallint] NULL,
	[Agemos] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MST_QueryBuilderParameters]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MST_QueryBuilderParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MST_QueryBuilderParameters](
	[ReportID] [int] NOT NULL,
	[ParameterName] [varchar](50) NOT NULL,
	[ParameterDataType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MST_QueryBuilderParameters_1] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC,
	[ParameterName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_ItemSubType]    Script Date: 07/01/2014 12:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ItemSubType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_ItemSubType](
	[SubItemTypeID] [int] NOT NULL,
	[SubTypeName] [varchar](150) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[SRNo] [int] NULL,
 CONSTRAINT [PK_Mst_ItemSubType_1] PRIMARY KEY CLUSTERED 
(
	[SubItemTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ItemSubType]') AND name = N'IX_TypeIDAndName')
CREATE NONCLUSTERED INDEX [IX_TypeIDAndName] ON [dbo].[Mst_ItemSubType] 
(
	[ItemTypeID] ASC
)
INCLUDE ( [SubTypeName]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mst_ItemMaster]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ItemMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_ItemMaster](
	[Item_PK] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](50)  NULL,
	[ItemName] [varchar](255) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[ItemInstructions] [varchar](250)  NULL,
	[DispensingMargin] [decimal](18, 0) NULL,
	[DispensingUnitPrice] [decimal](18, 0) NULL,
	[FDACode] [varchar](50) NULL,
	[Manufacturer] [int] NULL,
	[MaxStock] [int] NULL,
	[MinStock] [int] NULL,
	[PurchaseUnitPrice] [decimal](18, 0) NULL,
	[QtyPerPurchaseUnit] [int] NULL,
	[DispensingUnit] [int] NULL,
	[PurchaseUnit] [int] NULL,
	[DeleteFlag] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Mst_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[Item_PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END





GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dtl_PatientDeleteLog]    Script Date: 12/11/2014 15:36:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_PatientDeleteLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dtl_PatientDeleteLog](
	[Ptn_PK] [int] NOT NULL,
	[Identifiers] [xml] NULL,
	[DeleteDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_PatientDeleteLog] PRIMARY KEY CLUSTERED 
(
	[Ptn_PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

End
Go
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_BillingType]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_BillingType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_BillingType](
	[BillingTypeID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[MasterTableName] [varchar](100) NULL,
	[MasterFieldName] [varchar](100) NULL,
	[MasterIDField] [varchar](100) NULL,
	[DeleteFlag] [int] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mst_Bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mst_Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[ptn_pk] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[BillStatus] [int] NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[BillNumber] [varchar](50) NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteFlag] [int] NOT NULL,
	[UserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_mst_Bill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'mst_Bill', N'COLUMN',N'BillStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=open(not paid or partially paid) 2=closed(paid in full, cancelled)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mst_Bill', @level2type=N'COLUMN',@level2name=N'BillStatus'
GO
/****** Object:  Table [dbo].[Lnk_ItemSubType]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lnk_ItemSubType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lnk_ItemSubType](
	[Item_PK] [int] NOT NULL,
	[ItemSubTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Lnk_ItemSubType] PRIMARY KEY CLUSTERED 
(
	[Item_PK] ASC,
	[ItemSubTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lnk_ItemCostConfiguration]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_ItemCostConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_ItemCostConfiguration](
	[CostId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[ItemType] [int] NULL,
	[ItemSellingPrice] [decimal](18, 2) NULL,
	[EffectiveDate] [datetime] NULL,
	[PriceStatus] [int] NULL,
	[PricePlanId] [int] Not Null,
	[statusDate] [datetime] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[PharmacyPriceType] [int] NULL,
	[DeleteFlag] [bit] NULL,
	VersionStamp timestamp Not Null
 CONSTRAINT [PK_lnk_ItemCostConfiguration] PRIMARY KEY CLUSTERED 
(
	[CostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'lnk_ItemCostConfiguration', N'COLUMN',N'PharmacyPriceType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=tretment price 0=quantity price(for pharmacy drugs)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lnk_ItemCostConfiguration', @level2type=N'COLUMN',@level2name=N'PharmacyPriceType'
GO
/****** Object:  Table [dbo].[IQToolsExcelReports]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IQToolsExcelReports]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IQToolsExcelReports](
	[IQToolsCatID] [int] NOT NULL,
	[ReportName] [varchar](50) NOT NULL,
	[ReportStylesheet] [varbinary](max) NULL,
	[FileName] [varchar](50) NULL,
	[FileExt] [varchar](50) NULL,
	[ContentType] [varchar](50) NULL,
	[Filelength] [int] NULL,
 CONSTRAINT [PK_IQToolsExcelReports] PRIMARY KEY CLUSTERED 
(
	[IQToolsCatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[dtl_WaitingList]    Script Date: 09/11/2015 07:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_WaitingList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_WaitingList](
	[WaitingListID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[ListID] [int] NOT NULL,
	[ModuleID] [int] NULL,
	[Priority] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[WaitingFor] [int] NOT NULL,
	[LabID] [int] NULL,
 CONSTRAINT [PK_dtl_WaitingList] PRIMARY KEY CLUSTERED 
(
	[WaitingListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_Priority]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_Priority]  DEFAULT ((0)) FOR [Priority]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_WaitingFor]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_WaitingFor]  DEFAULT ((0)) FOR [WaitingFor]
END

GO


/****** Object:  Table [dbo].[dtl_PatientItemsOrder]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientItemsOrder](
	[PatientItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemTypeId] [int] NOT NULL,
	[ptn_Pk] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[DateIssued] [datetime] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_dtl_dtl_PatientItemsOrder] PRIMARY KEY CLUSTERED 
(
	[PatientItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]') AND name = N'IX_dtl_PatientItemsOrder')
CREATE NONCLUSTERED INDEX [IX_dtl_PatientItemsOrder] ON [dbo].[dtl_PatientItemsOrder] 
(
	[ItemId] ASC,
	[ItemTypeId] ASC,
	[ptn_Pk] ASC,
	[ModuleId] ASC,
	[DateIssued] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dtl_LabGroupItems]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_LabGroupItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dtl_LabGroupItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LabGroupTestID] [int] NOT NULL,
	[LabTestID] [int] NOT NULL,
	[DeleteFlag] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserId] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_BillDepositTransaction]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_BillDepositTransaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNumber] [varchar](50) NOT NULL,
	[Ptn_PK] [int] NULL,
	[AccountID] [int] NULL,
	[LocationID] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionType]  AS (case [TransactionDescription] when 'Refund' then 'Debit' when 'Settlement' then 'Debit' when 'Deposit' then 'Credit'  end) PERSISTED,
	[TransactionDescription] [varchar](50) NOT NULL,
	[DepositType] [varchar](50) NOT NULL,
	[PatientDeposit]  AS (CONVERT([bit],case when [AccountID] IS NULL then (1) else (0) end,(0))) PERSISTED,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dtl_BillDepositTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_dtl_BillDepositTransaction] UNIQUE NONCLUSTERED 
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dtl_Billables]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_Billables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dtl_Billables](
	[BillableDetailID] [int] IDENTITY(1,1) NOT NULL,
	[DeCodeID] [int] NULL,
	[BillingTypeID] [int] NULL,
	[ItemID] [int] NULL,
	[DeleteFlag] [int] NOT NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Dtl_Billables] PRIMARY KEY CLUSTERED 
(
	[BillableDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_Bill]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_Bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_Bill](
	[billItemID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NULL,
	[LocationID] [int] NOT NULL,
	[BillID] [int] NULL,
	[BillItemDate] [datetime] NOT NULL,
	[PaymentType] [int] NULL,
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](250) NOT NULL,
	[ItemType] [int] NOT NULL,
	[Quantity] [int] NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[PaymentStatus] [int] NOT NULL,
	[TransactionId] [int] NULL,
	[ServiceStatus] [int] NOT NULL,
	[DeleteFlag] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[ModuleID] [int] NULL,
	[ItemSourceReferenceID] [int] NULL,
	[CostCenter] [varchar](50) Null,
 CONSTRAINT [PK_dtl_Bill] PRIMARY KEY CLUSTERED 
(
	[billItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'dtl_Bill', N'COLUMN',N'ServiceStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'shows whether client has recived this service or not. 0=not yet recieved 1=recieved' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dtl_Bill', @level2type=N'COLUMN',@level2name=N'ServiceStatus'
GO
/****** Object:  Table [dbo].[ord_bill]    Script Date: 05/22/2015 14:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_bill](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[BillId] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL CONSTRAINT [DF_ord_bill_TransactionDate]  DEFAULT (getdate()),
	[TransactionType] [int] NOT NULL,
	[RefNumber] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[AmountPayable] [decimal](18, 2) NOT NULL,
	[TenderedAmount] [decimal](18, 2) NULL,
	[userId] [int] NOT NULL,
	[ReceiptNumber] [varchar](50) NOT NULL,
	[TransactionStatus] [varchar](50) NULL,
	[Reversed] [bit] NOT NULL CONSTRAINT [DF_ord_bill_Reversed]  DEFAULT ((0)),
	[Discount] [decimal](3, 2) NULL CONSTRAINT [DF_ord_bill_Discount]  DEFAULT ((0.0)),
	[Narrative] [varchar](50) Null,
 CONSTRAINT [PK_ord_bill] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [NCI_OrdBill_BillID]    Script Date: 09/11/2015 07:43:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND name = N'NCI_OrdBill_BillID')
CREATE NONCLUSTERED INDEX [NCI_OrdBill_BillID] ON [dbo].[ord_bill]
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_OrdBill_TranDate]    Script Date: 09/11/2015 07:43:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND name = N'NCI_OrdBill_TranDate')
CREATE NONCLUSTERED INDEX [NCI_OrdBill_TranDate] ON [dbo].[ord_bill]
(
	[TransactionDate] ASC
)
INCLUDE ( 	[TransactionId],
	[BillId],
	[TransactionType],
	[Amount],
	[userID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_OrdBill_TranType]    Script Date: 09/11/2015 07:43:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND name = N'NCI_OrdBill_TranType')
CREATE NONCLUSTERED INDEX [NCI_OrdBill_TranType] ON [dbo].[ord_bill]
(
	[TransactionType] ASC
)
INCLUDE ( 	[Ptn_PK],
	[TransactionDate],
	[Amount],
	[userID],
	[ReceiptNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill]  WITH CHECK ADD  CONSTRAINT [FK_ord_bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill] CHECK CONSTRAINT [FK_ord_bill_mst_Bill]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ord_bill', N'COLUMN',N'Amount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Amount payable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ord_bill', @level2type=N'COLUMN',@level2name=N'Amount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ord_bill', N'COLUMN',N'TenderedAmount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amoujnt given by client as payment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ord_bill', @level2type=N'COLUMN',@level2name=N'TenderedAmount'
GO
/****** Object:  Table [dbo].[ord_Bill_Reversals]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_Bill_Reversals](
	[TransactionReversalID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[TransactionID] [int] NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReversalReason] [varchar](250) NOT NULL,
	[ApprovalNotes] [varchar](250) NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovalStatus] [int] NOT NULL,
	[ApprovedBy] [int] NULL,
	[ReversalReference] [varchar](50) NULL,
	[Refunded] [bit] NOT NULL,
	[RefundDate] [datetime] NULL,
	[RefundBy] [int] NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD [RefundType] [varchar](50) NULL
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]') AND name = N'PK_dtl_Bill_Reversals')
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD  CONSTRAINT [PK_dtl_Bill_Reversals] PRIMARY KEY CLUSTERED 
(
	[TransactionReversalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ord_Bill_Reversals', N'COLUMN',N'ApprovalStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0(Pending),1(Approved),3(Rejected)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ord_Bill_Reversals', @level2type=N'COLUMN',@level2name=N'ApprovalStatus'
GO
/****** Object:  Default [DF_dtl_Bill_SellingPrice]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_SellingPrice]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_SellingPrice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_SellingPrice]  DEFAULT ((0.0)) FOR [SellingPrice]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_Discount]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_Discount]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_Discount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_Discount]  DEFAULT ((0)) FOR [Discount]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_PaymentStatus]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_PaymentStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_PaymentStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_PaymentStatus]  DEFAULT ((0)) FOR [PaymentStatus]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_ServiceStatus]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_ServiceStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_ServiceStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_ServiceStatus]  DEFAULT ((0)) FOR [ServiceStatus]
END


End
GO
/****** Object:  Default [DF_dtl_PatientItemsOrder_SellingPrice]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_PatientItemsOrder_SellingPrice]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_PatientItemsOrder_SellingPrice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_PatientItemsOrder] ADD  CONSTRAINT [DF_dtl_PatientItemsOrder_SellingPrice]  DEFAULT ((0.00)) FOR [SellingPrice]
END


End
GO
/****** Object:  Default [DF_dtl_PatientItemsOrder_DeleteFlag]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_PatientItemsOrder_DeleteFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_PatientItemsOrder_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_PatientItemsOrder] ADD  CONSTRAINT [DF_dtl_PatientItemsOrder_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END


End
GO
/****** Object:  Default [DF_dtl_WaitingList_Priority]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_Priority]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_WaitingList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_WaitingList_Priority]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_Priority]  DEFAULT ((0)) FOR [Priority]
END


End
GO
/****** Object:  Default [DF_dtl_WaitingList_CreateDate]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_WaitingList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_WaitingList_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_lnk_ItemCostConfiguration_CreateDate]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_lnk_ItemCostConfiguration_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_ItemCostConfiguration]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_lnk_ItemCostConfiguration_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lnk_ItemCostConfiguration] ADD  CONSTRAINT [DF_lnk_ItemCostConfiguration_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditVoucher]') AND type in (N'U')) BEGIN
	CREATE TABLE [dbo].[dtl_BillCreditVoucher](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[LocationId] [int] NOT NULL,
		[VoucherDate] [datetime] NOT NULL,
		[Amount] [decimal](18, 2) NOT NULL,
		[KnockedOffAmount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_dtl_BillCreditVoucher_KnockedOffAmount]  DEFAULT ((0.00)),
		[VoucherType] [varchar](50) NOT NULL,
		[ReferenceId] [varchar](50) NOT NULL,
		[Description] [varchar](300) NOT NULL,
		[UserId] [int] NOT NULL,
		[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_dtl_BillCreditVoucher_CreateDate]  DEFAULT (getdate()),
		[DeleteFlag] [bit] NOT NULL CONSTRAINT [dtl_BillCreditVoucher_DeleteFlag]  DEFAULT ((0)),
		[VoidDate] [datetime] NULL,
		[VoidedBy] [int] NULL,
	 CONSTRAINT [PK_dtl_BillCreditVoucher] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

End
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[dtl_BillCreditKnockOff]    Script Date: 9/1/2016 2:03:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]') AND type in (N'U')) Begin
	CREATE TABLE [dbo].[dtl_BillCreditKnockOff](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[TransactionId] [int] NOT NULL,
		[PaymentTypeId] [int] NOT NULL,
		[VoucherId] [int] NOT NULL,
		[KnockOffAmount] [decimal](18, 2) NOT NULL,
		[Description] [varchar](250) NULL,
		[UserId] [int] NOT NULL,
		[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_dtl_BillCreditKnockOff_CreateDate]  DEFAULT (getdate()),
		[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_BillCreditKnockOff_DeleteFlag]  DEFAULT ((0)),
		[VoidDate] [datetime] NULL,
		[VoidedBy] [int] NULL,
	 CONSTRAINT [PK_dtl_BillCreditKnockOff] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff]  WITH CHECK ADD  CONSTRAINT [FK_dtl_BillCreditKnockOff] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[ord_bill] ([TransactionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff] CHECK CONSTRAINT [FK_dtl_BillCreditKnockOff]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff_Voucher]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff]  WITH CHECK ADD  CONSTRAINT [FK_dtl_BillCreditKnockOff_Voucher] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[dtl_BillCreditVoucher] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff_Voucher]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff] CHECK CONSTRAINT [FK_dtl_BillCreditKnockOff_Voucher]
GO

	
/****** Object:  Default [DF_lnk_ItemCostConfiguration_PharmacyPriceType]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_lnk_ItemCostConfiguration_PharmacyPriceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_ItemCostConfiguration]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_lnk_ItemCostConfiguration_PharmacyPriceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lnk_ItemCostConfiguration] ADD  CONSTRAINT [DF_lnk_ItemCostConfiguration_PharmacyPriceType]  DEFAULT ((0)) FOR [PharmacyPriceType]
END


End
GO
/****** Object:  Default [DF_mst_Bill_DeleteFlag]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_Bill_DeleteFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_mst_Bill_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_Bill] ADD  CONSTRAINT [DF_mst_Bill_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END


End
GO
/****** Object:  Default [DF_ord_bill_TransactionDate]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ord_bill_TransactionDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ord_bill_TransactionDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_bill] ADD  CONSTRAINT [DF_ord_bill_TransactionDate]  DEFAULT (getdate()) FOR [TransactionDate]
END


End
GO
/****** Object:  Default [DF_ord_bill_Reversed]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ord_bill_Reversed]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ord_bill_Reversed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_bill] ADD  CONSTRAINT [DF_ord_bill_Reversed]  DEFAULT ((0)) FOR [Reversed]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_Reversals_ApprovalStatus]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_Reversals_ApprovalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_Reversals_ApprovalStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD  CONSTRAINT [DF_dtl_Bill_Reversals_ApprovalStatus]  DEFAULT ((0)) FOR [ApprovalStatus]
END


End
GO
/****** Object:  Default [DF_ord_Bill_Reversals_CashRefunded]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ord_Bill_Reversals_CashRefunded]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ord_Bill_Reversals_CashRefunded]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD  CONSTRAINT [DF_ord_Bill_Reversals_CashRefunded]  DEFAULT ((0)) FOR [Refunded]
END


End
GO
/****** Object:  Check [CK_dtl_BDT_Corporate_Patient]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BDT_Corporate_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction]  WITH CHECK ADD  CONSTRAINT [CK_dtl_BDT_Corporate_Patient] CHECK  (([AccountID] IS NOT NULL OR [Ptn_PK] IS NOT NULL))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BDT_Corporate_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction] CHECK CONSTRAINT [CK_dtl_BDT_Corporate_Patient]
GO
/****** Object:  Check [CK_dtl_BillDepositTransaction_Description]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillDepositTransaction_Description]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction]  WITH CHECK ADD  CONSTRAINT [CK_dtl_BillDepositTransaction_Description] CHECK  (([TransactionDescription]='Settlement' OR [TransactionDescription]='Refund' OR [TransactionDescription]='Deposit'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillDepositTransaction_Description]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction] CHECK CONSTRAINT [CK_dtl_BillDepositTransaction_Description]
GO
/****** Object:  ForeignKey [FK_dtl_Bill_mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
ALTER TABLE [dbo].[dtl_Bill]  WITH CHECK ADD  CONSTRAINT [FK_dtl_Bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
ALTER TABLE [dbo].[dtl_Bill] CHECK CONSTRAINT [FK_dtl_Bill_mst_Bill]
GO
/****** Object:  ForeignKey [FK_mst_Bill_mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_mst_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_Bill]'))
ALTER TABLE [dbo].[mst_Bill]  WITH CHECK ADD  CONSTRAINT [FK_mst_Bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_mst_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_Bill]'))
ALTER TABLE [dbo].[mst_Bill] CHECK CONSTRAINT [FK_mst_Bill_mst_Bill]
GO
/****** Object:  ForeignKey [FK_ord_bill_mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill]  WITH CHECK ADD  CONSTRAINT [FK_ord_bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill] CHECK CONSTRAINT [FK_ord_bill_mst_Bill]
GO
/****** Object:  ForeignKey [FK_ord_Bill_Reversals_ord_bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_Bill_Reversals_ord_bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
ALTER TABLE [dbo].[ord_Bill_Reversals]  WITH CHECK ADD  CONSTRAINT [FK_ord_Bill_Reversals_ord_bill] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[ord_bill] ([TransactionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_Bill_Reversals_ord_bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
ALTER TABLE [dbo].[ord_Bill_Reversals] CHECK CONSTRAINT [FK_ord_Bill_Reversals_ord_bill]
GO
/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Patient]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Patient]
GO
/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Ward]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward]
GO
/****** Object:  Check [CK_DTL_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [CK_DTL_PatientWardAdmission]

END
GO
/****** Object:  Check [CK_Mst_PatientWard_PatientCategory]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] DROP CONSTRAINT [CK_Mst_PatientWard_PatientCategory]

END
GO
/****** Object:  Table [dbo].[dtl_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [CK_DTL_PatientWardAdmission]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DTL_PatientWardAdmission_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [DF_DTL_PatientWardAdmission_DeleteFlag]
END
GO

/****** Object:  Table [dbo].[Mst_PatientWard]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] DROP CONSTRAINT [CK_Mst_PatientWard_PatientCategory]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mst_PatientWard_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mst_PatientWard] DROP CONSTRAINT [DF_Mst_PatientWard_DeleteFlag]
END
GO

/****** Object:  Table [dbo].[Mst_PatientWard]    Script Date: 02/11/2015 15:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_PatientWard](
	[WardId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[WardName] [varchar](50) NOT NULL,
	[PatientCategory] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Occupancy]  AS ([dbo].[fn_Admission_GetWardOccupancy]([WardID])),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Mst_PatientWard_DeleteFlag]  DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Mst_PatientWard] PRIMARY KEY CLUSTERED 
(
	[WardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_PatientWardKey] UNIQUE NONCLUSTERED 
(
	[WardName] ASC,
	[PatientCategory] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Check [CK_DTL_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission]  WITH CHECK ADD  CONSTRAINT [CK_DTL_PatientWardAdmission] CHECK  (([ActualDischargeDate] IS NULL OR [ActualDischargeDate]>=[AdmissionDate]))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] CHECK CONSTRAINT [CK_DTL_PatientWardAdmission]
GO
/****** Object:  Check [CK_Mst_PatientWard_PatientCategory]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard]  WITH CHECK ADD  CONSTRAINT [CK_Mst_PatientWard_PatientCategory] CHECK  (([PatientCategory]='Peadiatric' OR [PatientCategory]='Female' OR [PatientCategory]='Male' OR [PatientCategory]='All'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] CHECK CONSTRAINT [CK_Mst_PatientWard_PatientCategory]
GO
/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Patient]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission]  WITH CHECK ADD  CONSTRAINT [FK_DTL_PatientWardAdmission_To_Patient] FOREIGN KEY([Ptn_PK])
REFERENCES [dbo].[mst_Patient] ([Ptn_Pk])
GO

/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Ward]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission]  WITH CHECK ADD  CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward] FOREIGN KEY([WardID])
REFERENCES [dbo].[Mst_PatientWard] ([WardID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] CHECK CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward]
GO

/****** Object:  Check [CK_DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts] DROP CONSTRAINT [CK_DTL_PaymentDiscounts]

END
GO
/****** Object:  Table [dbo].[DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts] DROP CONSTRAINT [CK_DTL_PaymentDiscounts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DTL_PaymentDiscounts_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DTL_PaymentDiscounts] DROP CONSTRAINT [DF_DTL_PaymentDiscounts_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]') AND type in (N'U'))
DROP TABLE [dbo].[DTL_PaymentDiscounts]
GO
/****** Object:  Table [dbo].[DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DTL_PaymentDiscounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [varchar](100) NOT NULL,
	[Rate] [decimal](3, 2) NOT NULL,
	[PaymentTypeID] [int]  NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime]  NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_DTL_PaymentDiscounts_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_DTL_PaymentDiscounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK_DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts]  WITH CHECK ADD  CONSTRAINT [CK_DTL_PaymentDiscounts] CHECK  (([Rate]<(1.00) AND [Rate]>(0.00)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts] CHECK CONSTRAINT [CK_DTL_PaymentDiscounts]
GO

/****** Object:  Table [dbo].[Mst_BillPaymentType]    Script Date: 09/02/2015 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_BillPaymentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_BillPaymentType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeDescription] [varchar](100) NULL,
	[Locked] [bit] NOT NULL,
	[PluginName] [varchar](50) NOT NULL ,
	[Credit] [bit] Not Null Constraint [DF_Mst_BillPaymentType_Credit] Default((1)),
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Mst_BillPaymentType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
/*
SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientLabTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientLabTest](
	[LabTestOrderId] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[TestNotes] [varchar](255) NULL,
	[IsParent] [bit] NOT NULL CONSTRAINT [DF_dtl_PatientLabTest_IsParent]  DEFAULT ((1)),
	[ParentTestID] [int] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_PatientLabTest_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_PatientLabTest] PRIMARY KEY CLUSTERED 
(
	[LabTestOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End
Go
SET ANSI_NULLS ON
GO		 
*/

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStockBalance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemStockBalance](
	[ItemId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[BatchId] [int] Not Null,
	[AvailableQuantity] [int] NOT NULL,
	[BalanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ItemStockBalance] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
Go
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ItemStockBalance_BalanceDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemStockBalance] ADD  CONSTRAINT [DF_ItemStockBalance_BalanceDate]  DEFAULT (getdate()) FOR [BalanceDate]
END
GO
/****** Object:  Table [dbo].[dtl_BillingReceipt]    Script Date: 10/15/2015 12:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_BillingReceipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[ReceiptDate] [datetime] NOT NULL,
	[ReceiptType] int  NOT NULL,
	[ReceiptNumber] [varchar](50) NOT NULL,
	[TransactionId] int Not Null,
	[ReceiptData] xml NOT NULL,	
	[PrintCount] [int] NOT NULL,
	[UserId] [int] NOT NULL
 CONSTRAINT [PK_dtl_BillingReceipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_dtl_BillingReceipt]    Script Date: 10/15/2015 12:12:30 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]') AND name = N'IX_dtl_BillingReceipt')
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtl_BillingReceipt] ON [dbo].[dtl_BillingReceipt]
(
	[ReceiptNumber] ASC
)
INCLUDE ( 	[Ptn_PK],[TransactionId],
	[ReceiptType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_BillingReceipt_PrintCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_BillingReceipt] ADD  CONSTRAINT [DF_dtl_BillingReceipt_PrintCount]  DEFAULT ((0)) FOR [PrintCount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillingReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]'))
ALTER TABLE [dbo].[dtl_BillingReceipt]  WITH CHECK ADD  CONSTRAINT [CK_dtl_BillingReceipt] CHECK  (([ReceiptType]=1 OR [ReceiptType]=2 OR [ReceiptType]=3 OR [ReceiptType]=4))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillingReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]'))
ALTER TABLE [dbo].[dtl_BillingReceipt] CHECK CONSTRAINT [CK_dtl_BillingReceipt]
GO

/****** Object:  Table [dbo].[dtl_BillWriteOffTransaction]    Script Date: 01/14/2016 09:49:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillWriteOffTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_BillWriteOffTransaction](
	[WriteOffId] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NOT NULL,
	[WriteOffDate] [datetime] NOT NULL,
	[WriteOffAmount] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dtl_BillWriteOffTransaction] PRIMARY KEY CLUSTERED 
(
	[WriteOffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillWriteOffTransaction_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillWriteOffTransaction]'))
ALTER TABLE [dbo].[dtl_BillWriteOffTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dtl_BillWriteOffTransaction_mst_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillWriteOffTransaction_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillWriteOffTransaction]'))
ALTER TABLE [dbo].[dtl_BillWriteOffTransaction] CHECK CONSTRAINT [FK_dtl_BillWriteOffTransaction_mst_Bill]
GO

-- Lab and services Section

/****** Object:  UserDefinedFunction [dbo].[fn_Laboratory_GetParameterCount]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Laboratory_GetParameterCount]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 20160226
-- Description:	Get number of parameters for a lab test. A valid lab must have atleast one parameter other than a group lab
-- =============================================
CREATE FUNCTION [dbo].[fn_Laboratory_GetParameterCount]
(
	-- Add the parameters for the function here
	@LabTestId int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Count int

	-- Add the T-SQL statements to compute the return value here
	Select 
		@Count = Case 
					When IsGroup = 0 Then (Select Count(Id) From Mst_LabTestParameter Where LabTestId = @LabTestId And DeleteFlag = 0)
					Else (Select Count(P.Id) From lnk_GroupLabTest G 
								Inner join Mst_LabTestParameter P On G.LabTestId = P.LabTestId
								Where GroupLabTestId=@LabTestId and p.DeleteFlag = 0
						) End
	From mst_LabTestMaster M Where Id = @LabTestId

	-- Return the result of the function
	RETURN @Count

END
' 
END

GO
/****** Object:  Table [dbo].[dtl_ClinicalServiceOrder]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_ClinicalServiceOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ClinicalServiceId] [int] NOT NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_dtl_ClinicalServiceOrder_Quantity]  DEFAULT ((1)),
	[RequestNotes] [varchar](400) NULL,
	[ResultNotes] [varchar](400) NULL,
	[ResultDate] [datetime] NULL,
	[ResultBy] [int] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_ClinicalServiceOrder_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_ClinicalServiceOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtl_LabOrderTest]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabOrderTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[TestNotes] [varchar](255) NULL,
	[IsParent] [bit] NOT NULL CONSTRAINT [DF_LabOrderTest_IsParent]  DEFAULT ((1)),
	[ParentTestId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_LabOrderTest_DeleteFlag]  DEFAULT ((0)),
	[ResultNotes] [varchar](255) NULL,
	[ResultBy] [int] NULL,
	[ResultDate] [datetime] NULL,
	[ResultStatus] [varchar](50) NULL,
	[UserId] [int] NULL,
	[StatusDate] [datetime] NULL,
 CONSTRAINT [PK_dtl_LabOrderTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtl_LabOrderTestResult]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabOrderTestResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[LabOrderTestId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[ResultValue] [decimal](18, 2) NULL,
	[ResultText] [varchar](400) NULL,
	[ResultOptionId] [int] NULL,
	[ResultOption] [varchar](50) NULL,
	[HasResult]  AS (CONVERT([bit],case when [resultvalue] IS NULL AND [resulttext] IS NULL AND [resultoption] IS NULL then (0) else (1) end,(0))),
	[ResultUnit] [varchar](50) NULL,
	[ResultUnitId] [int] NULL,
	[ResultConfigId] [int] NULL,
	[Undetectable] [bit] NULL,
	[DetectionLimit] [decimal](18, 2) NULL,
	[UserId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_LabOrderTestResult_DeleteFlag]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dtl_LabOrderTestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF Not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_dtl_LabOrderTestResult_DeleteFlag_INC')
CREATE NONCLUSTERED INDEX [NCI_dtl_LabOrderTestResult_DeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
(
	[DeleteFlag] ASC
)
INCLUDE ( 	[LabOrderId],
	[ParameterId],
	[ResultValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF Not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_TestResult_OrderIdDeleteFlag_INC')
CREATE NONCLUSTERED INDEX [NCI_TestResult_OrderIdDeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
([LabOrderId],[DeleteFlag])
INCLUDE ( 	
	[ParameterId],
	[ResultValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterConfig]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabTestParameterConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParameterId] [int] NOT NULL,
	[MinBoundary] [decimal](18, 2) NULL,
	[MaxBoundary] [decimal](18, 2) NULL,
	[MinNormalRange] [decimal](18, 2) NULL,
	[MaxNormalRange] [decimal](18, 2) NULL,
	[UnitId] [int] NULL,
	[DefaultUnit] [bit] NULL,
	[DetectionLimit] [decimal](18, 2) NULL,
	[DeleteFlag] [bit] NULL CONSTRAINT [DF_dtl_LabTestParameterConfig_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_LabTestParameterConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterResultOption]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabTestParameterResultOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParameterId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_LabTestParameterResultOption_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_LabTestParameterResultOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lnk_GroupLabTest]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_GroupLabTest](
	[GroupLabTestId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
 CONSTRAINT [PK_lnk_GroupLabTest] PRIMARY KEY CLUSTERED 
(
	[GroupLabTestId] ASC,
	[LabTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mst_ClinicalService]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ClinicalService]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_ClinicalService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Mst_ClinicalService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mst_LabTestMaster]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mst_LabTestMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceId] [varchar](36) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[LoincCode] [varchar](50) NULL,
	[IsGroup] [bit] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_IsGroup]  DEFAULT ((0)),
	[DepartmentId] [int] NULL,
	[ParameterCount]  AS ([dbo].[fn_Laboratory_GetParameterCount]([Id])),
	[Active] [bit] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_Active]  DEFAULT ((1)),	
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_CreatedBy]  DEFAULT (getdate()),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_DeleteFlag]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeleteDate] datetime NULL
 CONSTRAINT [PK_mst_LabTestMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_LabTestParameter]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_LabTestParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceId] [varchar](36) NOT NULL,
	[ParameterName] [varchar](250) NOT NULL,
	[LabTestId] [int] NOT NULL,
	[DataType] [varchar](20) NOT NULL,
	[OrdRank] [decimal](5, 2) NOT NULL  CONSTRAINT [DF_Mst_LabTestParameter_OrdRank]  DEFAULT ((0.00)),
	[LoincCode] [varchar](50) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Mst_LabTestParameter_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_Mst_LabTestParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ord_ClinicalServiceOrder]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_ClinicalServiceOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_ClinicalServiceOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_Pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VisitId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[TargetModuleId] [int] NOT NULL,
	[OrderNumber] [varchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderedBy] [int] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[ClinicalNotes] [varchar](400) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_ord_ClinicalServiceOrder_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_ord_ClinicalServiceOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ord_LabOrder]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_LabOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_LabOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_Pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VisitId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[OrderedBy] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PreClinicLabDate] [datetime] NULL,
	[ClinicalOrderNotes] [varchar](400) NULL,
	[OrderNumber] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_ord_LabOrder_DeleteFlag]  DEFAULT ((0)),
	[DeletedBy] [int] Null,
	[DeleteDate] [datetime] Null,
	[DeleteReason] [varchar](250) Null,
 CONSTRAINT [PK_ord_LabOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_dtl_LabTestParameterResultOption]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND name = N'IX_dtl_LabTestParameterResultOption')
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtl_LabTestParameterResultOption] ON [dbo].[dtl_LabTestParameterResultOption]
(
	[ParameterId] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Mst_LabTestMaster_Name]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_Mst_LabTestMaster_Name')
CREATE NONCLUSTERED INDEX [IX_Mst_LabTestMaster_Name] ON [dbo].[mst_LabTestMaster]
(
	[Name] ASC
)
INCLUDE ( 	[IsGroup],
	[DeleteFlag]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_mst_LabTestMaster_Ref]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_mst_LabTestMaster_Ref')
CREATE UNIQUE NONCLUSTERED INDEX [IX_mst_LabTestMaster_Ref] ON [dbo].[mst_LabTestMaster]
(
	[ReferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Mst_LabTestParameter]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND name = N'IX_Mst_LabTestParameter')
CREATE NONCLUSTERED INDEX [IX_Mst_LabTestParameter] ON [dbo].[Mst_LabTestParameter]
(
	[ParameterName] ASC,
	[DataType] ASC
)
INCLUDE ( 	[DeleteFlag]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClinicalServiceOrdered_ClinicalServiceOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalServiceOrdered_ClinicalServiceOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[ord_ClinicalServiceOrder] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClinicalServiceOrdered_ClinicalServiceOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder] CHECK CONSTRAINT [FK_ClinicalServiceOrdered_ClinicalServiceOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_ClinicalServiceOrder_ClinicalService]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_dtl_ClinicalServiceOrder_ClinicalService] FOREIGN KEY([ClinicalServiceId])
REFERENCES [dbo].[Mst_ClinicalService] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_ClinicalServiceOrder_ClinicalService]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder] CHECK CONSTRAINT [FK_dtl_ClinicalServiceOrder_ClinicalService]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTest_LabOrder] FOREIGN KEY([LabOrderId])
REFERENCES [dbo].[ord_LabOrder] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest] CHECK CONSTRAINT [FK_LabOrderTest_LabOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabTestMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTest_LabTestMaster] FOREIGN KEY([LabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabTestMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest] CHECK CONSTRAINT [FK_LabOrderTest_LabTestMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabOrderTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabOrderTest] FOREIGN KEY([LabOrderTestId])
REFERENCES [dbo].[dtl_LabOrderTest] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabOrderTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabOrderTest]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabTestParameter] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Mst_LabTestParameter] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabTestParameter]
GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterConfig]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabTestParameterConfig] FOREIGN KEY([ResultConfigId])
--REFERENCES [dbo].[dtl_LabTestParameterConfig] ([Id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterConfig]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabTestParameterConfig]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterResultOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabTestParameterResultOption] FOREIGN KEY([ResultOptionId])
--REFERENCES [dbo].[dtl_LabTestParameterResultOption] ([Id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterResultOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabTestParameterResultOption]
--GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterConfig_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]'))
ALTER TABLE [dbo].[dtl_LabTestParameterConfig]  WITH CHECK ADD  CONSTRAINT [FK_LabTestParameterConfig_LabTestParameter] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Mst_LabTestParameter] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterConfig_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]'))
ALTER TABLE [dbo].[dtl_LabTestParameterConfig] CHECK CONSTRAINT [FK_LabTestParameterConfig_LabTestParameter]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterResultOption_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]'))
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption]  WITH CHECK ADD  CONSTRAINT [FK_LabTestParameterResultOption_LabTestParameter] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Mst_LabTestParameter] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterResultOption_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]'))
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption] CHECK CONSTRAINT [FK_LabTestParameterResultOption_LabTestParameter]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest]  WITH CHECK ADD  CONSTRAINT [FK_GroupLabTest_LabTest_1] FOREIGN KEY([LabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest] CHECK CONSTRAINT [FK_GroupLabTest_LabTest_1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest]  WITH CHECK ADD  CONSTRAINT [FK_GroupLabTest_LabTest_2] FOREIGN KEY([GroupLabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest] CHECK CONSTRAINT [FK_GroupLabTest_LabTest_2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTest_LabDepartment]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]'))
ALTER TABLE [dbo].[mst_LabTestMaster]  WITH CHECK ADD  CONSTRAINT [FK_LabTest_LabDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[mst_LabDepartment] ([LabDepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTest_LabDepartment]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]'))
ALTER TABLE [dbo].[mst_LabTestMaster] CHECK CONSTRAINT [FK_LabTest_LabDepartment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameter_LabTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]'))
ALTER TABLE [dbo].[Mst_LabTestParameter]  WITH CHECK ADD  CONSTRAINT [FK_LabTestParameter_LabTest] FOREIGN KEY([LabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameter_LabTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]'))
ALTER TABLE [dbo].[Mst_LabTestParameter] CHECK CONSTRAINT [FK_LabTestParameter_LabTest]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_AllergiesDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_AllergiesDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ptn_pk] [int] NOT NULL,
	[AllergyType] [varchar](50)  NOT NULL,
	[Allergen] [varchar](200)  NULL,
	[OtherAllergen] [varchar](200)  NULL,
	[TypeReaction] [varchar](200)  NULL,
	[Severity] [varchar](50)  NULL,
	[DateAllergy] [varchar](50)  NULL,
	[UserId] [int] NOT NULL,
	[DeleteFlag] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
End

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_ServiceBusinessRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_ServiceBusinessRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[BusRuleId] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Value1] [varchar](1000) NULL,
	[SetType] [int] NULL
	
 CONSTRAINT [PK_lnk_ServiceBusinessRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ModuleId] ASC,
	[BusRuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
End
Go

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_featureBusinessRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_featureBusinessRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NOT NULL,
	[BusRuleId] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Value1] [varchar](1000) NULL,
	[SetType] [int] NULL,
 CONSTRAINT [PK_lnk_featureBusinessRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FeatureID] ASC,
	[BusRuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
End
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTL_FBCUSTOMFIELD_Intensive_Case_Finding]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[DTL_FBCUSTOMFIELD_Intensive_Case_Finding](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_pk] [int] NOT NULL,
	[Visit_Pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[BMIClassification] [int] NULL,
	[DetailsofSmearPositiveContact] [varchar](1000) NULL,
	[Cough] [bit] NULL,
	[Fever] [bit] NULL,
	[WeightLoss] [bit] NULL,
	[Sweat] [bit] NULL,
	[ContactTB] [bit] NULL,
	[SputumSmear] [int] NULL,
	[SputumDate] [datetime] NULL,
	[ChestXray] [int] NULL,
	[ChestXRayDate] [datetime] NULL,
	[Referral] [bit] NULL,
	[ReferalDate] [datetime] NULL,
	[StartAntiTB] [bit] NULL,
	[StartAntiTBDate] [datetime] NULL,
	[InvitationContacts] [bit] NULL,
	[InvitationContactsDate] [datetime] NULL,
	[IPTEvaluation] [bit] NULL,
	[IPTEvaluationDate] [datetime] NULL,
	[YellowUrine] [bit] NULL,
	[NumbnessAdult] [bit] NULL,
	[NumbnessPead] [bit] NULL,
	[YellowEyes] [bit] NULL,
	[TenderAbdomen] [bit] NULL,
	[PainAbdomen] [bit] NULL,
	[LiverFunctionTestALT] [decimal](18, 2) NULL,
	[LiverFunctionTestAST] [decimal](18, 2) NULL,
	[IPTStartDate] [datetime] NULL,
	[IndicationforIPT] [int] NULL,
	[IPTOutcome] [int] NULL,
	[IPTOutcomeDate] [datetime] NULL,
	[ReasonsforDiscontinuationIPT] [int] NULL,
	[FollowUpTBStatus] [int] NULL,
	[DateofTBDiagnosis] [datetime] NULL,
	[TBStatusDate] [datetime] NULL,
	[Hepatotoxicity] [bit] NULL,
	[HepatotoxicityAction] [varchar](8000) NULL,
	[PeripheralNeuropathy] [bit] NULL,
	[NeuropathyAction] [varchar](8000) NULL,
	[Rash] [bit] NULL,
	[RashAction] [varchar](8000) NULL,
	[TBAdherenceMeasurement] [int] NULL,
	[Remarks] [varchar](8000) NULL,
	[ChidExposedPTB] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientLabTracker]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [patientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [LabName]              [VARCHAR](50) NOT NULL,
         [SampleDate]           [DATETIME] NOT NULL,
         [Reasons]              [VARCHAR](50) NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [DeleteFlag]           [BIT] NULL,
         [Results]              [VARCHAR](50) NULL,
         [LabOrderId]           [INT] NULL,
         [ResultValues]         [DECIMAL](18, 0) NULL,
         [FacilityId]           [INT] NULL,
         [LabTestId]            [INT] NULL,
         [ResultTexts]          [VARCHAR](50) NULL,
         [LabOrderTestId]       [INT] NULL,
         CONSTRAINT [PK_PatientLabTracker] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO