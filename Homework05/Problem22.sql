INSERT INTO Users
SELECT
LEFT(e.FirstName, 1) + '.' + LOWER(e.LastName) + ISNULL(LEFT(MiddleName, 1), ''),
LEFT(e.FirstName, 1) + '.' + LOWER(e.LastName) + ' (pass)',
e.FirstName + ' ' + e.LastName,
GETDATE(), 
10
FROM Employees e
