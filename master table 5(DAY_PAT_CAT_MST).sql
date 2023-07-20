CREATE TABLE DAY_PAT_CAT_MST (
  HOS_CD          NVARCHAR(10)     NOT NULL,    -- Hospital Code
  CAT_CD          NVARCHAR(10)     NOT NULL,    -- Category Code
  CAT_DESC        NVARCHAR(100)    NOT NULL,    -- Category Description
  ACTIVE_FLG      CHAR(1)      DEFAULT 'Y' NOT NULL,    -- Active Flag ([Y]es / [N]o)
  ENTRY_DT        DATE          NOT NULL,    -- Entry Date
  USER_CD         NVARCHAR(10)     NOT NULL,    -- User Code
  SESSION_ID      NUMERIC(9)       NOT NULL,    -- Session Id
  MOD_ID          NVARCHAR(2)      NOT NULL,    -- Module ID
  SUB_MOD_ID      NVARCHAR(3)      NOT NULL,    -- Sub Module ID
  ACT_FLG         CHAR(1)      DEFAULT 'A' NOT NULL,    -- Active Flag (Active-"A", Inactive-"I", Delete-"D")
  MOD_DT          DATE,                              -- Modification Date
  SESSION_ID_WEB  NVARCHAR(30)                               -- Session ID for Web Development
);

ALTER TABLE DAY_PAT_CAT_MST ADD CONSTRAINT PK001_M0390_0001 PRIMARY KEY (HOS_CD, CAT_CD);
ALTER TABLE DAY_PAT_CAT_MST ADD CONSTRAINT CK001_M0390_0001 CHECK (ACTIVE_FLG IN ('Y', 'N'));
ALTER TABLE DAY_PAT_CAT_MST ADD CONSTRAINT CK002_M0390_0001 CHECK (ACT_FLG IN ('A', 'I', 'D'));
