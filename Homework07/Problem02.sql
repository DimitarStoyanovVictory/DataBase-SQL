--Clear chace

DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS
GO

--CREATE INDEX date_index
--ON DateAndText (CurrentDateTime)

--DBCC FREEPROCCACHE
--DBCC DROPCLEANBUFFERS
--GO

SELECT
	CurrentDateTime,
	SheepNumbers
FROM DateAndText
WHERE CurrentDateTime BETWEEN '2015/07/10' AND '2015/07/11'