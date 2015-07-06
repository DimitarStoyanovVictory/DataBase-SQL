SELECT
  AVG(e.Salary) as [Average Salary]
FROM 
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID = 1