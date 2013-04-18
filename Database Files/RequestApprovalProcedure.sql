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
-- Author:		Anthony Cope
-- Create date: 4/18/13
-- Description:	Adds the designated week to the approval table for that employee,
-- calculates total wage for that week
-- =============================================
CREATE PROCEDURE RequestApproval 
	-- Add the parameters for the stored procedure here
	@eid int = 0, 
	@weekOf date = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    DELETE
	FROM DBProject.dbo.Approval
	WHERE Eid = @eid AND WeekOf = @weekOf;
	
	INSERT INTO DBProject.dbo.Approval(Eid, weekOf, Hours,  Amount, mgrid, Approved )		
	SELECT @eid, @weekOf, WeeklyHours.Hours_Worked, WeeklyHours.Hours_Worked  * E.wage,  E.mgrid, 'Awaiting Approval'
	FROM DBProject.dbo.Weekly_Hours WeeklyHours, DBProject.dbo.Employees E
	WHERE WeeklyHours.Eid = @eid AND WeeklyHours.WeekOf = @weekOf AND E.eid = @eid;
END
GO
