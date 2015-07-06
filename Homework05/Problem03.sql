SELECT 
  e.FirstName + ' ' + e.LastName AS FullName,
  e.Salary,
  d.Name
FROM 
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary IN (SELECT MIN(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID)
GROUP BY e.Salary, e.FirstName, e.MiddleName, e.LastName, d.Name
ORDER BY d.Name