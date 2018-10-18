SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ControllerAIStd] table
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
CREATE PROCEDURE [dbo].[usp_UpsertControllerAIStd]
	
	@PK_ControllerAIStd AS INT = -1 ,
	@FK_ControllerModel AS INT = NULL,
	@FK_AIStd AS INT = NULL,
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
	IF @PK_ControllerAIStd = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ControllerAIStd] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[ControllerAIStd]
		(
		[FK_ControllerModel] ,
		[FK_AIStd] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_ControllerAIStd INTO @Result 
		SELECT 
		@FK_ControllerModel,
		@FK_AIStd,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ControllerAIStd] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[FK_ControllerModel] = COALESCE(@FK_ControllerModel,[ur].[FK_ControllerModel]),
		[ur].[FK_AIStd] = COALESCE(@FK_AIStd,[ur].[FK_AIStd]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [ctl].[ControllerAIStd] AS [ur]
		WHERE [PK_ControllerAIStd] = @PK_ControllerAIStd
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[ControllerAIStd] WHERE PK_ControllerAIStd = @PK_ControllerAIStd) = 0
	    SET @PK_ControllerAIStd = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ControllerAIStd) AS [PK] 
	-- ------------------------------------------------------------
END
GO