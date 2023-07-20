SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Meghna Hazari
-- Create date: 18 July 2023
-- Description:	Insert/Update and Delete for DAY_SERV_MAP
-- =============================================
CREATE PROCEDURE DAY_SERV_MAP 
		@HOS_CD nvarchar(10) ,
		@DAY_CLINIC_CD nvarchar(10),    	          
		@SERV_TYP_CD nvarchar(5),     	            
		@SERV_CD nvarchar(7),     	            
		@SUN_AVL_FLG char(1)='N',    	
		@MON_AVL_FLG char(1)='N',   
		@TUE_AVL_FLG char(1)='N',    	
		@WED_AVL_FLG char(1)='N',    	
		@THU_AVL_FLG char(1)='N',    	
		@FRI_AVL_FLG char(1)='N',   	
		@SAT_AVL_FLG char(1)='N',    	
		@SUN_FR_TM nvarchar(5),
		@SUN_TO_TM nvarchar(5), 
		@MON_FR_TM nvarchar(5), 
		@MON_TO_TM nvarchar(5), 
		@TUE_FR_TM nvarchar(5),
		@TUE_TO_TM nvarchar(5),
		@WED_FR_TM nvarchar(5),
		@WED_TO_TM nvarchar(5),     	               	      
		@THU_FR_TM nvarchar(5),     	               	     
		@THU_TO_TM nvarchar(5),     	               	     
		@FRI_FR_TM nvarchar(5),     	               	      
		@FRI_TO_TM nvarchar(5),     	               	      
		@SAT_FR_TM nvarchar(5),     	               	     
		@SAT_TO_TM nvarchar(5),    	               	     
		@SUN_SERV_MAX_NO Numeric(9)= 0,
		@MON_SERV_MAX_NO Numeric(9)= 0,	
		@TUE_SERV_MAX_NO Numeric(9)= 0,	
		@WED_SERV_MAX_NO Numeric(9)= 0,	
		@THU_SERV_MAX_NO Numeric(9)= 0,	
		@FRI_SERV_MAX_NO Numeric(9)= 0,	
		@SAT_SERV_MAX_NO Numeric(9)= 0,	
		@ENTRY_DT Date ='1/1/1990',
		@USER_CD nvarchar(10) ,
		@SESSION_ID Numeric(9),	
		@MOD_ID Date='1/1/1990',
		@SUB_MOD_ID nvarchar(3),
		@ACT_FLG char(1)='A',
		@MOD_DT Date='1/1/1990', 
		@QueryType nvarchar(10) = 'Insert'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @QueryType = 'Insert'
	   BEGIN 
		INSERT INTO [dbo].[DAY_SERV_MAP]
	   ([HOS_CD],
		[DAY_CLINIC_CD],    	          
		[SERV_TYP_CD],     	            
		[SERV_CD],     	            
		[SUN_AVL_FLG],    	
		[MON_AVL_FLG],   
		[TUE_AVL_FLG],    	
		[WED_AVL_FLG],    	
		[THU_AVL_FLG],    	
		[FRI_AVL_FLG],   	
		[SAT_AVL_FLG],    	
		[SUN_FR_TM],
		[SUN_TO_TM], 
		[MON_FR_TM], 
		[MON_TO_TM], 
		[TUE_FR_TM],
		[TUE_TO_TM],
		[WED_FR_TM],
		[WED_TO_TM],     	               	      
		[THU_FR_TM],     	               	     
		[THU_TO_TM],     	               	     
		[FRI_FR_TM],     	               	      
		[FRI_TO_TM],     	               	      
		[SAT_FR_TM],     	               	     
		[SAT_TO_TM],    	               	     
		[SUN_SERV_MAX_NO],
		[MON_SERV_MAX_NO],	
		[TUE_SERV_MAX_NO],	
		[WED_SERV_MAX_NO],	
		[THU_SERV_MAX_NO],	
		[FRI_SERV_MAX_NO],	
		[SAT_SERV_MAX_NO],	
		[ENTRY_DT],
		[USER_CD],
		[SESSION_ID],	
		[MOD_ID],
		[SUB_MOD_ID],
		[ACT_FLG],
		[MOD_DT]
	   )

	   VALUES
		   (@HOS_CD,
			@DAY_CLINIC_CD,    	          
			@SERV_TYP_CD,     	            
			@SERV_CD,     	            
			@SUN_AVL_FLG,    	
			@MON_AVL_FLG,   
			@TUE_AVL_FLG,    	
			@WED_AVL_FLG,    	
			@THU_AVL_FLG,    	
			@FRI_AVL_FLG,   	
			@SAT_AVL_FLG,    	
			@SUN_FR_TM,
			@SUN_TO_TM, 
			@MON_FR_TM, 
			@MON_TO_TM, 
			@TUE_FR_TM,
			@TUE_TO_TM,
			@WED_FR_TM,
			@WED_TO_TM,     	               	      
			@THU_FR_TM,     	               	     
			@THU_TO_TM,     	               	     
			@FRI_FR_TM,     	               	      
			@FRI_TO_TM,     	               	      
			@SAT_FR_TM,     	               	     
			@SAT_TO_TM,    	               	     
			@SUN_SERV_MAX_NO,
			@MON_SERV_MAX_NO,	
			@TUE_SERV_MAX_NO,	
			@WED_SERV_MAX_NO,	
			@THU_SERV_MAX_NO,	
			@FRI_SERV_MAX_NO,	
			@SAT_SERV_MAX_NO,	
			@ENTRY_DT,
			@USER_CD,
			@SESSION_ID,	
			@MOD_ID,
			@SUB_MOD_ID,
			@ACT_FLG,
			@MOD_DT
			)
		END
ELSE IF @QueryType = 'Update'
	BEGIN
		UPDATE [dbo].[DAY_SERV_MAP]
		SET [SERV_TYP_CD] = @SERV_TYP_CD, 
			[SERV_CD] = @SERV_CD, 
			[SUN_AVL_FLG] = @SUN_AVL_FLG, 
			[MON_AVL_FLG] = @MON_AVL_FLG, 
			[TUE_AVL_FLG] = @TUE_AVL_FLG, 
			[WED_AVL_FLG] = @WED_AVL_FLG, 
			[THU_AVL_FLG] = @THU_AVL_FLG, 
			[FRI_AVL_FLG] = @FRI_AVL_FLG, 
			[SAT_AVL_FLG] = @SAT_AVL_FLG, 
			[SUN_FR_TM] = @SUN_FR_TM, 
			[SUN_TO_TM] = @SUN_TO_TM, 
			[MON_FR_TM] = @MON_FR_TM, 
			[MON_TO_TM] = @MON_TO_TM, 
			[TUE_FR_TM] = @TUE_FR_TM, 
			[TUE_TO_TM] = @TUE_TO_TM, 
			[WED_FR_TM] = @WED_FR_TM, 
			[WED_TO_TM] = @WED_TO_TM, 
			[THU_FR_TM] = @THU_FR_TM, 
			[THU_TO_TM] = @THU_TO_TM, 
			[FRI_FR_TM] = @FRI_FR_TM, 
			[FRI_TO_TM] = @FRI_TO_TM, 
			[SAT_FR_TM] = @SAT_FR_TM, 
			[SAT_TO_TM] = @SAT_TO_TM, 
			[SUN_SERV_MAX_NO] = @SUN_SERV_MAX_NO, 
			[MON_SERV_MAX_NO] = @MON_SERV_MAX_NO, 
			[TUE_SERV_MAX_NO] = @TUE_SERV_MAX_NO, 
			[WED_SERV_MAX_NO] = @WED_SERV_MAX_NO, 
			[THU_SERV_MAX_NO] = @THU_SERV_MAX_NO, 
			[FRI_SERV_MAX_NO] = @FRI_SERV_MAX_NO, 
			[SAT_SERV_MAX_NO] = @SAT_SERV_MAX_NO, 
			[ENTRY_DT] = @ENTRY_DT, 
			[USER_CD] = @USER_CD, 
			[SESSION_ID] = @SESSION_ID, 
			[MOD_ID] = @MOD_ID, 
			[SUB_MOD_ID] = @SUB_MOD_ID, 
			[ACT_FLG] = @ACT_FLG, 
			[MOD_DT] = @MOD_DT
	 WHERE [HOS_CD] = @HOS_CD AND [DAY_CLINIC_CD] = @DAY_CLINIC_CD
	 END
ELSE @QueryType = 'Delete'
	 BEGIN
		DELETE FROM [dbo].[DAY_SERV_MAP]
		WHERE [HOS_CD] = @HOS_CD AND [DAY_CLINIC_CD] = @DAY_CLINIC_CD
	END
END
