-- =============================================
-- Author:		Arnab Patra
-- Create date: 19/07/23
-- =============================================
CREATE TABLE DAY_SERV_MST (
  SERV_TYP_CD      NVARCHAR(5)    NOT NULL,    -- Service Type Code
  SERV_CD          NVARCHAR(7)    NOT NULL,    -- Service Code
  SERV_DESC        NVARCHAR(100)  NOT NULL,    -- Service Description
  ADV_BOOK_FLG     CHAR(1)    DEFAULT 'Y' NOT NULL,    -- Advance Booking Flag – [Y]es / [N]o
  MAX_SERV_NO      NUMERIC(9)     DEFAULT 0   NOT NULL,    -- Maximum Service No.
  MAX_TM           NVARCHAR(5)    NOT NULL,    -- Maximum Execution Time of Service
  MIN_TM           NVARCHAR(5)    NOT NULL,    -- Minimum Execution Time of Service
  FREE_FLG         CHAR(1)    DEFAULT 'N' NOT NULL,    -- Free flag (Yes-"Y", No-"N")
  REFUND_PER       FLOAT(8)       DEFAULT 100 NOT NULL,    -- Refund Percentage
  UNIT_DEPD_FLG    CHAR(1)    DEFAULT 'N' NOT NULL,    -- Unit Dependent Flag
  PH_ANC_FLG       CHAR(1)    DEFAULT 'N' NOT NULL,    -- Public Health Antenatal Care Flag ([Y]es, [N]o)
  PH_DLV_FLG       CHAR(1)    DEFAULT 'N' NOT NULL,    -- Public Health Delivery Flag ([Y]es, [N]o)
  PH_PNC_FLG       CHAR(1)    DEFAULT 'N' NOT NULL,    -- Public Health Postnatal Care Flag ([Y]es, [N]o)
  PH_VAC_FLG       CHAR(1)    DEFAULT 'N' NOT NULL,    -- Public Health Vaccination Flag ([Y]es, [N]o)
  PH_RNTCP_FLG     CHAR(1)    DEFAULT 'N' NOT NULL,    -- Public Health Revised National Tuberculosis Control Program Flag ([Y]es, [N]o)
  PH_NLEP_FLG      CHAR(1)    DEFAULT 'N' NOT NULL,    -- Public Health National Leprosy Elimination Program Flag ([Y]es, [N]o)
  ACTIVE_FLG       CHAR(1)    DEFAULT 'Y' NOT NULL,    -- Active Flag ([Y]es / [N]o)
  USER_CD          NVARCHAR(10)   NOT NULL,    -- User Code
  ENTRY_DT         DATE        NOT NULL,    -- Entry Date
  SESSION_ID       NUMERIC(9)     NOT NULL,    -- Session Id
  ADV_DAY          NUMERIC(9)     DEFAULT 30  NOT NULL,    -- Advance Booking Allow Upto Days
  MOD_ID           NVARCHAR(2)    NOT NULL,    -- Module ID
  SUB_MOD_ID       NVARCHAR(3)    NOT NULL,    -- Sub Module ID
  ACT_FLG          CHAR(1)    DEFAULT 'A' NOT NULL,    -- Active Flag (Active-"A", Inactive-"I", Delete -"D")
  MOD_DT           DATE,                                -- Modification Date
  SESSION_ID_WEB   NVARCHAR(30)                               -- Session ID for Web Development
);

ALTER TABLE DAY_SERV_MST ADD CONSTRAINT PK001_M0390_0005 PRIMARY KEY (SERV_TYP_CD, SERV_CD);
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT FK001_M0390_0005 FOREIGN KEY (SERV_TYP_CD) REFERENCES DAY_SERV_TYP_MST(SERV_TYP_CD);
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK011_M0390_0005 CHECK (PH_ANC_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK009_M0390_0005 CHECK (FREE_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK010_M0390_0005 CHECK (UNIT_DEPD_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK001_M0390_0005 CHECK (ACT_FLG IN ('A', 'I', 'D'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK002_M0390_0005 CHECK (PH_DLV_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK003_M0390_0005 CHECK (PH_PNC_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK004_M0390_0005 CHECK (PH_VAC_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK005_M0390_0005 CHECK (PH_RNTCP_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK006_M0390_0005 CHECK (PH_NLEP_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK007_M0390_0005 CHECK (ACTIVE_FLG IN ('Y', 'N'));
ALTER TABLE DAY_SERV_MST ADD CONSTRAINT CK008_M0390_0005 CHECK (ADV_BOOK_FLG IN ('Y', 'N'));
