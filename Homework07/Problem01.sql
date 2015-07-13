--Clear chace

DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS
GO

--Create table

CREATE TABLE DateAndText (
	CurrentDateTime DateTime NOT NULL,
	SheepNumbers nvarchar(100) NOT NULL
)

--FillTable

DECLARE @date datetime
SET @date = GETDATE()

DECLARE @n bigint
SET @n = 10000000

BEGIN TRANSACTION 
WHILE (@n > 0)
BEGIN 
INSERT INTO DateAndText
VALUES (@date, ('This is sheep number: ' + CONVERT(nvarchar, @n)))
SET @n = @n - 1
SET @date = DATEADD(MINUTE, 1, @date)
END
COMMIT TRANSACTION

--SearchInTable

SELECT
	CurrentDateTime,
	SheepNumbers
FROM DateAndText
WHERE CurrentDateTime BETWEEN '2015/07/10' AND '2015/07/11'