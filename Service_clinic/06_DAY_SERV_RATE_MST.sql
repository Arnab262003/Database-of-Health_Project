CREATE TABLE DAY_SERV_RATE_MST (
  HOS_CD         NVARCHAR(10)     NOT NULL,    -- Hospital Code
  SERV_TYP_CD    NVARCHAR(5)      NOT NULL,    -- Service Type Code
  SERV_CD        NVARCHAR(7)      NOT NULL,    -- Service Code
  CAT_CD         NVARCHAR(10)     NOT NULL,    -- Category Code
  EFFECT_DT      DATE          NOT NULL,    -- Effective Date
  SERV_AMT       FLOAT(8)         DEFAULT 0   NOT NULL,    -- Service Amount
  ENTRY_DT       DATE          NOT NULL,    -- Entry Date
  USER_CD        NVARCHAR(10)     NOT NULL,    -- User Code
  SESSION_ID     NUMERIC(9)       NOT NULL,    -- Session Id
  ACT_FLG        CHAR(1)      DEFAULT 'A' NOT NULL,    -- Active Flag (Active-"A", Inactive-"I", Delete-"D")
  MOD_DT         DATE,                              -- Modification Date
  SESSION_ID_WEB NVARCHAR(30)                               -- Session ID for Web Development
);

ALTER TABLE DAY_SERV_RATE_MST ADD CONSTRAINT PK001_M0390_0006 PRIMARY KEY (HOS_CD, SERV_TYP_CD, SERV_CD, CAT_CD, EFFECT_DT);
ALTER TABLE DAY_SERV_RATE_MST ADD CONSTRAINT FK002_M0390_0006 FOREIGN KEY (SERV_TYP_CD, SERV_CD) REFERENCES DAY_SERV_MST (SERV_TYP_CD, SERV_CD);
ALTER TABLE DAY_SERV_RATE_MST ADD CONSTRAINT FK001_M0390_0006 FOREIGN KEY (HOS_CD, CAT_CD) REFERENCES DAY_PAT_CAT_MST (HOS_CD, CAT_CD);
ALTER TABLE DAY_SERV_RATE_MST ADD CONSTRAINT CK001_M0390_0006 CHECK (ACT_FLG IN ('A', 'I', 'D'));
