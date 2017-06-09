USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UpdateAvatarUrl]    Script Date: 6/9/2017 11:48:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_UpdateAvatarUrl]
			  @UserId nvarchar(128)
			, @AvatarUrl varchar(200)

AS
/*							TEST CODE 



DECLARE		 @UserId nvarchar(128) = '001452f3-04bc-475b-82dd-63eb369ce34a'
			, @AvatarUrl varchar(200) = 'https://www.crossref.org/images/staff/blank-profile-picture.png'

Select *
FROM dbo.Accounts
Where UserId = @UserId

EXECUTE dbo.Accounts_UpdateAvatarUrl
			 @UserId
			, @AvatarUrl


SELECT *
FROM dbo.Accounts
Where UserId = @UserId



SELECT *
FROM dbo.Accounts
Where Handle = 'yeg123'
WHERE UserId = '4ee5c29b-1398-4b81-8731-b5240b001fbe'


*/

BEGIN

UPDATE [dbo].[Accounts]
   SET [UserId] = @UserId
      ,[AvatarUrl] = @AvatarUrl
 WHERE UserId = @UserId
END


