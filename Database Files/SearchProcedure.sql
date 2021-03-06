USE [DBProject]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 04/20/2013 15:12:10 ******/
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
	@position varchar(50) = NULL,
	@mgrid int = 0,
	@wage smallmoney = 0,
	@firstname varchar(50) = NULL,
	@lastname varchar(50) = NULL,
	@username varchar(50) = NULL,
	@Choice int = 0 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT Eid, firstname, lastname, address, birthdate, position, mgrid, wage
	--FROM DBProject.dbo.Employees E
	--WHERE E.Eid = @eid;
	
	IF @Choice = 0 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.Eid = @eid);
	ELSE IF @Choice = 1 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.firstname = @firstname); 
	ELSE IF @Choice = 2 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.lastname = @lastname); 
	ELSE IF @Choice = 3 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.position = @position); 
	ELSE IF @Choice = 4 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.birthdate = @birthdate); 
	ELSE IF @Choice = 5 SELECT Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.mgrid = @mgrid);
	ELSE IF @Choice = 6 SELECT  Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.username = @username);
	ELSE IF @Choice = 7 SELECT  Eid, username, firstname, lastname, address, birthdate, position, mgrid, wage FROM Employees AS E WHERE (E.wage= @wage);
END
