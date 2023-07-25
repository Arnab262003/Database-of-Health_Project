CREATE PROCEDURE DAY_DLY_RSTT
	(@HOS_CD varchar,	
	@DAY_CLINIC_CD varchar,	
	@RST_DT Date,
	@RST_NO varchar,	
	@UNIT_DEPD_FLG char='N',
	@FROM_TM char,
	@TO_TM varchar,	
	@VENUE_NM varchar,	
	@PH_ANC_FLG char='N',	
	@PH_DLV_FLG char='N',	
	@PH_PNC_FLG char='N',
	@PH_VAC_FLG char='N',	
	@PH_RNTCP_FLG char='N',	
	@PH_NLEP_FLG char='N',	    	
	@ACTIVE_FLG char='Y',	
	@ENTRY_DT Date ,	
	@USER_CD varchar,	
	@SESSION_ID int,	
	@MOD_ID varchar,
	@SUB_MOD_ID varchar,	
	@ACT_FLG char='A',	
	@MOD_DT Date,
	@QueryType nvarchar(10) = 'Insert')
	AS
	BEGIN
		SET NOCOUNT ON;
		IF @QueryType = 'Insert'
		BEGIN 
		INSERT INTO [dbo].[DAY_DLY_RST]
		   ([HOS_CD],	
			[DAY_CLINIC_CD],	
			[RST_DT],
			[RST_NO],	
			[UNIT_DEPD_FLG],
			[FROM_TM],
			[TO_TM],	
			[VENUE_NM],	
			[PH_ANC_FLG],	
			[PH_DLV_FLG],	
			[PH_PNC_FLG],
			[PH_VAC_FLG],	
			[PH_RNTCP_FLG],	
			[PH_NLEP_FLG],	    	
			[ACTIVE_FLG],	
			[ENTRY_DT],	
			[USER_CD],	
			[SESSION_ID],	
			[MOD_ID],
			[SUB_MOD_ID],	
			[ACT_FLG],	
			[MOD_DT])
		VALUES
		  (@HOS_CD,	
			@DAY_CLINIC_CD,	
			@RST_DT,
			@RST_NO,	
			@UNIT_DEPD_FLG,
			@FROM_TM,
			@TO_TM,	
			@VENUE_NM,	
			@PH_ANC_FLG,	
			@PH_DLV_FLG,	
			@PH_PNC_FLG,
			@PH_VAC_FLG,	
			@PH_RNTCP_FLG,	
			@PH_NLEP_FLG,	    	
			@ACTIVE_FLG,	
			@ENTRY_DT,	
			@USER_CD,	
			@SESSION_ID,	
			@MOD_ID,
			@SUB_MOD_ID,	
			@ACT_FLG,	
			@MOD_DT 
		  );
	  IF @@ROWCOUNT = 1
		RETURN 1;
	  ELSE
		RETURN 0;
	END

	ELSE IF @QueryType = 'Update'
		BEGIN 
			UPDATE DAY_DLY_RST
				SET 	
				[RST_DT]=@RST_DT,
				[RST_NO]=@RST_NO,	
				[UNIT_DEPD_FLG]=@UNIT_DEPD_FLG,
				[FROM_TM]=@FROM_TM,
				[TO_TM]=@TO_TM,	
				[VENUE_NM]=@VENUE_NM,	
				[PH_ANC_FLG]=@PH_ANC_FLG,	
				[PH_DLV_FLG]=@PH_DLV_FLG,	
				[PH_PNC_FLG]=@PH_PNC_FLG,
				[PH_VAC_FLG]=@PH_VAC_FLG,	
				[PH_RNTCP_FLG]=@PH_RNTCP_FLG,	
				[PH_NLEP_FLG]=@PH_NLEP_FLG,	    	
				[ACTIVE_FLG]=@ACTIVE_FLG,	
				[ENTRY_DT]=@ENTRY_DT,	
				[USER_CD]=@USER_CD,	
				[SESSION_ID]=@SESSION_ID,	
				[MOD_ID]=@MOD_ID,
				[SUB_MOD_ID]=@SUB_MOD_ID,	
				[ACT_FLG]=ACT_FLG,	
				[MOD_DT]=@MOD_DT
				WHERE [HOS_CD]=@HOS_CD AND [DAY_CLINIC_CD]=@DAY_CLINIC_CD;
			END

	ELSE IF @QueryType = 'Delete'
		BEGIN
		DELETE FROM [dbo].[DAY_DLY_RST]
			WHERE [HOS_CD]=@HOS_CD AND [DAY_CLINIC_CD]=@DAY_CLINIC_CD;
	END
END