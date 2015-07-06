CREATE PROC GiveMonthInterestRate @AccountId int, @InterestRate money	
AS
	SELECT dbo.ufn_CalcIR(Balanace, @InterestRate, 1)
	FROM Accounts
	WHERE AccountID = @AccountId
GO