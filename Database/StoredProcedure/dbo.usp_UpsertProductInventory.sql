SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ProductInventory] table
-- NOTE : DO NOT UPDATE this stored procedure, 
--        the code was autogenerated by usp_GenerateUpsertStodedProcedure
-- ----------------------------------------------------------------------------
--  How to call this stored procedure ....
-- 
-- 	EXEC	@return_value = [dbo].[usp_UpsertCity]
-- 		@PK_City = -1,
-- 		@Code = N'LAV', 
-- 		@Name = N'Laval' 
-- 
-- 
CREATE PROCEDURE [dbo].[usp_UpsertProductInventory]
	
	@PK_ProductInventory AS INT = -1 ,
	@FK_Product AS INT = NULL,
	@FK_ProductLocation AS INT = NULL,
	@UnitCost AS REAL = NULL,
	@InStock AS REAL = NULL,
	@ReservedStock AS REAL = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_ProductInventory = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ProductInventory] 
		-- ------------------------------------------------------------
		INSERT INTO [inv].[ProductInventory]
		(
		[FK_Product] ,
		[FK_ProductLocation] ,
		[UnitCost] ,
		[InStock] ,
		[ReservedStock] )
		OUTPUT Inserted.PK_ProductInventory INTO @Result 
		SELECT 
		@FK_Product,
		@FK_ProductLocation,
		@UnitCost,
		@InStock,
		@ReservedStock
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ProductInventory] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[FK_Product] = COALESCE(@FK_Product,[ur].[FK_Product]),
		[ur].[FK_ProductLocation] = COALESCE(@FK_ProductLocation,[ur].[FK_ProductLocation]),
		[ur].[UnitCost] = COALESCE(@UnitCost,[ur].[UnitCost]),
		[ur].[InStock] = COALESCE(@InStock,[ur].[InStock]),
		[ur].[ReservedStock] = COALESCE(@ReservedStock,[ur].[ReservedStock])
		FROM [inv].[ProductInventory] AS [ur]
		WHERE [PK_ProductInventory] = @PK_ProductInventory
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [inv].[ProductInventory] WHERE PK_ProductInventory = @PK_ProductInventory) = 0
	    SET @PK_ProductInventory = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ProductInventory) AS [PK] 
	-- ------------------------------------------------------------
END
GO
