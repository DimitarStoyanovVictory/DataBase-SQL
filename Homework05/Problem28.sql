SELECT
  t.Name AS [Town],
  count(e.ManagerID) AS [Number of managers]
FROM 
  Employees e
  JOIN Addresses a ON e.AddressID = a.AddressID
  JOIN Towns t ON a.TownID = t.TownID
WHERE e.ManagerID IS NOT NULL
GROUP BY t.Name
ORDER BY t.Name

--SELECT 
--  t.Name AS Town, 
--  COUNT(*) AS [Number of managers]
--FROM Employees emp
--INNER JOIN Addresses ads ON ads.AddressID = emp.AddressID
--INNER JOIN Towns t ON t.TownID = ads.TownID
--WHERE emp.ManagerID IS NOT NULL
--GROUP BY t.Name
