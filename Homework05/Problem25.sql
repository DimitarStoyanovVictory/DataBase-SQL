SELECT
  d.Name AS [Department],
  e.JobTitle,
  AVG(e.Salary) AS [Average Salary]
FROM 
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.JobTitle, d.Name
ORDER BY e.JobTitle, d.Name