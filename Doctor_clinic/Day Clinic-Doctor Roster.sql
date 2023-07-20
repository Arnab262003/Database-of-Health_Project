-- =============================================
-- Author:		Arnab Patra
-- Create date: 12/07/23
-- =============================================
CREATE TABLE DAY_DOC_RST (
  HOS_CD        nvarchar(10)       NOT NULL, -- Hospital Code
  DAY_CLINIC_CD nvarchar(10)       NOT NULL, -- Day Clinic Code
  RST_NO        nvarchar(10)       NOT NULL, -- Roster No.
  DOC_CD        nvarchar(10)       NOT NULL, -- Doctor Code
  RST_DT        DATE           NOT NULL, -- Roster Date
  FROM_TM       nvarchar(5)        NOT NULL, -- From Time
  TO_TM         nvarchar(5)        NOT NULL, -- To Time
  VENUE_NM      nvarchar(50)       NOT NULL, -- Venue Name
  ACTIVE_FLG    char(1)        DEFAULT 'Y' NOT NULL, -- Active Flag ([Y]es / [N]o)
  ENTRY_DT      DATE        NOT NULL, -- Entry Date
  USER_CD       nvarchar(50)       NOT NULL, -- User Code
  SESSION_ID    NUMERIC(9)     DEFAULT 0 NOT NULL, -- Session Id
  ACT_FLG       char(1)        DEFAULT 'A' NOT NULL, -- Active Flag (Active-"A",Inactive-"I", Delete -"D")
  MOD_DT        DATE, -- Modification Date 

Constraint PK001_M0236_0023 Primary Key  (HOS_CD,DAY_CLINIC_CD,RST_NO,DOC_CD),
Constraint CK001_M0236_0023 Check     (ACTIVE_FLG IN ('Y','N')),
Constraint CK002_M0236_0023 Check     (ACT_FLG IN ('A','I','D'))

);


