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
-- Create date: 19/07/2023
-- Description:	store procedure for DAY_PAT_CAT_MST table
-- =============================================
CREATE PROCEDURE store_procedure_DAY_PAT_CAT_MST
(
    @HOS_CD NVARCHAR(10),
    @CAT_CD NVARCHAR(10),
    @CAT_DESC NVARCHAR(100),
    @ACTIVE_FLG CHAR(1) = 'Y',
    @ENTRY_DT DATE,
    @USER_CD NVARCHAR(10),
    @SESSION_ID NUMERIC(9),
    @MOD_ID NVARCHAR(2),
    @SUB_MOD_ID NVARCHAR(3),
    @ACT_FLG CHAR(1) = 'A',
    @MOD_DT DATE = NULL,
    @SESSION_ID_WEB NVARCHAR(30) = NULL,
	@QueryType   nvarchar(10)    ='INSERT'
)
AS
BEGIN
	SET NOCOUNT ON;
	IF @QueryType ='INSERT'
		BEGIN
		INSERT INTO DAY_PAT_CAT_MST (
			HOS_CD,
			CAT_CD,
			CAT_DESC,
			ACTIVE_FLG,
			ENTRY_DT,
			USER_CD,
			SESSION_ID,
			MOD_ID,
			SUB_MOD_ID,
			ACT_FLG,
			MOD_DT,
			SESSION_ID_WEB
		)
    VALUES (
        @HOS_CD,
        @CAT_CD,
        @CAT_DESC,
        @ACTIVE_FLG,
        @ENTRY_DT,
        @USER_CD,
        @SESSION_ID,
        @MOD_ID,
        @SUB_MOD_ID,
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
				UPDATE DAY_PAT_CAT_MST
        SET
            CAT_DESC = @CAT_DESC,
            ACTIVE_FLG = @ACTIVE_FLG,
            ENTRY_DT = @ENTRY_DT,
            USER_CD = @USER_CD,
            SESSION_ID = @SESSION_ID,
            MOD_ID = @MOD_ID,
            SUB_MOD_ID = @SUB_MOD_ID,
            ACT_FLG = @ACT_FLG,
            MOD_DT = @MOD_DT,
            SESSION_ID_WEB = @SESSION_ID_WEB
        WHERE
            HOS_CD = @HOS_CD
            AND CAT_CD = @CAT_CD;

        IF @@ROWCOUNT = 1
            RETURN 1;
        ELSE
            RETURN 0;
    END
    ELSE IF @QueryType = 'DELETE'
    BEGIN
        DELETE FROM DAY_PAT_CAT_MST
        WHERE
            HOS_CD = @HOS_CD
            AND CAT_CD = @CAT_CD;
        
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
