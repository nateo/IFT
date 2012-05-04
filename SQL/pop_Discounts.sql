insert into [IFT].[dbo].Discounts (
	[Description]
      ,[DiscountPercent]
      ,[Type]
      ,[Category]
      ,[MinQty]
      ,[MaxQty]
      ,[rowguid]
      ,[ModifiedDate]
      , [ModifiedBy]
) 
SELECT top 6
	[Description]
      ,[DiscountPct]
      ,[Type]
      ,[Category]
      ,[MinQty]
      ,[MaxQty]
      ,[rowguid]
      ,[ModifiedDate]
      ,'nate'

  FROM [AdventureWorks].[Sales].[SpecialOffer]



