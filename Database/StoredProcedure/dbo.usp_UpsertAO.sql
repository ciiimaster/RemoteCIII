SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ----------------------------------------------------------------------------
-- INSERT, UPDATE a row for the [AO] table
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
CREATE PROCEDURE [dbo].[usp_UpsertAO]
	
	@PK_AO AS INT = -1 ,
	@ObjectIdentifier AS NVARCHAR(50) = NULL,
	@ObjectName AS NVARCHAR(50) = NULL,
	@Description AS NVARCHAR(4000) = NULL,
	@PresentValue AS REAL = NULL,
	@Units AS NVARCHAR(50) = NULL,
	@CommissionFlag AS NVARCHAR(50) = NULL,
	@TypeReference AS NVARCHAR(50) = NULL,
	@OutOfService AS INT = NULL,
	@CurrentPriority AS INT = NULL,
	@CriticalControl AS INT = NULL,
	@CovIncrement AS REAL = NULL,
	@RelinquishDefault AS REAL = NULL,
	@Polarity AS NVARCHAR(50) = NULL,
	@FBackEnable AS NVARCHAR(50) = NULL,
	@Reliability AS NVARCHAR(50) = NULL,
	@HalFlags AS NVARCHAR(50) = NULL,
	@EventDetectionEnable AS INT = NULL,
	@MarkedAsDeleted AS BIT = NULL,
	@HistoricalDateTime AS DATETIME = NULL,
	@FK_ProjectController AS INT = NULL,
	@FK_HistoricalStage AS INT = NULL,
	@ForceOverride BIT = 1
AS
BEGIN

	-- ------------------------------------------------------------
	IF @ForceOverride = 1
	BEGIN
	    SET @ForceOverride=@ForceOverride
	END

	DECLARE @Result  TABLE ( FK int);
	IF @PK_AO = -1
	BEGIN
		-- ------------------------------------------------------------
		-- Insert a row in table  [AO] 
		-- ------------------------------------------------------------
		INSERT INTO [ctl].[AO]
		(
		[ObjectIdentifier] ,
		[ObjectName] ,
		[Description] ,
		[PresentValue] ,
		[Units] ,
		[CommissionFlag] ,
		[TypeReference] ,
		[OutOfService] ,
		[CurrentPriority] ,
		[CriticalControl] ,
		[CovIncrement] ,
		[RelinquishDefault] ,
		[Polarity] ,
		[FBackEnable] ,
		[Reliability] ,
		[HalFlags] ,
		[EventDetectionEnable] ,
		[MarkedAsDeleted] ,
		[HistoricalDateTime] ,
		[FK_ProjectController] ,
		[FK_HistoricalStage] )
		OUTPUT Inserted.PK_AO INTO @Result 
		SELECT 
		@ObjectIdentifier,
		@ObjectName,
		@Description,
		@PresentValue,
		@Units,
		@CommissionFlag,
		@TypeReference,
		@OutOfService,
		@CurrentPriority,
		@CriticalControl,
		@CovIncrement,
		@RelinquishDefault,
		@Polarity,
		@FBackEnable,
		@Reliability,
		@HalFlags,
		@EventDetectionEnable,
		@MarkedAsDeleted,
		@HistoricalDateTime,
		@FK_ProjectController,
		@FK_HistoricalStage
	END ELSE
	BEGIN
		-- ------------------------------------------------------------
		-- Update a row in table  [AO] 
		-- ------------------------------------------------------------
		UPDATE [ur]
		SET 
		[ur].[ObjectIdentifier] = COALESCE(@ObjectIdentifier,[ur].[ObjectIdentifier]),
		[ur].[ObjectName] = COALESCE(@ObjectName,[ur].[ObjectName]),
		[ur].[Description] = COALESCE(@Description,[ur].[Description]),
		[ur].[PresentValue] = COALESCE(@PresentValue,[ur].[PresentValue]),
		[ur].[Units] = COALESCE(@Units,[ur].[Units]),
		[ur].[CommissionFlag] = COALESCE(@CommissionFlag,[ur].[CommissionFlag]),
		[ur].[TypeReference] = COALESCE(@TypeReference,[ur].[TypeReference]),
		[ur].[OutOfService] = COALESCE(@OutOfService,[ur].[OutOfService]),
		[ur].[CurrentPriority] = COALESCE(@CurrentPriority,[ur].[CurrentPriority]),
		[ur].[CriticalControl] = COALESCE(@CriticalControl,[ur].[CriticalControl]),
		[ur].[CovIncrement] = COALESCE(@CovIncrement,[ur].[CovIncrement]),
		[ur].[RelinquishDefault] = COALESCE(@RelinquishDefault,[ur].[RelinquishDefault]),
		[ur].[Polarity] = COALESCE(@Polarity,[ur].[Polarity]),
		[ur].[FBackEnable] = COALESCE(@FBackEnable,[ur].[FBackEnable]),
		[ur].[Reliability] = COALESCE(@Reliability,[ur].[Reliability]),
		[ur].[HalFlags] = COALESCE(@HalFlags,[ur].[HalFlags]),
		[ur].[EventDetectionEnable] = COALESCE(@EventDetectionEnable,[ur].[EventDetectionEnable]),
		[ur].[MarkedAsDeleted] = COALESCE(@MarkedAsDeleted,[ur].[MarkedAsDeleted]),
		[ur].[HistoricalDateTime] = COALESCE(@HistoricalDateTime,[ur].[HistoricalDateTime]),
		[ur].[FK_ProjectController] = COALESCE(@FK_ProjectController,[ur].[FK_ProjectController]),
		[ur].[FK_HistoricalStage] = COALESCE(@FK_HistoricalStage,[ur].[FK_HistoricalStage])
		FROM [ctl].[AO] AS [ur]
		WHERE [PK_AO] = @PK_AO
	END;
	-- ------------------------------------------------------------
	IF (SELECT COUNT(*) FROM [ctl].[AO] WHERE PK_AO = @PK_AO) = 0
	    SET @PK_AO = -1 ; 
	-- ------------------------------------------------------------
	SELECT COALESCE((SELECT MAX(FK) FROM @Result),@PK_AO) AS [PK] 
	-- ------------------------------------------------------------
END
GO
