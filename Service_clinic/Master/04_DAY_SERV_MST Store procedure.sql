-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Arnab Patra
-- Create date: 20/07/23
-- Description:	Store procedure of DAY_SERV_MST
-- =============================================
CREATE PROCEDURE Store_procedure_DAY_SERV_MST
(
    @SERV_TYP_CD NVARCHAR(5),
    @SERV_CD NVARCHAR(7),
    @SERV_DESC NVARCHAR(100),
    @ADV_BOOK_FLG CHAR(1) = 'Y',
    @MAX_SERV_NO NUMERIC = 0,
    @MAX_TM NVARCHAR(5),
    @MIN_TM NVARCHAR(5),
    @FREE_FLG CHAR(1) = 'N',
    @REFUND_PER FLOAT = 100,
    @UNIT_DEPD_FLG CHAR(1) = 'N',
    @PH_ANC_FLG CHAR(1) = 'N',
    @PH_DLV_FLG CHAR(1) = 'N',
    @PH_PNC_FLG CHAR(1) = 'N',
    @PH_VAC_FLG CHAR(1) = 'N',
    @PH_RNTCP_FLG CHAR(1) = 'N',
    @PH_NLEP_FLG CHAR(1) = 'N',
    @ACTIVE_FLG CHAR(1) = 'Y',
    @USER_CD NVARCHAR(10),
    @ENTRY_DT DATE,
    @SESSION_ID NUMERIC(9),
    @ADV_DAY NUMERIC = 30,
    @MOD_ID NVARCHAR(2),
    @SUB_MOD_ID NVARCHAR(3),
    @ACT_FLG CHAR(1) = 'A',
    @MOD_DT DATE = NULL,
    @SESSION_ID_WEB NVARCHAR(30) = NULL,
	@QueryType     nvarchar(10)    ='INSERT'
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @QueryType ='INSERT'
		BEGIN
		INSERT INTO DAY_SERV_MST (
			SERV_TYP_CD,
			SERV_CD,
			SERV_DESC,
			ADV_BOOK_FLG,
			MAX_SERV_NO,
			MAX_TM,
			MIN_TM,
			FREE_FLG,
			REFUND_PER,
			UNIT_DEPD_FLG,
			PH_ANC_FLG,
			PH_DLV_FLG,
			PH_PNC_FLG,
			PH_VAC_FLG,
			PH_RNTCP_FLG,
			PH_NLEP_FLG,
			ACTIVE_FLG,
			USER_CD,
			ENTRY_DT,
			SESSION_ID,
			ADV_DAY,
			MOD_ID,
			SUB_MOD_ID,
			ACT_FLG,
			MOD_DT,
			SESSION_ID_WEB
		)
    VALUES (
        @SERV_TYP_CD,
        @SERV_CD,
        @SERV_DESC,
        @ADV_BOOK_FLG,
        @MAX_SERV_NO,
        @MAX_TM,
        @MIN_TM,
        @FREE_FLG,
        @REFUND_PER,
        @UNIT_DEPD_FLG,
        @PH_ANC_FLG,
        @PH_DLV_FLG,
        @PH_PNC_FLG,
        @PH_VAC_FLG,
        @PH_RNTCP_FLG,
        @PH_NLEP_FLG,
        @ACTIVE_FLG,
        @USER_CD,
        @ENTRY_DT,
        @SESSION_ID,
        @ADV_DAY,
        @MOD_ID,
        @SUB_MOD_ID,
        @ACT_FLG,
        @MOD_DT,
        @SESSION_ID_WEB
    )
	IF @@ROWCOUNT=1
			RETURN 1;
		ELSE
			RETURN 0;
		END
		ELSE IF @QueryType = 'UPDATE'
			BEGIN
				 UPDATE DAY_SERV_MST
        SET
            SERV_DESC = @SERV_DESC,
            ADV_BOOK_FLG = @ADV_BOOK_FLG,
            MAX_SERV_NO = @MAX_SERV_NO,
            MAX_TM = @MAX_TM,
            MIN_TM = @MIN_TM,
            FREE_FLG = @FREE_FLG,
            REFUND_PER = @REFUND_PER,
            UNIT_DEPD_FLG = @UNIT_DEPD_FLG,
            PH_ANC_FLG = @PH_ANC_FLG,
            PH_DLV_FLG = @PH_DLV_FLG,
            PH_PNC_FLG = @PH_PNC_FLG,
            PH_VAC_FLG = @PH_VAC_FLG,
            PH_RNTCP_FLG = @PH_RNTCP_FLG,
            PH_NLEP_FLG = @PH_NLEP_FLG,
            ACTIVE_FLG = @ACTIVE_FLG,
            USER_CD = @USER_CD,
            ENTRY_DT = @ENTRY_DT,
            SESSION_ID = @SESSION_ID,
            ADV_DAY = @ADV_DAY,
            MOD_ID = @MOD_ID,
            SUB_MOD_ID = @SUB_MOD_ID,
            ACT_FLG = @ACT_FLG,
            MOD_DT = @MOD_DT,
            SESSION_ID_WEB = @SESSION_ID_WEB
        WHERE
            SERV_TYP_CD = @SERV_TYP_CD
            AND SERV_CD = @SERV_CD;
        
        IF @@ROWCOUNT = 1
            RETURN 1;
        ELSE
            RETURN 0;
    END
    ELSE IF @QueryType = 'DELETE'
    BEGIN
        DELETE FROM DAY_SERV_MST
        WHERE
            SERV_TYP_CD = @SERV_TYP_CD
            AND SERV_CD = @SERV_CD;
        
        IF @@ROWCOUNT = 1
            RETURN 1;
        ELSE
            RETURN 0;
    END
    ELSE
    BEGIN
        -- Invalid @QueryType
        RETURN -1;
    END
END
