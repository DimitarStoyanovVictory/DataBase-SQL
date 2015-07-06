SELECT 
  e.FirstName + ' ' + e.LastName AS [Employee Name],
  m.FirstName + ' ' + m.LastName AS [Manager Name],
  a.AddressText AS [Manager Address]
FROM 
  Employees e
  JOIN Employees m ON e.ManagerID = m.EmployeeID
  JOIN Addresses a ON e.ManagerID = a.AddressID
ORDER BY e.FirstName, e.LastName, m.FirstName, m.LastName, a.AddressText