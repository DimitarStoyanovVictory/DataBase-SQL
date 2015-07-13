----Task 13

--SELECT
--	p.PeakName,
--	r.RiverName,
--	LOWER(SUBSTRING(p.PeakName, 0, LEN(p.PeakName)) + r.RiverName) AS Mix
--FROM Peaks p, Rivers r
--WHERE RIGHT(p.PeakName, 1) = LEFT (r.RiverName, 1)
--ORDER BY Mix

----Task 14

--SELECT 
--	cou.CountryName AS [Country],
--	ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
--	ISNULL(p.Elevation, 0) AS [Highest Peak Elevation],
--	ISNULL(m.MountainRange, '(no mountain)') AS [Mountain]
--FROM Countries cou
--LEFT JOIN MountainsCountries mc ON cou.CountryCode = mc.CountryCode
--LEFT JOIN Mountains m ON mc.MountainId = m.Id
--LEFT JOIN Peaks p ON m.Id = p.MountainId
--WHERE p.Elevation = (
--	SELECT MAX(p.Elevation) 
--	FROM Peaks p
--	LEFT JOIN Mountains m ON m.Id = p.MountainId
--	LEFT JOIN MountainsCountries mc ON mc.MountainId = p.MountainId
--	WHERE cou.CountryCode = mc.CountryCode 
--)  OR (
--	SELECT MAX(p.Elevation) 
--	FROM Peaks p
--	LEFT JOIN Mountains m ON m.Id = p.MountainId
--	LEFT JOIN MountainsCountries mc ON mc.MountainId = p.MountainId
--	WHERE cou.CountryCode = mc.CountryCode
--) IS NULL
--ORDER BY cou.CountryName, [Highest Peak Name]  

----Part 2 

--CREATE TABLE Monasteries(
--	Id int IDENTITY,
--	Name nvarchar(100) NOT NULL,
--	CountryCode char(2) NOT NULL,
--	CONSTRAINT PK_Monasteries PRIMARY KEY(Id),
--	CONSTRAINT FK_Monasteries_Countries FOREIGN KEY(CountryCode)
--	REFERENCES Countries(CountryCode)
--)

--INSERT INTO Monasteries(Name, CountryCode) VALUES
--('Rila Monastery “St. Ivan of Rila”', 'BG'), 
--('Bachkovo Monastery “Virgin Mary”', 'BG'),
--('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
--('Kopan Monastery', 'NP'),
--('Thrangu Tashi Yangtse Monastery', 'NP'),
--('Shechen Tennyi Dargyeling Monastery', 'NP'),
--('Benchen Monastery', 'NP'),
--('Southern Shaolin Monastery', 'CN'),
--('Dabei Monastery', 'CN'),
--('Wa Sau Toi', 'CN'),
--('Lhunshigyia Monastery', 'CN'),
--('Rakya Monastery', 'CN'),
--('Monasteries of Meteora', 'GR'),
--('The Holy Monastery of Stavronikita', 'GR'),
--('Taung Kalat Monastery', 'MM'),
--('Pa-Auk Forest Monastery', 'MM'),
--('Taktsang Palphug Monastery', 'BT'),
--('Sümela Monastery', 'TR')

--ALTER TABLE Countries 
--ADD IsDeleted bit NOT NULL
--CONSTRAINT Countries_IsDeleted DEFAULT(0)

--DECLARE @y table(
--	DeleteId int NOT NULL
--)

--UPDATE Countries
--SET IsDeleted = 1
--WHERE CountryCode IN
--(SELECT	c.CountryCode
--FROM Countries c
--JOIN CountriesRivers cr ON c.CountryCode = cr.CountryCode
--JOIN Rivers r ON cr.RiverId = r.Id
--GROUP BY c.CountryCode
--HAVING COUNT(r.Id) > 3)

--SELECT 
--	m.Name AS Monastery,
--	c.CountryName AS Country
--FROM Monasteries m
--JOIN Countries c ON m.CountryCode = c.CountryCode
--WHERE c.IsDeleted = 0
--ORDER BY m.Name

-- Task 16
 
-- Task 1

--UPDATE Countries
--SET CountryName = 'Burma'
--WHERE CountryName = 'Myanmar'

-- Task 2

--INSERT INTO Monasteries
--VALUES ('Hanga Abbey', 'TZ'), ('Myin-Tin-Daik', 'Myanmar')

-- Task 3

--SELECT
--	c.CountryName,
--	c.CountryCode
--FROM Countries c
--WHERE c.CountryName = 'Myanmar'

-- Task 4

--SELECT
--	con.ContinentName,
--	c.CountryName,
--	count(m.Id) AS [MonasteriesCount]
--FROM Countries c 
--JOIN Monasteries m ON m.CountryCode = c.CountryCode
--JOIN Continents con ON c.ContinentCode = con.ContinentCode
--GROUP BY con.ContinentName, c.CountryName
--ORDER BY MonasteriesCount DESC, c.CountryName

CREATE FUNCTION fn_MountainsPeaksJSON()
RETURNS nvarchar(MAX)
AS
BEGIN
	DECLARE @json nvarchar(MAX) = '{"mountains":['

	DECLARE mountainsCoursor cursor
	FOR SELECT m.Id, m.MountainRange FROM Mountains m
	OPEN mountainsCoursor
	DECLARE @mountainName nvarchar(MAX)
	DECLARE @mountainId int
	FETCH NEXT FROM mountainsCoursor INTO @mountainID, @mountainName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @json = @json + '{"name":"' + @mountainName + '","peaks":['

		DECLARE peaksCursor cursor FOR
		SELECT PeakName, Elevation FROM Peaks p
		WHERE p.MountainId = @mountainId 

		OPEN peaksCursor 
		DECLARE @peakName NVARCHAR(MAX)
		DECLARE @elevation INT 
		FETCH NEXT FROM peaksCursor INTO @peakName, @elevation
		WHILE @@FETCH_STATUS = 0
		BEGIN 
			SET @json = @json + '{"name":"' + @peakName + '",' +
				'"elevation":' + CONVERT(nvarchar(MAX), @elevation) + '}'
			FETCH NEXT FROM peaksCursor INTO @peakName, @elevation
			IF @@FETCH_STATUS = 0
				SET @json = @json + ','
		END 
		CLOSE peaksCursor
		DEALLOCATE peaksCursor
		SET @json = @json + ']}'

		FETCH NEXT FROM mountainsCoursor INTO @mountainId, @mountainName
		IF @@FETCH_STATUS = 0
			SET @json = @json + ','
	END
	CLOSE mountainsCoursor
	DEALLOCATE mountainsCoursor

	SET @json = @json + ']}'
	RETURN @json
END

SELECT dbo.fn_MountainsPeaksJSON()