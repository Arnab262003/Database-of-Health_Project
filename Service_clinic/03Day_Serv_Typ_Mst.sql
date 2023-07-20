Create Table DAY_SERV_TYP_MST(
SERV_TYP_CD nvarchar(5) Not Null  ,	
SERV_TYP_DESC nvarchar(100) Not Null  ,	
ACTIVE_FLG char(1) Default 'Y' Not Null  ,	
USER_CD nvarchar(10) Not Null  ,	
ENTRY_DT date Not Null  ,	
SESSION_ID Numeric(9) Not Null  ,	
MOD_ID nvarchar(2) Not Null  ,	
SUB_MOD_ID nvarchar(3) Not Null  ,	
ACT_FLG char(1) Default 'A' Not Null  ,	
MOD_DT date ,	
SESSION_ID_WEB nvarchar(30),	
  
Constraint PK001_M0390_0004 Primary Key (SERV_TYP_CD),
Constraint CK001_M0390_0004 Check (ACTIVE_FLG in ('Y','N')),
Constraint CK002_M0390_0004 Check (ACT_FLG in ('A','I','D'))
); 
