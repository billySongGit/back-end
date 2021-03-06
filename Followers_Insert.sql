USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_Insert_V2]    Script Date: 6/9/2017 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*		TEST CODE

DECLARE @ProfileUID nvarchar(250) = '41f24210-a7af-4c33-b740-70b9e4dbe8fe'
DECLARE @FollowerId nvarchar(128) = '001452f3-04bc-475b-82dd-63eb369ce34a'

INSERT INTO [dbo].[Followers]
		([FollowerID]
		,[ProfileUID]
		, [Latitude]
		, [Longitude])
	VALUES
		(@FollowerId
		, @ProfileUID
		, @Latitude
		, @Longitude)

END
*/

ALTER Proc [dbo].[Followers_Insert_V2] 
@FollowerID nvarchar(128),
@ProfileUID nvarchar(128),
@Latitude decimal(9, 6) = null,
@Longitude decimal(9, 6) = null
AS
BEGIN

INSERT INTO [dbo].[Followers]
		([FollowerID]
		,[ProfileUID]
		, [Latitude]
		, [Longitude])
	VALUES
		(@FollowerID
		,@ProfileUID
		, @Latitude
		, @Longitude)

END