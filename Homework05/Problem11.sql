SELECT
  m.FirstName,
  m.LastName,
  count(m.EmployeeID) as [Employees count]
FROM 
  Employees e
  JOIN Employees m ON e.ManagerID = m.EmployeeID
GROUP BY m.FirstName, m.LastName
HAVING count(m.EmployeeID) = 5
ORDER BY m.FirstName, m.LastName