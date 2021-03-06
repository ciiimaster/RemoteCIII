SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ControllerBIStd] table
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
CREATE PROCEDURE [dbo].[usp_UpsertControllerBIStd]
	
	@PK_ControllerBIStd AS INT = -1 ,
	@FK_ControllerModel AS INT = NULL,
	@FK_BIStd AS INT = NULL,
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
	IF @PK_ControllerBIStd = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ControllerBIStd] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[ControllerBIStd]
		(
		[FK_ControllerModel] ,
		[FK_BIStd] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_ControllerBIStd INTO @Result 
		SELECT 
		@FK_ControllerModel,
		@FK_BIStd,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ControllerBIStd] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[FK_ControllerModel] = COALESCE(@FK_ControllerModel,[ur].[FK_ControllerModel]),
		[ur].[FK_BIStd] = COALESCE(@FK_BIStd,[ur].[FK_BIStd]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [ctl].[ControllerBIStd] AS [ur]
		WHERE [PK_ControllerBIStd] = @PK_ControllerBIStd
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[ControllerBIStd] WHERE PK_ControllerBIStd = @PK_ControllerBIStd) = 0
	    SET @PK_ControllerBIStd = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ControllerBIStd) AS [PK] 
	-- ------------------------------------------------------------
END
GO
