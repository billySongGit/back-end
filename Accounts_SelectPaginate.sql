USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectPaginate]    Script Date: 6/9/2017 11:48:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Accounts_SelectPaginate]
	@PageIndex int
	,@PageSize int 



/* ----------------- TEST CODE ---------------------------

	Declare @PageIndex int =0
			,@PageSize int = 12


	Execute dbo.Accounts_SelectPaginate   @PageIndex
											,@PageSize

*/-------------------------------------------------------
AS

BEGIN
	DECLARE @Offset int = @PageIndex*@PageSize


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
			  ,[TotalCount]= COUNT(1) OVER()
		  FROM [dbo].[Accounts] as A
		  ORDER BY A.LastName 
		  OFFSET @Offset ROWS 
		  FETCH NEXT @PageSize ROWS ONLY;
END

