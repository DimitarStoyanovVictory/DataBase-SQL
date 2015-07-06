SELECT 
  e.FirstName + ' ' + e.LastName AS [Name],
  e.Salary
FROM 
  Employees e
WHERE e.Salary LIKE '25000%' OR e.Salary LIKE '14000%' OR e.Salary LIKE '12500%' OR e.Salary LIKE '23600%'
ORDER BY e.Salary, e.FirstName, e.LastName
