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
-- Create date: 01/08/2023
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_DayPatFollowupChikDtl
(
    @HOS_CD NVARCHAR(10),
    @DAY_BOOK_SL_NO NVARCHAR(20),
    @SL_NO NUMERIC(18, 0),
    @CHK_DT DATE = NULL,
    @CHK_TM NVARCHAR(5) = NULL,
    @CHK_DEPT NVARCHAR(10) = NULL,
    @DOC_CD NVARCHAR(10) = NULL,
    @COMM NVARCHAR(50) = NULL,
    @ACT_FLG CHAR(1) = 'A',
    @MOD_DT DATE = NULL,
    @QueryType NVARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @QueryType = 'INSERT'
    BEGIN
        INSERT INTO DAY_PAT_FOLLOWUPCHK_DTL (
            HOS_CD,
            DAY_BOOK_SL_NO,
            SL_NO,
            CHK_DT,
            CHK_TM,
            CHK_DEPT,
            DOC_CD,
            COMM,
            ACT_FLG,
            MOD_DT
        )
        VALUES (
            @HOS_CD,
            @DAY_BOOK_SL_NO,
            @SL_NO,
            @CHK_DT,
            @CHK_TM,
            @CHK_DEPT,
            @DOC_CD,
            @COMM,
            CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
            @MOD_DT
        );
    END
    ELSE IF @QueryType = 'UPDATE'
    BEGIN
        UPDATE DAY_PAT_FOLLOWUPCHK_DTL
        SET
            CHK_DT = @CHK_DT,
            CHK_TM = @CHK_TM,
            CHK_DEPT = @CHK_DEPT,
            DOC_CD = @DOC_CD,
            COMM = @COMM,
            ACT_FLG = CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
            MOD_DT = @MOD_DT
        WHERE
            HOS_CD = @HOS_CD
            AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO
            AND SL_NO = @SL_NO;
    END
    ELSE IF @QueryType = 'DELETE'
    BEGIN
        DELETE FROM DAY_PAT_FOLLOWUPCHK_DTL
        WHERE
            HOS_CD = @HOS_CD
            AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO
            AND SL_NO = @SL_NO;
    END
    ELSE
    BEGIN
        -- Invalid @QueryType
        RETURN -1;
    END
END;
