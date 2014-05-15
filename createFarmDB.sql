IF EXISTS(SELECT 1 FROM master.dbo.sysdatabases WHERE name = 'FarmDB') 
BEGIN
DROP DATABASE FarmDB
END
GO

CREATE DATABASE FarmDB
GO

USE [FarmDB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO


CREATE TABLE [dbo].[Production](
	[ProductionID]		[int] IDENTITY(1,1)		NOT NULL,
	[Year]				[int]					NOT NULL 	CHECK ((Year > 1800) AND (Year < 2100)),
	[PlantDate]			[date]					NOT NULL,
	[HarvestDate]		[date]					NOT NULL,
	[Yield]				[int]					NOT NULL,
	[FieldID]			[int]					NOT NULL,
	[SeedID]			[int]					NOT NULL,
	[Active]			[bit] DEFAULT('1')		NOT NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[ProductionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Production] UNIQUE NONCLUSTERED 
(
	[Year] ASC,
	[FieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Field](
	[FieldID]			[int] IDENTITY(1,1)		NOT NULL,
	[FieldName]			[varchar](50)			NOT NULL,
	[Acres]				[int]					NOT NULL,
	[Owner]				[varchar](50)			NOT NULL DEFAULT ('Willhoit Farms'),
	[Active]			[bit] 					NOT NULL DEFAULT('1'),


 CONSTRAINT [PK_Field] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Seed](
	[SeedID]			[int] IDENTITY(1,1)		NOT NULL,
	[Variety]			[varchar](30)			NOT NULL,
	[SeedName]			[varchar](50)			NOT NULL,
	[Crop]				[varchar](25)			NOT NULL,
	[BrandID]			[int]					NOT NULL,
	[Active]			[bit] 					NOT NULL DEFAULT('1'),


 CONSTRAINT [PK_Seed] PRIMARY KEY CLUSTERED 
(
	[SeedID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Brand](
	[BrandID]			[int] IDENTITY(1,1)		NOT NULL,
	[BrandName]			[varchar](50)			NOT NULL,
	[BrandDealerName]	[varchar](50)			NOT NULL,
	[Active]			[bit]					NOT NULL  DEFAULT('1')	,


 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Chemical](
	[ChemicalID]		[int] IDENTITY(1,1)		NOT NULL,
	[ChemicalName]		[varchar](50)			NOT NULL,
	[ChemicalBrand]		[varchar](50)			NOT NULL,
	[ChemicalType]		[varchar](50)			NOT NULL,
	[Active]			[bit]					NOT NULL  DEFAULT('1')	,


 CONSTRAINT [PK_Chemical] PRIMARY KEY CLUSTERED 
(
	[ChemicalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Chemical_Production](
	[ChemicalID]		[int]					NOT NULL,
	[ProductionID]		[int]					NOT NULL,
	[ApplicationDate]	[date]					NOT NULL,
	[Active]			[bit]					NOT NULL  DEFAULT('1')	,

 CONSTRAINT [PK_Chemical_Production] PRIMARY KEY NONCLUSTERED 
(
	[ChemicalID], [ProductionID] 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




/* *** Add the foreign key constraints on the Production table *** */

ALTER TABLE [dbo].[Production]  WITH NOCHECK ADD  CONSTRAINT [FK_Production_Field] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Field] ([FieldID])
GO

ALTER TABLE [dbo].[Production]  WITH NOCHECK ADD  CONSTRAINT [FK_Production_Seed] FOREIGN KEY([SeedID])
REFERENCES [dbo].[Seed] ([SeedID])
GO

/* *** Add the foreign key constraints on the Seed table *** */

ALTER TABLE [dbo].[Seed]  WITH NOCHECK ADD  CONSTRAINT [FK_Seed_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO


/* *** Add the foreign key constraints on the Chemical_Production table *** */

ALTER TABLE [dbo].[Chemical_Production]  WITH NOCHECK ADD  CONSTRAINT [FK_Chemical_Production_Chemical] FOREIGN KEY([ChemicalID])
REFERENCES [dbo].[Chemical] ([ChemicalID])
GO

ALTER TABLE [dbo].[Chemical_Production]  WITH NOCHECK ADD  CONSTRAINT [FK_Chemical_Production_Production] FOREIGN KEY([ProductionID])
REFERENCES [dbo].[Production] ([ProductionID])
GO






/* *** Inserts *** */

SET ANSI_PADDING OFF
GO 


/* Inserts for Brand Table */
INSERT [dbo].[Brand]( [BrandName], [BrandDealerName], [Active]) VALUES ( 'Stine', 'Roger Timberry', 1) 
INSERT [dbo].[Brand]( [BrandName], [BrandDealerName], [Active]) VALUES ( 'Middlekoop', 'Gary Shinehart', 1) 
INSERT [dbo].[Brand]( [BrandName], [BrandDealerName], [Active]) VALUES ( 'Garst', 'Reginal Picklebarrel', 1) 
INSERT [dbo].[Brand]( [BrandName], [BrandDealerName], [Active]) VALUES ( 'Pioneer', 'Robert Ducca', 1) 
INSERT [dbo].[Brand]( [BrandName], [BrandDealerName], [Active]) VALUES ( 'Agripro', 'Scott Auckerman', 1) 
GO


/* Inserts for Seed Table */
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( '9100RR', 'Roundup Ready Corn 2','Corn', 1)
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( 'R9424SS', 'Genuity SmartStax RI','Corn', 2)
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( '24204', 'Roundup Ready Soybeans','Soybeans', 1)
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( '01LE06', 'LibertyLink','Soybeans', 3)
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( 'P9834AMX', 'Optimum AcreMax','Corn', 4)
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( '54B66', 'Alfamale','Alfalfa', 4)
INSERT [dbo].[Seed] ( [Variety], [SeedName], [Crop], [BrandID]) VALUES ( 'W1377', 'The Heavyweighter','Wheat', 5)
GO


/* Inserts for Field Table */
INSERT [dbo].[Field] ( [FieldName], [Acres], [Owner], [Active]) VALUES ( 'Sharkys', 75,'Tim Sharkstein', 1)
INSERT [dbo].[Field] ( [FieldName], [Acres], [Owner], [Active]) VALUES ( 'Maury', 75,'Gary Maury', 1)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Bathous', 75)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Treewoo', 140)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Shnaumi', 130)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Hills', 75)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Deere', 75)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Eighty', 80)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Bottom', 75)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Vermeer', 75)
INSERT [dbo].[Field] ( [FieldName], [Acres] ) VALUES ( 'Recksvs', 80)
GO





/* Inserts for Chemical Table */


INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Roundup', 'Monsanto','Herbicide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'GaurdsmanMax', 'BASF','Herbicide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Fertapro', 'Scotts','Fertilizer')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Aztec', 'Amvac','Insecticide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Pounce', 'Agricultural','Insecticide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Dizziecat', 'Monsanto','Fungicide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Nervenna', 'BASF','Insecticide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Staphicide', 'Scotts','Insecticide')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Poobarrel', 'Amvac','Fertilizer')
INSERT [dbo].[Chemical] ( [ChemicalName], [ChemicalBrand], [ChemicalType]) VALUES ( 'Smelltrain', 'Agricultural','Fertilizer')
GO


/* Inserts for Production Table */


INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2000, '2000-4-30','2000-10-15', 145, 1, 1)
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2000, '2000-5-1','2000-10-15', 100, 3, 1 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2000, '2000-5-2','2000-10-19', 130, 2, 3 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2001, '2001-4-29','2001-10-18', 120, 1, 4 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2001, '2001-5-8','2001-10-30', 105, 3, 5 )

INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2001, '2001-5-9','2001-10-29', 122, 2, 4 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2002, '2002-5-11','2002-10-11', 181, 5, 3 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2002, '2002-5-13','2002-10-12', 166, 4, 2 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2002, '2002-5-5','2002-10-16', 146, 3, 1 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2003, '2003-5-6','2003-10-15', 122, 4, 2 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2003, '2003-5-8','2003-10-29', 144, 3, 3 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2003, '2003-5-20','2003-10-15', 190, 2, 4 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2004, '2004-5-17','2004-10-19', 111, 2, 5 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2004, '2004-5-16','2004-10-21', 106, 3, 6 )
INSERT [dbo].[Production] ( [Year], [PlantDate], [HarvestDate], [Yield], [FieldID], [SeedID]) VALUES ( 2004, '2004-5-20','2004-10-20', 155, 4, 7 )

GO



/* Inserts for Chemical_Production Table */

INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate] ) VALUES ( 1, 1, '2000-7-8')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate]  ) VALUES ( 3, 1, '2000-6-8')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate]  ) VALUES ( 5, 1, '2000-5-8')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate]  ) VALUES ( 3, 2, '2000-7-9')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate]  ) VALUES ( 5, 2, '2000-7-10')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate]  ) VALUES ( 1, 3, '2000-7-3')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate] ) VALUES ( 3, 3, '2000-7-4')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate] ) VALUES ( 2, 4, '2001-7-1')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate] ) VALUES ( 3, 4, '2001-7-10')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate] ) VALUES ( 4, 4, '2001-7-9')
INSERT [dbo].[Chemical_Production] ( [ChemicalID], [ProductionID], [ApplicationDate] ) VALUES ( 4, 5, '2001-7-4')

GO








/******BRAND STORED PROCEDURES*******/
/******BRAND STORED PROCEDURES*******/



/* Get MAX BrandID*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandMaxID]
AS
	SELECT MAX(BrandID)
	FROM Brand
	Return
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandGetAll]
AS
	SELECT *
	FROM Brand 
	Return
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandGetActive]
AS
	SELECT *
	FROM Brand
	WHERE Active = 1 
	Return
GO

/* Add a brand in Brand Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandAdd]
	(@BrandName varchar(50),
	 @BrandDealerName varchar(50))
AS
	INSERT INTO Brand
	    (BrandName, BrandDealerName)
	VALUES
	    (@BrandName, @BrandDealerName)    
	RETURN @@ROWCOUNT
GO






/* Search for a brand by BrandID */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandGetByID]
	(@BrandID int)
AS
	SELECT *
	FROM Brand
	WHERE BrandID = @BrandID
	Return
GO

/* Update BrandName in Brand Table  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandUpdateBrandName]
	(@BrandName varchar(50),
	 @original_BrandID int,
	 @original_BrandName varchar(50))
AS
	UPDATE Brand
	SET BrandName = @BrandName
	WHERE BrandID = @original_BrandID
	AND BrandName = @original_BrandName

	RETURN @@ROWCOUNT
GO

/* Update BrandDealerName in Brand Table  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandUpdateBrandDealerName]
	(@BrandDealerName varchar(50),
	 @original_BrandID int,
	 @original_BrandDealerName varchar(50))
AS
	UPDATE Brand
	SET BrandDealerName = @BrandDealerName
	WHERE BrandID = @original_BrandID
	AND BrandDealerName = @original_BrandDealerName

	RETURN @@ROWCOUNT
GO


/* Update Active in Brand Table (SoftDelete) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandUpdateActive]
	(@Active bit,
	 @original_BrandID int,
	 @original_Active bit)
AS
	UPDATE Brand
	SET Active = @Active
	WHERE BrandID = @original_BrandID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO


/* Update Brand in Brand Table  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBrandUpdate]
	(@BrandName varchar(50),
   	 @BrandDealerName varchar(50),
   	 @Active bit,
	 @original_BrandID int,
	 @original_BrandName varchar(50),
	 @original_BrandDealerName varchar(50),
   	 @original_Active bit)
AS
	UPDATE Brand
	SET BrandName = @BrandName,
		BrandDealerName = @BrandDealerName,
		Active = @Active
	WHERE BrandID = @original_BrandID
	AND BrandName = @original_BrandName
	AND BrandDealerName = @original_BrandDealerName
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO


/* Delete Brand from Brand Table */


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteBrand]
	(@BrandID int,
	 @BrandName varchar(50),
   	 @BrandDealerName varchar(50),
   	 @Active bit)
AS
	DELETE Brand
	WHERE BrandID = @BrandID
	  AND BrandName = @BrandName
	  AND BrandDealerName = @BrandDealerName
	  AND Active = @Active
	
	RETURN @@ROWCount
GO





/******END OF BRAND STORED PROCEDURES*******/
/******END OF BRAND STORED PROCEDURES*******/



/******FIELD STORED PROCEDURES*******/
/******FIELD STORED PROCEDURES*******/


/* Get MAX FieldID*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldMaxID]
AS
	SELECT MAX(FieldID)
	FROM Field
	Return
GO

/* Get all Field Names */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldGetNames]
AS
	SELECT FieldName 
	FROM Field
	Return
GO

/* Get all Fields */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetFields]
AS
	SELECT *
	FROM Field 
	Return
GO


/* Get all Fields that are active */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetActiveFields]
AS
	SELECT *
	FROM Field
	WHERE Active = 1 
	Return
GO


/* Search for a field by FieldID */


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldGetByID]
	(@FieldID int)
AS
	SELECT *
	FROM Field
	WHERE FieldID = @FieldID
	Return
GO


/* Add Field to Field Table - missing active column */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertField]
	(@FieldName varchar(50),
	 @Acres varchar(50),
	 @Owner varchar(50))
AS
	INSERT INTO Field
	    (FieldName, Acres, Owner)
	VALUES
	    (@FieldName, @Acres, @Owner)
	RETURN @@ROWCOUNT
GO



/* Update Field in Field Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateField]
	(@FieldName varchar(50),
	 @Acres int,
	 @Owner varchar(50),
	 @Active bit,
	 @original_FieldID int,
	 @original_FieldName varchar(50),
	 @original_Acres int,
	 @original_Owner varchar(50),
	 @original_Active bit)
AS
	UPDATE Field
	   SET FieldName = @FieldName,
	       Acres = @Acres,
	       Owner = @Owner,
	       Active = @Active
	WHERE FieldID = @original_FieldID
	  AND FieldName = @original_FieldName
	  AND Acres = @original_Acres
	  AND Owner = @original_Owner
	  AND Active = @original_Active
	  	
	RETURN @@ROWCOUNT
GO



/* Update FieldName in Field Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldUpdateName]
	(@FieldName varchar(50),
	 @original_FieldID int,
	 @original_FieldName varchar(50))
AS
	UPDATE Field
	SET FieldName = @FieldName
	WHERE FieldID = @original_FieldID
	AND FieldName = @original_FieldName

	RETURN @@ROWCOUNT
GO


/* Update Acre in Field Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldUpdateAcres]
	(@Acres int,
	 @original_FieldID int,
	 @original_Acres int)
AS
	UPDATE Field
	SET Acres = @Acres
	WHERE FieldID = @original_FieldID
	AND Acres = @original_Acres

	RETURN @@ROWCOUNT
GO


/* Update Owner in Field Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldUpdateOwner]
	(@Owner varchar(50),
	 @original_FieldID int,
	 @original_Owner varchar(50))
AS
	UPDATE Field
	SET Owner = @Owner
	WHERE FieldID = @original_FieldID
	AND Owner = @original_Owner

	RETURN @@ROWCOUNT
GO



/* Update Active in Field Table (SoftDelete) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFieldUpdateActive]
	(@Active bit,
	 @original_FieldID int,
	 @original_Active bit)
AS
	UPDATE Field
	SET Active = @Active
	WHERE FieldID = @original_FieldID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO


/* Delete Field from Field Table */


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteField]
	(@FieldID int,
	 @FieldName varchar(50),
	 @Acres int,
	 @Owner varchar(50),
	 @Active bit)
AS
	DELETE Field
	WHERE FieldID = @FieldID
	  AND FieldName = @FieldName
	  AND Acres = @Acres
	  AND Owner = @Owner	  	  
	  AND Active = @Active
	
	RETURN @@ROWCount
GO


/******END OF FIELD STORED PROCEDURES*******/
/******END OF FIELD STORED PROCEDURES*******/



/******SEED STORED PROCEDURES******/
/******SEED STORED PROCEDURES******/


/* Get MAX SeedID*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedMaxID]
AS
	SELECT MAX(SeedID)
	FROM Seed
	Return
GO


/* Get all Seed Variety */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedGetVariety]
AS
	SELECT Variety 
	FROM Seed
	Return
GO


/* Get all Seeds */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedGetAll]
AS
	SELECT *
	FROM Seed 
	Return
GO


/* Get all Seeds that are active */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedGetAllActive]
AS
	SELECT *
	FROM Seed
	WHERE Active = 1 
	Return
GO

/* Search for a SeedVBObject by SeedID */


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedVBGetByID]
	(@SeedID int)
AS
	SELECT s.SeedID, s.Variety, s.SeedName, s.Crop, s.BrandID, b.BrandName, s.Active 
		FROM Brand b JOIN Seed s 
		ON b.BrandID = s.BrandID

	WHERE SeedID = @SeedID
	Return
GO


/* Search for a Seed by SeedID */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedGetByID]
	(@SeedID int)
AS
	SELECT *
	FROM Seed
	WHERE SeedID = @SeedID
	Return
GO



/* Add Seed to Seed Table - missing active column */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedAdd]
	(@Variety varchar(30),
	 @SeedName varchar(50),
	 @Crop varchar(50),
	 @BrandID int)
AS
	INSERT INTO Seed
	    (Variety, SeedName, Crop, BrandID)
	VALUES
	    (@Variety, @SeedName, @Crop, @BrandID)

	RETURN @@ROWCOUNT
GO

/* Update Variety in Seed Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedUpdateVariety]
	(@Variety varchar(30),
	 @original_SeedID int,
	 @original_Variety varchar(30))
AS
	UPDATE Seed
	SET Variety = @Variety
	WHERE SeedID = @original_SeedID
	AND Variety = @original_Variety
	RETURN @@ROWCOUNT
GO

/* Update SeedName in Seed Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedUpdateSeedName]
	(@SeedName varchar(50),
	 @original_SeedID int,
	 @original_SeedName varchar(50))
AS
	UPDATE Seed
	SET SeedName = @SeedName
	WHERE SeedID = @original_SeedID
	AND SeedName = @original_SeedName
	RETURN @@ROWCOUNT
GO

/* Update Crop in Seed Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedUpdateCrop]
	(@Crop varchar(50),
	 @original_SeedID int,
	 @original_Crop varchar(50))
AS
	UPDATE Seed
	SET Crop = @Crop
	WHERE SeedID = @original_SeedID
	AND Crop = @original_Crop
	RETURN @@ROWCOUNT
GO

/* Update BrandID in Seed Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedUpdateBrandID]
	(@BrandID int,
	 @original_SeedID int,
	 @original_BrandID int)
AS
	UPDATE Seed
	SET BrandID = @BrandID
	WHERE SeedID = @original_SeedID
	AND BrandID = @original_BrandID
	RETURN @@ROWCOUNT
GO

/* Update Active in Seed Table (SoftDelete) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSeedUpdateActive]
	(@Active bit,
	 @original_SeedID int,
	 @original_Active bit)
AS
	UPDATE Seed
	SET Active = @Active
	WHERE SeedID = @original_SeedID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO






/* Update Seed in Seed Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateSeed]
	(@Variety varchar(30),
	 @SeedName varchar(50),
	 @Crop varchar(50),
	 @BrandID int,
	 @Active bit,
	 @original_SeedID int,
	 @original_Variety varchar(30),
	 @original_SeedName varchar(50),
	 @original_Crop varchar(50),
	 @original_BrandID int,
	 @original_Active bit)
AS
	UPDATE Seed
	   SET Variety = @Variety,
	   	   SeedName = @SeedName,
	       Crop = @Crop,
	       BrandID = @BrandID,
	       Active = @Active
	WHERE SeedID = @original_SeedID
	  AND SeedName = @original_SeedName
	  AND Crop = @original_Crop
	  AND Active = @original_Active
	  	
	RETURN @@ROWCOUNT
GO



/* Delete Seed from Seed Table */


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteSeed]
	(@SeedID int,
	 @Variety varchar(30),
	 @SeedName varchar(30),
	 @Crop varchar(25),
	 @BrandID int,
	 @Active bit)
AS
	DELETE Seed
	WHERE SeedID = @SeedID
	  AND Variety = @Variety
	  AND SeedName = @SeedName
	  AND Crop = @Crop
	  AND BrandID = @BrandID	  	  
	  AND Active = @Active
	
	RETURN @@ROWCount
GO



/******END OF SEED STORED PROCEDURES******/
/******END OF SEED STORED PROCEDURES******/




/******CHEMCIAL STORED PROCEDURES*******/
/******CHEMCIAL STORED PROCEDURES*******/


/* Get MAX ChemicalID*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalMaxID]
AS
	SELECT MAX(ChemicalID)
	FROM Chemical
	Return
GO

/* Add Chemical to Chemical Table - missing active column */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalAdd]
	(@ChemicalName varchar(50),
	 @ChemicalBrand varchar(50),
	 @ChemicalType varchar(50))
AS
	INSERT INTO Chemical
	    (ChemicalName, ChemicalBrand, ChemicalType)
	VALUES
	    (@ChemicalName, @ChemicalBrand, @ChemicalType)    
	RETURN @@ROWCOUNT
GO



/* Get all Chemicals */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalGetAll]
AS
	SELECT *
	FROM Chemical 
	Return
GO


/* Get all Chemicals that are active */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalGetAllActive]
AS
	SELECT *
	FROM Chemical
	WHERE Active = 1 
	Return
GO


/* Search for a Chemical by ChemcialID */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalGetByID]
	(@ChemicalID int)
AS
	SELECT *
	FROM Chemical
	WHERE ChemicalID = @ChemicalID
	Return
GO

/* Update ChemicalName in Chemical Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalUpdateName]
	(@ChemicalName varchar(50),
	 @original_ChemicalID int,
	 @original_ChemicalName varchar(50))
AS
	UPDATE Chemical
	SET ChemicalName = @ChemicalName
	WHERE ChemicalID = @original_ChemicalID
	AND ChemicalName = @original_ChemicalName
	RETURN @@ROWCOUNT
GO


/* Update ChemicalBrand in Chemical Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalUpdateBrand]
	(@ChemicalBrand varchar(50),
	 @original_ChemicalID int,
	 @original_ChemicalBrand varchar(50))
AS
	UPDATE Chemical
	SET ChemicalBrand = @ChemicalBrand
	WHERE ChemicalID = @original_ChemicalID
	AND ChemicalBrand = @original_ChemicalBrand
	RETURN @@ROWCOUNT
GO


/* Update ChemicalType in Chemical Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalUpdateType]
	(@ChemicalType varchar(50),
	 @original_ChemicalID int,
	 @original_ChemicalType varchar(50))
AS
	UPDATE Chemical
	SET ChemicalType = @ChemicalType
	WHERE ChemicalID = @original_ChemicalID
	AND ChemicalType = @original_ChemicalType
	RETURN @@ROWCOUNT
GO

/* Update Active in Chemical Table (SoftDelete) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalUpdateActive]
	(@Active bit,
	 @original_ChemicalID int,
	 @original_Active bit)
AS
	UPDATE Chemical
	SET Active = @Active
	WHERE ChemicalID = @original_ChemicalID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO

/* Update Chemical in Chemical Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateChemical]
	(@ChemicalName varchar(50),
 	 @ChemicalBrand varchar(50),
	 @ChemicalType varchar(50),
	 @Active bit,
	 @original_ChemicalID int,
	 @original_ChemicalName varchar(50),
	 @original_ChemicalBrand varchar(50),
	 @original_ChemicalType varchar(50),
	 @original_Active bit)
AS
	UPDATE Chemical
	   SET ChemicalName = @ChemicalName,
	       ChemicalBrand = @ChemicalBrand,
	       ChemicalType = @ChemicalType,
	       Active = @Active
	WHERE ChemicalID = @original_ChemicalID
	  AND ChemicalName = @original_ChemicalName
	  AND ChemicalBrand = @original_ChemicalBrand
	  AND ChemicalType = @original_ChemicalType
	  AND Active = @original_Active
	  	
	RETURN @@ROWCOUNT
GO


/* Delete Chemical from Chemical Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemicalDelete]
	(@ChemicalID int,
	 @ChemicalName varchar(50),
 	 @ChemicalBrand varchar(50),
	 @ChemicalType varchar(50),
	 @Active bit)
AS
	DELETE Chemical
	WHERE ChemicalID = @ChemicalID
	  AND ChemicalName = @ChemicalName
	  AND ChemicalBrand = @ChemicalBrand
	  AND ChemicalType = @ChemicalType
	  AND Active = @Active
	  	
	RETURN @@ROWCOUNT
GO



/******END OF CHEMCIAL STORED PROCEDURES*******/
/******END OF CHEMCIAL STORED PROCEDURES*******/



/******PRODUCTION STORED PROCEDURES******/
/******PRODUCTION STORED PROCEDURES******/


/* Add Production to Production Table - missing active column */


/* Get MAX ProductionID*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionMaxID]
AS
	SELECT MAX(ProductionID)
	FROM Production
	Return
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionAdd]
	(@Year int,
	 @PlantDate date,
	 @HarvestDate date,
	 @Yield int,
	 @FieldID int,
	 @SeedID int)
AS
	INSERT INTO Production
	    (Year, PlantDate, HarvestDate, Yield, FieldID, SeedID)
	VALUES
	    (@Year, @PlantDate, @HarvestDate, @Yield, @FieldID, @SeedID)

	RETURN @@ROWCOUNT
GO




/* Get Production from Production Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionGetByID]
	(@ProductionID int)
AS
	SELECT * FROM Production
	WHERE ProductionID = @ProductionID
	
	RETURN
GO



/* Update Year in Production Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdateYear]
	(@Year int,
	 @original_ProductionID int,
	 @original_Year int)
AS
	UPDATE Production
	SET Year = @Year
	WHERE ProductionID = @original_ProductionID
	AND Year = @original_Year

	RETURN @@ROWCOUNT
GO

/* Update FieldID in Production Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdateFieldID]
	(@FieldID int,
	 @original_ProductionID int,
	 @original_FieldID int)
AS
	UPDATE Production
	SET FieldID = @FieldID
	WHERE ProductionID = @original_ProductionID
	AND FieldID = @original_FieldID

	RETURN @@ROWCOUNT
GO

/* Update SeedID in Production Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdateSeedID]
	(@SeedID int,
	 @original_ProductionID int,
	 @original_SeedID int)
AS
	UPDATE Production
	SET SeedID = @SeedID
	WHERE ProductionID = @original_ProductionID
	AND SeedID = @original_SeedID

	RETURN @@ROWCOUNT
GO

/* Update PlantDate in Production Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdatePlantDate]
	(@PlantDate date,
	 @original_ProductionID int,
	 @original_PlantDate date)
AS
	UPDATE Production
	SET PlantDate = @PlantDate
	WHERE ProductionID = @original_ProductionID
	AND PlantDate = @original_PlantDate

	RETURN @@ROWCOUNT
GO

/* Update HarvestDate in Production Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdateHarvestDate]
	(@HarvestDate date,
	 @original_ProductionID int,
	 @original_HarvestDate date)
AS
	UPDATE Production
	SET HarvestDate = @HarvestDate
	WHERE ProductionID = @original_ProductionID
	AND HarvestDate = @original_HarvestDate

	RETURN @@ROWCOUNT
GO

/* Update Yield in Production Table */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdateYield]
	(@Yield int,
	 @original_ProductionID int,
	 @original_Yield int)
AS
	UPDATE Production
	SET Yield = @Yield
	WHERE ProductionID = @original_ProductionID
	AND Yield = @original_Yield

	RETURN @@ROWCOUNT
GO


/* Update Active in Production Table (SoftDelete) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdateActive]
	(@Active bit,
	 @original_ProductionID int,
	 @original_Active bit)
AS
	UPDATE Production
	SET Active = @Active
	WHERE ProductionID = @original_ProductionID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO




/* Update Production Table  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionUpdate]
	(@Year int,
     @PlantDate date,
     @HarvestDate date,
     @Yield int,
     @FieldID int,
     @SeedID int,
     @Active bit,
	 @original_ProductionID int,
	 @original_Year int,
     @original_PlantDate date,
     @original_HarvestDate date,
     @original_Yield int,
     @original_FieldID int,
     @original_SeedID int,
	 @original_Active bit)
AS
	UPDATE Production
	SET Year = @Year,
		PlantDate = @PlantDate,
		HarvestDate = @HarvestDate,
		Yield = @Yield,
		FieldID = @FieldID,
		SeedID = @SeedID,
		Active = @Active
	WHERE ProductionID = @original_ProductionID
	AND Year = @original_Year
	AND PlantDate = @original_PlantDate
	AND HarvestDate = @original_HarvestDate
	AND Yield = @original_Yield
	AND FieldID = @original_FieldID
	And SeedID = @original_SeedID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO




/* Delete Production Table  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductionDelete]
	(@ProductionID int,
	 @Year int,
     @PlantDate date,
     @HarvestDate date,
     @Yield int,
     @FieldID int,
     @SeedID int,
     @Active bit)
AS
	DELETE Production
	WHERE ProductionID = @ProductionID
	AND Year = @Year
	AND PlantDate = @PlantDate
	AND HarvestDate = @HarvestDate
	AND Yield = @Yield
	AND FieldID = @FieldID
	And SeedID = @SeedID
	AND Active = @Active

	RETURN @@ROWCOUNT
GO




/******END OF PRODUCTION STORED PROCEDURES******/
/******END OF PRODUCTION STORED PROCEDURES******/





/******CHEMICAL_PRODUCTION STORED PROCEDURES******/
/******CHEMICAL_PRODUCTION STORED PROCEDURES******/


/* Add Chemical_Production to Chemical_Production Table - missing active column */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemical_ProductionAddRelationship]
	(@ChemicalID int,
	 @ProductionID int,
	 @ApplicationDate date)
AS
	INSERT INTO Chemical_Production
	    (ChemicalID, ProductionID, ApplicationDate)
	VALUES
	    (@ChemicalID, @ProductionID, @ApplicationDate)
	     
	     
	RETURN @@ROWCOUNT
GO


/* Get Chemicals from a Production from the Chemical_Production Table */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemical_ProductionGetByProductionID]
	(@ProductionID int)
AS
	SELECT * FROM Chemical_Production WHERE ProductionID = @ProductionID
	
	RETURN
GO


/* Get Chemical_Production information based on ProductionID */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemical_ProductionGetChemicalByProductionID]
	(@ProductionID int)
AS
	SELECT cp.ProductionID, cp.ChemicalID, c.ChemicalType, c.ChemicalBrand, c.ChemicalName, cp.ApplicationDate, cp.Active
	FROM Chemical_Production cp
	JOIN Chemical c
	ON cp.ChemicalID = c.ChemicalID
	WHERE ProductionID = @ProductionID 
	ORDER BY c.ChemicalType

	RETURN
GO


/* Get Chemical_Production information based on ProductionID - ACTIVE ONLY! */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemical_ProductionGetChemicalByProductionIDActive]
	(@ProductionID int)
AS
	SELECT cp.ProductionID, cp.ChemicalID, c.ChemicalType, c.ChemicalBrand, c.ChemicalName, cp.ApplicationDate, cp.Active
	FROM Chemical_Production cp
	JOIN Chemical c
	ON cp.ChemicalID = c.ChemicalID
	WHERE ProductionID = @ProductionID 
	AND  cp.Active = 1
	ORDER BY c.ChemicalType

	RETURN
GO


/* Swap a Chemical_Production Active - soft delete */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemical_ProductionUpdateActive]
	(@original_ProductionID int,
	 @original_ChemicalID int,
	 @original_Active bit,
	 @Active bit)
AS
	UPDATE Chemical_Production
	SET Active = @Active
	WHERE ProductionID = @original_ProductionID
	AND ChemicalID = @original_ChemicalID
	AND Active = @original_Active

	RETURN @@ROWCOUNT
GO


/* Edit a Chemical_Production Application Date */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spChemical_ProductionEditApplicationDate]
	(@original_ProductionID int,
	 @original_ChemicalID int,
	 @original_ApplicationDate date,
	 @new_ApplicationDate date)
AS
	UPDATE Chemical_Production
	SET ApplicationDate = @new_ApplicationDate
	WHERE ProductionID = @original_ProductionID
	AND ChemicalID = @original_ChemicalID
	AND ApplicationDate = @original_ApplicationDate

	RETURN @@ROWCOUNT
GO



/******END OF CHEMICAL_PRODUCTION STORED PROCEDURES ******/
/******END OF CHEMICAL_PRODUCTION STORED PROCEDURES ******/