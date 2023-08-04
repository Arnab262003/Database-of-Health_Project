CREATE TABLE DAY_PAT_BOOK_HDR (
    HOS_CD               nvarchar(10)         Not Null,   -- Hospital Code
    DAY_BOOK_SL_NO       nvarchar(20)         Not Null,   -- Day Booking Serial No.
    PAT_NM               nvarchar(60)         Not Null,   -- Name of the Patient
    SEX                  char(1)   Default 'M' Not Null,   -- Sex ([M]ale/[F]emale)
    AGE_YR               Numeric(9)   Default 0 Not Null,   -- Age Year
    AGE_MON              Numeric(9)   Default 0 Not Null,   -- Age Month
    AGE_DAY              Numeric(9)   Default 0 Not Null,   -- Age Day
    PAT_ADDR             nvarchar(100),                   -- Patient Address
    CONTACT_NO           nvarchar(20),                   -- Contact No.
    CAT_CD               nvarchar(10)         Not Null,   -- Category Code
    Tran_Dt              Date                Not Null,   -- Transaction date
    TOT_BOOK_AMT         Float(8)    Default 0 Not Null,   -- Total Booking Amount
    TOT_DISC_AMT         Float(8)    Default 0 Not Null,   -- Total Discount Amount
    TOT_BILL_AMT         Float(8)    Default 0 Not Null,   -- Total Bill Amount
    ADV_AMT              Float(8)    Default 0 Not Null,   -- Advanced Amount
    PAID_AMT             Float(8)    Default 0 Not Null,   -- Paid amount
    DUE_AMT              Float(8)    Default 0 Not Null,   -- Due amount
    CANCEL_AMT           Float(9)    Default 0 Not Null,   -- Cancel Amount
    REFUND_AMT           Float(8)    Default 0 Not Null,   -- Refund Amount
    TOT_SERV_GIVEN_FLG   char(1)  Default 'N' Not Null,   -- Total Service Given Flag ([Y]es/[N]o)
    BOOK_CNCL_FLG        char(1)  Default 'N' Not Null,   -- Booking Cancellation Flag ([Y]es/[N]o)
    CNCL_RSN_TYP_CD      nvarchar(5),                     -- Cancellation Reason Type Code
    CNCL_RSN_CD          nvarchar(10),                    -- Cancellation Reason Code
    CNCL_REFUND_FLG      char(1)  Default 'X' Not Null,   -- Cancellation Refund Flag ([Y]es/[N]o/[X] Not Cancelled)
    CNCL_REBOOK_FLG      char(1)  Default 'X' Not Null,   -- Cancellation Re-Book Flag ([Y]es/[N]o/[X] Not Cancelled)
    BOOK_CNCL_ENTRY_DT   Date,                            -- Cancellation Entry Date
    BOOK_CNCL_USER_CD    nvarchar(10),                    -- Cancellation User Code
    BOOK_CNCL_SESSION_ID Numeric(9),                      -- Cancellation Session ID
    BOOK_CNCL_REMARKS    nvarchar(200),                   -- Booking Cancellation Remarks
    POST_FLG             char(1)  Default 'N' Not Null,   -- Posting Flag ([Y]es/[N]o)
    ENTRY_DT             Date                Not Null,   -- Entry Date
    USER_CD              nvarchar(10)         Not Null,   -- User Code
    SESSION_ID           Numeric(9)           Not Null,   -- Session Id
    OPD_FLG              char(1)  Default 'N' Not Null,   -- OPD Flag -Doctor visits OPD ([Y]es/[N]o)
    OPD_SL_NO            nvarchar(15),                    -- OPD Serial No.
    VST_DT               Date,                            -- Visit Date
    OPD_CD               nvarchar(10),                    -- OPD Code
    DOC_CD               nvarchar(10),                    -- Doctor Code
    ACT_FLG              char(1)  Default 'A' Not Null,   -- Active Flag (Active-"A",Inactive-"I",Delete-"D")
    MOD_DT               Date,                            -- Modification Date
    SESSION_ID_WEB       nvarchar(30),                    -- Session ID for Web Development

    Constraint PK001_M0390_0009 Primary Key (HOS_CD, DAY_BOOK_SL_NO),
    Constraint FK001_M0390_0009 Foreign Key (HOS_CD, CAT_CD) References DAY_PAT_CAT_MST (HOS_CD, CAT_CD),
    Constraint FK002_M0390_0009 Foreign Key (CNCL_RSN_TYP_CD, CNCL_RSN_CD) References DAY_CNCL_RSN_MST (CNCL_RSN_TYP_CD, CNCL_RSN_CD),
    Constraint CK001_M0390_0009 Check (BOOK_CNCL_FLG in ('Y', 'N')),
    Constraint CK002_M0390_0009 Check (CNCL_REFUND_FLG in ('Y', 'N', 'X')),
    Constraint CK003_M0390_0009 Check (CNCL_REBOOK_FLG in ('Y', 'N', 'X')),
    Constraint CK004_M0390_0009 Check (POST_FLG in ('Y', 'N')),
    Constraint CK005_M0390_0009 Check (SEX in ('M', 'F')),
    Constraint CK006_M0390_0009 Check (TOT_SERV_GIVEN_FLG in ('Y', 'N')),
    Constraint CK007_M0390_0009 Check (ACT_FLG in ('A', 'I', 'D')),
    Constraint CK008_M0390_0009 Check (OPD_FLG in ('Y', 'N'))
);
