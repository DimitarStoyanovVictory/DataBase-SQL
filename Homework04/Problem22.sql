SELECT 
  t.Name
FROM 
  Towns t
GROUP BY t.Name
UNION
SELECT
  d.Name
FROM 
  Departments d
GROUP BY d.Name