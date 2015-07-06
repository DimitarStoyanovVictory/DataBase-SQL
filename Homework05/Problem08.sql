SELECT
  count(EmployeeID) AS [Employees without manager]
FROM 
  Employees 
WHERE ManagerID IS NULL