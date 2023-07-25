CREATE TABLE DAY_CNCL_RSN_MST(
CNCL_RSN_TYP_CD           NVARCHAR(5)    Not Null,
CNCL_RSN_CD               NVARCHAR(10)   Not Null,
CNCL_RSN_DESC             NVARCHAR(200)  Not Null,
ACTIVE_FLG                CHAR(1)    Default 'Y' Not Null,
ENTRY_DT                  DATE        Not Null,
USER_CD                   NVARCHAR(10)   Not Null,
SESSION_ID                NUMERIC(9)     Not Null,
MOD_ID                    NVARCHAR(2)    Not Null,
SUB_MOD_ID                NVARCHAR(3)    Not Null,
ACT_FLG                   CHAR(1)    Default 'A' Not Null,
MOD_DT                    DATE
,
Constraint PK001_M0390_0003 PRIMARY KEY (CNCL_RSN_TYP_CD, CNCL_RSN_CD),
Constraint FK001_M0390_0003 FOREIGN KEY (CNCL_RSN_TYP_CD) REFERENCES DAY_CNCL_RSN_TYP_MST (CNCL_RSN_TYP_CD),
Constraint CK001_M0390_0003 CHECK (ACTIVE_FLG IN ('Y','N')),
Constraint CK002_M0390_0003 CHECK (ACT_FLG IN ('A','I','D'))
);
