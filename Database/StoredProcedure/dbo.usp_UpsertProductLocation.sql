SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ProductLocation] table
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
CREATE PROCEDURE [dbo].[usp_UpsertProductLocation]
	
	@PK_ProductLocation AS INT = -1 ,
	@Warehouse AS NVARCHAR(100) = NULL,
	@Site AS NVARCHAR(50) = NULL,
	@Emplacement AS NVARCHAR(50) = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_ProductLocation = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ProductLocation] 
		-- ------------------------------------------------------------
		INSERT INTO [inv].[ProductLocation]
		(
		[Warehouse] ,
		[Site] ,
		[Emplacement] )
		OUTPUT Inserted.PK_ProductLocation INTO @Result 
		SELECT 
		@Warehouse,
		@Site,
		@Emplacement
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ProductLocation] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Warehouse] = COALESCE(@Warehouse,[ur].[Warehouse]),
		[ur].[Site] = COALESCE(@Site,[ur].[Site]),
		[ur].[Emplacement] = COALESCE(@Emplacement,[ur].[Emplacement])
		FROM [inv].[ProductLocation] AS [ur]
		WHERE [PK_ProductLocation] = @PK_ProductLocation
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [inv].[ProductLocation] WHERE PK_ProductLocation = @PK_ProductLocation) = 0
	    SET @PK_ProductLocation = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ProductLocation) AS [PK] 
	-- ------------------------------------------------------------
END
GO