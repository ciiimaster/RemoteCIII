SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [FollowType] table
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
CREATE PROCEDURE [dbo].[usp_UpsertFollowType]
	
	@PK_FollowType AS INT = -1 ,
	@Name AS NVARCHAR(50) = NULL,
	@Sequence AS INT = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_FollowType = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [FollowType] 
		-- ------------------------------------------------------------
		INSERT INTO [fol].[FollowType]
		(
		[Name] ,
		[Sequence] )
		OUTPUT Inserted.PK_FollowType INTO @Result 
		SELECT 
		@Name,
		@Sequence
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [FollowType] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Name] = COALESCE(@Name,[ur].[Name]),
		[ur].[Sequence] = COALESCE(@Sequence,[ur].[Sequence])
		FROM [fol].[FollowType] AS [ur]
		WHERE [PK_FollowType] = @PK_FollowType
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [fol].[FollowType] WHERE PK_FollowType = @PK_FollowType) = 0
	    SET @PK_FollowType = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_FollowType) AS [PK] 
	-- ------------------------------------------------------------
END
GO
