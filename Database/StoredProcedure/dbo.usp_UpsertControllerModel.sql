SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ControllerModel] table
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
CREATE PROCEDURE [dbo].[usp_UpsertControllerModel]
	
	@PK_ControllerModel AS INT = -1 ,
	@NameCloud AS NVARCHAR(50) = NULL,
	@NameXML AS NVARCHAR(50) = NULL,
	@Description AS NVARCHAR(4000) = NULL,
	@HalFlags AS NVARCHAR(50) = NULL,
	@CloudAvailable AS BIT = NULL,
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
	IF @PK_ControllerModel = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ControllerModel] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[ControllerModel]
		(
		[NameCloud] ,
		[NameXML] ,
		[Description] ,
		[HalFlags] ,
		[CloudAvailable] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_ControllerModel INTO @Result 
		SELECT 
		@NameCloud,
		@NameXML,
		@Description,
		@HalFlags,
		@CloudAvailable,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ControllerModel] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[NameCloud] = COALESCE(@NameCloud,[ur].[NameCloud]),
		[ur].[NameXML] = COALESCE(@NameXML,[ur].[NameXML]),
		[ur].[Description] = COALESCE(@Description,[ur].[Description]),
		[ur].[HalFlags] = COALESCE(@HalFlags,[ur].[HalFlags]),
		[ur].[CloudAvailable] = COALESCE(@CloudAvailable,[ur].[CloudAvailable]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [ctl].[ControllerModel] AS [ur]
		WHERE [PK_ControllerModel] = @PK_ControllerModel
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[ControllerModel] WHERE PK_ControllerModel = @PK_ControllerModel) = 0
	    SET @PK_ControllerModel = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ControllerModel) AS [PK] 
	-- ------------------------------------------------------------
END
GO
