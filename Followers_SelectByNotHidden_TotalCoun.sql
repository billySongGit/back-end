USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_SelectByNotHidden_TotalCount]    Script Date: 6/9/2017 11:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Followers_SelectByNotHidden_TotalCount] 
			@UserId nvarchar(128)

			
AS

/*			TEST CODE  this is for getting all of the followers of a profile
SELECT*
FROM dbo.Accounts

SELECT * 
FROM dbo.AspNetUsers

DECLARE @UserID nvarchar(128) = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

EXECUTE dbo.Followers_SelectByNotHidden_TotalCount
		@UserId

		

SELECT *
FROM dbo.Followers
WHERE ProfileUID = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

SELECT * FROM Accounts where UserId='f51de1df-52c9-4a7c-b4be-1efb9970c91c'

*/

Begin


	SELECT DISTINCT 
		  [TotalCount] = COUNT(1) OVER()

	FROM [dbo].[Followers] as F
		INNER JOIN [dbo].[AspNetUsers] AS A
			ON F.FollowerID = A.Id
		INNER JOIN [dbo].[Accounts] AS AC
			ON A.Id = AC.UserId
		
		
	WHERE 
	 F.ProfileUID = @UserId
	 AND NOT EXISTS (
			SELECT 1 
			FROM [dbo].[AccountSettings] as Ac
			WHERE Ac.[Value] = 0 AND Ac.[SettingId] = 1 AND Ac.UserId = F.FollowerID			
			)

END			