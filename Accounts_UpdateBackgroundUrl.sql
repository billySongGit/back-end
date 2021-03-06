USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UpdateBackgroundUrl]    Script Date: 6/9/2017 11:48:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_UpdateBackgroundUrl]
			  @UserId nvarchar(128)
			, @BackgroundUrl varchar(200)

AS
/*							TEST CODE 

SELECT *
FROM dbo.Accounts

DECLARE	@UserId nvarchar(128) = '03435704-c7af-4d4e-8e8f-ee0c3657204c'
			, @BackgroundUrl nvarchar(200) = 'https://www.crossref.org/images/staff/blank-profile-picture.png'

SELECT * FROM dbo.Accounts
Where UserId = @UserId

EXECUTE dbo.Accounts_UpdateBackgroundUrl
			 @UserId
			, @BackgroundUrl


SELECT *
FROM dbo.Accounts
Where UserId = @UserId


SELECT *
FROM dbo.Accounts
WHERE UserId = '02146f67-f5db-4d64-ac2f-e9bd1c2a2013'


*/

BEGIN

UPDATE [dbo].[Accounts]
   SET [UserId] = @UserId
      ,BackgroundPicture = @BackgroundUrl
 WHERE UserId = @UserId
END


