---=================================
-- Table no:    7
-- Author:		Arnab Patra
-- Create date: 30/07/2023
---=================================
CREATE TABLE DAY_PAT_OBSER_DTL (
    HOS_CD           nvarchar(10)         Not Null,   -- Hospital Code
    DAY_BOOK_SL_NO   nvarchar(20)         Not Null,   -- Day Booking Serial No.
    SL_NO            Numeric(9)           Not Null,   -- Serial No
    OBSER_CD         nvarchar(10)         Not Null,   -- Observation Code
    RESULT           nvarchar(50),                    -- Result
    ACT_FLG          char(1)    Default 'A' Not Null,  -- Active Flag (Active-"A",Inactive-"I", Delete -"D")
    MOD_DT           Date,                            -- Modification Date

    Constraint PK001_M0236_0028 Primary Key (HOS_CD, DAY_BOOK_SL_NO, SL_NO),
    Constraint FK001_M0236_0028 Foreign Key (HOS_CD, DAY_BOOK_SL_NO) References DAY_DOC_PAT_BOOK (HOS_CD, DAY_BOOK_SL_NO),
    Constraint CK001_M0236_0028 Check (ACT_FLG in ('A', 'I', 'D'))
);
