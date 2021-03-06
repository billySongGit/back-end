USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectById]    Script Date: 6/9/2017 11:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Accounts_SelectById]
		@UserId nvarchar(128) = null
AS

/*					TEST CODE 

SELECT *
FROM dbo.People
WHERE CreatedBy = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

SELECT *
FROM dbo.Profile
WHERE CreatedBy = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

SELECT *
FROM dbo.Accounts
WHERE UserId = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

SELECT *
FROM dbo.AspNetUsers
WHERE Email = 'dub@mailinator.com'

SELECT *
FROM dbo.Accounts

DECLARE @UserID nvarchar(128) = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c'

EXECUTE dbo.Accounts_SelectById
		@UserId


*/


BEGIN

SELECT [UserId]
      ,[AvatarUrl]
      ,[Handle]
      ,[FirstName]
      ,[MiddleInitial]
      ,[LastName]
      ,[GenderId]
      ,[DOB]
	  ,[Highlight]
	  ,[Bio]
	  ,[AccountModifier]
	  ,[BackgroundPicture]
	  ,[VideoUrl]

FROM [dbo].[Accounts] AS AC
	LEFT JOIN [dbo].AspNetUsers AS A
		ON AC.UserId = A.Id
	WHERE A.Id = @UserId
END


