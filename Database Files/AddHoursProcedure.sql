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
-- Description:	<This procedure adds a user's daily hours to the
--				Daily_Hours table and updates the value for the associated week>
-- =============================================
CREATE PROCEDURE AddDailyHours 
	-- Add the parameters for the stored procedure here
	@eid int = 0,
	@day date = NULL,
	@hours real = 0,
	@weekStartDate date = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
	FROM DBProject.dbo.Daily_Hours 
	WHERE Eid = @eid AND Day_Of = @day;

	INSERT INTO DBProject.dbo.Daily_Hours(Eid, Day_Of, Hours_Worked)
		VALUES(@eid, @day, @hours);
	--

	DELETE
	FROM DBProject.dbo.Weekly_Hours
	WHERE Eid = @eid AND weekOf = @weekStartDate;

	INSERT INTO DBProject.dbo.Weekly_Hours(Eid, weekOf, Hours_Worked)
	SELECT DailyHours.Eid, @weekStartDate, SUM(DailyHours.Hours_Worked)
	FROM DBProject.dbo.Daily_Hours DailyHours
	WHERE DailyHours.Eid = @eid AND DailyHours.Day_Of >= @weekStartDate AND DailyHours.Day_Of < DATEADD(day,7,@weekStartDate)
	GROUP BY DailyHours.Eid;
END
GO
