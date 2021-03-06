USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectAll]    Script Date: 6/9/2017 11:31:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Accounts_SelectAll]

/* ----------------- TEST CODE ---------------------------

	Execute dbo.Accounts_SelectAll

*/-------------------------------------------------------
AS

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
      ,[CreatedBy]
      ,[ModifiedBy]
      ,[ModifiedDate]
      ,[CreatedDate]
  FROM [dbo].[Accounts]



