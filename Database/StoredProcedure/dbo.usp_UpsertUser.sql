SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [User] table
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
CREATE PROCEDURE [dbo].[usp_UpsertUser]
	
	@PK_User AS INT = -1 ,
	@Username AS NVARCHAR(50) = NULL,
	@FirstName AS NVARCHAR(50) = NULL,
	@LastName AS NVARCHAR(50) = NULL,
	@Password AS NVARCHAR(50) = NULL,
	@Comment AS NVARCHAR(400) = NULL,
	@RowPerPage AS INT = NULL,
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
	IF @PK_User = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [User] 
		-- ------------------------------------------------------------
		INSERT INTO [app].[User]
		(
		[Username] ,
		[FirstName] ,
		[LastName] ,
		[Password] ,
		[Comment] ,
		[RowPerPage] ,
		[MarkedAsDeleted] )
		OUTPUT Inserted.PK_User INTO @Result 
		SELECT 
		@Username,
		@FirstName,
		@LastName,
		@Password,
		@Comment,
		@RowPerPage,
		@MarkedAsDeleted
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [User] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[Username] = COALESCE(@Username,[ur].[Username]),
		[ur].[FirstName] = COALESCE(@FirstName,[ur].[FirstName]),
		[ur].[LastName] = COALESCE(@LastName,[ur].[LastName]),
		[ur].[Password] = COALESCE(@Password,[ur].[Password]),
		[ur].[Comment] = COALESCE(@Comment,[ur].[Comment]),
		[ur].[RowPerPage] = COALESCE(@RowPerPage,[ur].[RowPerPage]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted])
		FROM [app].[User] AS [ur]
		WHERE [PK_User] = @PK_User
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [app].[User] WHERE PK_User = @PK_User) = 0
	    SET @PK_User = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_User) AS [PK] 
	-- ------------------------------------------------------------
END
GO