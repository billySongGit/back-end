USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UpdateHandle]    Script Date: 6/9/2017 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_UpdateHandle]
			  @UserId nvarchar(128)
			, @Handle nvarchar(250)

AS
/*							TEST CODE 
DECLARE		 @UserId nvarchar(128) = '03435704-c7af-4d4e-8e8f-ee0c3657204cc'
			, @Handle nvarchar(250) = 'wegweg'


EXECUTE dbo.Accounts_UpdateHandle
			 @UserId
			, @Handle

*/

BEGIN

UPDATE [dbo].[Accounts]
   SET [UserId] = @UserId
      ,Handle = @Handle
 WHERE UserId = @UserId
END


