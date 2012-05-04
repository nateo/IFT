USE [IFT]
GO

/****** Object:  Table [Discounts]    Script Date: 05/03/2012 22:08:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Discounts](
	[DiscountsID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DiscountPercent] [smallmoney] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[MinQty] [int] NOT NULL,
	[MaxQty] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL
 CONSTRAINT [PK_Discounts_DiscountsID] PRIMARY KEY CLUSTERED 
(
	[DiscountsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Discounts records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'DiscountsID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount description.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount precentage.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'DiscountPct'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount type category.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Group the discount applies to such as Reseller or Customer.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'Category'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount start date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Discount end date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minimum discount percent allowed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'MinQty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maximum discount percent allowed.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'MaxQty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'rowguid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sale discounts lookup table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'PK_Discounts_DiscountsID'
GO

ALTER TABLE [Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts_DiscountPct] CHECK  (([DiscountPct]>=(0.00)))
GO

ALTER TABLE [Discounts] CHECK CONSTRAINT [CK_Discounts_DiscountPct]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [DiscountPct] >= (0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'CK_Discounts_DiscountPct'
GO

ALTER TABLE [Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts_MaxQty] CHECK  (([MaxQty]>=(0)))
GO

ALTER TABLE [Discounts] CHECK CONSTRAINT [CK_Discounts_MaxQty]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [MaxQty] >= (0)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'CK_Discounts_MaxQty'
GO

ALTER TABLE [Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts_MinQty] CHECK  (([MinQty]>=(0)))
GO

ALTER TABLE [Discounts] CHECK CONSTRAINT [CK_Discounts_MinQty]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [MinQty] >= (0)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'CK_Discounts_MinQty'
GO

ALTER TABLE [Discounts] ADD  CONSTRAINT [DF_Discounts_DiscountPct]  DEFAULT ((0.00)) FOR [DiscountPct]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 0.0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'DF_Discounts_DiscountPct'
GO

ALTER TABLE [Discounts] ADD  CONSTRAINT [DF_Discounts_MinQty]  DEFAULT ((0)) FOR [MinQty]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 0.0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'DF_Discounts_MinQty'
GO

ALTER TABLE [Discounts] ADD  CONSTRAINT [DF_Discounts_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of NEWID()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'DF_Discounts_rowguid'
GO

ALTER TABLE [Discounts] ADD  CONSTRAINT [DF_Discounts_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Discounts', @level2type=N'CONSTRAINT',@level2name=N'DF_Discounts_ModifiedDate'
GO


