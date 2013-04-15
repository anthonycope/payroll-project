DECLARE @weekStartDate date = '2013-04-14';
DECLARE @eid int = 1;
-- this section only used when adding a new date, i.e. via web interface, not intial population of data
DECLARE @day date = '2013-04-20';

DECLARE @hours real = 7.5;


DELETE
FROM DBProject.dbo.Daily_Hours DailyHours
WHERE DailyHours.Eid = @eid AND DailyHours.Day_Of = @day;

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
