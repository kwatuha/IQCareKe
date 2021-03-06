/****** Object:  Table [dbo].[AuditTracker_PharmacyOrder]    Script Date: 28-May-2018 12:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditTracker_PharmacyOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditTracker_PharmacyOrder](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OriginalPharmacyPk] [bigint] NOT NULL,
	[CurrentPharmacyPk] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Justification] [varchar](250) NOT NULL,
 CONSTRAINT [PK_AuditTracker_PharmacyOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
