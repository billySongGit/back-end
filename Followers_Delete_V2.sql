USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_Delete_V2]    Script Date: 6/9/2017 11:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Followers_Delete_V2]
				@FollowerID nvarchar(128)
				,@ProfileUID nvarchar(128)

AS

/*			TEST CODE

DECLARE @FollowerID nvarchar(128) = '18c5d19c-998a-4c5f-be05-1a3fa116d278'
		,@ProfileUID nvarchar(128) = '059b95e3-4533-464e-ac9e-0ae88ddade0b'

EXECUTE dbo.Followers_DeleteByHandle
		@FollowerID
		,@ProfileUID

SELECT *
FROM [dbo].[Followers]


*/

DELETE FROM [dbo].[Followers]
      WHERE ProfileUID = @ProfileUID
	  AND FollowerID = @FollowerID
