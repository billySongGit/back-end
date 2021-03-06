USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_SelectByPUID]    Script Date: 6/9/2017 11:57:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Followers_SelectByPUID]
			@ProfileUID nvarchar(128)

AS

/*			TEST CODE  this is for getting all of the followers of a profile
SELECT *
FROM dbo.People

SELECT *
FROM dbo.Profile

SELECT * 
FROM dbo.AspNetUsers

DECLARE @ProfileUID nvarchar(128) = '059b95e3-4533-464e-ac9e-0ae88ddade0b'

EXECUTE dbo.[Followers_SelectByPUID]
		@ProfileUID

SELECT *
FROM dbo.Followers
WHERE ProfileUID = @ProfileUid

*/

BEGIN


SELECT F.[FollowerID]
	  ,F.[ProfileUID]
	  ,PE.[FirstName]
	  ,PE.[LastName]
	  ,PR.[AvatarUrl]


FROM [dbo].[Followers] AS F
	INNER JOIN [dbo].[AspNetUsers] AS A
	ON F.ProfileUID = A.Id
	INNER JOIN [dbo].[Profile] AS PR
	ON A.Id = PR.CreatedBy
	INNER JOIN [dbo].[People] AS PE
	ON A.Id = PE.CreatedBy
	WHERE A.ID = @ProfileUID

  


END


