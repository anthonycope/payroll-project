-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
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
CREATE PROCEDURE Search
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

	SELECT *
	FROM DBProject.dbo.Employees E
	WHERE E.Eid = @eid;
END
GO
