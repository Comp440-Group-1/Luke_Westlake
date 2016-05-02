USE [s16guest58]
GO

/****** Object:  StoredProcedure [dbo].[insert_phone_number]    Script Date: 5/2/2016 4:07:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Luke Westlake
-- Create date: 5/1/2016
-- Description:	This procedure inserts a number into the phone_number table if a phone number and its type are both valid.
-- Only allows numbers in the form '##########'.
-- =============================================
CREATE PROCEDURE [dbo].[insert_phone_number] 
	-- Add the parameters for the stored procedure here
	-- Must use char(11) for the number parameter in order to check if the input was actually more than 10 characters
	@number char(11), 
	@type varchar(10) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF((@type = 'home' OR @type = 'work' OR @type = 'cell' OR @type = 'mobile') AND ISNUMERIC(@number) = 1 AND LEN(@number) = 10 AND @number NOT LIKE '%-%')
	BEGIN
		
		DECLARE @type_id smallint

		IF(@type = 'home')
			SET @type_id = 1;

		IF(@type = 'work')
			SET @type_id = 2;

		IF(@type = 'cell' OR @type = 'mobile')
			SET @type_id = 3;

			INSERT INTO phone_number(number, phone_type_id)
			VALUES (@number, @type_id);

	END
	ELSE
		PRINT 'Invalid input.';
END

GO

