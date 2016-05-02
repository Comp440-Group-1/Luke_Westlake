USE [s16guest58]
GO

/****** Object:  StoredProcedure [dbo].[get_new_features]    Script Date: 5/2/2016 4:07:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Luke Westlake
-- Create date: 5/1/2016
-- Description:	This procedure prints to console the number of new features in a given customer release
-- and selects a table with the relevant information. To use this procedure one must specify the product
-- name, version number, and customer release number they are looking for.
-- =============================================
CREATE PROCEDURE [dbo].[get_new_features] 
	-- Add the parameters for the stored procedure here
	@product_name varchar(50), 
	@version_number varchar(5),
	@customer_release_number varchar(5) 
AS
BEGIN
    -- Insert statements for procedure here
	DECLARE @this_product_id smallint
	DECLARE @this_version_id int
	DECLARE @this_customer_release_id int
	DECLARE @number_of_new_features int
	
	SELECT @this_product_id=product_id FROM product WHERE product_name = @product_name;
	IF (@@ROWCOUNT < 1)
	BEGIN
		PRINT 'Product does not exist.'
		RETURN
	END

	SELECT @this_version_id=version_id FROM version WHERE product_id = @this_product_id AND version_number = @version_number;
	IF (@@ROWCOUNT < 1)
	BEGIN
		PRINT 'Version does not exist.'
		RETURN
	END

	SELECT @this_customer_release_id=customer_release_id FROM customer_release WHERE version_id = @this_version_id AND release_number = @customer_release_number
	IF (@@ROWCOUNT < 1)
	BEGIN
		PRINT 'Customer release does not exist.'
		RETURN
	END

	-- Get the total number of new features in this customer release
	SELECT @number_of_new_features = COUNT (*)
	FROM customer_release_feature_xref 
	WHERE customer_release_id = @this_customer_release_id AND customer_release_feature_xref.status_of_feature_id = 2
	-- A status_of_feature_id of 2 means the status_name is "new"

	IF(@number_of_new_features > 0)
	BEGIN
		PRINT 'There are '
			+cast(@number_of_new_features as varchar(4))
			+' new features in version '
			+@version_number
			+', release '
			+@customer_release_number
			+' of '
			+@product_name
			+'.';
	END
	ELSE
		PRINT 'Version '
			+@version_number
			+', release '
			+@customer_release_number
			+' of '
			+@product_name
			+' is a bug-fix release. There are no new features.';

	-- Select a table showing the id of the customer release, the new features' ids and names, and the status of those features
	SELECT customer_release_feature_xref.customer_release_id, feature.feature_id, feature.feature_name, status_of_feature.status_of_feature_id,
		status_of_feature.status_name
	FROM customer_release_feature_xref 
	INNER JOIN status_of_feature ON customer_release_feature_xref.status_of_feature_id = status_of_feature.status_of_feature_id
	INNER JOIN feature ON customer_release_feature_xref.feature_id = feature.feature_id
	WHERE customer_release_id = @this_customer_release_id AND customer_release_feature_xref.status_of_feature_id = 2 
END

GO

