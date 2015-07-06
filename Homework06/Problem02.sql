CREATE PROC GetBalanceOverNum @balance money
AS
	SELECT 
	p.FirstName + ' ' + p.LastName AS [Full name],
	a.Balanace
	FROM Persons p
	JOIN Accounts a ON p.PersonID = a.PersonID
	WHERE a.Balanace > @balance
GO

EXEC GetBalanceOverNum 25000.2