SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [Permission] table
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
CREATE PROCEDURE [dbo].[usp_UpsertPermission]
	
	@PK_Permission AS INT = -1 ,
	@Name AS NVARCHAR(50) = NULL,
	@Value AS NVARCHAR(100) = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_Permission = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [Permission] 
		-- ------------------------------------------------------------
		INSERT INTO [app].[Permission]
		(
		[Name] ,
		[Value] )
		OUTPUT Inserted.PK_Permission INTO @Result 
		SELECT 
		@Name,
		@Value
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [Permission] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Name] = COALESCE(@Name,[ur].[Name]),
		[ur].[Value] = COALESCE(@Value,[ur].[Value])
		FROM [app].[Permission] AS [ur]
		WHERE [PK_Permission] = @PK_Permission
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [app].[Permission] WHERE PK_Permission = @PK_Permission) = 0
	    SET @PK_Permission = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_Permission) AS [PK] 
	-- ------------------------------------------------------------
END
GO
