---=================================
-- Table no:    14
-- Author:		Arnab Patra
-- Create date: 30/07/2023
---=================================
CREATE TABLE DAY_PAT_FOLLOWUPCHK_DTL (
    HOS_CD            nvarchar(10)        Not Null,   -- Hospital Code
    DAY_BOOK_SL_NO    nvarchar(20)        Not Null,   -- Day Booking Serial No.
    SL_NO             Numeric(18, 0)      Not Null,   -- Serial No.
    CHK_DT            Date,                            -- Check Date
    CHK_TM            nvarchar(5),                     -- Checking Time
    CHK_DEPT          nvarchar(10),                    -- Checking Department
    DOC_CD            nvarchar(10),                    -- Doctor Code
    COMM              nvarchar(50),                    -- Comments
    ACT_FLG           char(1)   Default 'A' Not Null,   -- Active Flag (A=Active, I=Inactive, D=Deleted)
    MOD_DT            Date,                            -- Last Modified Date & Time

    Constraint PK001_M0236_0036 Primary Key (HOS_CD, DAY_BOOK_SL_NO, SL_NO),
    Constraint CK001_M0236_0036 Check (ACT_FLG in ('A', 'D', 'I'))
);
