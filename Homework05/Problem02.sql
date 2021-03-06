SELECT
  FirstName,
  LastName,
  Salary
FROM 
  Employees
WHERE Salary >= (SELECT MIN(Salary) FROM Employees)
AND Salary < ((SELECT MIN(Salary) FROM Employees) + ((SELECT MIN(Salary) FROM Employees) * 10 / 100))
ORDER BY Salary 
DESC
