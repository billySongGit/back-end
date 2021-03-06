USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_SelectByNotHidden_Pagination]    Script Date: 6/9/2017 11:57:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Followers_SelectByNotHidden_Pagination] 
			@Handle nvarchar(250)
			, @PageSize int
			, @PageIndex int
			
AS

/*			TEST CODE  this is for getting all of the followers of a profile
SELECT*
FROM dbo.Accounts

SELECT * 
FROM dbo.AspNetUsers

DECLARE @Handle nvarchar(250) = 'c_hart'
		,@PageSize int = 50
		,@PageIndex int = 0
	

EXECUTE dbo.Followers_SelectByNotHidden_Pagination
		@Handle
		,@PageSize
		,@PageIndex
		

SELECT *
FROM dbo.Followers
WHERE ProfileUID = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

SELECT * FROM Accounts where UserId='f51de1df-52c9-4a7c-b4be-1efb9970c91c'

*/

Begin

	Declare @offset int = @PageIndex * @PageSize;
	DECLARE @HandleUserId nvarchar(128) 
			,@TimeStamp datetime2(7)
	SELECT	@HandleUserID = AC.userId
	FROM	dbo.[Accounts] as AC
	WHERE	AC.Handle = @Handle	


	SELECT DISTINCT F.[FollowerID]
		  ,F.[ProfileUID]
		  ,F.[Latitude]
		  ,F.[Longitude]
		  ,AC.[UserId]
		  ,AC.[Handle]
		  ,AC.[FirstName]
		  ,AC.[LastName]
		  ,AC.[AvatarUrl]
		  --,AcSe.[SettingId]
		  --,SE.[Id]
		  --,AcSe.[Value]
		  ,F.[TimeStamp]
		  ,[TotalCount] = COUNT(1) OVER()

	FROM [dbo].[Followers] as F
		INNER JOIN [dbo].[AspNetUsers] AS A
			ON F.FollowerID = A.Id
		INNER JOIN [dbo].[Accounts] AS AC
			ON A.Id = AC.UserId
		
		
	WHERE NOT EXISTS (
				SELECT 1 
				FROM [dbo].[AccountSettings] as Ac
				WHERE Ac.[Value] = 0 AND Ac.[SettingId] = 1 AND Ac.UserId = F.FollowerID
				)		
		AND F.ProfileUID =  @HandleUserId	
	ORDER BY AC.Handle

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS ONLY
		
END			