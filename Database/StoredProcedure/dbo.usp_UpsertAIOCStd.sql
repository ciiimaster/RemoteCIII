SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [AIOCStd] table
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
CREATE PROCEDURE [dbo].[usp_UpsertAIOCStd]
	
	@PK_AIOCStd AS INT = -1 ,
	@ObjectIdentifier AS NVARCHAR(50) = NULL,
	@ObjectName AS NVARCHAR(50) = NULL,
	@Description AS NVARCHAR(4000) = NULL,
	@Units AS NVARCHAR(50) = NULL,
	@MaxValue AS REAL = NULL,
	@MinValue AS REAL = NULL,
	@HalFlags AS NVARCHAR(50) = NULL,
	@IsAIC AS BIT = NULL,
	@MarkedAsDeleted AS BIT = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_AIOCStd = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [AIOCStd] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[AIOCStd]
		(
		[ObjectIdentifier] ,
		[ObjectName] ,
		[Description] ,
		[Units] ,
		[MaxValue] ,
		[MinValue] ,
		[HalFlags] ,
		[IsAIC] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_AIOCStd INTO @Result 
		SELECT 
		@ObjectIdentifier,
		@ObjectName,
		@Description,
		@Units,
		@MaxValue,
		@MinValue,
		@HalFlags,
		@IsAIC,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [AIOCStd] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[ObjectIdentifier] = COALESCE(@ObjectIdentifier,[ur].[ObjectIdentifier]),
		[ur].[ObjectName] = COALESCE(@ObjectName,[ur].[ObjectName]),
		[ur].[Description] = COALESCE(@Description,[ur].[Description]),
		[ur].[Units] = COALESCE(@Units,[ur].[Units]),
		[ur].[MaxValue] = COALESCE(@MaxValue,[ur].[MaxValue]),
		[ur].[MinValue] = COALESCE(@MinValue,[ur].[MinValue]),
		[ur].[HalFlags] = COALESCE(@HalFlags,[ur].[HalFlags]),
		[ur].[IsAIC] = COALESCE(@IsAIC,[ur].[IsAIC]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [ctl].[AIOCStd] AS [ur]
		WHERE [PK_AIOCStd] = @PK_AIOCStd
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[AIOCStd] WHERE PK_AIOCStd = @PK_AIOCStd) = 0
	    SET @PK_AIOCStd = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_AIOCStd) AS [PK] 
	-- ------------------------------------------------------------
END
GO