---=================================
-- Table no:    8
-- Author:		Arnab Patra
-- Create date: 30/07/2023
---=================================
CREATE TABLE DAY_PAT_MED_DTL (
    HOS_CD           nvarchar(10)         Not Null,   -- Hospital Code
    DAY_BOOK_SL_NO   nvarchar(20)         Not Null,   -- Day Booking Serial No.
    SL_NO            Numeric(9)           Not Null,   -- Serial No
    ITEM_CAT_CD      nvarchar(20),                   -- Item Category Code
    DOSE_DTL         nvarchar(20),                   -- Dose Details
    PRES_QTY         Float(8)        Default 0 Not Null,  -- Prescribe Quantity
    UNITS            nvarchar(15),                   -- Units
    ISU_QTY          Float(8)        Default 0 Not Null,  -- Issue Quantity
    COMM             nvarchar(50),                   -- Comments
    SRL_NO           Numeric(9),                      -- Serial No
    ACT_FLG          char(1)     Default 'A' Not Null,  -- Active Flag (Active-"A",Inactive-"I", Delete -"D")
    MOD_DT           Date,                            -- Modification Date

    Constraint PK001_M0236_0029 Primary Key (HOS_CD, DAY_BOOK_SL_NO, SL_NO),
    Constraint FK001_M0236_0029 Foreign Key (HOS_CD, DAY_BOOK_SL_NO) References DAY_DOC_PAT_BOOK (HOS_CD, DAY_BOOK_SL_NO),
    Constraint CK001_M0236_0029 Check (ACT_FLG in ('A', 'I', 'D'))
);
