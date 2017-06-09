USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Followers_DeleteByF]    Script Date: 6/9/2017 11:50:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Followers_DeleteByF]
				@FollowerID nvarchar(128)


AS

/*			TEST CODE


SELECT *
FROM [dbo].[Followers]

DECLARE @FollowerID nvarchar(128) = '1297e9b8-6f6b-4259-9ac2-47a88c50e513'


EXECUTE dbo.Followers_DeleteByF
		@FollowerID


SELECT *
FROM [dbo].[Followers]


*/


DELETE FROM [dbo].[Followers]
      WHERE FollowerID = @FollowerID


