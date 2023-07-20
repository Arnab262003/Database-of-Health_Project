SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Meghna Hazari
-- Create date:18 July 2023
-- Description:stored procedure for DAY_SERV_RATE_MST
-- =============================================
CREATE PROCEDURE DAY_SERV_RATE_MST
	@HOS_CD nvarchar(10),
	@SERV_TYP_CD nvarchar(5),
	@SERV_CD nvarchar(7),
	@CAT_CD nvarchar(10),
    @EFFECT_DT Date='1/1/1990',
	@SERV_AMT Float(8)= 0,
    @ENTRY_DT Date='1/1/1990',
    @USER_CD nvarchar(10),
    @SESSION_ID Numeric(9),
	@ACT_FLG CHAR(1)='A',
	@MOD_DT Date='1/1/1990',
	@SESSION_ID_WEB nvarchar(30),
	@QueryType nvarchar(10) = 'Insert'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @QueryType = 'Insert'
	   BEGIN 
		INSERT INTO [dbo].[DAY_SERV_RATE_MST] 
	   ([HOS_CD],
		[SERV_TYP_CD],
		[SERV_CD],
		[CAT_CD],
		[EFFECT_DT],
		[SERV_AMT],
		[ENTRY_DT],
		[USER_CD],
		[SESSION_ID],
		[ACT_FLG],
		[MOD_DT],
		[SESSION_ID_WEB]
	   ) 	      
	END
ELSE IF @QueryType = 'Update'
	BEGIN
		UPDATE [dbo].[DAY_SERV_RATE_MST]
		SET [CAT_CD] = @CAT_CD, 
			[EFFECT_DT] = @EFFECT_DT, 
			[SERV_AMT] = @SERV_AMT, 
			[ENTRY_DT] = @ENTRY_DT, 
			[USER_CD] = @USER_CD, 
			[SESSION_ID] = @SESSION_ID, 
			[ACT_FLG] = @ACT_FLG, 
			[MOD_DT] = @MOD_DT, 
			[SESSION_ID_WEB] = @SESSION_ID_WEB
		WHERE [HOS_CD] = @HOS_CD AND [SERV_TYP_CD] = @SERV_TYP_CD AND [SERV_CD] = @SERV_CD
	END
ELSE @QueryType = 'Delete'
BEGIN
    DELETE FROM [dbo].[DAY_SERV_RATE_MST]
    WHERE [HOS_CD] = @HOS_CD AND [SERV_TYP_CD] = @SERV_TYP_CD AND [SERV_CD] = @SERV_CD
	END
END