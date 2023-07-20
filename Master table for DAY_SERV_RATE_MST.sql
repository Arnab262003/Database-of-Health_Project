Create Table DAY_SERV_RATE_MST(
HOS_CD nvarchar(10) Not Null, -- Hospital Code
SERV_TYP_CD nvarchar(5) Not Null,  --Service Type Code
SERV_CD nvarchar(7)  Not Null,  --Service Code
CAT_CD nvarchar(10)	Not Null,  --Category Code
EFFECT_DT Date Not Null, --Effective Date
SERV_AMT Float(8) Default 0  Not Null, --Service Amount
ENTRY_DT Date Not Null,  --Entry Date
USER_CD nvarchar(10) Not Null ,--User Code
SESSION_ID Numeric(9) Not Null, -- Session Id
ACT_FLG CHAR(1) Default 'A' Not Null,-- Active Flag (Active-"A",Inactive-"I",Delete' -"D")
MOD_DT Date,  --Modification Date
SESSION_ID_WEB nvarchar(30),-- Session ID for Web Development
  
Constraint PK001_M0390_0006 Primary Key (HOS_CD,SERV_TYP_CD,SERV_CD,CAT_CD,EFFECT_DT),
Constraint FK002_M0390_0006 Foreign Key  (SERV_TYP_CD,SERV_CD) REFERENCES DAY_SERV_MST(SERV_TYP_CD,SERV_CD),
Constraint FK001_M0390_0006 Foreign Key  (HOS_CD,CAT_CD) REFERENCES DAY_PAT_CAT_MST(HOS_CD,CAT_CD),
Constraint CK001_M0390_0006 Check (ACT_FLG in ('A','I','D'))
); 