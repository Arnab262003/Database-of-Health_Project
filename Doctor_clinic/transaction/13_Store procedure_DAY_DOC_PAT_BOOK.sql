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
CREATE PROCEDURE sp_Day_Doc_Pat_Book
(
    @HOS_CD NVARCHAR(10),
    @DAY_BOOK_SL_NO NVARCHAR(20),
    @BOOK_DT DATE,
    @BOOK_TM NVARCHAR(5),
    @PAT_NM NVARCHAR(60),
    @AGE_YR NUMERIC(9) = 0,
    @AGE_MON NUMERIC(9) = 0,
    @AGE_DAY NUMERIC(9),
    @SEX CHAR(1) = 'M',
    @PAT_ADD NVARCHAR(200),
    @CONTACT_NO NVARCHAR(20),
    @PAT_CAT NVARCHAR(10),
    @DOC_CD NVARCHAR(10),
    @DAY_CLINIC_CD NVARCHAR(10),
    @BOOK_FOR_DT DATE,
    @RST_NO NVARCHAR(10),
    @BOOK_FR_TM NVARCHAR(5),
    @BOOK_TO_TM NVARCHAR(5),
    @QUE_NO NVARCHAR(9) = 0,
    @BOOK_STAT CHAR(1) = 'P',
    @TOT_BOOK_AMT FLOAT(8),
    @ADV_AMT FLOAT(8) = 0,
    @PAID_AMT FLOAT(8) = 0,
    @DUE_AMT FLOAT(8) = 0,
    @CAN_AMT FLOAT(8) = 0,
    @REFUND_AMT FLOAT(8) = 0,
    @BOOK_CANCEL_FLG CHAR(1) = 'N',
    @BOOK_CNCL_ENTRY_DT DATE,
    @BOOK_CNCL_TM NVARCHAR(5),
    @CNCL_RSN_TYP_CD NVARCHAR(5),
    @BOOK_CAN_RSN_CD NVARCHAR(5),
    @BOOK_CAN_USER_CD NVARCHAR(10),
    @BOOK_CAN_SESSION_ID NUMERIC(9) = 0,
    @REPORTING_FLG CHAR(1) = 'N',
    @REPORTING_DT DATE,
    @REPORTING_TM NVARCHAR(5),
    @RPT_USER_CD NVARCHAR(10),
    @RPT_SESSION_ID NUMERIC(9) = 0,
    @VISIT_FLG CHAR(1) = 'N',
    @REFUND_FLG CHAR(1) = 'N',
    @ENTRY_DT DATE,
    @USER_CD NVARCHAR(10),
    @SESSION_ID NUMERIC(9) = 0,
    @ACT_FLG CHAR(1) = 'A',
    @MOD_DT DATE = NULL,
    @SESSION_ID_WEB NVARCHAR(30)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM DAY_DOC_PAT_BOOK WHERE HOS_CD = @HOS_CD AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO)
    BEGIN
        -- INSERT
        INSERT INTO DAY_DOC_PAT_BOOK (
            HOS_CD,
            DAY_BOOK_SL_NO,
            BOOK_DT,
            BOOK_TM,
            PAT_NM,
            AGE_YR,
            AGE_MON,
            AGE_DAY,
            SEX,
            PAT_ADD,
            CONTACT_NO,
            PAT_CAT,
            DOC_CD,
            DAY_CLINIC_CD,
            BOOK_FOR_DT,
            RST_NO,
            BOOK_FR_TM,
            BOOK_TO_TM,
            QUE_NO,
            BOOK_STAT,
            TOT_BOOK_AMT,
            ADV_AMT,
            PAID_AMT,
            DUE_AMT,
            CAN_AMT,
            REFUND_AMT,
            BOOK_CANCEL_FLG,
            BOOK_CNCL_ENTRY_DT,
            BOOK_CNCL_TM,
            CNCL_RSN_TYP_CD,
            BOOK_CAN_RSN_CD,
            BOOK_CAN_USER_CD,
            BOOK_CAN_SESSION_ID,
            REPORTING_FLG,
            REPORTING_DT,
            REPORTING_TM,
            RPT_USER_CD,
            RPT_SESSION_ID,
            VISIT_FLG,
            REFUND_FLG,
            ENTRY_DT,
            USER_CD,
            SESSION_ID,
            ACT_FLG,
            MOD_DT,
            SESSION_ID_WEB
        )
        VALUES (
            @HOS_CD,
            @DAY_BOOK_SL_NO,
            @BOOK_DT,
            @BOOK_TM,
            @PAT_NM,
            @AGE_YR,
            @AGE_MON,
            @AGE_DAY,
            CASE WHEN @SEX IN ('M', 'F') THEN @SEX ELSE 'M' END,
            @PAT_ADD,
            @CONTACT_NO,
            @PAT_CAT,
            @DOC_CD,
            @DAY_CLINIC_CD,
            @BOOK_FOR_DT,
            @RST_NO,
            @BOOK_FR_TM,
            @BOOK_TO_TM,
            @QUE_NO,
            CASE WHEN @BOOK_STAT IN ('P', 'V') THEN @BOOK_STAT ELSE 'P' END,
            @TOT_BOOK_AMT,
            @ADV_AMT,
            @PAID_AMT,
            @DUE_AMT,
            @CAN_AMT,
            @REFUND_AMT,
            CASE WHEN @BOOK_CANCEL_FLG IN ('Y', 'N') THEN @BOOK_CANCEL_FLG ELSE 'N' END,
            @BOOK_CNCL_ENTRY_DT,
            @BOOK_CNCL_TM,
            @CNCL_RSN_TYP_CD,
            @BOOK_CAN_RSN_CD,
            @BOOK_CAN_USER_CD,
            @BOOK_CAN_SESSION_ID,
            CASE WHEN @REPORTING_FLG IN ('Y', 'N') THEN @REPORTING_FLG ELSE 'N' END,
            @REPORTING_DT,
            @REPORTING_TM,
            @RPT_USER_CD,
            @RPT_SESSION_ID,
            CASE WHEN @VISIT_FLG IN ('Y', 'N') THEN @VISIT_FLG ELSE 'N' END,
            CASE WHEN @REFUND_FLG IN ('Y', 'N') THEN @REFUND_FLG ELSE 'N' END,
            @ENTRY_DT,
            @USER_CD,
            @SESSION_ID,
            CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
            @MOD_DT,
            @SESSION_ID_WEB
        );
    END
    ELSE IF @MOD_DT IS NOT NULL
    BEGIN
        -- UPDATE
        UPDATE DAY_DOC_PAT_BOOK
        SET
            BOOK_DT = @BOOK_DT,
            BOOK_TM = @BOOK_TM,
            PAT_NM = @PAT_NM,
            AGE_YR = @AGE_YR,
            AGE_MON = @AGE_MON,
            AGE_DAY = @AGE_DAY,
            SEX = CASE WHEN @SEX IN ('M', 'F') THEN @SEX ELSE 'M' END,
            PAT_ADD = @PAT_ADD,
            CONTACT_NO = @CONTACT_NO,
            PAT_CAT = @PAT_CAT,
            DOC_CD = @DOC_CD,
            DAY_CLINIC_CD = @DAY_CLINIC_CD,
            BOOK_FOR_DT = @BOOK_FOR_DT,
            RST_NO = @RST_NO,
            BOOK_FR_TM = @BOOK_FR_TM,
            BOOK_TO_TM = @BOOK_TO_TM,
            QUE_NO = @QUE_NO,
            BOOK_STAT = CASE WHEN @BOOK_STAT IN ('P', 'V') THEN @BOOK_STAT ELSE 'P' END,
            TOT_BOOK_AMT = @TOT_BOOK_AMT,
            ADV_AMT = @ADV_AMT,
            PAID_AMT = @PAID_AMT,
            DUE_AMT = @DUE_AMT,
            CAN_AMT = @CAN_AMT,
            REFUND_AMT = @REFUND_AMT,
            BOOK_CANCEL_FLG = CASE WHEN @BOOK_CANCEL_FLG IN ('Y', 'N') THEN @BOOK_CANCEL_FLG ELSE 'N' END,
            BOOK_CNCL_ENTRY_DT = @BOOK_CNCL_ENTRY_DT,
            BOOK_CNCL_TM = @BOOK_CNCL_TM,
            CNCL_RSN_TYP_CD = @CNCL_RSN_TYP_CD,
            BOOK_CAN_RSN_CD = @BOOK_CAN_RSN_CD,
            BOOK_CAN_USER_CD = @BOOK_CAN_USER_CD,
            BOOK_CAN_SESSION_ID = @BOOK_CAN_SESSION_ID,
            REPORTING_FLG = CASE WHEN @REPORTING_FLG IN ('Y', 'N') THEN @REPORTING_FLG ELSE 'N' END,
            REPORTING_DT = @REPORTING_DT,
            REPORTING_TM = @REPORTING_TM,
            RPT_USER_CD = @RPT_USER_CD,
            RPT_SESSION_ID = @RPT_SESSION_ID,
            VISIT_FLG = CASE WHEN @VISIT_FLG IN ('Y', 'N') THEN @VISIT_FLG ELSE 'N' END,
            REFUND_FLG = CASE WHEN @REFUND_FLG IN ('Y', 'N') THEN @REFUND_FLG ELSE 'N' END,
            ENTRY_DT = @ENTRY_DT,
            USER_CD = @USER_CD,
            SESSION_ID = @SESSION_ID,
            ACT_FLG = CASE WHEN @ACT_FLG IN ('A', 'I', 'D') THEN @ACT_FLG ELSE 'A' END,
            MOD_DT = @MOD_DT,
            SESSION_ID_WEB = @SESSION_ID_WEB
        WHERE
            HOS_CD = @HOS_CD
            AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO;
    END
    ELSE IF @MOD_DT IS NULL
    BEGIN
        -- DELETE
        DELETE FROM DAY_DOC_PAT_BOOK
        WHERE
            HOS_CD = @HOS_CD
            AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO;
    END
    ELSE
    BEGIN
        -- Invalid Operation
        RETURN -1;
    END
END;
