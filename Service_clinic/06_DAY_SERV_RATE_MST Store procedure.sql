-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Arnab Patra
-- Create date: 19/07/23
-- Description:	Store procedure for DAY_SERV_RATE_MST
-- =============================================
CREATE PROCEDURE Store_Procedure_DAY_SERV_RATE_MST
(
    @HOS_CD NVARCHAR(10),
    @SERV_TYP_CD NVARCHAR(5),
    @SERV_CD NVARCHAR(7),
    @CAT_CD NVARCHAR(10),
    @EFFECT_DT DATE,
    @SERV_AMT FLOAT = 0,
    @ENTRY_DT DATE,
    @USER_CD NVARCHAR(10),
    @SESSION_ID NUMERIC(9),
    @ACT_FLG CHAR(1) = 'A',
    @MOD_DT DATE = NULL,
    @SESSION_ID_WEB NVARCHAR(30) = NULL,
@QueryType     nvarchar(10)    ='INSERT' ) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @QueryType ='INSERT'
		BEGIN
		INSERT INTO DAY_SERV_RATE_MST (
			HOS_CD,
			SERV_TYP_CD,
			SERV_CD,
			CAT_CD,
			EFFECT_DT,
			SERV_AMT,
			ENTRY_DT,
			USER_CD,
			SESSION_ID,
			ACT_FLG,
			MOD_DT,
			SESSION_ID_WEB
		)
    VALUES (
        @HOS_CD,
        @SERV_TYP_CD,
        @SERV_CD,
        @CAT_CD,
        @EFFECT_DT,
        @SERV_AMT,
        @ENTRY_DT,
        @USER_CD,
        @SESSION_ID,
        @ACT_FLG,
        @MOD_DT,
        @SESSION_ID_WEB
    )
	IF @@ROWCOUNT=1
			RETURN 1;
		ELSE
			RETURN 0;
		END
		ELSE IF @QueryType = 'UPDATE'
			BEGIN
				 UPDATE DAY_SERV_RATE_MST
        SET
            SERV_TYP_CD = @SERV_TYP_CD,
            SERV_CD = @SERV_CD,
            CAT_CD = @CAT_CD,
            EFFECT_DT = @EFFECT_DT,
            SERV_AMT = @SERV_AMT,
            ENTRY_DT = @ENTRY_DT,
            USER_CD = @USER_CD,
            SESSION_ID = @SESSION_ID,
            ACT_FLG = @ACT_FLG,
            MOD_DT = @MOD_DT,
            SESSION_ID_WEB = @SESSION_ID_WEB
        WHERE
            HOS_CD = @HOS_CD
            AND SERV_TYP_CD = @SERV_TYP_CD
            AND SERV_CD = @SERV_CD;

        IF @@ROWCOUNT = 1
            RETURN 1;
        ELSE
            RETURN 0;
    END
    ELSE IF @QueryType = 'DELETE'
    BEGIN
        DELETE FROM DAY_SERV_RATE_MST
        WHERE
            HOS_CD = @HOS_CD
            AND SERV_TYP_CD = @SERV_TYP_CD
            AND SERV_CD = @SERV_CD;

        IF @@ROWCOUNT = 1
            RETURN 1;
        ELSE
            RETURN 0;
    END
    ELSE
    BEGIN
        RETURN -1;
    END
END
