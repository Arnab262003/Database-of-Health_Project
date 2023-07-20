Create Table DAY_SERV_MAP(
HOS_CD                   	nvarchar(10)    	            Not Null  ,	--Hospital Code
DAY_CLINIC_CD            	nvarchar(10)    	            Not Null  ,	--Day Clinic Code
SERV_TYP_CD              	nvarchar(5)     	            Not Null  ,	--Service Type Code
SERV_CD                  	nvarchar(7)     	            Not Null  ,	--Service Code
SUN_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Sunday Available Flag  ([Y]es / [N]o).
MON_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Monday Available Flag  ([Y]es / [N]o).
TUE_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Tuesday Available Flag  ([Y]es / [N]o).
WED_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Wednesday Available Flag ([Y]es / [N]o).
THU_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Thursday Available Flag ([Y]es / [N]o).
FRI_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Friday Available Flag ([Y]es / [N]o).
SAT_AVL_FLG              	char(1)     	Default 'N'    	Not Null  ,	--Saturday Available Flag ([Y]es / [N]o).
SUN_FR_TM                	nvarchar(5)     	               	      ,	--Sunday From Time
SUN_TO_TM                	nvarchar(5)     	               	      ,	--Sunday To Time
MON_FR_TM                	nvarchar(5)     	               	      ,	--Monday From Time
MON_TO_TM                	nvarchar(5)     	               	      ,	--Monday To Time
TUE_FR_TM                	nvarchar(5)     	               	      ,	--Tuesday From Time
TUE_TO_TM                	nvarchar(5)     	               	      ,	--Tuesday Flag
WED_FR_TM                	nvarchar(5)     	               	      ,	--Wednesday From Time
WED_TO_TM                	nvarchar(5)     	               	      ,	--Wednesday To Time
THU_FR_TM                	nvarchar(5)     	               	      ,	--Thrusday From Time
THU_TO_TM                	nvarchar(5)     	               	      ,	--Thursday To Time
FRI_FR_TM                	nvarchar(5)     	               	      ,	--Friday From Time
FRI_TO_TM                	nvarchar(5)     	               	      ,	--Friday To Time
SAT_FR_TM                	nvarchar(5)     	               	      ,	--Saturday From Time
SAT_TO_TM                	nvarchar(5)     	               	      , --Saterday To Time
SUN_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  , --Maximum No. of Service given on Sunday.
MON_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  ,	--Maximum No. of Service given on Monday.
TUE_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  ,	--Maximum No. of Service given on Tuesday.
WED_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  ,	--Maximum No. of Service given on Wednesday.
THU_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  ,	--Maximum No. of Service given on Thursday.
FRI_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  ,	--Maximum No. of Service given on Friday.
SAT_SERV_MAX_NO          	Numeric(9)     	Default 0      	Not Null  ,	--Maximum No. of Service given on Saturday.
ENTRY_DT                 	Date     	                 	Not Null  ,	--Entry Date
USER_CD                  	nvarchar(10)    	            Not Null  ,	--User Code
SESSION_ID               	Numeric(9)     	               	Not Null  ,	--Session Id
MOD_ID                   	nvarchar(2)     	            Not Null  ,	--Module ID
SUB_MOD_ID               	nvarchar(3)     	            Not Null  ,	--Sub Module ID
ACT_FLG                  	char(1)     	Default 'A'    	Not Null  ,	--Active Flag (Active-"A",Inactive-"I",Delete-D)                                                                            	' -"D")
MOD_DT                   	Date     	               	              ,	--Modification Date
  
Constraint PK001_M0390_0007 Primary Key  (HOS_CD,DAY_CLINIC_CD,SERV_TYP_CD,SERV_CD),
Constraint FK001_M0390_0007 Foreign Key  (SERV_TYP_CD,SERV_CD) References DAY_SERV_MST(SERV_TYP_CD,SERV_CD) ,
Constraint FK002_M0390_0007 Foreign Key  (HOS_CD,DAY_CLINIC_CD) References DAY_CLINIC_MST(HOS_CD,DAY_CLINIC_CD) ,
Constraint CK001_M0390_0007 Check (WED_AVL_FLG in ('Y','N')),
Constraint CK002_M0390_0007 Check (MON_AVL_FLG in ('Y','N')),
Constraint CK003_M0390_0007 Check (TUE_AVL_FLG in ('Y','N')),
Constraint CK004_M0390_0007 Check (SAT_AVL_FLG in ('Y','N')),
Constraint CK005_M0390_0007 Check (THU_AVL_FLG in ('Y','N')),
Constraint CK006_M0390_0007 Check (FRI_AVL_FLG in ('Y','N')),
Constraint CK007_M0390_0007 Check (SUN_AVL_FLG in ('Y','N')),
Constraint CK008_M0390_0007 Check (ACT_FLG in ('A','I','D'))
); 