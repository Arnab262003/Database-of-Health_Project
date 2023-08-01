CREATE PROCEDURE DAY_DOC_MSTT
	(@HOS_CD varchar,	
		@DOC_CD varchar,	
		@DOC_NM varchar,	
		@ADDRESS varchar,
		@SEX char='M', 
		@SPL_CD varchar,
		@RES_PH varchar,	
		@CHAMBER_PH varchar,	
		@MOBILE_NO varchar,
		@EMAIL_ID varchar,
		@REGI_NO varchar,
		@GRADE_FLG char='S',	
		@HOS_DOC_FLG char='N',
		@REF_DOC_CD varchar,
		@ACTIVE_FLG char='Y',	
		@REMARKS varchar,	
		@PRL_EMP_CD varchar,
		@ENTRY_DT Date,	
		@USER_CD varchar,	
		@SESSION_ID int,	
		@ACT_FLG char='A',	                                                                      
		@MOD_DT Date,     	               	          	
		@SESSION_ID_WEB varchar,
		@QueryType nvarchar(10) = 'Insert')
	AS
	BEGIN
		SET NOCOUNT ON;
		IF @QueryType = 'Insert'
		BEGIN 
		INSERT INTO [dbo].[DAY_DOC_MST]
			 ([HOS_CD] ,	
					[DOC_CD],	
					[DOC_NM],	
					[ADDRESS],	
					[SEX],	
					[SPL_CD],	
					[RES_PH],	
					[CHAMBER_PH],	
					[MOBILE_NO],	
					[EMAIL_ID],	
					[REGI_NO],	
					[GRADE_FLG],	
					[HOS_DOC_FLG],	
					[REF_DOC_CD],	
					[ACTIVE_FLG],	
					[REMARKS],	
					[PRL_EMP_CD],	
					[ENTRY_DT],	
					[USER_CD],	
					[SESSION_ID],	
					[ACT_FLG],	                                                                      
					[MOD_DT],	
					[SESSION_ID_WEB])
			VALUES
			   ( @HOS_CD,	
				@DOC_CD ,	
				@DOC_NM,	
				@ADDRESS,	
				@SEX,	
				@SPL_CD,	
				@RES_PH ,	
				@CHAMBER_PH,	
				@MOBILE_NO,	
				@EMAIL_ID,	
				@REGI_NO,	
				@GRADE_FLG,	
				@HOS_DOC_FLG,	
				@REF_DOC_CD,	
				@ACTIVE_FLG,	
				@REMARKS,	
				@PRL_EMP_CD,	
				@ENTRY_DT,	
				@USER_CD,	
				@SESSION_ID,	
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
				UPDATE DAY_DOC_MST
				SET [DOC_NM] = @DOC_NM,
					[ADDRESS] = @ADDRESS,
					[SEX] = @SEX,
					[SPL_CD] = @SPL_CD,
					[RES_PH] = @RES_PH,
					[CHAMBER_PH] = @CHAMBER_PH,
					[MOBILE_NO] = @MOBILE_NO,
					[EMAIL_ID] = @EMAIL_ID,
					[REGI_NO] = @REGI_NO,
					[GRADE_FLG] = @GRADE_FLG,
					[HOS_DOC_FLG] = @HOS_DOC_FLG,
					[REF_DOC_CD] = @REF_DOC_CD,
					[ACTIVE_FLG] = @ACTIVE_FLG,
					[REMARKS] = @REMARKS,
					[PRL_EMP_CD] = @PRL_EMP_CD,
					[ENTRY_DT] = @ENTRY_DT,
					[USER_CD] = @USER_CD,
					[SESSION_ID] = @SESSION_ID,
					[ACT_FLG] = @ACT_FLG,
					[MOD_DT] = @MOD_DT,
					[SESSION_ID_WEB] = @SESSION_ID_WEB
				WHERE [HOS_CD] = @HOS_CD AND [DOC_CD] = @DOC_CD;
			END

			

	ELSE IF @QueryType = 'Delete'
		BEGIN
		DELETE FROM [dbo].[DAY_DOC_MST]
			WHERE [HOS_CD] = @HOS_CD AND [DOC_CD] = @DOC_CD;
	END
END