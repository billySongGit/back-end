USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Delete]    Script Date: 6/9/2017 11:30:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Accounts_Delete]
	@UserId nvarchar(128)

/*	----------------------	TEST CODE	-----------------------------

	Declare @UserId nvarchar(128) = '1387fbba-bd13-43b3-85ea-b8bfff3b828b'

	Execute dbo.Accounts_Delete @UserId

*/	-----------------------------------------------------------------
AS

BEGIN

	DELETE FROM dbo.Accounts 
	WHERE UserId = @UserId

END