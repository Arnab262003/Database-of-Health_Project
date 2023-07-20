Create Table DAY_DOC_SPL(
SPL_CD nvarchar(10) Not Null  ,	
SPL_DESC nvarchar(50) Not Null  ,	
ACTIVE_FLG char(1) Default 'Y' Not Null  ,	
ENTRY_DT date ,	
USER_CD nvarchar(10),	
SESSION_ID numeric(9) ,	
ACT_FLG char(1) Default 'A' Not Null  ,	                                                                       
MOD_DT date ,	
SESSION_ID_WEB nvarchar(30) ,	
  
Constraint PK001_M0236_0020 Primary Key (SPL_CD),
Constraint CK001_M0236_0020 Check (ACTIVE_FLG in ('Y','N')),
Constraint CK002_M0236_0020 Check (ACT_FLG in ('A','I','D'))
); 
