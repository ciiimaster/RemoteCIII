SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [Client] table
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
CREATE PROCEDURE [dbo].[usp_UpsertClient]
	
	@PK_Client AS INT = -1 ,
	@Active AS BIT = NULL,
	@Code AS NVARCHAR(50) = NULL,
	@Code_Override AS NVARCHAR(50) = NULL,
	@Name AS NVARCHAR(250) = NULL,
	@Name_Override AS NVARCHAR(250) = NULL,
	@Comment AS NVARCHAR(400) = NULL,
	@Source AS INT = NULL,
	@MarkedAsDeleted AS BIT = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
		SET @Code_Override = @Code
		SET @Code = NULL
		SET @Name_Override = @Name
		SET @Name = NULL
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_Client = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [Client] 
		-- ------------------------------------------------------------
		INSERT INTO [prj].[Client]
		(
		[Active] ,
		[Code] ,
		[Code_Override] ,
		[Name] ,
		[Name_Override] ,
		[Comment] ,
		[Source] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_Client INTO @Result 
		SELECT 
		@Active,
		@Code,
		@Code_Override,
		@Name,
		@Name_Override,
		@Comment,
		@Source,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [Client] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Active] = COALESCE(@Active,[ur].[Active]),
		[ur].[Code] = COALESCE(@Code,[ur].[Code]),
		[ur].[Code_Override] = COALESCE(@Code_Override,[ur].[Code_Override]),
		[ur].[Name] = COALESCE(@Name,[ur].[Name]),
		[ur].[Name_Override] = COALESCE(@Name_Override,[ur].[Name_Override]),
		[ur].[Comment] = COALESCE(@Comment,[ur].[Comment]),
		[ur].[Source] = COALESCE(@Source,[ur].[Source]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [prj].[Client] AS [ur]
		WHERE [PK_Client] = @PK_Client
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [prj].[Client] WHERE PK_Client = @PK_Client) = 0
	    SET @PK_Client = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_Client) AS [PK] 
	-- ------------------------------------------------------------
END
GO
