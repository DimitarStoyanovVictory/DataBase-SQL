SELECT
  FirstName,
  LastName,
  Salary 
FROM 
  Employees 
WHERE Salary IN (SELECT MIN(Salary) FROM Employees)


