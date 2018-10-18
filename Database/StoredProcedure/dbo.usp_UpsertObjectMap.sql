SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ObjectMap] table
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
CREATE PROCEDURE [dbo].[usp_UpsertObjectMap]
	
	@PK_ObjectMap AS NVARCHAR(50) = -1 ,
	@GroupTag AS NVARCHAR(50) = NULL,
	@ewebTagV3 AS NVARCHAR(50) = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_ObjectMap = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ObjectMap] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[ObjectMap]
		(
		[GroupTag] ,
		[ewebTagV3] )
		OUTPUT Inserted.PK_ObjectMap INTO @Result 
		SELECT 
		@GroupTag,
		@ewebTagV3
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ObjectMap] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[GroupTag] = COALESCE(@GroupTag,[ur].[GroupTag]),
		[ur].[ewebTagV3] = COALESCE(@ewebTagV3,[ur].[ewebTagV3])
		FROM [ctl].[ObjectMap] AS [ur]
		WHERE [PK_ObjectMap] = @PK_ObjectMap
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[ObjectMap] WHERE PK_ObjectMap = @PK_ObjectMap) = 0
	    SET @PK_ObjectMap = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ObjectMap) AS [PK] 
	-- ------------------------------------------------------------
END
GO
