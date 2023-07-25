CREATE TABLE DAY_CNCL_RSN_TYP_MST(
CNCL_RSN_TYP_CD           NVARCHAR(5)    Not Null,
CNCL_RSN_TYP_DESC         NVARCHAR(100)  Not Null,
REFUND_FLG                CHAR(1)    Default 'N' Not Null,
REBOOK_FLG                CHAR(1)    Default 'Y' Not Null,
ACTIVE_FLG                CHAR(1)    Default 'Y' Not Null,
ENTRY_DT                  DATE        Not Null,
USER_CD                   NVARCHAR(10)   Not Null,
SESSION_ID                NUMERIC(9)     Not Null,
MOD_ID                    NVARCHAR(2)    Not Null,
SUB_MOD_ID                CHAR(3)    Not Null,
ACT_FLG                   CHAR(1)    Default 'A' Not Null,
MOD_DT                    DATE
,
Constraint PK001_M0390_0002 PRIMARY KEY (CNCL_RSN_TYP_CD),
Constraint CK001_M0390_0002 CHECK (REBOOK_FLG IN ('Y','N')),
Constraint CK002_M0390_0002 CHECK (ACTIVE_FLG IN ('Y','N')),
Constraint CK003_M0390_0002 CHECK (REFUND_FLG IN ('Y','N')),
Constraint CK004_M0390_0002 CHECK (ACT_FLG IN ('A','I','D'))
);


