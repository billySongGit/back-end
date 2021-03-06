USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectByHandle]    Script Date: 6/9/2017 11:31:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Accounts_SelectByHandle]
		@Handle nvarchar(250) = NULL

AS

/*
DECLARE @Handle nvarchar(250) = 'ephilpotts86'

EXECUTE dbo.Accounts_SelectByHandle
		@Handle
*/
BEGIN

SELECT
	  
	  [UserId]
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
	  FROM [dbo].[Accounts] 
	
	
	WHERE Handle = @Handle
END

