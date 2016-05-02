USE [s16guest58]
GO

/****** Object:  StoredProcedure [dbo].[product_request_report]    Script Date: 5/2/2016 4:07:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Luke Westlake
-- Create date: 5/1/2016
-- Description:	This procedure generates a report which shows the number of download requests for each
-- product version per month. 
-- =============================================
CREATE PROCEDURE [dbo].[product_request_report] 
	-- Add the parameters for the stored procedure here

AS
BEGIN

	SET NOCOUNT OFF

	-- Create new table which will show the report,
	CREATE TABLE #product_requests (product varchar(50), version varchar(5), month varchar(7), request_count int)

	-- Create a table which converts full dates from the download table to dates with year and month only.
	CREATE TABLE #year_month (download_id_ym int, date_requested_ym varchar(7))
	INSERT INTO #year_month(download_id_ym, date_requested_ym)
	SELECT  download_id, CONVERT(varchar(7), download.date_requested)
	FROM download

	INSERT INTO #product_requests(product, version, month, request_count)
	SELECT DISTINCT product.product_name, version.version_number, #year_month.date_requested_ym, COUNT(download_id)
	FROM download
	INNER JOIN #year_month
	ON download.download_id = #year_month.download_id_ym
	INNER JOIN customer_release
	ON download.customer_release_id = customer_release.customer_release_id
	INNER JOIN version
	ON customer_release.version_id = version.version_id
	INNER JOIN product
	ON version.product_id = product.product_id
	GROUP BY product_name, version_number, date_requested_ym;

	select * from #product_requests;

	DROP TABLE #product_requests
	DROP TABLE #year_month
	
END

GO

