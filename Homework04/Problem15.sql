SELECT
  e.FirstName + ' ' + e.LastName AS [Name]
  --, e.ManagerID 
FROM
  Employees e
WHERE e.ManagerID IS NULL
--uncomment e.ManagerID if you wish proof that the query is correct
