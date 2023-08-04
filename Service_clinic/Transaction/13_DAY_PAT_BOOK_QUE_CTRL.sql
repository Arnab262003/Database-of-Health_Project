CREATE TABLE DAY_PAT_BOOK_QUE_CTRL (
    HOS_CD               nvarchar(10)         Not Null,   -- Hospital Code
    DAY_CLINIC_CD        nvarchar(10)         Not Null,   -- Day Clinic Code
    SERV_TYP_CD          nvarchar(5)          Not Null,   -- Service Type Code
    SERV_CD              nvarchar(7)          Not Null,   -- Service Code
    BOOK_DT              Date                 Not Null,   -- Booking Date
    MAX_SERV_NO          Numeric(9)   Default 0 Not Null,   -- Maximum Service No.
    CURR_SERV_QUE_NO     Numeric(9)   Default 0 Not Null,   -- Current Service Queue No.
    SERV_AVL_NO          Numeric(9)   Default 0 Not Null,   -- No. of Service Available.
    ACT_FLG              char(1)   Default 'A' Not Null,   -- Active Flag (Active-"A",Inactive-"I",Delete-"D")
    MOD_DT               Date,                             -- Modification Date

    Constraint PK001_M0390_0011 Primary Key (HOS_CD, DAY_CLINIC_CD, SERV_TYP_CD, SERV_CD, BOOK_DT),
    Constraint FK002_M0390_0011 Foreign Key (HOS_CD, DAY_CLINIC_CD) References DAY_CLINIC_MST (HOS_CD, DAY_CLINIC_CD),
    Constraint FK001_M0390_0011 Foreign Key (SERV_TYP_CD, SERV_CD) References DAY_SERV_MST (SERV_TYP_CD, SERV_CD),
    Constraint CK001_M0390_0011 Check (ACT_FLG in ('A', 'I', 'D'))
);
