SELECT
  e.FirstName + '.' + e.LastName + '@softuni.bg' AS [Full Email Addresses]
FROM 
  Employees e 
ORDER BY e.FirstName, e.LastName
