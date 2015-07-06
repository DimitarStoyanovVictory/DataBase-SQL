SELECT
  d.Name as [Department],
  e.JobTitle,
  MIN(e.FirstName) + ' ' + MIN(e.LastName) AS [FullName],
  MIN(e.Salary) AS [Min Salary]
FROM 
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle
ORDER BY d.Name