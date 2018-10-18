SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [Follow] table
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
CREATE PROCEDURE [dbo].[usp_UpsertFollow]
	
	@PK_Follow AS INT = -1 ,
	@Subject AS NVARCHAR(50) = NULL,
	@Description AS NVARCHAR(1000) = NULL,
	@MarkAsDeleted AS BIT = NULL,
	@TimeStamp AS DATETIME = NULL,
	@HistoricalDateTime AS DATETIME = NULL,
	@FK_FollowType AS INT = NULL,
	@FK_Application AS INT = NULL,
	@FK_FollowPriority AS INT = NULL,
	@FK_FollowStatus AS INT = NULL,
	@FK_User AS INT = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_Follow = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [Follow] 
		-- ------------------------------------------------------------
		INSERT INTO [fol].[Follow]
		(
		[Subject] ,
		[Description] ,
		[MarkAsDeleted] ,
		[TimeStamp] ,
		[HistoricalDateTime] ,
		[FK_FollowType] ,
		[FK_Application] ,
		[FK_FollowPriority] ,
		[FK_FollowStatus] ,
		[FK_User] )
		OUTPUT Inserted.PK_Follow INTO @Result 
		SELECT 
		@Subject,
		@Description,
		@MarkAsDeleted,
		@TimeStamp,
		@HistoricalDateTime,
		@FK_FollowType,
		@FK_Application,
		@FK_FollowPriority,
		@FK_FollowStatus,
		@FK_User
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [Follow] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Subject] = COALESCE(@Subject,[ur].[Subject]),
		[ur].[Description] = COALESCE(@Description,[ur].[Description]),
		[ur].[MarkAsDeleted] = COALESCE(@MarkAsDeleted,[ur].[MarkAsDeleted]),
		[ur].[TimeStamp] = COALESCE(@TimeStamp,[ur].[TimeStamp]),
		[ur].[HistoricalDateTime] = COALESCE(@HistoricalDateTime,[ur].[HistoricalDateTime]),
		[ur].[FK_FollowType] = COALESCE(@FK_FollowType,[ur].[FK_FollowType]),
		[ur].[FK_Application] = COALESCE(@FK_Application,[ur].[FK_Application]),
		[ur].[FK_FollowPriority] = COALESCE(@FK_FollowPriority,[ur].[FK_FollowPriority]),
		[ur].[FK_FollowStatus] = COALESCE(@FK_FollowStatus,[ur].[FK_FollowStatus]),
		[ur].[FK_User] = COALESCE(@FK_User,[ur].[FK_User])
		FROM [fol].[Follow] AS [ur]
		WHERE [PK_Follow] = @PK_Follow
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [fol].[Follow] WHERE PK_Follow = @PK_Follow) = 0
	    SET @PK_Follow = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_Follow) AS [PK] 
	-- ------------------------------------------------------------
END
GO