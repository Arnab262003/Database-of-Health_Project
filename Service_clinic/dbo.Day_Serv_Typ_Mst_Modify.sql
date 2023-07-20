CREATE PROCEDURE [dbo].[Day_Serv_Typ_Mst_Modify]
	(@SERV_TYP_CD nvarchar,	
	@SERV_TYP_DESC nvarchar,	
	@ACTIVE_FLG char = 'Y',	
	@USER_CD nvarchar,	
	@ENTRY_DT date = '1/1/1999' ,	
	@SESSION_ID Numeric,	
	@MOD_ID nvarchar,	
	@SUB_MOD_ID nvarchar,	
	@ACT_FLG char = 'A',	
	@MOD_DT date = '1/1/1999',	
	@SESSION_ID_WEB nvarchar,
	@QueryType nvarchar(10) = 'Insert')
	AS
	BEGIN
		SET NOCOUNT ON;
		IF @QueryType = 'Insert'
		BEGIN 
		INSERT INTO [dbo].[DAY_SERV_TYP_MST]
			([SERV_TYP_CD], 
			[SERV_TYP_DESC], 
			[ACTIVE_FLG],
			[USER_CD],
			[ENTRY_DT],
			[SESSION_ID],
			[MOD_ID],
			[SUB_MOD_ID],
			[ACT_FLG],
			[MOD_DT],
			[SESSION_ID_WEB]
			)
		VALUES
		  ( @SERV_TYP_CD,	
			@SERV_TYP_DESC,	
			@ACTIVE_FLG,	
			@USER_CD,	
			@ENTRY_DT ,	
			@SESSION_ID ,	
			@MOD_ID,	
			@SUB_MOD_ID,	
			@ACT_FLG,	
			@MOD_DT,	
			@SESSION_ID_WEB 
		  );
	  IF @@ROWCOUNT = 1
		RETURN 1;
	  ELSE
		RETURN 0;
	END

	ELSE IF @QueryType = 'Update'
		BEGIN 
			UPDATE DAY_SERV_TYP_MST
				SET 
				[SERV_TYP_DESC]= @SERV_TYP_DESC,
				[ACTIVE_FLG] = @ACTIVE_FLG,
				[USER_CD] = @USER_CD,
				[ENTRY_DT]= @ENTRY_DT,
				[SESSION_ID]= @SESSION_ID,
				[MOD_ID]= @MOD_ID,
				[SUB_MOD_ID]= @SUB_MOD_ID,
				[ACT_FLG]= @ACT_FLG,
				[MOD_DT]= @MOD_DT,
				[SESSION_ID_WEB]= @SESSION_ID_WEB
				WHERE [SERV_TYP_CD] = @SERV_TYP_CD AND [USER_CD] = @USER_CD;
			END

	ELSE IF @QueryType = 'Delete'
		BEGIN
		DELETE FROM [dbo].[DAY_SERV_TYP_MST]
			WHERE [SERV_TYP_CD] = @SERV_TYP_CD AND [USER_CD] = @USER_CD;
	END
END