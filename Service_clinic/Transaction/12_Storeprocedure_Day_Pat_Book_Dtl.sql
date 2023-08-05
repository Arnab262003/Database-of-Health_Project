CREATE PROCEDURE sp_Day_Pat_Book_Dtl
(
    @HOS_CD                 nvarchar(10)          ,
    @DAY_BOOK_SL_NO         nvarchar(20)          ,
    @SERV_TYP_CD            nvarchar(5)           ,
    @SERV_CD                nvarchar(7)           ,
    @DAY_CLINIC_CD          nvarchar(10)          ,
    @RST_DT                 Date                  ,
    @RST_NO                 nvarchar(10)          ,
    @DU_CD                  nvarchar(10),                    -- Either Doctor Code or Unit Code.
    @SERV_QUE_SL_NO         Numeric(9)   = 0  ,
    @BOOK_DT                Date                  ,
    @BOOK_FR_TM             nvarchar(5)           ,
    @BOOK_TO_TM             nvarchar(5)           ,
    @SERV_RT                Float(8)     = 0  ,
    @DISC_AMT               Float(8)     = 0  ,
    @BILL_AMT               Float(8)     = 0  ,
    @PAID_AMT               Float(8)     = 0  ,
    @DUE_AMT                Float(8)     = 0  ,
    @CANCEL_AMT             Float(9)     = 0  ,
    @REFUND_AMT             Float(8)     = 0  ,
    @REPORTING_FLG          char(1)   = 'N'  ,
    @SERV_GIVEN_FLG         char(1)   = 'N'  ,
    @SERV_GIVEN_DT          Date,                            -- Service Given Date
    @SERV_GIVEN_TM          nvarchar(5),                     -- Service Given Time
    @SERV_CNCL_FLG          char(1)   = 'N'  ,
    @CNCL_RSN_TYP_CD        nvarchar(5),                     -- Cancellation Reason Type Code
    @CNCL_RSN_CD            nvarchar(10),                    -- Cancellation Reason Code
    @CNCL_REFUND_FLG        char(1)   = 'X'  ,   -- Cancellation Refund Flag ([Y]es/[N]o/[X] Not Cancelled)
    @CNCL_REBOOK_FLG        char(1)   = 'X'  ,   -- Cancellation Re-Book Flag ([Y]es/[N]o/[X] Not Cancelled)
    @SERV_CNCL_ENTRY_DT     Date,                            -- Service Cancellation Entry Date
    @SERV_CNCL_USER_CD      nvarchar(10),                    -- Service Cancellation User Code
    @SERV_CNCL_SESSION_ID   Numeric(9),                      -- Service Cancellation Session ID
    @SERV_CNCL_REMARKS      nvarchar(200),                   -- Service Cancellation Remarks
    @ENTRY_DT               Date                  ,   -- Entry Date
    @USER_CD                nvarchar(10)          ,   -- User Code
    @SESSION_ID             Numeric(9)            ,   -- Session Id
    @ACT_FLG                char(1)   = 'A'  ,   -- Active Flag (Active-"A",Inactive-"I",Delete-"D")
    @MOD_DT                 Date,                            -- Modification Date
    @QueryType              NVARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

        IF @QueryType = 'INSERT'
    BEGIN
        INSERT INTO DAY_PAT_BOOK_DTL (
            @HOS_CD,
            @DAY_BOOK_SL_NO,
            @SERV_TYP_CD,
            @SERV_CD,
            @DAY_CLINIC_CD,
            @RST_DT,
            @RST_NO,
            @DU_CD,
            @SERV_QUE_SL_NO,
            @BOOK_DT,
            @BOOK_FR_TM,
            @BOOK_TO_TM,
            @SERV_RT,
            @DISC_AMT,
            @BILL_AMT,
            @PAID_AMT,
            @DUE_AMT,
            @CANCEL_AMT,
            @REFUND_AMT,
            @REPORTING_FLG,
            @SERV_GIVEN_FLG,
            @SERV_GIVEN_DT,
            @SERV_GIVEN_TM,
            @SERV_CNCL_FLG,
            @CNCL_RSN_TYP_CD,
            @CNCL_RSN_CD,
            @CNCL_REFUND_FLG,
            @CNCL_REBOOK_FLG,
            @SERV_CNCL_ENTRY_DT,
            @SERV_CNCL_USER_CD,
            @SERV_CNCL_SESSION_ID,
            @SERV_CNCL_REMARKS,
            @ENTRY_DT,
            @USER_CD,
            @SESSION_ID,
            @ACT_FLG,
            @MOD_DT
        )
        VALUES (
            @HOS_CD,
            @DAY_BOOK_SL_NO,
            @SERV_TYP_CD,
            @SERV_CD,
            @DAY_CLINIC_CD,
            @RST_DT,
            @RST_NO,
            @DU_CD,
            @SERV_QUE_SL_NO,
            @BOOK_DT,
            @BOOK_FR_TM,
            @BOOK_TO_TM,
            @SERV_RT,
            @DISC_AMT,
            @BILL_AMT,
            @PAID_AMT,
            @DUE_AMT,
            @CANCEL_AMT,
            @REFUND_AMT,
            @REPORTING_FLG,
            @SERV_GIVEN_FLG,
            @SERV_GIVEN_DT,
            @SERV_GIVEN_TM,
            @SERV_CNCL_FLG,
            @CNCL_RSN_TYP_CD,
            @CNCL_RSN_CD,
            @CNCL_REFUND_FLG,
            @CNCL_REBOOK_FLG,
            @SERV_CNCL_ENTRY_DT,
            @SERV_CNCL_USER_CD,
            @SERV_CNCL_SESSION_ID,
            @SERV_CNCL_REMARKS,
            @ENTRY_DT,
            @USER_CD,
            @SESSION_ID,
            @ACT_FLG,
            @MOD_DT
        );
    END
	ELSE IF @QueryType = 'UPDATE'
BEGIN
    UPDATE DAY_PAT_BOOK_DTL
    SET
        @HOS_CD = HOS_CD,
        @DAY_BOOK_SL_NO = DAY_BOOK_SL_NO,
        @SERV_TYP_CD = SERV_TYP_CD,
        @SERV_CD = SERV_CD,
        @DAY_CLINIC_CD = DAY_CLINIC_CD,
        @RST_DT = RST_DT,
        @RST_NO = RST_NO,
        @DU_CD = DU_CD,
        @SERV_QUE_SL_NO = SERV_QUE_SL_NO,
        @BOOK_DT = BOOK_DT,
        @BOOK_FR_TM = BOOK_FR_TM,
        @BOOK_TO_TM = BOOK_TO_TM,
        @SERV_RT = SERV_RT,
        @DISC_AMT = DISC_AMT,
        @BILL_AMT = BILL_AMT,
        @PAID_AMT = PAID_AMT,
        @DUE_AMT = DUE_AMT,
        @CANCEL_AMT = CANCEL_AMT,
        @REFUND_AMT = REFUND_AMT,
        @REPORTING_FLG = REPORTING_FLG,
        @SERV_GIVEN_FLG = SERV_GIVEN_FLG,
        @SERV_GIVEN_DT = SERV_GIVEN_DT,
        @SERV_GIVEN_TM = SERV_GIVEN_TM,
        @SERV_CNCL_FLG = SERV_CNCL_FLG,
        @CNCL_RSN_TYP_CD = CNCL_RSN_TYP_CD,
        @CNCL_RSN_CD = CNCL_RSN_CD,
        @CNCL_REFUND_FLG = CNCL_REFUND_FLG,
        @CNCL_REBOOK_FLG = CNCL_REBOOK_FLG,
        @SERV_CNCL_ENTRY_DT = SERV_CNCL_ENTRY_DT,
        @SERV_CNCL_USER_CD = SERV_CNCL_USER_CD,
        @SERV_CNCL_SESSION_ID = SERV_CNCL_SESSION_ID,
        @SERV_CNCL_REMARKS = SERV_CNCL_REMARKS,
        @MOD_DT = SYSDATETIME()
    WHERE
        HOS_CD = @HOS_CD
        AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO
        AND SERV_TYP_CD = @SERV_TYP_CD
        AND SERV_CD = @SERV_CD
        AND RST_DT = @RST_DT
        AND RST_NO = @RST_NO;
END
ELSE IF @QueryType = 'DELETE'
BEGIN
    DELETE FROM DAY_PAT_BOOK_DTL
    WHERE
        HOS_CD = @HOS_CD
        AND DAY_BOOK_SL_NO = @DAY_BOOK_SL_NO
        AND SERV_TYP_CD = @SERV_TYP_CD
        AND SERV_CD = @SERV_CD
        AND RST_DT = @RST_DT
        AND RST_NO = @RST_NO;
END
ELSE
    BEGIN
        -- Invalid @QueryType
        RETURN -1;
    END
END;


