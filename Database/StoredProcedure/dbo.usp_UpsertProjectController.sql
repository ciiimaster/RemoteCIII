SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [ProjectController] table
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
CREATE PROCEDURE [dbo].[usp_UpsertProjectController]
	
	@PK_ProjectController AS INT = -1 ,
	@FK_Project AS INT = NULL,
	@FK_Controller AS INT = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_ProjectController = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [ProjectController] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[ProjectController]
		(
		[FK_Project] ,
		[FK_Controller] )
		OUTPUT Inserted.PK_ProjectController INTO @Result 
		SELECT 
		@FK_Project,
		@FK_Controller
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [ProjectController] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[FK_Project] = COALESCE(@FK_Project,[ur].[FK_Project]),
		[ur].[FK_Controller] = COALESCE(@FK_Controller,[ur].[FK_Controller])
		FROM [ctl].[ProjectController] AS [ur]
		WHERE [PK_ProjectController] = @PK_ProjectController
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[ProjectController] WHERE PK_ProjectController = @PK_ProjectController) = 0
	    SET @PK_ProjectController = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_ProjectController) AS [PK] 
	-- ------------------------------------------------------------
END
GO