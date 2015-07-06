SELECT
  e.FirstName + ' ' + e.LastName as [Name],
  a.AddressText
FROM Employees e,
  Addresses a
WHERE a.AddressID = e.AddressID
