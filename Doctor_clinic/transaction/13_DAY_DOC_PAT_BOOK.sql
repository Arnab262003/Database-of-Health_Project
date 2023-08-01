---=================================
-- Table no:    13
-- Author:		Arnab Patra
-- Create date: 30/07/2023
---=================================
CREATE TABLE DAY_DOC_PAT_BOOK (
    HOS_CD              nvarchar(10)       Not Null,   -- Hospital Code
    DAY_BOOK_SL_NO      nvarchar(20)       Not Null,   -- Day Booking Serial No.
    BOOK_DT             Date               Not Null,   -- Booking Date
    BOOK_TM             nvarchar(5)        Not Null,   -- Booking Time
    PAT_NM              nvarchar(60)       Not Null,   -- Name of the Patient
    AGE_YR              Numeric(9)   Default 0,         -- Age Year
    AGE_MON             Numeric(9)   Default 0,         -- Age Month
    AGE_DAY             Numeric(9),                    -- Age Day
    SEX                 char(1)   Default 'M' Not Null,   -- Sex ([M]ale/[F]emale)
    PAT_ADD             nvarchar(200)      Not Null,   -- Address of the Patient
    CONTACT_NO          nvarchar(20)       Not Null,   -- Contact No.
    PAT_CAT             nvarchar(10)       Not Null,   -- Patient Category
    DOC_CD              nvarchar(10)       Not Null,   -- Doctor Code
    DAY_CLINIC_CD       nvarchar(10)       Not Null,   -- Day Clinic Code
    BOOK_FOR_DT         Date               Not Null,   -- Book For Date
    RST_NO              nvarchar(10),                  -- Roster No.
    BOOK_FR_TM          nvarchar(5)        Not Null,   -- Booking From Time
    BOOK_TO_TM          nvarchar(5)        Not Null,   -- Booking To Time
    QUE_NO              nvarchar(9)   Default 0 Not Null,   -- Queue No.
    BOOK_STAT           char(1)   Default 'P' Not Null,   -- Book Status (P-Phone, V-Visit)
    TOT_BOOK_AMT        Float(8)           Not Null,   -- Total Booking Amount
    ADV_AMT             Float(8)    Default 0 Not Null,   -- Advanced Amount
    PAID_AMT            Float(8)    Default 0 Not Null,   -- Paid amount
    DUE_AMT             Float(8)    Default 0 Not Null,   -- Due amount
    CAN_AMT             Float(8)    Default 0 Not Null,   -- Cancel Amount
    REFUND_AMT          Float(8)    Default 0 Not Null,   -- Refund Amount
    BOOK_CANCEL_FLG     char(1)   Default 'N' Not Null,   -- Booking Cancel Flag (Y/N)
    BOOK_CNCL_ENTRY_DT  Date,                           -- Cancellation Entry Date
    BOOK_CNCL_TM        nvarchar(5),                    -- Book Cancel Time
    CNCL_RSN_TYP_CD     nvarchar(5),                    -- Cancellation Reason Type Code
    BOOK_CAN_RSN_CD     nvarchar(5),                    -- Book Cancellation Reason Code
    BOOK_CAN_USER_CD    nvarchar(10),                   -- Booking Cancel User Code
    BOOK_CAN_SESSION_ID Numeric(9),                     -- Booking Cancel Session ID
    REPORTING_FLG       char(1)   Default 'N' Not Null,   -- Reporting Flag ([Y]es/[N]o)
    REPORTING_DT        Date,                           -- Patient Reporting Date
    REPORTING_TM        nvarchar(5),                    -- Patient Reporting Time
    RPT_USER_CD         nvarchar(10),                   -- Reporting User Code
    RPT_SESSION_ID      Numeric(9),                     -- Reporting Session Id.
    VISIT_FLG           char(1)   Default 'N' Not Null,   -- Visit Flag (Yes/No)
    REFUND_FLG          char(1)   Default 'N' Not Null,   -- Refund Flag [Y]es/[N]o
    ENTRY_DT            Date               Not Null,   -- Entry Date
    USER_CD             nvarchar(10)       Not Null,   -- User Code
    SESSION_ID          Numeric(9)   Default 0 Not Null,   -- Session Id
    ACT_FLG             char(1)   Default 'A' Not Null,   -- Active Flag (Active-"A",Inactive-"I", Delete -"D")
    MOD_DT              Date,                           -- Modification Date
    SESSION_ID_WEB      nvarchar(30),                   -- Session ID for Web Development

    Constraint PK001_M0236_0026 Primary Key (HOS_CD, DAY_BOOK_SL_NO),
    Constraint CK005_M0236_0026 Check (REPORTING_FLG in ('Y', 'N')),
    Constraint CK006_M0236_0026 Check (ACT_FLG in ('A', 'I', 'D')),
    Constraint CK001_M0236_0026 Check (VISIT_FLG in ('Y', 'N')),
    Constraint CK002_M0236_0026 Check (REFUND_FLG in ('Y', 'N')),
    Constraint CK003_M0236_0026 Check (SEX in ('M', 'F')),
    Constraint CK004_M0236_0026 Check (BOOK_CANCEL_FLG in ('Y', 'N'))
);
