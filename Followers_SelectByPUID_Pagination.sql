USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_SelectByPUID_Pagination_V3]    Script Date: 6/9/2017 11:57:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Followers_SelectByPUID_Pagination_V3]
			@UserId nvarchar(128)
			, @PageSize int
			, @PageIndex int

AS

/*			TEST CODE  this is for getting all of the followers of a profile
SELECT*
FROM dbo.Accounts

SELECT * 
FROM dbo.AspNetUsers

DECLARE @PageSize int = 50
		,@PageIndex int = 0
		,@UserID nvarchar(128) = '059b95e3-4533-464e-ac9e-0ae88ddade0b'

EXECUTE dbo.Followers_SelectByPuid_Pagination_V3
		@UserId
		,@PageSize
		,@PageIndex
		

SELECT *
FROM dbo.Followers
WHERE ProfileUID = @ProfileUid

SELECT * FROM Accounts where UserId='02d0fffc-593c-4090-a23f-9aa1467fd85a'


*/

BEGIN
	
	Declare @offset int = @PageIndex * @PageSize;

	SELECT DISTINCT F.[FollowerID]
		  ,F.[ProfileUID]
		  ,F.[Latitude]
		  ,F.[Longitude]
		  ,AC.[UserId]
		  ,AC.[Handle]
		  ,AC.[FirstName]
		  ,AC.[LastName]
		  ,AC.[AvatarUrl]
		  ,F.[TimeStamp]
		  ,[TotalCount] = COUNT(1) OVER()
	FROM [dbo].[Followers] AS F 
		inner join [dbo].[AspNetUsers] AS A
			ON F.FollowerID = A.Id
		inner join [dbo].[Accounts] AS AC
			ON A.Id = AC.UserId


	WHERE f.ProfileUID = @UserId
	ORDER BY LastName
	
	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY
  


END


