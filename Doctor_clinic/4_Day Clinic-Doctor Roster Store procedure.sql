USE [Day Clinic-Doctor Roster]
GO
/****** Object:  StoredProcedure [dbo].[DAY_DOC_RST2]    Script Date: 20-07-2023 00:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Arnab Patra
-- Create date: 12/07/23
-- Description:	Store procedure for Day Clinic-Doctor Roster
-- =============================================
CREATE PROCEDURE  [dbo].[DAY_DOC_RST1]
(
@HOS_CD         nvarchar(10)    = NULL, -- Hospital Code
@DAY_CLINIC_CD  nvarchar(10)    = NULL, -- Day Clinic Code
@RST_NO         nvarchar(10)    = NULL, -- Roster No.
@DOC_CD         nvarchar(10)    = NULL, -- Doctor Code
@RST_DT         DATE            ='1/1/1990', -- Roster Date
@FROM_TM        nvarchar(5)     = NULL, -- From Time
@TO_TM          nvarchar(5)     = NULL, -- To Time
@VENUE_NM       nvarchar(50)    = NULL, -- Venue Name
@ACTIVE_FLG     char(1)         = 'Y', -- Active Flag ([Y]es / [N]o)
@ENTRY_DT       DATE	        ='1/1/1990', -- Entry Date
@USER_CD        nvarchar(10)    = NULL, -- User Code
@SESSION_ID     NUMERIC(9)      = 0, -- Session Id
@ACT_FLG        char(1)         = 'A', -- Active Flag (Active-"A",Inactive-"I", Delete -"D")
@MOD_DT         DATE	        ='1/1/1990',
@SESSION_ID_WEB NVARCHAR(30)    = NULL,
@QueryType     nvarchar(10)    ='INSERT' )  

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @QueryType ='INSERT'
		BEGIN
			INSERT INTO [dbo].[DAY_DOC_RST]
				([HOS_CD],
				[DAY_CLINIC_CD],
				[RST_NO],
				[DOC_CD],
				[RST_DT],
				[FROM_TM],
				[TO_TM],
				[VENUE_NM],
				[ACTIVE_FLG],
				[ENTRY_DT],
				[USER_CD],
				[SESSION_ID],
				[ACT_FLG],
				[MOD_DT],
				[SESSION_ID_WEB])

		VALUES
			(@HOS_CD,
			@DAY_CLINIC_CD,
			@RST_NO,
			@DOC_CD,
			@RST_DT,
			@FROM_TM,
			@TO_TM,
			@VENUE_NM,
			@ACTIVE_FLG,
			@ENTRY_DT,
			@USER_CD,
			@SESSION_ID,
			@ACT_FLG,
			@MOD_DT,
			@SESSION_ID_WEB);

		IF @@ROWCOUNT=1
			RETURN 1;
		ELSE
			RETURN 0;
		END
		ELSE IF @QueryType = 'UPDATE'
			BEGIN
				UPDATE [dbo].[DAY_DOC_RST]
        SET
            [HOS_CD] = @HOS_CD,
            [DAY_CLINIC_CD] = @DAY_CLINIC_CD,
            [RST_NO] = @RST_NO,
            [DOC_CD] = @DOC_CD,
            [RST_DT] = @RST_DT,
            [FROM_TM] = @FROM_TM,
            [TO_TM] = @TO_TM,
            [VENUE_NM] = @VENUE_NM,
            [ACTIVE_FLG] = @ACTIVE_FLG,
            [ENTRY_DT] = @ENTRY_DT,
            [USER_CD] = @USER_CD,
            [SESSION_ID] = @SESSION_ID,
            [ACT_FLG] = @ACT_FLG,
            [MOD_DT] = @MOD_DT,
            [SESSION_ID_WEB] = @SESSION_ID_WEB
        WHERE
            [HOS_CD] = @HOS_CD AND [DAY_CLINIC_CD] = @DAY_CLINIC_CD AND [RST_NO] = @RST_NO AND [DOC_CD] = @DOC_CD;

        IF @@ROWCOUNT > 0
            RETURN 1;
        ELSE
            RETURN 0;
    END
    ELSE IF @QueryType = 'DELETE'
    BEGIN
        -- DELETE operation
        DELETE FROM [dbo].[DAY_DOC_RST]
        WHERE
            [HOS_CD] = @HOS_CD AND [DAY_CLINIC_CD] = @DAY_CLINIC_CD AND [RST_NO] = @RST_NO AND [DOC_CD] = @DOC_CD;

        IF @@ROWCOUNT > 0
            RETURN 1;
        ELSE
            RETURN 0;
    END

    -- Handle other conditions or errors here if necessary
    RETURN -1;
END
