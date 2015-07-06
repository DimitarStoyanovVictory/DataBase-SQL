SELECT
  e.FirstName + ' ' + e.LastName AS [Employee Name],
  d.Name AS [Department Name],
  e.HireDate
FROM 
  Employees e 
  RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE  d.Name = 'Sales' AND YEAR(e.HireDate) BETWEEN 1995 AND 2004 OR d.Name = 'Finance' AND YEAR(e.HireDate) BETWEEN 1995 AND 2004
ORDER BY e.FirstName, e.LastName, d.Name, e.HireDate