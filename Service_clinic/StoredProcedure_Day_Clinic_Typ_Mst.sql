CREATE PROCEDURE [dbo].[Day_Clinic_Typ_Mst_Modify]
	(@DAY_CLINIC_TYP_CD nvarchar,
  @DAY_CLINIC_TYP_DESC nvarchar,
  @ACT_FLG char = 'A' 	
  @MOD_DT date = '1/1/1999',
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
