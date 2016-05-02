USE [s16guest58]
GO

/****** Object:  StoredProcedure [dbo].[update_version_number]    Script Date: 5/2/2016 4:07:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Luke Westlake
-- Create date: 5/1/2016
-- Description:	This procedure checks if the specified version of a product exists
-- and, if it does, updates the version number to the new one passed in.
-- =============================================
CREATE PROCEDURE [dbo].[update_version_number]
	-- Add the parameters for the stored procedure here
	@product_name varchar(50), 
	@version_number varchar(5),
	@new_version_number varchar(5) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @this_product_id smallint
	DECLARE @this_version_id int

	-- Check if product exists and get the ID if it does
	SELECT @this_product_id=product_id FROM product WHERE product_name = @product_name;
	IF (@@ROWCOUNT < 1)
	BEGIN
		PRINT 'Product does not exist.'
		RETURN
	END

	-- Check if version exists and get the ID if it does
	SELECT @this_version_id=version_id FROM version WHERE product_id = @this_product_id AND version_number = @version_number;
	IF (@@ROWCOUNT < 1)
	BEGIN
		PRINT 'Version does not exist.'
		RETURN
	END

	-- Update version_number column with the new value
	UPDATE version
	SET version_number = @new_version_number
	WHERE product_id = @this_product_id AND version_id = @this_version_id;

END

GO

