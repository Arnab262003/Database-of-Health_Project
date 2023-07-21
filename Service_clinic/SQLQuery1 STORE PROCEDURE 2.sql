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
-- Author:ANIRBAN BHATTACHARJEE
-- Create date:20-07-2023
-- Description:	INSERT UPDATE AND  DELETE FOR DAY_CNCL_RSN_TYP_MST
-- =============================================
CREATE PROCEDURE InsertDayCnclRsnTypMst
    @CNCL_RSN_TYP_CD NVARCHAR(5),
    @CNCL_RSN_TYP_DESC NVARCHAR(100),
    @REFUND_FLG CHAR(1),
    @REBOOK_FLG CHAR(1),
    @ACTIVE_FLG CHAR(1),
    @ENTRY_DT DATE,
    @USER_CD NVARCHAR(10),
    @SESSION_ID NUMERIC(9),
    @MOD_ID NVARCHAR(2),
    @SUB_MOD_ID CHAR(3),
    @ACT_FLG CHAR(1),
    @MOD_DT DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DAY_CNCL_RSN_TYP_MST (
        CNCL_RSN_TYP_CD,
        CNCL_RSN_TYP_DESC,
        REFUND_FLG,
        REBOOK_FLG,
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
        @CNCL_RSN_TYP_DESC,
        CASE WHEN @REFUND_FLG IN ('Y', 'N') THEN @REFUND_FLG ELSE 'N' END,
        CASE WHEN @REBOOK_FLG IN ('Y', 'N') THEN @REBOOK_FLG ELSE 'Y' END,
        CASE WHEN @ACTIVE_FLG IN ('Y', 'N') THEN @ACTIVE_FLG ELSE 'Y' END,
        @ENTRY_DT,
        @USER_CD,
        @SESSION_ID,
        @MOD_ID,
        @SUB_MOD_ID,
        CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
        @MOD_DT
    );
END;
