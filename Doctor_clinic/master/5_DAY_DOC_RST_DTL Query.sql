Create Table DAY_DOC_RST_DTL(
HOS_CD nvarchar(10) Not Null  ,	
DAY_CLINIC_CD nvarchar(10) Not Null  ,	
RST_NO nvarchar(10)	Not Null  ,	
DOC_CD nvarchar(10) Not Null  ,	
QUE_NO nvarchar(9) Default 0      Not Null  ,	
FROM_TM nvarchar(5) Not Null  ,	
TO_TM nvarchar(5) Not Null  ,	
BOOK_FLG char(1) Default 'N' Not Null  ,	
DAY_BOOK_SL_NO nvarchar(20) ,	
SRL_NO numeric(9) Default 0 Not Null  ,	
ACTIVE_FLG char(1) Default 'Y' Not Null  ,	
ENTRY_DT Date Not Null  ,	
USER_CD nvarchar(10) Not Null  ,	
SESSION_ID Numeric(9) Default 0 Not Null  ,
ACT_FLG char(1) Default 'A'	Not Null  ,	                                                                      
MOD_DT Date,	
  
Constraint PK001_M0236_0024 Primary Key  (HOS_CD,DAY_CLINIC_CD,RST_NO,DOC_CD,QUE_NO),
Constraint CK001_M0236_0024 Check ((ACTIVE_FLG) in  ('Y','N')),
Constraint CK002_M0236_0024 Check (ACT_FLG in ('A','I','D'))
); 