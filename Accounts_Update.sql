USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Update]    Script Date: 6/9/2017 11:48:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_Update]
			@UserId nvarchar(128)
			, @AvatarUrl varchar(200) = null
			, @Handle nvarchar(250) = null
			, @FirstName nvarchar(15)
			, @MiddleInitial nvarchar(2) = null
			, @LastName nvarchar(50)
			, @GenderId smallint = null
			, @DOB date = null
			, @Highlight bit
			, @Bio nvarchar (4000) = null
			, @CreatedBy nvarchar(128)
			, @ModifiedBy nvarchar(128)
            , @ModifiedDate datetime2(7) = NULL
AS
/*							TEST CODE 

SELECT *
FROM dbo.Accounts

DECLARE		 @UserId nvarchar(128) = '4ee5c29b-1398-4b81-8731-b5240b001fbe'
			, @AvatarUrl varchar(200) = 'https://randomuser.me/api/portraits/women/6.jpg'
			, @Handle nvarchar(250) = 'YegUserName'
			, @FirstName nvarchar(15) = 'Vasily'
			, @MiddleInitial nvarchar(2) = '2'
			, @LastName nvarchar(50) = 'Learmonth'
			, @GenderId smallint = '1'
			, @DOB date = '1985/12/24'
			, @Highlight bit = '1'
			, @Bio nvarchar(4000) = 'Hello world! I love lashes!'
			, @CreatedBy nvarchar(128) = '4ee5c29b-1398-4b81-8731-b5240b001fbe'
			, @ModifiedBy nvarchar(128) = '4ee5c29b-1398-4b81-8731-b5240b001fbe'
			, @ModifiedDate datetime2(7) = NULL
SELECT *
FROM dbo.Accounts
Where UserId = @UserId

EXECUTE dbo.Accounts_Update
			 @UserId
			, @AvatarUrl
			, @Handle
			, @FirstName
			, @MiddleInitial
			, @LastName
			, @GenderId
			, @DOB
			, @Highlight
			, @Bio
			, @CreatedBy
			, @ModifiedBy

SELECT *
FROM dbo.Accounts
Where UserId = @UserId


SELECT *
FROM dbo.Accounts
WHERE UserId = '02146f67-f5db-4d64-ac2f-e9bd1c2a2013'


*/

BEGIN
SET @ModifiedDate = COALESCE(@ModifiedDate, getutcdate())

UPDATE [dbo].[Accounts]
   SET [UserId] = @UserId
      ,[AvatarUrl] = @AvatarUrl
      ,[Handle] = @Handle
      ,[FirstName] = @FirstName
      ,[MiddleInitial] = @MiddleInitial
      ,[LastName] = @LastName
      ,[GenderId] = @GenderId
      ,[DOB] = @DOB
	  ,[Highlight] = @Highlight
	  ,[Bio] = @Bio
	  ,[CreatedBy] = @CreatedBy
	  ,[ModifiedBy] = @ModifiedBy
      ,[ModifiedDate] = @ModifiedDate
 WHERE UserId = @UserId
END


