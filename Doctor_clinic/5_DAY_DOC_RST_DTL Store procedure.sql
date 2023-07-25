CREATE PROCEDURE DAY_DOC_RST
	(@HOS_CD nvarchar,	
	@DAY_CLINIC_CD nvarchar,	
	@RST_NO nvarchar,	
	@DOC_CD nvarchar,	
	@QUE_NO nvarchar,	
	@FROM_TM nvarchar,	
	@TO_TM nvarchar,	
	@BOOK_FLG char ='N',	
	@DAY_BOOK_SL_NO nvarchar,	
	@SRL_NO int,	
	@ACTIVE_FLG char='Y',	
	@ENTRY_DT Date ='1/1/1990',	
	@USER_CD nvarchar,	
	@SESSION_ID int,
	@ACT_FLG char='A',	                                                                      
	@MOD_DT Date= '1/1/1990',
	@QueryType nvarchar= 'Insert')
	AS
	BEGIN
		SET NOCOUNT ON;
		IF @QueryType = 'Insert'
		BEGIN 
		INSERT INTO [dbo].[DAY_DOC_RST_DTL]
			([HOS_CD],	
			[DAY_CLINIC_CD],	
			[RST_NO],	
			[DOC_CD],	
			[QUE_NO],	
			[FROM_TM],	
			[TO_TM],	
			[BOOK_FLG],	
			[DAY_BOOK_SL_NO],	
			[SRL_NO],	
			[ACTIVE_FLG],	
			[ENTRY_DT],	
			[USER_CD],	
			[SESSION_ID],
			[ACT_FLG],	                                                                      
			[MOD_DT])
		VALUES
		   (@HOS_CD,	
			@DAY_CLINIC_CD,	
			@RST_NO,	
			@DOC_CD,	
			@QUE_NO,	
			@FROM_TM,	
			@TO_TM,	
			@BOOK_FLG,	
			@DAY_BOOK_SL_NO,	
			@SRL_NO,	
			@ACTIVE_FLG,	
			@ENTRY_DT,	
			@USER_CD,	
			@SESSION_ID,
			@ACT_FLG,	                                                                      
			@MOD_DT);
	  IF @@ROWCOUNT = 1
		RETURN 1;
	  ELSE
		RETURN 0;
	END

	ELSE IF @QueryType = 'Update'
		BEGIN 
			UPDATE DAY_DOC_RST_DTL
				SET 
				[DAY_CLINIC_CD] = @DAY_CLINIC_CD,
				[RST_NO] = @RST_NO,
				[QUE_NO] = @QUE_NO,
				[FROM_TM] = @FROM_TM,
				[TO_TM] = @TO_TM,
				[BOOK_FLG] = @BOOK_FLG,
				[DAY_BOOK_SL_NO] = @DAY_BOOK_SL_NO,
				[SRL_NO] = @SRL_NO,
				[ACTIVE_FLG] = @ACTIVE_FLG,
				[ENTRY_DT] = @ENTRY_DT,
				[USER_CD] = @USER_CD,
				[SESSION_ID] = @SESSION_ID,
				[ACT_FLG] = @ACT_FLG,
				[MOD_DT] = @MOD_DT
				WHERE [HOS_CD] = @HOS_CD AND [DOC_CD] = @DOC_CD;
			END

	ELSE IF @QueryType = 'Delete'
		BEGIN
		DELETE FROM [dbo].[DAY_DOC_RST_DTL]
		WHERE [HOS_CD] = @HOS_CD AND [DOC_CD] = @DOC_CD;
	END
END
