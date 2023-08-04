CREATE TABLE DAY_PAT_BOOK_DTL (
    HOS_CD                 nvarchar(10)         Not Null,   -- Hospital Code
    DAY_BOOK_SL_NO         nvarchar(20)         Not Null,   -- Day Booking Serial No.
    SERV_TYP_CD            nvarchar(5)          Not Null,   -- Service Type Code
    SERV_CD                nvarchar(7)          Not Null,   -- Service Code
    DAY_CLINIC_CD          nvarchar(10)         Not Null,   -- Day Clinic Code
    RST_DT                 Date                 Not Null,   -- Roster Date
    RST_NO                 nvarchar(10)         Not Null,   -- Roster No.
    DU_CD                  nvarchar(10),                    -- Either Doctor Code or Unit Code.
    SERV_QUE_SL_NO         Numeric(9)   Default 0 Not Null,   -- Service Queue Serial Number
    BOOK_DT                Date                 Not Null,   -- Booking Date
    BOOK_FR_TM             nvarchar(5)          Not Null,   -- Booking From Time
    BOOK_TO_TM             nvarchar(5)          Not Null,   -- Booking To Time
    SERV_RT                Float(8)     Default 0 Not Null,   -- Service Rate Amount
    DISC_AMT               Float(8)     Default 0 Not Null,   -- Discount Amount
    BILL_AMT               Float(8)     Default 0 Not Null,   -- Bill amount
    PAID_AMT               Float(8)     Default 0 Not Null,   -- Paid amount
    DUE_AMT                Float(8)     Default 0 Not Null,   -- Due amount
    CANCEL_AMT             Float(9)     Default 0 Not Null,   -- Cancel Amount
    REFUND_AMT             Float(8)     Default 0 Not Null,   -- Refund Amount
    REPORTING_FLG          char(1)   Default 'N' Not Null,   -- Reporting Flag ([Y]es/[N]o)
    SERV_GIVEN_FLG         char(1)   Default 'N' Not Null,   -- Service Given Flag ([Y]es/[N]o)
    SERV_GIVEN_DT          Date,                            -- Service Given Date
    SERV_GIVEN_TM          nvarchar(5),                     -- Service Given Time
    SERV_CNCL_FLG          char(1)   Default 'N' Not Null,   -- Service Cancellation Flag ([Y]es/[N]o)
    CNCL_RSN_TYP_CD        nvarchar(5),                     -- Cancellation Reason Type Code
    CNCL_RSN_CD            nvarchar(10),                    -- Cancellation Reason Code
    CNCL_REFUND_FLG        char(1)   Default 'X' Not Null,   -- Cancellation Refund Flag ([Y]es/[N]o/[X] Not Cancelled)
    CNCL_REBOOK_FLG        char(1)   Default 'X' Not Null,   -- Cancellation Re-Book Flag ([Y]es/[N]o/[X] Not Cancelled)
    SERV_CNCL_ENTRY_DT     Date,                            -- Service Cancellation Entry Date
    SERV_CNCL_USER_CD      nvarchar(10),                    -- Service Cancellation User Code
    SERV_CNCL_SESSION_ID   Numeric(9),                      -- Service Cancellation Session ID
    SERV_CNCL_REMARKS      nvarchar(200),                   -- Service Cancellation Remarks
    ENTRY_DT               Date                 Not Null,   -- Entry Date
    USER_CD                nvarchar(10)         Not Null,   -- User Code
    SESSION_ID             Numeric(9)           Not Null,   -- Session Id
    ACT_FLG                char(1)   Default 'A' Not Null,   -- Active Flag (Active-"A",Inactive-"I",Delete-"D")
    MOD_DT                 Date,                            -- Modification Date
    SESSION_ID_WEB         nvarchar(30),                    -- Session ID for Web Development

    Constraint PK001_M0390_0010 Primary Key (HOS_CD, DAY_BOOK_SL_NO, SERV_TYP_CD, SERV_CD, RST_NO),
    Constraint FK003_M0390_0010 Foreign Key (HOS_CD, DAY_BOOK_SL_NO) References DAY_PAT_BOOK_HDR (HOS_CD, DAY_BOOK_SL_NO),
    Constraint FK001_M0390_0010 Foreign Key (CNCL_RSN_TYP_CD, CNCL_RSN_CD) References DAY_CNCL_RSN_MST (CNCL_RSN_TYP_CD, CNCL_RSN_CD),
    Constraint FK002_M0390_0010 Foreign Key (HOS_CD, DAY_CLINIC_CD, RST_DT, RST_NO) References DAY_DLY_RST (HOS_CD, DAY_CLINIC_CD, RST_DT, RST_NO),

    Constraint CK005_M0390_0010 Check (REPORTING_FLG in ('Y', 'N')),
    Constraint CK006_M0390_0010 Check (SERV_GIVEN_FLG in ('Y', 'N')),
    Constraint CK001_M0390_0010 Check (SERV_CNCL_FLG in ('Y', 'N')),
    Constraint CK002_M0390_0010 Check (ACT_FLG in ('A', 'I', 'D')),
    Constraint CK003_M0390_0010 Check (CNCL_REFUND_FLG in ('Y', 'N', 'X')),
    Constraint CK004_M0390_0010 Check (CNCL_REBOOK_FLG in ('Y', 'N', 'X'))
);
