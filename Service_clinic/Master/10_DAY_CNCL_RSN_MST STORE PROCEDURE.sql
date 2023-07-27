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
-- Author ANIRBAN BHATTACHARJEE
-- Create date: 20-07-2023
-- Description:INSERT UPDATE FOR DAY_CNCL_RSN_MST
-- =============================================
CREATE PROCEDURE InsertDayCnclRsnMst
    @CNCL_RSN_TYP_CD NVARCHAR(5),
    @CNCL_RSN_CD NVARCHAR(10),
    @CNCL_RSN_DESC NVARCHAR(200),
    @ACTIVE_FLG CHAR(1),
    @ENTRY_DT DATE,
    @USER_CD NVARCHAR(10),
    @SESSION_ID NUMERIC(9),
    @MOD_ID NVARCHAR(2),
    @SUB_MOD_ID NVARCHAR(3),
    @ACT_FLG CHAR(1),
    @MOD_DT DATE,
    @QueryType NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    IF @QueryType = 'INSERT'
    BEGIN
        INSERT INTO DAY_CNCL_RSN_MST (
            CNCL_RSN_TYP_CD,
            CNCL_RSN_CD,
            CNCL_RSN_DESC,
            ACTIVE_FLG,
            ENTRY_DT,
            USER_CD,
            SESSION_ID,
            MOD_ID,
            SUB_MOD_ID,
            ACT_FLG,
            MOD_DT
        )
        VALUES (
            @CNCL_RSN_TYP_CD,
            @CNCL_RSN_CD,
            @CNCL_RSN_DESC,
            CASE WHEN @ACTIVE_FLG IN ('Y', 'N') THEN @ACTIVE_FLG ELSE 'Y' END,
            @ENTRY_DT,
            @USER_CD,
            @SESSION_ID,
            @MOD_ID,
            @SUB_MOD_ID,
            CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
            @MOD_DT
        );
    END
    ELSE IF @QueryType = 'UPDATE'
    BEGIN
        UPDATE DAY_CNCL_RSN_MST
        SET
            CNCL_RSN_DESC = @CNCL_RSN_DESC,
            ACTIVE_FLG = CASE WHEN @ACTIVE_FLG IN ('Y', 'N') THEN @ACTIVE_FLG ELSE 'Y' END,
            ENTRY_DT = @ENTRY_DT,
            USER_CD = @USER_CD,
            SESSION_ID = @SESSION_ID,
            MOD_ID = @MOD_ID,
            SUB_MOD_ID = @SUB_MOD_ID,
            ACT_FLG = CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
            MOD_DT = @MOD_DT
        WHERE
            CNCL_RSN_TYP_CD = @CNCL_RSN_TYP_CD
            AND CNCL_RSN_CD = @CNCL_RSN_CD;
    END
    ELSE IF @QueryType = 'DELETE'
    BEGIN
        DELETE FROM DAY_CNCL_RSN_MST
        WHERE
            CNCL_RSN_TYP_CD = @CNCL_RSN_TYP_CD
            AND CNCL_RSN_CD = @CNCL_RSN_CD;
    END
    ELSE
    BEGIN
        -- Invalid @QueryType
        RETURN -1;
    END
END;
