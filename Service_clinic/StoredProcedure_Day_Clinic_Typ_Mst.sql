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
-- Author:		Sayantani Dey
-- Create date: 15-07-2023
-- Description:	To insert, update, delete an entry from DAY_CLINIC_TYP_MST
-- =============================================
CREATE PROCEDURE [dbo].[Day_Clinic_Typ_Mst_Modify]
	(@DAY_CLINIC_TYP_CD nvarchar(5),
	  @DAY_CLINIC_TYP_DESC nvarchar(100),
	  @ACT_FLG char(1) = 'A' ,	
	  @MOD_DT Date,
	  @QueryType nvarchar(10) = 'Insert')
	AS
	BEGIN
		SET NOCOUNT ON;
		IF @QueryType = 'Insert'
		BEGIN 
		INSERT INTO [dbo].[DAY_CLINIC_TYP_MST]
			([DAY_CLINIC_TYP_CD], 
			[DAY_CLINIC_TYP_DESC], 
			[ACT_FLG],
			[MOD_DT]
			)
		VALUES
		  ( @DAY_CLINIC_TYP_CD, 
			@DAY_CLINIC_TYP_DESC, 
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
			UPDATE DAY_CLINIC_TYP_MST
				SET 
				[DAY_CLINIC_TYP_DESC] = @DAY_CLINIC_TYP_DESC,
				[ACT_FLG] = @ACT_FLG,
				[MOD_DT] = @MOD_DT
				WHERE [DAY_CLINIC_TYP_CD] = @DAY_CLINIC_TYP_CD;
			END

	ELSE IF @QueryType = 'Delete'
		BEGIN
		DELETE FROM [dbo].[DAY_CLINIC_TYP_MST]
			WHERE [DAY_CLINIC_TYP_CD] = @DAY_CLINIC_TYP_CD;
	END
END
