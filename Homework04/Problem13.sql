SELECT 
  e.FirstName + ' ' + e.LastName AS [Name],
  e.Salary
FROM 
  Employees e
WHERE e.Salary >= 20000 AND e.Salary <= 30000
ORDER BY e.Salary, e.FirstName, e.LastName