SELECT
  d.Name AS Department,
  AVG(e.Salary) AS [Average Salary]
FROM 
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN (SELECT Name FROM Departments WHERE d.Name = Name)
GROUP BY d.Name
