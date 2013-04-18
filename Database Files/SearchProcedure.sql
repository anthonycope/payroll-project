USE [DBProject]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 04/17/2013 22:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Anthony Cope>
-- Create date: <4/14/13>
-- Description:	<This procedure searches the employee database
-- for employees with matching attributes>
-- =============================================
ALTER PROCEDURE [dbo].[Search]
	-- Add the parameters for the stored procedure here
	@eid int = 0,
	@birthdate date = NULL,
	@hours real = 0,
	@position varchar(5) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Eid, firstname, lastname, address, birthdate, position, mgrid
	FROM DBProject.dbo.Employees E
	WHERE E.Eid = @eid;
END
