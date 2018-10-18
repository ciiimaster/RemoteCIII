SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [FollowPriority] table
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
CREATE PROCEDURE [dbo].[usp_UpsertFollowPriority]
	
	@PK_FollowPriority AS INT = -1 ,
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
	IF @PK_FollowPriority = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [FollowPriority] 
		-- ------------------------------------------------------------
		INSERT INTO [fol].[FollowPriority]
		(
		[Name] ,
		[Sequence] )
		OUTPUT Inserted.PK_FollowPriority INTO @Result 
		SELECT 
		@Name,
		@Sequence
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [FollowPriority] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Name] = COALESCE(@Name,[ur].[Name]),
		[ur].[Sequence] = COALESCE(@Sequence,[ur].[Sequence])
		FROM [fol].[FollowPriority] AS [ur]
		WHERE [PK_FollowPriority] = @PK_FollowPriority
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [fol].[FollowPriority] WHERE PK_FollowPriority = @PK_FollowPriority) = 0
	    SET @PK_FollowPriority = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_FollowPriority) AS [PK] 
	-- ------------------------------------------------------------
END
GO