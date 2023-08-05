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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_Day_Pat_Book_Hdr
(
    @HOS_CD NVARCHAR(10),
    @DAY_BOOK_SL_NO NVARCHAR(20),
    @PAT_NM NVARCHAR(60),
    @SEX CHAR(1),
    @AGE_YR NUMERIC(9),
    @AGE_MON NUMERIC(9),
    @AGE_DAY NUMERIC(9),
    @PAT_ADDR NVARCHAR(100),
    @CONTACT_NO NVARCHAR(20),
    @CAT_CD NVARCHAR(10),
    @Tran_Dt DATE,
    @TOT_BOOK_AMT FLOAT(8),
    @TOT_DISC_AMT FLOAT(8),
    @TOT_BILL_AMT FLOAT(8),
    @ADV_AMT FLOAT(8),
    @PAID_AMT FLOAT(8),
    @DUE_AMT FLOAT(8),
    @CANCEL_AMT FLOAT(9),
    @REFUND_AMT FLOAT(8),
    @TOT_SERV_GIVEN_FLG CHAR(1),
    @BOOK_CNCL_FLG CHAR(1),
    @CNCL_RSN_TYP_CD NVARCHAR(5),
    @CNCL_RSN_CD NVARCHAR(10),
    @CNCL_REFUND_FLG CHAR(1),
    @CNCL_REBOOK_FLG CHAR(1),
    @BOOK_CNCL_ENTRY_DT DATE,
    @BOOK_CNCL_USER_CD NVARCHAR(10),
    @BOOK_CNCL_SESSION_ID NUMERIC(9),
    @BOOK_CNCL_REMARKS NVARCHAR(200),
    @POST_FLG CHAR(1),
    @ENTRY_DT DATE,
    @USER_CD NVARCHAR(10),
    @SESSION_ID NUMERIC(9),
    @OPD_FLG CHAR(1),
    @OPD_SL_NO NVARCHAR(15),
    @VST_DT DATE,
    @OPD_CD NVARCHAR(10),
    @DOC_CD NVARCHAR(10),
    @ACT_FLG CHAR(1),
    @MOD_DT DATE,
    @QueryType NVARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @QueryType = 'INSERT'
    BEGIN
        INSERT INTO DAY_PAT_BOOK_HDR (
            HOS_CD,
            DAY_BOOK_SL_NO,
            PAT_NM,
            SEX,
            AGE_YR,
            AGE_MON,
            AGE_DAY,
            PAT_ADDR,
            CONTACT_NO,
            CAT_CD,
            Tran_Dt,
            TOT_BOOK_AMT,
            TOT_DISC_AMT,
            TOT_BILL_AMT,
            ADV_AMT,
            PAID_AMT,
            DUE_AMT,
            CANCEL_AMT,
            REFUND_AMT,
            TOT_SERV_GIVEN_FLG,
            BOOK_CNCL_FLG,
            CNCL_RSN_TYP_CD,
            CNCL_RSN_CD,
            CNCL_REFUND_FLG,
            CNCL_REBOOK_FLG,
            BOOK_CNCL_ENTRY_DT,
            BOOK_CNCL_USER_CD,
            BOOK_CNCL_SESSION_ID,
            BOOK_CNCL_REMARKS,
            POST_FLG,
            ENTRY_DT,
            USER_CD,
            SESSION_ID,
            OPD_FLG,
            OPD_SL_NO,
            VST_DT,
            OPD_CD,
            DOC_CD,
            ACT_FLG,
            MOD_DT
        )
        VALUES (
             @HOS_CD,
            @DAY_BOOK_SL_NO,
            @PAT_NM,
            @SEX,
            @AGE_YR,
            @AGE_MON,
            @AGE_DAY,
            @PAT_ADDR,
            @CONTACT_NO,
            @CAT_CD,
            @Tran_Dt,
            @TOT_BOOK_AMT,
            @TOT_DISC_AMT,
            @TOT_BILL_AMT,
            @ADV_AMT,
            @PAID_AMT,
            @DUE_AMT,
            @CANCEL_AMT,
            @REFUND_AMT,
            @TOT_SERV_GIVEN_FLG,
            @BOOK_CNCL_FLG,
            @CNCL_RSN_TYP_CD,
            @CNCL_RSN_CD,
            @CNCL_REFUND_FLG,
            @CNCL_REBOOK_FLG,
            @BOOK_CNCL_ENTRY_DT,
            @BOOK_CNCL_USER_CD,
            @BOOK_CNCL_SESSION_ID,
            @BOOK_CNCL_REMARKS,
            @POST_FLG,
            @ENTRY_DT,
            @USER_CD,
            @SESSION_ID,
            @OPD_FLG,
            @OPD_SL_NO,
            @VST_DT,
            @OPD_CD,
            @DOC_CD,
            'A',
            @MOD_DT
        );
    END
	ELSE IF @QueryType = 'UPDATE'
BEGIN
    UPDATE DAY_PAT_BOOK_HDR
    SET
        PAT_NM = @PAT_NM,
        SEX = @SEX,
        AGE_YR = @AGE_YR,
        AGE_MON = @AGE_MON,
        AGE_DAY = @AGE_DAY,
        PAT_ADDR = @PAT_ADDR,
        CONTACT_NO = @CONTACT_NO,
        CAT_CD = @CAT_CD,
        Tran_Dt = @Tran_Dt,
        TOT_BOOK_AMT = @TOT_BOOK_AMT,
        TOT_DISC_AMT = @TOT_DISC_AMT,
        TOT_BILL_AMT = @TOT_BILL_AMT,
        ADV_AMT = @ADV_AMT,
        PAID_AMT = @PAID_AMT,
        DUE_AMT = @DUE_AMT,
        CANCEL_AMT = @CANCEL_AMT,
        REFUND_AMT = @REFUND_AMT,
        TOT_SERV_GIVEN_FLG = @TOT_SERV_GIVEN_FLG,
        BOOK_CNCL_FLG = @BOOK_CNCL_FLG,
        CNCL_RSN_TYP_CD = @CNCL_RSN_TYP_CD,
        CNCL_RSN_CD = @CNCL_RSN_CD,
        CNCL_REFUND_FLG = @CNCL_REFUND_FLG,
        CNCL_REBOOK_FLG = @CNCL_REBOOK_FLG,
        BOOK_CNCL_ENTRY_DT = @BOOK_CNCL_ENTRY_DT,
        BOOK_CNCL_USER_CD = @BOOK_CNCL_USER_CD,
        BOOK_CNCL_SESSION_ID = @BOOK_CNCL_SESSION_ID,
        BOOK_CNCL_REMARKS = @BOOK_CNCL_REMARKS,
        POST_FLG = @POST_FLG,
        MOD_DT = @MOD_DT
    WHERE
        HOS_CD = @HOS_CD
        AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO;
END
ELSE IF @QueryType = 'DELETE'
BEGIN
    DELETE FROM DAY_PAT_BOOK_HDR
    WHERE
        HOS_CD = @HOS_CD
        AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO;
END
ELSE
    BEGIN
        -- Invalid @QueryType
        RETURN -1;
    END
END;

