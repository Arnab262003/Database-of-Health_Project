CREATE PROCEDURE [dbo].[Day_Doc_Spl_Modify]
	(@SPL_CD nvarchar, 
	@SPL_DESC nvarchar, 
	@ACTIVE_FLG char = 'Y',
	@ENTRY_DT date = '1/1/1999',
	@USER_CD nvarchar,
	@SESSION_ID int,
	@ACT_FLG char = 'A',
	@MOD_DT date = '1/1/1999',
	@SESSION_ID_WEB nvarchar,
	@QueryType nvarchar(10) = 'Insert')
	AS
	BEGIN
		SET NOCOUNT ON;
		IF @QueryType = 'Insert'
		BEGIN 
		INSERT INTO [dbo].[DAY_DOC_SPL]
			([SPL_CD], 
			[SPL_DESC], 
			[ACTIVE_FLG],
			[ENTRY_DT],
			[USER_CD],
			[SESSION_ID],
			[ACT_FLG],
			[MOD_DT],
			[SESSION_ID_WEB]
			)
		VALUES
		  ( @SPL_CD, 
			@SPL_DESC, 
			@ACTIVE_FLG,
			@ENTRY_DT,
			@USER_CD,
			@SESSION_ID,
			@ACT_FLG ,
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
			UPDATE DAY_DOC_SPL
				SET 
				[SPL_DESC] = @SPL_DESC, 
				[ACTIVE_FLG] = @ACTIVE_FLG,
				[ENTRY_DT] = @ENTRY_DT,
				[USER_CD] = @USER_CD,
				[SESSION_ID] = @SESSION_ID,
				[ACT_FLG] = @ACT_FLG,
				[MOD_DT] = @MOD_DT, 
				[SESSION_ID_WEB] = @SESSION_ID_WEB
				WHERE [SPL_CD] = @SPL_CD;
			END

	ELSE IF @QueryType = 'Delete'
		BEGIN
		DELETE FROM [dbo].[DAY_DOC_SPL]
			WHERE [SPL_CD] = @SPL_CD;
	END
END