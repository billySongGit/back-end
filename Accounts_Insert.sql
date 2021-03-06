USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Insert]    Script Date: 6/9/2017 11:31:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_Insert]
			@UserId nvarchar(128) OUTPUT
			, @AvatarUrl varchar(200) = NULL
			, @Handle nvarchar(250) = NULL
			, @FirstName nvarchar(15) = NULL
			, @MiddleInitial nvarchar(2) = NULL
			, @LastName nvarchar(50) =NULL
			, @GenderId smallint = null
			, @DOB date = null
			, @Highlight bit = 0
			, @Bio nvarchar(4000) =  NULL
			, @BackgroundPicture nvarchar(200) = null
			, @CreatedBy nvarchar(128) = NULL
            , @ModifiedDate datetime2(7) = NULL
            , @CreatedDate datetime2(7) = NULL
AS
/*										TEST CODE
this is to see which AspNetUser Ids aren't in the accounts folder
SELECT A.Id
FROM dbo.AspNetUsers AS A
FULL OUTER JOIN dbo.Accounts AS AC
ON A.Id = AC.UserId
WHERE A.Id IS null or AC.UserId IS null


SELECT *
FROM dbo.Accounts

DECLARE		 
			 @AvatarUrl varchar(200) = null
			, @Handle nvarchar(250) = null
			, @FirstName nvarchar(15) = 'TestFN'
			, @MiddleInitial nvarchar(2) = null
			, @LastName nvarchar(50) = 'TestLN'
			, @GenderId smallint = null
			, @DOB date = null
			, @CreatedBy nvarchar(128) = '02146f67-f5db-4d64-ac2f-e9bd1c2a2013'
            , @ModifiedDate datetime2(7) = getutcdate()
            , @CreatedDate datetime2(7) = getUTCdate()
			, @Highlight bit = '0'

EXECUTE dbo.Accounts_Insert
			 
			 @AvatarUrl 
			, @Handle 
			, @FirstName 
			, @MiddleInitial 
			, @LastName
			, @GenderId
			, @DOB
			, @CreatedBy
            , @ModifiedDate
            , @CreatedDate 
			, @Highlight

SELECT *
FROM dbo.Accounts
WHERE UserId = @UserId


*/
BEGIN

	DECLARE @ModifiedBy nvarchar(128) = @CreatedBy
			
	IF (@CreatedDate IS null)
	BEGIN
			SET @CreatedDate = getutcdate()
	END

	SET @ModifiedDate = COALESCE(@ModifiedDate, getutcdate())
	SET @CreatedDate = COALESCE(@CreatedDate, getutcdate())

INSERT INTO [dbo].[Accounts]
           ([UserId]
           ,[AvatarUrl]
           ,[Handle]
           ,[FirstName]
           ,[MiddleInitial]
           ,[LastName]
           ,[GenderId]
           ,[DOB]
		   ,[Highlight]
		   ,[Bio]
		   ,[BackgroundPicture]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[ModifiedDate]
           ,[CreatedDate]
		   )

     VALUES
           (@UserId
           ,@AvatarUrl
           ,@Handle
           ,@FirstName
           ,@MiddleInitial
           ,@LastName
           ,@GenderId
           ,@DOB
		   ,@Highlight
		   ,@Bio
		   ,@BackgroundPicture
           ,@CreatedBy
           ,@ModifiedBy
           ,@ModifiedDate
           ,@CreatedDate
		   )
END

