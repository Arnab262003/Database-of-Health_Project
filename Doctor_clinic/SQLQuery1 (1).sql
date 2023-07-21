CREATE TABLE DAY_DOC_MAP (
  HOS_CD           nvarchar(10)     NOT NULL, -- Hospital Code
  DAY_CLINIC_CD    nvarchar(10)     NOT NULL, -- Day Clinic Code
  DOC_CD           nvarchar(10)     NOT NULL, -- Doctor Code
  SUN_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Sunday Flag (Yes/No)
  MON_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Monday Flag (Yes/No)
  TUE_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Tuesday Flag (Yes/No)
  WED_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Wednesday Flag (Yes/No)
  THU_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Thursday Flag (Yes/No)
  FRI_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Friday Flag (Yes/No)
  SAT_FLG          char(1)          DEFAULT 'N' NOT NULL, -- Saturday Flag (Yes/No)
  SUN_FR_TM        nvarchar(5)      NOT NULL, -- Sunday From Time
  SUN_TO_TM        nvarchar(5)      NOT NULL, -- Sunday To Time
  MON_FR_TM        nvarchar(5)      NOT NULL, -- Monday From Time
  MON_TO_TM        nvarchar(5)      NOT NULL, -- Monday To Time
  TUE_FR_TM        nvarchar(5)      NOT NULL, -- Tuesday From Time
  TUE_TO_TM        nvarchar(5)      NOT NULL, -- Tuesday To Time
  WED_FR_TM        nvarchar(5)      NOT NULL, -- Wednesday From Time
  WED_TO_TM        nvarchar(5)      NOT NULL, -- Wednesday To Time
  THU_FR_TM        nvarchar(5)      NOT NULL, -- Thursday From Time
  THU_TO_TM        nvarchar(5)      NOT NULL, -- Thursday To Time
  FRI_FR_TM        nvarchar(5)      NOT NULL, -- Friday From Time
  FRI_TO_TM        nvarchar(5)      NOT NULL, -- Friday To Time
  SAT_FR_TM        nvarchar(5)      NOT NULL, -- Saturday From Time
  SAT_TO_TM        nvarchar(5)      NOT NULL, -- Saturday To Time
  EFFECT_FROM      Date          NOT NULL, -- Effective From
  EFFECT_TO        Date, -- Effect To
  APPX_REQ_TM      nvarchar(5)      NOT NULL, -- Approx. Required Time
  ADV_DAY          Numeric(9)       DEFAULT 0 NOT NULL, -- Advance Booking Allow Upto Days
  ACTIVE_FLG       char(1)          DEFAULT 'Y' NOT NULL, -- Active Flag (Yes/No)
  ENTRY_DT         Date         NOT NULL, -- Entry Date
  USER_CD          nvarchar(10)     NOT NULL, -- User Code
  SESSION_ID       Numeric(9)       DEFAULT 0 NOT NULL, -- Current User Session
  ACT_FLG          char(1)          DEFAULT 'A' NOT NULL, -- Active Flag (Active-"A",Inactive-"I", Delete-"D")
  MOD_DT           Date, -- Modification Date
  SESSION_ID_WEB   nvarchar(30), -- Session ID for Web Development

  CONSTRAINT PK001_M0236_0022 PRIMARY KEY (HOS_CD, DAY_CLINIC_CD, DOC_CD),
  CONSTRAINT CK001_M0236_0022 CHECK (ACTIVE_FLG IN ('Y', 'N')),
  CONSTRAINT CK002_M0236_0022 CHECK (ACT_FLG IN ('A', 'I', 'D'))
);
select *from DAY_DOC_MAP;