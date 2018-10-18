SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [BDCStd] table
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
CREATE PROCEDURE [dbo].[usp_UpsertBDCStd]
	
	@PK_BDCStd AS INT = -1 ,
	@ObjectIdentifier AS NVARCHAR(50) = NULL,
	@ObjectName AS NVARCHAR(50) = NULL,
	@Description AS NVARCHAR(4000) = NULL,
	@ActiveText AS NVARCHAR(50) = NULL,
	@InactiveText AS NVARCHAR(50) = NULL,
	@HalFlags AS NVARCHAR(50) = NULL,
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
	IF @PK_BDCStd = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [BDCStd] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[BDCStd]
		(
		[ObjectIdentifier] ,
		[ObjectName] ,
		[Description] ,
		[ActiveText] ,
		[InactiveText] ,
		[HalFlags] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_BDCStd INTO @Result 
		SELECT 
		@ObjectIdentifier,
		@ObjectName,
		@Description,
		@ActiveText,
		@InactiveText,
		@HalFlags,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [BDCStd] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[ObjectIdentifier] = COALESCE(@ObjectIdentifier,[ur].[ObjectIdentifier]),
		[ur].[ObjectName] = COALESCE(@ObjectName,[ur].[ObjectName]),
		[ur].[Description] = COALESCE(@Description,[ur].[Description]),
		[ur].[ActiveText] = COALESCE(@ActiveText,[ur].[ActiveText]),
		[ur].[InactiveText] = COALESCE(@InactiveText,[ur].[InactiveText]),
		[ur].[HalFlags] = COALESCE(@HalFlags,[ur].[HalFlags]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [ctl].[BDCStd] AS [ur]
		WHERE [PK_BDCStd] = @PK_BDCStd
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[BDCStd] WHERE PK_BDCStd = @PK_BDCStd) = 0
	    SET @PK_BDCStd = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_BDCStd) AS [PK] 
	-- ------------------------------------------------------------
END
GO