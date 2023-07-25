USE [MASTER1]
GO
/****** Object:  StoredProcedure [dbo].[DAY_DOC_MAP ]    Script Date: 17-07-2023 16:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ANIRBAN
-- Create date: 14-07-2023
-- Description:	Insert/Update and Delete for DAY_DOC_MAP1 
-- =============================================
ALTER PROCEDURE  [dbo].[DAY_DOC_MAP ]

 @HOS_CD             nvarchar(10)     = NULL, -- Hospital Code
 @DAY_CLINIC_CD    nvarchar(10)     = NULL, -- Day Clinic Code
 @DOC_CD           nvarchar(10)     = NULL, -- Doctor Code
 @SUN_FLG          char(1)          = 'N', -- Sunday Flag (Yes/No)
 @MON_FLG          char(1)          = 'N', -- Monday Flag (Yes/No)
 @TUE_FLG          char(1)          = 'N', -- Tuesday Flag (Yes/No)
 @WED_FLG          char(1)          = 'N', -- Wednesday Flag (Yes/No)
 @THU_FLG          char(1)          = 'N', -- Thursday Flag (Yes/No)
 @FRI_FLG          char(1)          = 'N', -- Friday Flag (Yes/No)
 @SAT_FLG          char(1)          = 'N', -- Saturday Flag (Yes/No)
 @SUN_FR_TM        nvarchar(5)      = NULL, -- Sunday From Time
 @SUN_TO_TM        nvarchar(5)      = NULL, -- Sunday To Time
 @MON_FR_TM        nvarchar(5)      = NULL, -- Monday From Time
 @MON_TO_TM        nvarchar(5)      = NULL, -- Monday To Time
 @TUE_FR_TM        nvarchar(5)      = NULL, -- Tuesday From Time
 @TUE_TO_TM        nvarchar(5)      = NULL, -- Tuesday To Time
 @WED_FR_TM        nvarchar(5)      = NULL, -- Wednesday From Time
 @WED_TO_TM        nvarchar(5)      = NULL, -- Wednesday To Time
 @THU_FR_TM        nvarchar(5)      = NULL, -- Thursday From Time
 @THU_TO_TM        nvarchar(5)      = NULL, -- Thursday To Time
 @FRI_FR_TM        nvarchar(5)      = NULL, -- Friday From Time
 @FRI_TO_TM        nvarchar(5)      = NULL, -- Friday To Time
 @SAT_FR_TM        nvarchar(5)      = NULL, -- Saturday From Time
 @SAT_TO_TM        nvarchar(5)      = NULL, -- Saturday To Time
 @EFFECT_FROM      Date          ='1/1/1990', -- Effective From
 @EFFECT_TO        Date          ='1/1/1990',
 @APPX_REQ_TM      nvarchar(5)      = NULL, -- Approx. Required Time
 @ADV_DAY          Numeric(9)       = 0 , -- Advance Booking Allow Upto Days
 @ACTIVE_FLG       char(1)          = 'Y' , -- Active Flag (Yes/No)
 @ENTRY_DT         Date         ='1/1/1990', -- Entry Date
 @USER_CD          nvarchar(10)     = NULL, -- User Code
 @SESSION_ID       Numeric(9)       = 0 , -- Current User Session
 @ACT_FLG          char(1)          = 'A' , -- Active Flag (Active-"A",Inactive-"I", Delete-"D")
 @MOD_DT           Date             ='1/1/1990',
 @SESSION_ID_WEB   nvarchar(30),-- Session ID for Web Development
 @QueeryType     nvarchar(10)    ='INSERT'   

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @QueeryType ='INSERT'
		BEGIN
			INSERT INTO [dbo].[DAY_DOC_MAP ]
				([HOS_CD],    
	[DAY_CLINIC_CD],
	[DOC_CD],        
	[SUN_FLG],        
	 [MON_FLG],         
	 [TUE_FLG], 
	 [WED_FLG],  
	 [THU_FLG],   
	 [FRI_FLG],    
	 [SAT_FLG],     
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
	 [EFFECT_FROM],
	 [EFFECT_TO],
	 [APPX_REQ_TM],
	 [ADV_DAY],
	 [ACTIVE_FLG],
	 [ENTRY_DT],
	 [USER_CD], 
	 [SESSION_ID],
	 [ACT_FLG], 
	 [MOD_DT],
	 [SESSION_ID_WEB])

		VALUES
			( @HOS_CD,       
			 @DAY_CLINIC_CD,  
			 @DOC_CD,          
			 @SUN_FLG,          
			 @MON_FLG,          
			 @TUE_FLG,   
			 @WED_FLG,    
			 @THU_FLG,     
			 @FRI_FLG,      
			 @SAT_FLG,       
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
			 @EFFECT_FROM,  
			 @EFFECT_TO,     
			 @APPX_REQ_TM,  
			 @ADV_DAY,
			 @ACTIVE_FLG, 
			 @ENTRY_DT,
			 @USER_CD,   
			 @SESSION_ID,
			 @ACT_FLG,  
			 @MOD_DT,
			 @SESSION_ID_WEB)
END
END
