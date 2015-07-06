SELECT
  e.FirstName + ' ' + e.MiddleName + '. ' + e.LastName as FullName
FROM 
  Employees e
WHERE e.FirstName IS NOT NULL and e.MiddleName IS NOT NULL and e.LastName IS NOT NULL
