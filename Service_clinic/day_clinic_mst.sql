Create Table DAY_CLINIC_TYP_MST(
DAY_CLINIC_TYP_CD nvarchar(5) Not Null,
DAY_CLINIC_TYP_DESC nvarchar(100) Not Null,
ACT_FLG char(1) default 'A' Not Null,	
MOD_DT date Not Null,	

Constraint PK001_M0389_0002 Primary Key  (DAY_CLINIC_TYP_CD),
Constraint CK001_M0389_0002 Check (ACT_FLG in ('A','I','D'))
);
