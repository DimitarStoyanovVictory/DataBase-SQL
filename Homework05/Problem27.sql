SELECT
  TOP 1
  t.Name,
  count(a.TownID) AS [Number of employees]
FROM 
  Addresses a
  JOIN Towns t ON a.TownID = t.TownID
GROUP BY t.Name
ORDER BY [Number of employees] DESC
