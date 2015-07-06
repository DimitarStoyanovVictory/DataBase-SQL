CREATE PROC WithdrawMoney @AccountId int, @money money
AS
	SELECT
	(CASE 
		WHEN Balanace - @money < 0 
		THEN 'Not enough money in bank Account'
		ELSE Balanace - @money 
	END) AS [Balance In Account]
	FROM Accounts
	WHERE AccountID = @AccountId
	UPDATE Accounts
	SET Balanace = Balanace - @money
	WHERE AccountID = @AccountId
GO

CREATE PROC DepositMoney @AccountId int, @money money
AS 
	UPDATE Accounts
	SET Balanace = Balanace + @money
	WHERE AccountID = @AccountId
	SELECT
	Balanace
	FROM Accounts
	WHERE @AccountId = AccountID
GO

EXEC WithdrawMoney 12, 10000

EXEC DepositMoney 10, 10000

